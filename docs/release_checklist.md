# Portfolio release checklist

This is a practical readiness checklist for this project, not a certification against a formal analytics standard. Documentation and export checks are ready within their reviewed scope. Public release still needs the execution and delivery items below.

## Prepared

- [x] State the business question and reporting population.
- [x] Include the seven principal findings, evidence, and limitations.
- [x] Retain five recommendations with metrics and validation plans.
- [x] Define metric numerators, denominators, units, and time windows.
- [x] Preserve separate grains for sessions, products, refunds, and customer cohorts.
- [x] Recover all seven export query definitions and label their execution status honestly.
- [x] Match the three previously log-recovered statements to the author's supplied overview, product, and refund scripts; record only comment/blank-line/final-newline differences. The other four saved files were already supplied.
- [x] Package the seven supplied aggregate CSVs without modifying their contents.
- [x] Include a runnable validator and recorded result: 44/44 check groups passed.
- [x] Record the known monthly attribution difference instead of forcing a false reconciliation.
- [x] Provide README, reproduction instructions, export inventory, and limitations.
- [x] Keep the lengthy working conversation log out of the recruiter-facing repository package.
- [x] Credit Maven Analytics and the original dataset URL; record the provider-listed Public Domain license.
- [x] Create the private [project repository](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis) and add the prepared package contents.

- [x] Include the received packaged workbook with all three dashboards and seven embedded extracts.
- [x] Confirm the overview's saved complete-month date range and record Tableau version metadata.
- [x] Add full-size exports of all three dashboards, inspect the complete layouts and key labels, and embed the images in the README.
- [x] Record the author's current PostgreSQL 18.4 build and America/Chicago session timezone, preserving the supplied output and its provenance.
- [x] Document the author's recollection of CSV imports into PostgreSQL and use of DBeaver for SQL, while leaving the exact import/schema procedure unconfirmed.
- [x] Add the Tableau Public link to the root README and workbook documentation. A signed-out visit on October 23, 2026 confirmed that Business Overview loads and its five headline metrics match the controls.

## Before public release

- [ ] Record the original dataset retrieval date and version or file checksum in `data/README.md` and `docs/execution_record.md`.
- [ ] Recover the exact source import/setup, source timestamp convention, and historical execution details if available; otherwise retain their explicitly unconfirmed status in `docs/execution_record.md`. Script comparison is complete and does not establish an observed source-database rerun.
- [ ] Confirm that all three intended dashboards are available in the published workbook and that its contents are limited to the project data. Only Business Overview is currently exposed in the inspected viewer; the reviewed downloadable package contains all three.
- [x] Confirm the revised overview connection uses monthly_overview.csv, a new overview extract is included, and all five saved KPI previews match the controls.
- [x] Confirm the revised funnel includes all devices and retains the April 2012–February 2015 overview range. The corrected package is saved and included.
- [ ] Finish the published-view check: enable and verify dashboard navigation, then check the other two dashboards' default filters, layout, and representative values. Business Overview's reporting label, five KPIs, and three trend panels have been checked. Reuse earlier package/source checks within their recorded scope; live filter behavior and published extract rows are not yet independently verified.
- [ ] Decide the license for the author's code/text separately from the dataset terms; do not license someone else's dataset by assumption.
- [x] Replace pending dashboard-link notes with the verified Business Overview link, retaining the remaining navigation check.
- [ ] Review the README as a visitor and make the repository public when ready. The current repository is still private.
- [ ] Add a short repository description and relevant topics; pin the completed project alongside Cyclistic and Bellabeat.

No new dashboard, presentation deck, website, machine-learning model, or additional exploratory analysis is required just to finish this portfolio. Add work only when it resolves one of these concrete gaps or supports a new business question.
