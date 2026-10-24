# Tableau workbook and final handoff

[Download ecommerce.twbx](ecommerce.twbx). This is the revised file received as ecommerce(1).twbx on October 18, 2026, preserved byte for byte under a stable repository filename.

**Workbook and presentation images included:** both requested saved-setting corrections are confirmed. All three full-size dashboard exports were received and visually reviewed on October 20, 2026. [All three dashboards are live on Tableau Public](https://public.tableau.com/app/profile/andrew.gerardo/viz/E-commercePerformanceAnalysis/BusinessOverview).

## Published view checks — October 23, 2026

All three dashboard tabs are visible and open without sign-in: Business Overview, Acquisition & Funnel, and Products, Refunds & Customers. Use the tabs above the visualization at the [public workbook link](https://public.tableau.com/app/profile/andrew.gerardo/viz/E-commercePerformanceAnalysis/BusinessOverview).

- **Business Overview:** the April 2012–February 2015 reporting label, all three trend panels, and all five headline metrics match the controls: revenue $1,856,559.28; sessions 455,909; orders 30,999; conversion 6.80%; average order value $59.89.
- **Acquisition & Funnel:** all six panels render. Paid Search shows 365,456 sessions; Organic Search conversion is 7.49% and revenue per session is $4.51. Device conversion is 8.45% desktop versus 3.10% mobile. The funnel defaults to All and shows 455,909 starting sessions and 91,127 cart sessions.
- **Live filter test:** selecting mobile updates the funnel to 140,502 → 66,408 → 45,216 → 19,036 → 11,348 → 8,032 → 4,349 across its seven ordered stages. Every count matches the mobile aggregate export. Revert restored All, including 455,909 starting sessions and 91,127 cart sessions; no changed filter was saved.
- **Products, Refunds & Customers:** all eight panels render, including the bottom cohort chart. Product gross-profit labels match $710,711.00, $208,987.50, $148,743.00, and $95,837.50; the gross-margin labels match 61.01%, 62.51%, 68.49%, and 68.36% for Mr. Fuzzy, Love Bear, Sugar Panda, and Mini Bear respectively. Refund rates are 5.97%, 5.18%, 2.21%, and 1.33% in descending order. Repeat/first-session conversion is 7.81%/6.60%, with revenue per session $4.72/$3.94. The title distinguishes April 2012–February 2015 sales/refunds/sessions from April 2012–November 2014 first-purchase cohorts.

These are representative rendering, navigation, and one filter-cycle checks, not an exhaustive test of every mark or an independent query of the published extracts. The previous missing-tab handoff is resolved. No further dashboard rebuild is required for this release.

The repository's downloadable package remains the reviewed October 18 copy. Its identity and earlier checks below do not establish byte equivalence with the October 23 publication. No workbook or data edits were made during the visitor checks.

## Revised package checks

- Archive integrity passed; Book1.twb and all seven referenced Hyper extracts are present.
- The workbook records Tableau 2025.2.4 (build 20252.25.1003.1601) on macOS, with 22 worksheets and three dashboards.
- All seven active text connection filenames match the intended exports. The overview now points to monthly_overview.csv and includes a newly saved extract.
- All eight overview sheets retain April 1, 2012–February 28, 2015.
- Website Funnel includes all device members. Its cached preview shows Cart at 91,127 sessions, consistent with the all-device view.
- Cached overview and KPI previews match Revenue $1,856,559.28; Sessions 455,909; Orders 30,999; Conversion 6.80%; and AOV $59.89.
- No direct XML or data edits were applied to the received workbook.

The overview retains an internal table identifier containing its former acquisition name. The active connection filename is now correct; the retained name alone does not establish an unresolved source problem or require another replacement.

SHA-256: `7b6fc7324031b3683153429c51f641d83e8f8469613f744e2f7062528b36e0e2`.

## Scope and limits

Checks covered archive integrity, referenced extract presence, saved source connections and filters, and representative cached previews. The five unchanged extracts retain the bytes of the previous package; overview and cohort extract bytes changed. Embedded rows were not independently queried. The earlier local Hyper process attempt could not start because the runtime denied its socket operation, so that unchanged blocker was not retried.

The supplied full-size PNGs were inspected directly; all dashboard panels are visible, including the entire customer-cohort row. This is a static presentation review, not a fresh local Tableau render or live filter test. Prior CSV validation and dashboard interaction reviews retain their original scopes. The full-size exports below replace the cropped embedded thumbnails as the portfolio previews.

## Portfolio assets

| Asset | Filename / destination | Status |
|---|---|---|
| Packaged workbook | [ecommerce.twbx](ecommerce.twbx) | Revised package received; two corrections confirmed |
| Overview image | [business_overview.png](business_overview.png) | Received and reviewed; 2048 × 1535 px |
| Acquisition/funnel image | [acquisition_funnel.png](acquisition_funnel.png) | Received and reviewed; 2048 × 1535 px |
| Product/refund/customer image | [products_refunds_customers.png](products_refunds_customers.png) | Received and reviewed; 1638 × 2047 px |
| Tableau Public share link | [Live dashboards](https://public.tableau.com/app/profile/andrew.gerardo/viz/E-commercePerformanceAnalysis/BusinessOverview) | All three tabs open without sign-in; representative values and mobile funnel filter verified |

The images are the author's supplied exports, copied without pixel changes under repository-safe filenames and embedded in the root README. The first two workbook dashboards are fixed at 1200 × 900; Products, Refunds & Customers is fixed at 1200 × 1500. The supplied PNGs use larger export resolutions.

## Full-size export review

- Business Overview shows all five expected KPIs: revenue $1,856,559.28; sessions 455,909; orders 30,999; conversion 6.80%; AOV $59.89. All three monthly trend panels are visible.
- Acquisition & Funnel shows the All device selector, the expected channel/device values, and the full seven-stage funnel. The funnel starts at 455,909 sessions, reaches Cart at 91,127, and ends at 30,999 order confirmations.
- Products, Refunds & Customers contains all eight panels. The four profit and margin labels, four refund-rate labels, and both session-type comparisons match the recorded controls. Its subtitle distinguishes the April 2012–February 2015 sales/refund/session scope from the April 2012–November 2014 purchase cohorts.
- The two longer product names are abbreviated in the color legends, but their full names appear in the product bars. The root README includes a full-name color key. The cohort chart title identifies the metric despite its shortened vertical axis label. These do not require another layout revision for the current preview handoff.

The reviewed images preserve the complete-month and all-device defaults. No new analysis or workbook changes were made during this image handoff.

Save the workbook locally before preparing exports and after any edit. The observed Command-S toolbar action says Save to Tableau Public, so choose the local save destination when making a backup. Reopen the saved package and check fresh rendering and default values when preparing public release.

The [data inventory](../data/README.md) records Maven's provider-listed Public Domain license. The package contains embedded data and retains original local connection metadata. Publication and the scoped visitor checks are complete. GitHub public release remains the next handoff; the repository is still private.

Official references, checked October 18, 2026: [edit data connections](https://help.tableau.com/current/pro/desktop/en-us/howto_connect.htm), [save workbooks](https://help.tableau.com/current/pro/desktop/en-us/save_savework.htm), and [export views](https://help.tableau.com/current/pro/desktop/en-us/save_export_image.htm).
