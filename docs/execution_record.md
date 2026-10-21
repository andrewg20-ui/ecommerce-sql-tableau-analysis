# Execution record

This file records what was actually executed. A prepared query or matching CSV does not establish the exact SQL used to create that CSV.

| Item | Current record |
|---|---|
| Original dataset provider and URL | Maven Analytics — [Toy Store E-Commerce Database](https://mavenanalytics.io/data-playground/toy-store-e-commerce-database) |
| Source license | Provider-listed Public Domain; checked October 16, 2026 |
| Dataset version / retrieval date | Not yet recorded |
| Import / PostgreSQL setup instructions | Not yet supplied |
| Current PostgreSQL server version | 18.4; author-supplied version() output received October 20, 2026. Full build string recorded below. |
| Current PostgreSQL session timezone | America/Chicago; author-supplied SHOW TIMEZONE output received October 20, 2026. |
| Original export execution environment | Not yet confirmed whether the current version and session settings match those used for all original exports. |
| Source timestamp timezone | Not yet established; the current session's America/Chicago setting does not establish the timezone represented by the imported timestamp values. |
| Tableau version | Packaged workbook metadata: 2025.2.4, build 20252.25.1003.1601, macOS; received October 18, 2026 |
| SQL provenance | Four saved definitions; three definitions recovered verbatim from the project log |
| Exact executed SQL compared with packaged files | Pending author confirmation |
| Raw primary keys / foreign-key relationships verified | Not observed in this portfolio preparation |
| Raw-event coverage verified | Not established from aggregate exports |
| CSV validation | Executed against all seven packaged exports; 44/44 check groups pass |
| Tableau review | Prior three-dashboard reviews retained. The received package includes 22 worksheets, three dashboards, and seven extracts. Static XML, cached-thumbnail, and supplied full-size PNG inspection completed; no live Tableau rendering or interaction was performed here. |
| Workbook saved defaults | Revised package: April 1, 2012–February 28, 2015 on all eight overview sheets; Website Funnel includes all device members. Both saved-default handoffs are resolved. |
| Workbook source lineage | Revised package: all seven text connection filenames agree with their intended exports, including monthly_overview.csv. A new overview extract is embedded. A retained internal table identifier still includes the former acquisition name; the active filename is correct, so that name alone does not establish an unresolved connection problem. |
| Embedded extract row verification | Not independently queried: the local Hyper process could not start because the runtime denied its socket operation. Existing CSV checks do not establish embedded-extract equality. |
| Saved preview checks | Overview revenue $1,856,559.28; sessions 455,909; orders 30,999; conversion 6.80%; AOV $59.89. All-device Cart count 91,127. Cached images, not fresh rendering. |
| Full-size presentation exports | Received and visually reviewed October 20, 2026: Business Overview and Acquisition & Funnel at 2048 × 1535 px; Products, Refunds & Customers at 1638 × 2047 px. All panels visible; headline labels and default scopes match the recorded controls. PNGs copied unchanged to tableau/ and embedded in the README. Static export review does not establish embedded-row equality or a live published view. |
| Packaged workbook checksum | SHA-256: 7b6fc7324031b3683153429c51f641d83e8f8469613f744e2f7062528b36e0e2; received ecommerce(1).twbx copied unchanged to tableau/ecommerce.twbx |
| Recommendations | Author reports saved and stored on October 13, 2026; implementation outcomes not measured |

## Current environment: author-supplied results

Received October 20, 2026. The author ran the following statements separately and supplied their results; these were not independently executed during portfolio preparation.

```sql
SELECT version() AS postgresql_version;
```

```text
PostgreSQL 18.4 on x86_64-apple-darwin24.6.0, compiled by Apple clang version 17.0.0 (clang-1700.6.3.2), 64-bit
```

```sql
SHOW TIMEZONE;
```

```text
America/Chicago
```

These record the current server build and session timezone. The original export-run environment and the timezone represented by source timestamps remain unconfirmed. No timezone or database setting was changed as part of this step.

## Next setup detail

Record how the original Maven data was loaded into PostgreSQL: the source format (for example, CSV tables or a SQL script), the application or command used, and any schema or syntax changes. If the original method is not recalled, keep it marked unknown until it can be recovered from an import script or notes. Then compare the packaged export queries with the SQL actually run and record any genuine reruns.

## Query execution history

When rerunning a query, add a row below with its filename, execution date, database/dataset version, exported row count, and any changes. Do not backfill unobserved runs as completed.

| Query file | Execution date | Database / dataset version | Export rows | Changes / result |
|---|---|---|---:|---|
| Awaiting original execution record or rerun | — | — | — | — |
