# Execution record

This file records what was actually executed. A prepared query or matching CSV does not establish the exact SQL used to create that CSV.

| Item | Current record |
|---|---|
| Original dataset provider and URL | Maven Analytics — [Toy Store E-Commerce Database](https://mavenanalytics.io/data-playground/toy-store-e-commerce-database) |
| Source license | Provider-listed Public Domain; checked October 16, 2026 |
| Dataset version / retrieval date | Not yet recorded |
| Import workflow, author recollection | Author recalls importing CSV files into PostgreSQL and using DBeaver to write and run SQL scripts; reported October 20, 2026. Exact import procedure is unconfirmed. |
| SQL client | DBeaver, reported by the author; client version not recorded. |
| PostgreSQL installation / import application | The author recalls a PostgreSQL application but is unsure of its name; no specific distribution, installer, import wizard, or command is inferred. |
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

## Author-reported import workflow

On October 20, 2026, the author recalled importing CSV files into PostgreSQL and using DBeaver to write and run the analysis scripts. The CSV import is a recollection rather than a verified import record.

The roles in that account are:

| Component | Role |
|---|---|
| Original CSV files | Recalled source format used to populate the database |
| PostgreSQL | Database that stores the tables and executes SQL |
| DBeaver | SQL client used to connect to PostgreSQL and write/run scripts |
| Tableau | Dashboard tool using the project's aggregate CSV exports |

The exact original filenames, schema creation statements, import application or command, type conversions, and installation package remain unconfirmed. In particular, this account does not establish that DBeaver performed the import. The original source CSVs are distinct from the seven aggregate exports already packaged in this repository.

This is enough to document the high-level workflow without inventing a reproducible import recipe. If original import files or notes are recovered, add their details here.

## Next provenance step

Compare original SQL scripts saved in DBeaver with the seven packaged definitions. Reuse the four supplied saved files; recover remaining originals if available, particularly the overview, product, and refund exports whose definitions were recovered from the project log. Record actual differences or missing originals. Do not infer that a query was executed merely because its definition or an aggregate CSV exists.

## Query execution history

When rerunning a query, add a row below with its filename, execution date, database/dataset version, exported row count, and any changes. Do not backfill unobserved runs as completed.

| Query file | Execution date | Database / dataset version | Export rows | Changes / result |
|---|---|---|---:|---|
| Awaiting original execution record or rerun | — | — | — | — |
