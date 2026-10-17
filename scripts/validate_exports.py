#!/usr/bin/env python3
"""Validate the supplied historical CSV exports; never connect to the database.

Run from the repository root: python3 scripts/validate_exports.py
Uses the Python standard library and Decimal for exact currency comparisons.
This checks the packaged outputs, not raw-event completeness or causal claims.
"""

import argparse
import csv
import hashlib
import json
from collections import defaultdict
from datetime import date, datetime, timezone
from decimal import Decimal
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
NULLS = {"", "NULL", "null", "[NULL]"}
SCHEMAS = {
    "monthly_overview": ("month first_observed_session_at last_observed_session_at sessions converting_sessions orders gross_revenue conversion_pct average_order_value gross_revenue_per_session", ["month"], 37, "2012-03-01", "2015-03-01"),
    "acquisition_monthly": ("month channel utm_source utm_campaign device_type sessions converting_sessions orders gross_revenue", ["month", "channel", "utm_source", "utm_campaign", "device_type"], 422, "2012-04-01", "2015-02-01"),
    "funnel_monthly": ("month device_type stage_order stage stage_sessions previous_stage_sessions session_cohort_size page_reach_sessions orders_table_converting_sessions", ["month", "device_type", "stage_order"], 490, "2012-04-01", "2015-02-01"),
    "product_monthly": ("month product_id product_name items_sold gross_revenue cogs gross_profit", ["month", "product_id"], 89, "2012-04-01", "2015-02-01"),
    "refund_monthly": ("sale_month product_id product_name items_sold refunded_items_30d", ["sale_month", "product_id"], 89, "2012-04-01", "2015-02-01"),
    "customer_sessions_monthly": ("month session_type sessions converting_sessions orders gross_revenue", ["month", "session_type"], 70, "2012-04-01", "2015-02-01"),
    "repeat_purchase_cohorts": ("first_purchase_month customers repeat_customers_90d", ["first_purchase_month"], 32, "2012-04-01", "2014-11-01"),
}
COUNT_FIELDS = set("sessions converting_sessions orders product_id items_sold refunded_items_30d customers repeat_customers_90d stage_order stage_sessions previous_stage_sessions session_cohort_size page_reach_sessions orders_table_converting_sessions".split())
MONEY_FIELDS = {"gross_revenue", "cogs", "gross_profit"}
RATIO_FIELDS = {"conversion_pct", "average_order_value", "gross_revenue_per_session"}
NULLABLE_FIELDS = {"utm_source", "utm_campaign", "device_type", "previous_stage_sessions", "orders_table_converting_sessions"}


def number(value):
    result = Decimal(str(value))
    if not result.is_finite():
        raise ValueError("Non-finite numeric value")
    return result


def month(value):
    result = date.fromisoformat(value[:10])
    if result.day != 1:
        raise ValueError("Monthly key is not the first day of its month")
    return result.isoformat()


def month_series(first, last):
    result = []
    y, m = map(int, first[:7].split("-"))
    while f"{y:04d}-{m:02d}-01" <= last:
        result.append(f"{y:04d}-{m:02d}-01")
        y, m = (y + 1, 1) if m == 12 else (y, m + 1)
    return result


def totals(rows, fields):
    return {field: sum((number(row[field]) for row in rows), Decimal(0)) for field in fields}


def grouped(rows, keys, fields):
    result = defaultdict(lambda: {field: Decimal(0) for field in fields})
    for row in rows:
        key = tuple(month(row[k]) if "month" in k else row[k] for k in keys)
        for field in fields:
            result[key][field] += number(row[field])
    return dict(result)


def rate(numerator, denominator, percent=True):
    return (number(numerator) / number(denominator) * (100 if percent else 1)).quantize(Decimal("0.01"))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--data-dir", type=Path, default=ROOT / "data" / "processed")
    parser.add_argument("--output", type=Path, default=ROOT / "reports" / "validation_summary.json")
    args = parser.parse_args()
    checks, files, datasets = [], [], {}

    def check(name, condition, detail):
        checks.append({"check": name, "status": "pass" if condition else "fail", "detail": detail})

    # Parsing, required fields, and row shapes are checked before any aggregation.
    for name, (columns, keys, expected_rows, first, last) in SCHEMAS.items():
        path = args.data_dir / f"{name}.csv"
        try:
            with path.open(newline="", encoding="utf-8-sig") as stream:
                reader = csv.DictReader(stream)
                fields = reader.fieldnames
                rows = list(reader)
            check(f"{name}: schema", fields == columns.split(), "Expected exported field names and order")
            valid_shape = all(None not in row and all(v is not None for v in row.values()) for row in rows)
            if fields != columns.split() or not valid_shape:
                raise ValueError("Invalid header or CSV row shape")
            invalid_cells = []
            for i, row in enumerate(rows, 2):
                for field, value in row.items():
                    if value in NULLS:
                        if field not in NULLABLE_FIELDS:
                            invalid_cells.append(f"row {i}: missing {field}")
                    elif field in COUNT_FIELDS | MONEY_FIELDS | RATIO_FIELDS:
                        n = number(value)
                        if n < 0 or (field in COUNT_FIELDS and n != n.to_integral_value()):
                            invalid_cells.append(f"row {i}: invalid {field}")
            if invalid_cells:
                raise ValueError("; ".join(invalid_cells[:5]))
            date_field = columns.split()[0]
            months = sorted({month(row[date_field]) for row in rows})
            check(f"{name}: rows and month coverage", len(rows) == expected_rows and months == month_series(first, last), f"{len(rows)} rows; {len(months)} distinct consecutive months; expected {first} to {last}")
            row_keys = [tuple(month(row[k]) if "month" in k else row[k] for k in keys) for row in rows]
            check(f"{name}: unique grain", len(row_keys) == len(set(row_keys)), ", ".join(keys))
            check(f"{name}: numeric and required values", True, "Finite nonnegative numeric values; integer counts; required fields present")
            files.append({"file": path.name, "rows": len(rows), "sha256": hashlib.sha256(path.read_bytes()).hexdigest()})
            datasets[name] = rows
        except (OSError, ValueError, ArithmeticError) as exc:
            check(f"{name}: readable data", False, str(exc))

    observations, metrics = [], {}
    if len(datasets) == len(SCHEMAS):
        overview_all = datasets["monthly_overview"]
        overview = [r for r in overview_all if "2012-04-01" <= month(r["month"]) < "2015-03-01"]
        acq = datasets["acquisition_monthly"]
        sessions = datasets["customer_sessions_monthly"]
        product = datasets["product_monthly"]
        refunds = datasets["refund_monthly"]
        cohorts = datasets["repeat_purchase_cohorts"]
        funnel = datasets["funnel_monthly"]
        additive = ["sessions", "converting_sessions", "orders", "gross_revenue"]
        overview_month = grouped(overview, ["month"], additive)
        expected = {"sessions": Decimal(455909), "converting_sessions": Decimal(30999), "orders": Decimal(30999), "gross_revenue": Decimal("1856559.28")}
        check("Overview: historical snapshot totals", totals(overview, additive) == expected, "35 complete months; independently retained control totals")
        check("Overview: observed timestamp bounds", all(month(r["month"])[:7] == r["first_observed_session_at"][:7] == r["last_observed_session_at"][:7] and datetime.fromisoformat(r["first_observed_session_at"]) <= datetime.fromisoformat(r["last_observed_session_at"]) for r in overview_all), "Within-month observed bounds; this does not prove source coverage")
        check("Session measures: denominator relationships", all(0 <= number(r["converting_sessions"]) <= number(r["sessions"]) and number(r["orders"]) >= number(r["converting_sessions"]) for rows in (overview_all, acq, sessions) for r in rows), "Converting sessions cannot exceed sessions or orders")
        check("Overview: supplied rounded ratios", all(abs(number(r["conversion_pct"]) - rate(r["converting_sessions"], r["sessions"])) <= Decimal("0.01") and abs(number(r["average_order_value"]) - rate(r["gross_revenue"], r["orders"], False)) <= Decimal("0.01") and abs(number(r["gross_revenue_per_session"]) - rate(r["gross_revenue"], r["sessions"], False)) <= Decimal("0.01") for r in overview_all), "Compare exported two-decimal ratios within 0.01 display units")
        for name, rows in (("Acquisition", acq), ("Customer sessions", sessions)):
            check(f"{name}: monthly reconciliation", grouped(rows, ["month"], additive) == overview_month, "Every month reconciles on sessions, converting sessions, orders, and exact revenue")
        check("Products: gross profit identities", all(number(r["gross_revenue"]) - number(r["cogs"]) == number(r["gross_profit"]) for r in product), "Every product-month revenue less COGS equals gross profit")
        pt = totals(product, ["items_sold", "gross_revenue", "cogs", "gross_profit"])
        check("Products: historical snapshot totals", pt == {"items_sold": Decimal(38272), "gross_revenue": Decimal("1856559.28"), "cogs": Decimal("692280.28"), "gross_profit": Decimal("1164279.00")}, "Retained complete-month item-sale totals")
        product_keys = {(month(r["month"]), r["product_id"]): (r["product_name"], number(r["items_sold"])) for r in product}
        refund_keys = {(month(r["sale_month"]), r["product_id"]): (r["product_name"], number(r["items_sold"])) for r in refunds}
        check("Refunds: product denominator reconciliation", product_keys == refund_keys, "All 89 keys, names, and items-sold denominators match")
        check("Refunds: valid incidence counts", all(0 <= number(r["refunded_items_30d"]) <= number(r["items_sold"]) for r in refunds), "Refunded items never exceed sold items")
        rt = totals(refunds, ["items_sold", "refunded_items_30d"])
        check("Refunds: historical snapshot totals", rt == {"items_sold": Decimal(38272), "refunded_items_30d": Decimal(1675)}, "Retained 30-day sale-cohort counts")
        ct = totals(cohorts, ["customers", "repeat_customers_90d"])
        check("Cohorts: valid counts and historical totals", all(0 <= number(r["repeat_customers_90d"]) <= number(r["customers"]) for r in cohorts) and ct == {"customers": Decimal(24105), "repeat_customers_90d": Decimal(439)}, "32 first-purchase cohorts; equal 90-day follow-up assumed by the query")
        funnel_groups = defaultdict(list)
        for row in funnel:
            funnel_groups[(month(row["month"]), row["device_type"])].append(row)
        paths_valid, orders_valid, reach_valid = True, True, True
        stage1, final = {}, {}
        stage_labels = ["Session", "Products", "Product detail", "Cart", "Shipping", "Billing", "Order confirmation"]
        for key, rows in funnel_groups.items():
            rows.sort(key=lambda r: number(r["stage_order"]))
            paths_valid &= [int(r["stage_order"]) for r in rows] == list(range(1, 8))
            paths_valid &= [r["stage"] for r in rows] == stage_labels
            if len(rows) != 7:
                continue
            size = number(rows[0]["stage_sessions"])
            for i, row in enumerate(rows):
                count = number(row["stage_sessions"])
                paths_valid &= number(row["session_cohort_size"]) == size
                reach_valid &= count <= number(row["page_reach_sessions"]) <= size
                if i == 0:
                    paths_valid &= row["previous_stage_sessions"] in NULLS
                    orders_valid &= row["orders_table_converting_sessions"] not in NULLS
                else:
                    paths_valid &= row["previous_stage_sessions"] not in NULLS
                    if row["previous_stage_sessions"] not in NULLS:
                        paths_valid &= number(row["previous_stage_sessions"]) == number(rows[i-1]["stage_sessions"]) >= count
                    orders_valid &= row["orders_table_converting_sessions"] in NULLS
            stage1[key] = {"sessions": size, "converting_sessions": number(rows[0]["orders_table_converting_sessions"])}
            final[key] = number(rows[-1]["stage_sessions"])
        check("Funnel: ordered paths and denominators", paths_valid, "Seven stages per month/device; monotonic counts; valid previous-stage and cohort denominators")
        check("Funnel: page reach bounds and order count placement", reach_valid and orders_valid, "Ordered reach <= page reach <= cohort; orders-table control only on stage 1")
        acq_device = grouped(acq, ["month", "device_type"], ["sessions", "converting_sessions"])
        check("Funnel: monthly device reconciliation", stage1 == acq_device, "All 70 month/device groups reconcile to acquisition")
        check("Funnel: observed confirmation and order agreement", final == {k: v["converting_sessions"] for k, v in acq_device.items()}, "Agreement holds for this snapshot; it is not imposed by the funnel definition")
        pm = grouped(product, ["month"], ["gross_revenue"])
        differences = {key[0]: pm[key]["gross_revenue"] - value["gross_revenue"] for key, value in overview_month.items() if pm[key]["gross_revenue"] != value["gross_revenue"]}
        observations.append({"topic": "Item sale month versus session month", "differing_months": len(differences), "largest_absolute_difference_usd": max(map(abs, differences.values()), default=Decimal(0)), "net_difference_usd": sum(differences.values(), Decimal(0)), "explanation": "Different attribution dates are documented. Matching full-window totals do not prove the cause of each monthly difference."})
        metrics["overview"] = {**expected, "conversion_pct": rate(expected["converting_sessions"], expected["sessions"]), "aov_usd": rate(expected["gross_revenue"], expected["orders"], False)}
        metrics["product_totals"] = pt
        metrics["refund_totals"] = {**rt, "rate_pct": rate(rt["refunded_items_30d"], rt["items_sold"])}
        metrics["cohort_totals"] = {**ct, "rate_pct": rate(ct["repeat_customers_90d"], ct["customers"])}
        for name, rows, keys, values in [("device", acq, ["device_type"], additive), ("channel", acq, ["channel"], additive), ("session_type", sessions, ["session_type"], additive), ("product", product, ["product_name"], ["items_sold", "gross_revenue", "cogs", "gross_profit"]), ("refund_product", refunds, ["product_name"], ["items_sold", "refunded_items_30d"])]:
            metrics[name] = {k[0]: v for k, v in grouped(rows, keys, values).items()}
        metrics["years"] = {str(year): totals([r for r in overview if r["month"].startswith(str(year))], additive) for year in (2013, 2014)}

    failures = sum(check["status"] == "fail" for check in checks)
    result = {"generated_at_utc": datetime.now(timezone.utc).isoformat(), "scope": "Export-level checks of the supplied historical snapshot; no live SQL execution or raw-record verification.", "status": "pass" if failures == 0 else "fail", "check_groups_passed": len(checks) - failures, "check_groups_failed": failures, "files": files, "checks": checks, "observations": observations, "metrics": metrics}
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, default=str) + "\n", encoding="utf-8")
    print(f"{result['status'].upper()}: {len(checks) - failures}/{len(checks)} check groups passed. Results: {args.output}")
    for item in checks:
        if item["status"] == "fail":
            print(f"FAIL: {item['check']} — {item['detail']}")
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
