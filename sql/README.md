# SQL inventory and provenance

The seven numbered files are PostgreSQL read-only export definitions. They can be run independently after the source database is imported; the numbering is for navigation, not a transformation dependency chain.

| File | Provenance | Expected output |
|---|---|---|
| `01_monthly_overview.sql` | Recovered verbatim from the saved overview exercise | 37 rows, all available monthly history |
| `02_acquisition_monthly.sql` | Existing saved SQL file | 422 rows, 35 complete months |
| `03_funnel_monthly.sql` | Existing saved SQL file | 490 rows, 35 months × 2 devices × 7 stages |
| `04_product_monthly.sql` | Recovered verbatim from the saved product export exercise | 89 product-month rows |
| `05_refund_monthly.sql` | Recovered verbatim from the saved 30-day refund export exercise | 89 sale-month/product rows |
| `06_customer_sessions_monthly.sql` | Existing saved SQL file | 70 month/session-type rows |
| `07_repeat_purchase_cohorts.sql` | Existing saved SQL file | 32 first-purchase cohorts |

The SQL has not been newly executed against PostgreSQL during portfolio packaging. Compare it with the original executed copies and record any differences. The received exports have been validated separately; this distinction is retained in comments and documentation.

## Expected source fields

This is the interface required by the queries, not a database DDL dump or a claim that constraints were verified.

| Table | Required fields |
|---|---|
| `website_sessions` | `website_session_id`, `created_at`, `device_type`, `utm_source`, `utm_campaign`, `http_referer`, `is_repeat_session` |
| `orders` | `order_id`, `website_session_id`, `user_id`, `created_at`, `price_usd` |
| `website_pageviews` | `website_pageview_id`, `website_session_id`, `created_at`, `pageview_url` |
| `products` | `product_id`, `product_name` |
| `order_items` | `order_item_id`, `product_id`, `created_at`, `price_usd`, `cogs_usd`; verify `order_id` for source relationship checks |
| `order_item_refunds` | `order_item_id`, `created_at`; verify the source refund primary key for duplicate-event checks |

Session/pageview/order/item/product keys must be unique for the relevant queries. Source timestamps and USD amounts must have suitable types. Null and unmatched keys require investigation in the original database. Repeat-purchase sequencing uses `(created_at, order_id)` to distinguish tied orders deterministically.

Acquisition groups `gsearch` and `bsearch` as Paid Search, `socialbook` as Paid Social, qualifying null-source search referrers as Organic Search, null-source/null-referrer visits as Direct, and remaining visits as Other. These are project rules defined in SQL, not inferred real-world advertising platforms.
