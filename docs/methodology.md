# Methodology and limits

## Analytical workflow

The project establishes a business baseline, evaluates growth and seasonality, compares acquisition and device segments, traces the website funnel, compares product economics and mix, examines refunds, and distinguishes repeat visits from repeat purchases. The resulting evidence supports investigation priorities and test proposals.

The seven CSV outputs are independent aggregates designed for their own grains and intended as separate Tableau sources. Joining them into a single flat table would duplicate measures because their dimensions and populations differ. The revised workbook received October 18 has seven source definitions whose active text connection filenames match the intended exports. The earlier overview connection mismatch is corrected. Embedded extract rows were not independently queried; see the Tableau handoff notes for the checked scope.

## Joins and attribution

- Orders are aggregated to one row per session before joining to website sessions. A left join retains non-converting sessions in the denominator.
- Session-based exports attribute every linked order to the session's start month. Product-based exports use the item's sale month. Full-window revenue agrees, but 11 monthly comparisons differ, with a maximum absolute difference of $79.98. Those differences are documented, not silently removed; the individual boundary-crossing records have not been inspected.
- Product names are left-joined to items so a missing name does not drop a sale. Product IDs are the stable grouping key; one product row per ID is assumed.
- Refunds are reduced to distinct item IDs with a qualifying 30-day event before counting refunded items. This prevents multiple refund events from inflating incidence.

## Ordered funnel

The path is Session → Products → Product detail → Cart → Shipping → Billing → Order confirmation. Event order uses pageview timestamp, then pageview ID to break ties. Intervening and repeated pages are allowed. A stage qualifies only after every prior tracked stage has qualified.

The final stage is the `/thank-you-for-your-order` page, not the orders table. Actual orders-table converting sessions are retained separately for reconciliation. These counts happen to agree in the supplied complete-month export; equality is not guaranteed by the definitions. Purchases that skip a tracked stage may fall outside this path.

Only the literal URL variants recorded in the query are mapped. The export also retains unordered page reach for comparison. Cohort size repeats for every stage; aggregate it only within a stage.

## Product and customer cohorts

Product launch comparisons are descriptive. Different selling histories, seasons, traffic levels, and prices affect lifetime rankings and growth comparisons. Falling product share can coexist with rising unit sales.

Refund cohorts follow each sale item for 30 days. First-purchase cohorts follow each customer for 90 days. The November 2014 customer-cohort cutoff supports the complete observation window using orders before March 2015. First-purchase dates are determined from all available earlier history before filtering the displayed cohorts. Stable customer IDs, unique order IDs, and adequate history are assumed. Refunded orders still count as purchases in this definition.

## Validation and provenance

Prior project reviews checked the seven exports and the Tableau values and relevant filter behavior. The repository adds a portable script that reproduces export-level schema, grain, numeric, count, ratio, and reconciliation checks. Its output includes file hashes and distinguishes documented attribution differences from failed reconciliations.

Four SQL definitions were packaged from saved query files; three were initially extracted from the project log. On October 22, 2026, those three statements were matched to the author's supplied overview, product, and refund scripts. Differences were limited to introductory comments, blank lines, and the final line break. This completes the supplied-script comparison. Query execution against the original PostgreSQL database was not independently observed. Full source-to-dashboard reproduction still requires the source import/setup and documented runs that regenerate the exports.

SQL drafting, troubleshooting, documentation, and validation scripting used AI assistance. The portfolio author should be able to explain the joins, denominators, date windows, and conclusions and should retain the SQL actually executed. This project makes no claim that the work was completed without assistance.

## Limits that affect decisions

- This is historical, observational analysis. Segment gaps, launches, and time trends do not establish causation, incrementality, or statistically significant effects.
- Ad spend, cost per acquisition, refund reasons, fulfillment/batch records, return handling, and recovered COGS are unavailable. ROI, channel profitability, net profit, and refund causes cannot be established.
- A latest observed event timestamp does not prove complete extraction or a refund policy. Raw uniqueness, orphan records, event instrumentation, and source coverage still need verification in the original database.
- Cohort repeat purchasing is not lifetime retention or churn. Repeat-session flags do not prove prior purchasing.
- Revenue, gross margin, and gross profit are before refunds and other expenses. No recommendation includes an unsupported monetary benefit forecast.
- The author supplied the current PostgreSQL 18.4 build and America/Chicago session timezone on October 20, 2026. Original import instructions, dataset retrieval date/version, exact export execution details, and final public links remain release items. The current session setting does not establish the source timestamp convention. Full-size dashboard images are included and were reviewed against recorded display controls on October 20, 2026; they do not establish live publication or embedded-extract equality. The supplied workbook records Tableau 2025.2.4 on macOS. Source attribution and the provider-listed Public Domain license are recorded in the data inventory. This package does not certify compliance with a formal analytical standard.
