# Portfolio release checklist

This is a practical readiness checklist for this project, not a certification against a formal analytics standard. Analysis, documentation, export checks, Tableau publication, and GitHub public release are complete within their reviewed scopes. Repository visibility was verified as public on October 25, 2026. Optional presentation choices and documented reproducibility limits are listed below.

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
- [x] Create the [project repository](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis) and add the prepared package contents.

- [x] Include the received packaged workbook with all three dashboards and seven embedded extracts.
- [x] Confirm the overview's saved complete-month date range and record Tableau version metadata.
- [x] Add full-size exports of all three dashboards, inspect the complete layouts and key labels, and embed the images in the README.
- [x] Record the author's current PostgreSQL 18.4 build and America/Chicago session timezone, preserving the supplied output and its provenance.
- [x] Document the author's recollection of CSV imports into PostgreSQL and use of DBeaver for SQL, while leaving the exact import/schema procedure unconfirmed.
- [x] Add the Tableau Public link to the root README and workbook documentation. A signed-out visit on October 23, 2026 confirmed that Business Overview loads and its five headline metrics match the controls.

## Publication checks

- [x] Confirm that all three intended dashboards are visible and open to a signed-out visitor. The visible charts show the intended project data. The reviewed downloadable package contains all three dashboards and seven project extracts; published extract contents have not been independently queried.
- [x] Confirm the revised overview connection uses monthly_overview.csv, a new overview extract is included, and all five saved KPI previews match the controls.
- [x] Confirm the revised funnel includes all devices and retains the April 2012–February 2015 overview range. The corrected package is saved and included.
- [x] Complete the scoped published-view check: all three dashboards render, reporting labels and representative values match, and the funnel defaults to All. Its mobile filter returns all seven expected counts; Revert restores All. See `tableau/README.md` for scope and limits.
- [x] Replace pending dashboard-link/navigation notes with the verified live workbook link and completed three-dashboard visitor checks.
- [x] Release the repository publicly. Andrew changed its visibility; GitHub reports `public` and `private: false`. The README content and linked local assets have been reviewed.

## Optional profile and reuse choices

- [ ] Add a short repository description and relevant topics; pin the completed project on the GitHub profile.
- [ ] Select a license for the author's original code/text if reuse permissions are desired. No separate license has been selected; the dataset's provider-listed terms are recorded separately.

## Recorded limitations and optional follow-up

The original dataset retrieval date/version, exact historical import/setup, source timestamp convention, and historical execution records remain explicitly unconfirmed in `docs/execution_record.md`. Keep those limits visible; add evidence if recovered. Supplied-script comparison is complete and does not establish an observed source-database rerun. These gaps limit the reproducibility claim; do not invent details or describe the analysis as independently reproduced from raw events.

No new dashboard, presentation deck, website, machine-learning model, or additional exploratory analysis is required just to finish this portfolio. Add work only when it resolves one of these concrete gaps or supports a new business question.
