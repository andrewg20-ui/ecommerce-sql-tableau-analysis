# E-commerce project: recommendations

Prepared October 11, 2026; saved and retained by the project author October 13, 2026. Based on the historical dataset and validated project exports. These are proposed actions for the portfolio case study; implementation and business impact have not been measured.

## Decision and reporting scope

Prioritize mobile conversion and product refund investigations, then test merchandising and repeat-purchase initiatives. This ordering reflects the size and specificity of the observed gaps, not a calculated return on investment. Effort, acquisition costs, refund reasons, and operational capacity are unavailable.

Unless otherwise stated, figures cover **April 2012–February 2015**. Refunds use item sale cohorts and an inclusive 30-day follow-up window. Repeat-purchase cohorts cover **April 2012–November 2014**, allowing a full 90 days of observation. Gross margin is before refunds and other expenses. Ratios are calculated from summed numerators and denominators.

## 1. Diagnose mobile friction and test targeted improvements

**Evidence:** Mobile conversion is **3.10%**, compared with **8.45%** on desktop. Gross revenue per session is **$1.87** versus **$5.05**. Across all devices, product detail → cart has the largest conditional funnel loss (**54.88%**); entry → products loses the most sessions in absolute terms (**204,442**). [E1–E2]

**Action:** Inspect mobile product discovery, product detail, and checkout behavior. Compare like-for-like time periods and acquisition segments, then test one specific change supported by usability or performance evidence.

**Measure and validate:** Use converting mobile sessions / eligible mobile sessions as the primary outcome, with revenue per session and the affected stage's continuation rate as supporting measures. Assign eligible visitors consistently to a randomized test and control; predefine the minimum detectable effect, required sample, and decision rule. Monitor refund incidence and order value as guardrails. The desktop rate is a comparison point, not an assumed achievable target; device differences alone do not establish a UX cause.

## 2. Investigate the historical Mr. Fuzzy refund spike and monitor recurrence

**Evidence:** Its weighted 30-day refund rate rose from **3.95% in January–July 2014** to **13.51% in August–September**, then fell to **3.41% in October 2014–February 2015**. The spike had already subsided within the dataset. [E3]

**Action:** If available, review refund reasons, production batches, suppliers, fulfillment records, and product-page changes associated with the affected sale cohorts. Compare them with adjacent periods and other products. Document any supported explanation and establish ongoing monitoring for similar changes.

**Measure and validate:** Track distinct items refunded within 30 days / items sold by product and sale cohort, using fully observed cohorts. Show counts alongside rates. Calibrate alerts to baseline variability and volume rather than inventing a fixed threshold from these monthly aggregates. A temporary spike supports investigation; it does not prove a manufacturing defect or a continuing problem.

## 3. Investigate Sugar Panda's persistently elevated refund incidence

**Evidence:** Sugar Panda combines the highest pre-refund margin (**68.49%**) with the highest complete-period 30-day refunded-item rate (**5.97%**). Mini Bear has a similar margin (**68.36%**) and a lower observed refund rate (**1.33%**). Sugar Panda's monthly rates generally remain around 5–7%. [E3–E4]

**Action:** Review available return reasons and product-expectation, packaging, and fulfillment evidence. Test the specific change supported by that review rather than assuming that high margin implies poor product economics or that refunds prove dissatisfaction.

**Measure and validate:** Compare mature 30-day sale-cohort refund rates before and after the change, preferably with a concurrent control. Track conversion and order volume so a lower refund rate is not achieved simply by reducing sales. Estimate profitability only after documenting refund amounts, return handling, and any recoverable product cost. The current export does not provide a complete post-refund profit measure.

## 4. Test Mini Bear merchandising while protecting total basket performance

**Evidence:** Mini Bear pairs a **68.36%** pre-refund margin with a **1.33%** 30-day refund rate. Mr. Fuzzy remains the largest individual seller, while its unit share fell from **71.75% in December 2013** to **51.13% in December 2014** as its units grew from **818 to 1,584**. [E3–E4]

**Action:** Test relevant Mini Bear recommendations or cross-sell placements. Retain Mr. Fuzzy's role as the flagship product while assessing whether broader merchandising adds profitable demand.

**Measure and validate:** Randomize eligible visitors and evaluate total gross profit per eligible session, conversion, basket value, and 30-day refunds. Include implementation or promotion costs and documented refund economics before calling the test profitable. Measure all products together: higher Mini Bear sales alone would not establish incremental growth or rule out cannibalization.

## 5. Test a focused repeat-purchase initiative with a holdout

**Evidence:** Repeat sessions convert at **7.81%** and generate **$4.72/session**, versus **6.60%** and **$3.94/session** for first sessions. Separately, the January–November 2014 first-purchase cohorts show a weighted **2.11%** 90-day repeat-purchase rate; all included cohorts total **439 / 24,105 = 1.82%**. [E5–E6]

**Action:** Propose a relevant post-purchase product recommendation or occasion-based follow-up and test it against an untreated holdout among eligible first-time buyers.

**Measure and validate:** Count customers placing another distinct order within 90 days / eligible first-time buyers, with equal follow-up and consistent assignment. Track revenue and refund-adjusted economics per assigned customer, including contact and discount costs. Returning visits are not the same as returning purchasers. The observed rates neither prove a retention initiative will work nor establish an industry benchmark or lifetime churn rate.

## Acquisition decision that needs more evidence

Paid Search supplies the most sessions (**365,456**). Organic Search has higher observed conversion (**7.49%**) and gross revenue per session (**$4.51**) in this window. Collect channel and campaign costs before recommending budget reallocations or claiming better profitability; traffic efficiency alone does not establish ROI. [E1]

## Evidence register and limits

| Ref | Validated export | Grain and supporting evidence |
|---|---|---|
| E1 | `acquisition_monthly.csv` | Month × channel × source × campaign × device; acquisition and device comparisons. |
| E2 | `funnel_monthly.csv` | Month × device × ordered stage; conditional drop-off and absolute session losses. |
| E3 | `refund_monthly.csv` | Sale month × product; items sold and distinct items refunded within 30 days. |
| E4 | `product_monthly.csv` | Item sale month × product; units, revenue, COGS, gross profit, and unit shares. |
| E5 | `customer_sessions_monthly.csv` | Session month × first/repeat session type; conversion and gross revenue per session. |
| E6 | `repeat_purchase_cohorts.csv` | First recorded purchase month; customers and 90-day repeat purchasers. |

Query definitions, metric definitions, validation results, and limitations are documented in this repository. The detailed working log is retained separately. These recommendations reuse the completed checks; it does not claim new database execution or new causal analysis. Product sale-month and session-month revenue attribution differ in some months; compare them only with the documented date definitions. Refund follow-up completeness, stable customer identity, and raw-event coverage remain stated assumptions. No monetary uplift forecast is justified by the current evidence.

## Portfolio next step

Use these recommendations alongside the seven final findings. Package the executed SQL, permitted exports, metric definitions, dashboard screenshots/link, and limitations in a reproducible GitHub README. Before capturing the final dashboard views, restore the intended default filters and save the workbook locally. Publishing the workbook and GitHub repository remains a separate step.
