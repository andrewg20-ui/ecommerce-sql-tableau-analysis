# Tableau workbook and final handoff

[Download ecommerce.twbx](ecommerce.twbx). This is the revised file received as ecommerce(1).twbx on October 18, 2026, preserved byte for byte under a stable repository filename.

**Workbook and presentation images included:** both requested saved-setting corrections are confirmed. All three full-size dashboard exports were received and visually reviewed on October 20, 2026. A live public link remains to be added.

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
| Tableau Public share link | Root README | Not supplied |

The images are the author's supplied exports, copied without pixel changes under repository-safe filenames and embedded in the root README. The first two workbook dashboards are fixed at 1200 × 900; Products, Refunds & Customers is fixed at 1200 × 1500. The supplied PNGs use larger export resolutions.

## Full-size export review

- Business Overview shows all five expected KPIs: revenue $1,856,559.28; sessions 455,909; orders 30,999; conversion 6.80%; AOV $59.89. All three monthly trend panels are visible.
- Acquisition & Funnel shows the All device selector, the expected channel/device values, and the full seven-stage funnel. The funnel starts at 455,909 sessions, reaches Cart at 91,127, and ends at 30,999 order confirmations.
- Products, Refunds & Customers contains all eight panels. The four profit and margin labels, four refund-rate labels, and both session-type comparisons match the recorded controls. Its subtitle distinguishes the April 2012–February 2015 sales/refund/session scope from the April 2012–November 2014 purchase cohorts.
- The two longer product names are abbreviated in the color legends, but their full names appear in the product bars. The root README includes a full-name color key. The cohort chart title identifies the metric despite its shortened vertical axis label. These do not require another layout revision for the current preview handoff.

The reviewed images preserve the complete-month and all-device defaults. No new analysis or workbook changes were made during this image handoff.

Save the workbook locally before preparing exports and after any edit. The observed Command-S toolbar action says Save to Tableau Public, so choose the local save destination when making a backup. Reopen the saved package and check fresh rendering and default values when preparing public release.

The [data inventory](../data/README.md) records Maven's provider-listed Public Domain license. The package contains embedded data and retains original local connection metadata. Publishing and fresh viewer checks remain separate handoffs; the repository is a private draft.

Official references, checked October 18, 2026: [edit data connections](https://help.tableau.com/current/pro/desktop/en-us/howto_connect.htm), [save workbooks](https://help.tableau.com/current/pro/desktop/en-us/save_savework.htm), and [export views](https://help.tableau.com/current/pro/desktop/en-us/save_export_image.htm).
