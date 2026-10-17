# Metric dictionary

All money is USD. Tableau rates use **SUM(numerator) / SUM(denominator)**, formatted as percentages; do not average or sum exported percentages. A zero denominator yields an unavailable result, not a fabricated zero rate.

| Metric | Numerator or definition | Denominator | Grain / date convention |
|---|---|---|---|
| Sessions | Count of eligible website session rows, assuming unique session IDs | — | Session start month |
| Converting sessions | Eligible sessions linked to at least one order | — | Session start month; each session counted once |
| Orders | All recorded orders linked to eligible sessions | — | Session start month in overview/acquisition/session-type exports |
| Session conversion | Converting sessions | Sessions | Same population and period for both |
| Gross revenue, session view | Sum of linked order prices before refunds | — | Attributed to the session start month, even for a later order timestamp |
| Average order value | Gross revenue from linked orders | Linked orders | Dollars per order |
| Revenue per session | Gross revenue from linked orders | Eligible sessions, including those without orders | Dollars per session |
| Items sold | Count of order-item rows | — | Item sale month; assumed one row per sold item |
| Gross revenue, product view | Sum of order-item prices before refunds | — | Item sale month × product |
| COGS | Sum of item product costs | — | Item sale month × product |
| Gross profit | Item gross revenue minus item COGS | — | Before refunds, acquisition costs, and operating expenses |
| Gross margin | Gross profit | Item gross revenue | Weighted product economics; not net profit |
| Monthly product unit share | Product's items sold in the month | Items sold across all products in that same month | Monthly composition; shares sum to 100% before display rounding |
| Ordered stage sessions | Sessions reaching the stage after all prior tracked stages | — | Session start month × device × stage |
| Stage reach | Ordered stage sessions | Starting session cohort size | Cumulative reach from session start; calculate within each stage |
| Step continuation | Ordered stage sessions | Sessions at the previous ordered stage | Conditional transition; undefined at stage 1 |
| Step drop-off | Previous ordered stage sessions minus current stage sessions | Previous ordered stage sessions | Conditional transition, not share of all sessions |
| Absolute stage loss | Previous ordered stage sessions minus current stage sessions | — | Sessions lost at one transition |
| 30-day item-refund rate | Distinct sold items with any refund at sale time through sale + 30 days, inclusive | Sold items in the same sale cohort | Sale month × product; an item with a partial refund counts once |
| First / repeat session | Recorded `is_repeat_session`: 0 / 1; other values retained as Unknown | — | Visit behavior, not purchase history |
| 90-day repeat-purchase rate | Customers with a second distinct recorded order no later than first order + 90 days | Customers in the same first-recorded-purchase cohort | First-purchase month; full history sequenced before cohort filtering |

## Reporting windows

| Output | Included dates | Follow-up / exclusions |
|---|---|---|
| Headline overview, acquisition, funnel, product, refund, and session-type views | April 1, 2012 inclusive to March 1, 2015 exclusive | Both partial March boundary months excluded from comparable headline totals |
| Original monthly overview CSV | March 2012–March 2015, 37 monthly rows | Preserved unchanged; filter to the 35 complete months for the dashboard |
| Refund sale cohorts | April 2012–February 2015 | Refund events may occur later; do not cut refunds off on March 1. Coverage through April 1, 2015 is assumed, not proven by the last event. |
| First-purchase cohorts | April 1, 2012 inclusive to December 1, 2014 exclusive | Use all recorded order history before March 1, 2015 to sequence customers and observe repeats |
| Full-year growth comparison | January–December 2013 versus January–December 2014 | Compare complete years, using pooled counts and revenue |

Timestamp timezone has not been recorded. The project uses the source timestamps as supplied without a timezone conversion. The user's local timezone is not evidence of the dataset's timezone.

Do not sum distinct user counts across months, sum funnel stages as a session KPI, sum chart status-bar percentages, or equate unit share with revenue share. Do not filter the product-share denominator down to only one product when claiming share of the entire catalog.
