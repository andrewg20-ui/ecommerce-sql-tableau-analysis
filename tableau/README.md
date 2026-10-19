# Tableau workbook and final handoff

[Download ecommerce.twbx](ecommerce.twbx). The received workbook is preserved byte for byte. It is a saved draft with two settings to correct before public release.

## Package inspection — October 18, 2026

- ZIP integrity passed. The package contains Book1.twb and all seven referenced Hyper extracts.
- Workbook metadata identifies Tableau 2025.2.4 (build 20252.25.1003.1601) on macOS.
- The workbook contains 22 worksheets and the three expected dashboards: Business Overview; Acquisition & Funnel; Products, Refunds & Customers.
- All eight overview sheets have the saved April 1, 2012–February 28, 2015 filter. Its cached preview shows $1,856,559.28 revenue, 455,909 sessions, and 30,999 orders.
- Website Funnel is saved with Device Type = Mobile. Reset it to (All) for the default portfolio view.
- The source captioned monthly_overview.csv references acquisition_monthly.csv in both its text connection and table relation. Its saved KPI formulas use summed numerators and denominators. The earlier CSV validation established that acquisition and overview totals agree by month in the complete-month window, so this mismatch alone does not demonstrate incorrect displayed totals. It does prevent the saved connection from matching the documented source lineage.
- The other six source filenames match the intended project exports. Extract paths resolve inside the package, and the XML contains no nonempty saved passwords.
- The three embedded dashboard thumbnails are only 384 × 384 pixels and crop the larger dashboards. They are not suitable README presentation images.

Inspection covered the package, saved XML settings, formulas relevant to the two findings, and cached thumbnails. It did not open the workbook in Tableau, exercise filters, or independently query the embedded extract rows. The local Hyper process could not start because the runtime denied its socket operation. Prior CSV checks and dashboard screenshot reviews remain valid within their original scopes.

SHA-256: `970a13ca6eda1f5693462629b16e616407c9b115dcf3ac8d9a6e7c31bd19ea12`.

## Two settings to correct in Tableau

Save a local backup before changing the workbook.

1. From a Business Overview worksheet, select the source named monthly_overview.csv. Use **Edit Connection** to point to the intended [monthly_overview.csv](../data/processed/monthly_overview.csv), preserving the existing field names and calculated fields. Refresh the extract. Keep the existing April 2012–February 2015 filter. Check Sessions 455,909; Orders 30,999; Revenue $1,856,559.28; Conversion 6.80%; AOV $59.89. **Save locally after this edit.**
2. Open Acquisition & Funnel and change the funnel device selector to **(All)**. Confirm the first stage is 455,909 sessions and Cart is 91,127 sessions. The channel and device charts should retain their existing complete-period scope. **Save locally after this edit.**

Resave the packaged workbook and reopen that saved file to check these changes. The observed Command-S toolbar action says Save to Tableau Public, so use the local save destination rather than assuming the shortcut creates a local backup.

## Remaining assets

| Asset | Filename / destination | Status |
|---|---|---|
| Packaged workbook | [ecommerce.twbx](ecommerce.twbx) | Received; replace after the two corrections |
| Overview image | business_overview.png | Full-size export pending |
| Acquisition/funnel image | acquisition_funnel.png | Full-size export pending |
| Product/refund/customer image | products_refunds_customers.png | Full-size export pending |
| Tableau Public share link | Root README | Not supplied |

The saved dashboard sizes are 1200 × 900 for the first two and 1200 × 1500 for Products, Refunds & Customers. Export the complete dashboards at readable size after correcting the settings; preserve the first-purchase cohort scope of April 2012–November 2014. Earlier authoring screenshots already support the build review, so another cosmetic review loop is unnecessary.

The [data inventory](../data/README.md) records Maven's provider-listed Public Domain license. A packaged workbook includes data; verify the intended project sources before publication. Reopening a downloaded package and testing its default view remain release checks, separate from ZIP/XML inspection.

Official references, checked October 18, 2026: [edit data connections](https://help.tableau.com/current/pro/desktop/en-us/howto_connect.htm), [save workbooks](https://help.tableau.com/current/pro/desktop/en-us/save_savework.htm), and [export views](https://help.tableau.com/current/pro/desktop/en-us/save_export_image.htm).
