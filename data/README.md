# Data sources and export inventory

## Original source attribution

| Item | Status |
|---|---|
| Dataset / case-study title | Toy Store E-Commerce Database — Maven Fuzzy Factory |
| Provider / author | Maven Analytics |
| Original source URL | [Maven Analytics Data Playground](https://mavenanalytics.io/data-playground/toy-store-e-commerce-database) |
| Retrieval date / dataset version | Not yet recorded |
| Business coverage | Online teddy-bear retail: website sessions, pageviews, orders, and returns |
| Provider-listed license | Public Domain; verified on the source page October 16, 2026 |

The CSVs in `processed/` are the aggregate outputs supplied during the project. The original database is available through the source page and is not included here. The provider's Public Domain label applies to its dataset; the author's original SQL and writing have no separate license selected. The verification date above is not the original download date. This project uses the actual export row counts below, rather than the provider page's summary counts, as its validation controls.

## Inventory

| Export | Rows | Grain | Dates | SQL |
|---|---:|---|---|---|
| `monthly_overview.csv` | 37 | Session-start month | March 2012–March 2015; headline window excludes both boundary months | `01_monthly_overview.sql` |
| `acquisition_monthly.csv` | 422 | Month × channel × source × campaign × device | April 2012–February 2015 | `02_acquisition_monthly.sql` |
| `funnel_monthly.csv` | 490 | Month × device × ordered stage | April 2012–February 2015 | `03_funnel_monthly.sql` |
| `product_monthly.csv` | 89 | Item sale month × product | April 2012–February 2015 | `04_product_monthly.sql` |
| `refund_monthly.csv` | 89 | Sale month × product, with 30-day refund follow-up | April 2012–February 2015 | `05_refund_monthly.sql` |
| `customer_sessions_monthly.csv` | 70 | Session-start month × session type | April 2012–February 2015 | `06_customer_sessions_monthly.sql` |
| `repeat_purchase_cohorts.csv` | 32 | First recorded purchase month | April 2012–November 2014, with 90-day follow-up | `07_repeat_purchase_cohorts.sql` |

All seven files are byte-for-byte copies of the supplied exports with consistent filenames. The upload prefixes and duplicate `.csv` extension were removed from filenames only. The manifest records original filenames, hashes, byte sizes, row counts, and columns. No rows were zero-filled or removed during packaging.

Keep missing prelaunch product/refund rows distinct from real zero observations. Tableau may use default positions for the product-share display; those display positions do not create sales or refund observations in these exports.

See [metric definitions](../docs/metric_dictionary.md), [methodology](../docs/methodology.md), and [manifest](export_manifest.json). There are no row-level user IDs, session IDs, or contact details in these aggregate CSVs.
