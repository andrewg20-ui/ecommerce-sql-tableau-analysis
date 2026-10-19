# Tableau workbook and final handoff

[Download ecommerce.twbx](ecommerce.twbx). This is the revised file received as ecommerce(1).twbx on October 18, 2026, preserved byte for byte under a stable repository filename.

**Ready within the package-inspection scope:** both requested saved-setting corrections are confirmed. Full-size presentation exports and a live public link remain to be added.

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

Fresh Tableau rendering and live filter behavior were not tested here. Prior CSV validation and dashboard screenshot reviews are retained at their original scopes. The embedded 384 × 384 dashboard thumbnails crop the larger views and are not suitable portfolio presentation images.

## Remaining assets

| Asset | Filename / destination | Status |
|---|---|---|
| Packaged workbook | [ecommerce.twbx](ecommerce.twbx) | Revised package received; two corrections confirmed |
| Overview image | business_overview.png | Full-size export pending |
| Acquisition/funnel image | acquisition_funnel.png | Full-size export pending |
| Product/refund/customer image | products_refunds_customers.png | Full-size export pending |
| Tableau Public share link | Root README | Not supplied |

The first two dashboards are fixed at 1200 × 900; Products, Refunds & Customers is fixed at 1200 × 1500. Export the complete dashboards at readable size, preserving the overview's April 2012–February 2015 range, the funnel's all-device default, and the separate April 2012–November 2014 first-purchase cohort scope.

Save the workbook locally before preparing exports and after any edit. The observed Command-S toolbar action says Save to Tableau Public, so choose the local save destination when making a backup. Reopen the saved package and check fresh rendering and default values when preparing public release.

The [data inventory](../data/README.md) records Maven's provider-listed Public Domain license. The package contains embedded data and retains original local connection metadata. Publishing and fresh viewer checks remain separate handoffs; the repository is a private draft.

Official references, checked October 18, 2026: [edit data connections](https://help.tableau.com/current/pro/desktop/en-us/howto_connect.htm), [save workbooks](https://help.tableau.com/current/pro/desktop/en-us/save_savework.htm), and [export views](https://help.tableau.com/current/pro/desktop/en-us/save_export_image.htm).
