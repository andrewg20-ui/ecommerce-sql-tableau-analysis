# Reproduce the analysis

## What can be reproduced now

The packaged CSVs support the reported aggregate metrics, reconciliations, and Tableau sources. The validation script is executable without database access or third-party Python packages:

```bash
python3 scripts/validate_exports.py
```

Run it from the repository root with Python 3.10 or later. The recorded execution environment is included in the export manifest. The script creates `reports/validation_summary.json`, exits nonzero if a check group fails, and prints the failing groups. Financial comparisons use Decimal rather than binary floating-point rounding.

Do not describe a passing export check as proof that the raw database is complete or that the original SQL joins were correct.

## Regenerate the exports from PostgreSQL

1. Obtain [Toy Store E-Commerce Database from Maven Analytics](https://mavenanalytics.io/data-playground/toy-store-e-commerce-database). Record the downloaded version or file checksum and retrieval date. Retain the import instructions and schema, including any changes needed to load the source into PostgreSQL. Record `SELECT version();` and `SHOW TIMEZONE;` in your execution notes.
2. Confirm that the required tables and columns in `sql/README.md` match the imported database. Compare each recovered query with the SQL you actually used. Keep any differences as intentional, documented changes.
3. Check primary-key uniqueness and nulls for session, pageview, order, item, and product identifiers. Check order-to-session, pageview-to-session, item-to-order/product, and refund-to-item references. Inspect invalid or duplicate records before deciding how to treat them; never drop them just to match a target total.
4. Execute each numbered SQL file as a read-only query. Export UTF-8 CSV with headers to the corresponding path in `data/processed/`. Keep the source's timestamp convention. Preserve the supplied field names, including count numerators and denominators.
5. Run the validation script. If a result differs from the historical control, investigate scope, data version, joins, and date attribution. Do not edit output counts or money to force agreement.
6. Record PostgreSQL version, source dataset/version, extraction time, timezone, query file/hash, row counts, and any deviations in `docs/execution_record.md`.

The overview query exports all 37 available monthly rows. The dashboard filters it to April 2012–February 2015. Other monthly queries already restrict to those 35 complete months; purchase cohorts stop at November 2014. Refund events remain eligible through each item's own 30-day follow-up.

## Reconnect and check Tableau

Connect each CSV as its own source, preserving its grain. Recreate or inspect the ratio calculations in the metric dictionary using sums of counts or dollars. Format date fields as dates and numeric fields as numbers. Format ratio fractions as percentages without multiplying by 100 twice.

The original project already reviewed the three dashboards. The revised workbook is included at tableau/ecommerce.twbx. The active overview connection now points to monthly_overview.csv, its range remains April 2012–February 2015, and the funnel includes all devices. These saved settings and representative cached values were checked. Reopen the saved package to verify fresh rendering, paths, and interactions when preparing publication. Preserve the default scopes and save locally after each change.

## Explain the work in an interview

Be ready to explain why orders are aggregated before joining to sessions, why product revenue can differ by month from session revenue, why rates use pooled counts, how the ordered funnel differs from page presence, and why 30-day refunds and 90-day repeat purchasing need complete follow-up. Explain what evidence would be needed to move from an observed difference to a causal recommendation.
