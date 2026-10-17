# Portfolio release checklist

This is a practical readiness checklist for this project, not a certification against a formal analytics standard. Documentation and export checks are ready within their reviewed scope. Public release still needs the execution and delivery items below.

## Prepared

- [x] State the business question and reporting population.
- [x] Include the seven principal findings, evidence, and limitations.
- [x] Retain five recommendations with metrics and validation plans.
- [x] Define metric numerators, denominators, units, and time windows.
- [x] Preserve separate grains for sessions, products, refunds, and customer cohorts.
- [x] Recover all seven export query definitions and label their execution status honestly.
- [x] Package the seven supplied aggregate CSVs without modifying their contents.
- [x] Include a runnable validator and recorded result: 44/44 check groups passed.
- [x] Record the known monthly attribution difference instead of forcing a false reconciliation.
- [x] Provide README, reproduction instructions, export inventory, and limitations.
- [x] Keep the lengthy working conversation log out of the recruiter-facing repository package.
- [x] Credit Maven Analytics and the original dataset URL; record the provider-listed Public Domain license.
- [x] Create the private [project repository](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis) and add the prepared package contents.

## Before public release

- [ ] Record the original dataset retrieval date and version or file checksum in `data/README.md` and `docs/execution_record.md`.
- [ ] Compare the recovered queries with the SQL actually run. Record the source setup, PostgreSQL version, timezone, and execution results in `docs/execution_record.md`.
- [ ] Supply the final `.twbx` workbook or a working Tableau Public link and presentation screenshots of all three dashboards. Confirm that the workbook contains only data intended for publication.
- [ ] Restore the overview to April 2012–February 2015 and the funnel device filter to (All), if still needed. Save locally after every edit.
- [ ] Open the relocated/published workbook and check its source paths, default filters, readable layout, and representative values. Reuse earlier checks for components unchanged by publication.
- [ ] Decide the license for the author's code/text separately from the dataset terms; do not license someone else's dataset by assumption.
- [ ] Replace the pending dashboard notes with verified links, then review the README as a visitor and make the repository public when ready.
- [ ] Add a short repository description and relevant topics; pin the completed project alongside Cyclistic and Bellabeat.

No new dashboard, presentation deck, website, machine-learning model, or additional exploratory analysis is required just to finish this portfolio. Add work only when it resolves one of these concrete gaps or supports a new business question.
