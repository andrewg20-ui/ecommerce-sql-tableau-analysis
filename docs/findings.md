# Findings and evidence

Figures use April 2012–February 2015 unless a different period is explicitly stated. Source links point to the packaged aggregate outputs; definitions and caveats are in the [metric dictionary](metric_dictionary.md) and [methodology](methodology.md).

| Finding | Supporting evidence | Implication and limit | Source |
|---|---|---|---|
| F01. Growth includes traffic and efficiency gains | 2013 → 2014: sessions 112,781 → 233,422; orders 7,447 → 16,860; revenue $393,247.87 → $1,075,612.19. CVR 6.60% → 7.22%; AOV $52.81 → $63.80. | Revenue growth of 173.52% accompanies more visits, better conversion, and higher order value. The comparison is not seasonally adjusted or a causal decomposition. | [Overview](../data/processed/monthly_overview.csv) |
| F02. Paid Search provides scale; Organic Search shows higher observed efficiency | Paid Search 365,456 sessions. Organic Search 7.49% CVR and $4.51/session; Direct 7.16% and $4.36/session. | Use segment evidence to guide investigations. Spend data is required before budget or profitability conclusions. | [Acquisition](../data/processed/acquisition_monthly.csv) |
| F03. Mobile underperforms desktop on observed purchase outcomes | Mobile 140,502 sessions, 4,349 converting sessions, 3.10% CVR and $1.87/session. Desktop 315,407 sessions, 26,650 converting sessions, 8.45% CVR and $5.05/session. | Investigate behavior and traffic mix before assigning a UX cause; test a specific improvement. | [Acquisition](../data/processed/acquisition_monthly.csv) |
| F04. Funnel priorities depend on the measure of loss | Ordered stage counts: 455,909; 251,467; 201,962; 91,127; 61,890; 49,986; 30,999. Detail → cart loses 110,835 sessions, 54.88% of detail reach. Entry → products loses 204,442, 44.84% of starters. | Separate conditional drop-off from absolute losses and cumulative reach. | [Funnel](../data/processed/funnel_monthly.csv) |
| F05. Product mix diversifies while flagship units grow | Mr. Fuzzy, December 2013 → December 2014: 818 → 1,584 units; 71.75% → 51.13% unit share. February 2015 share 41.13%. | Largest individual seller does not mean a majority. New product sales do not by themselves prove incremental demand. | [Products](../data/processed/product_monthly.csv) |
| F06. Refund risk differs across products and periods | Sugar Panda 282/4,722 = 5.97%; Mini Bear 62/4,675 = 1.33%. Mr. Fuzzy: Jan–Jul 2014 233/5,898 = 3.95%; Aug–Sep 272/2,014 = 13.51%; Oct 2014–Feb 2015 229/6,713 = 3.41%. | Investigate Sugar Panda's persistent tendency and the historical Mr. Fuzzy spike. No refund reason or quality defect is proven. | [Refunds](../data/processed/refund_monthly.csv) |
| F07. Return visits outperform first visits; repeat purchasing is a separate measure | First sessions: 25,111/380,541 = 6.60%, $3.94/session. Repeat: 5,888/75,368 = 7.81%, $4.72/session. April 2012–November 2014 purchase cohorts: 439/24,105 = 1.82% repeating within 90 days. | Later cohorts improve unevenly: April–Dec 2012 0.84%, 2013 1.59%, Jan–Nov 2014 2.11%. Partial-year coverage differs. Return visits do not establish prior purchasing or causal retention lift. | [Sessions](../data/processed/customer_sessions_monthly.csv), [cohorts](../data/processed/repeat_purchase_cohorts.csv) |

## Product economics in the complete-month window

| Product | Units | Gross revenue | Pre-refund gross profit | Gross margin | 30-day item-refund rate |
|---|---:|---:|---:|---:|---:|
| The Original Mr. Fuzzy | 23,302 | $1,164,866.98 | $710,711.00 | 61.01% | 5.18% |
| The Forever Love Bear | 5,573 | $334,324.27 | $208,987.50 | 62.51% | 2.21% |
| The Birthday Sugar Panda | 4,722 | $217,164.78 | $148,743.00 | 68.49% | 5.97% |
| The Hudson River Mini bear | 4,675 | $140,203.25 | $95,837.50 | 68.36% | 1.33% |

Sources: [product export](../data/processed/product_monthly.csv) and [refund export](../data/processed/refund_monthly.csv). These measures use different numerators; refund incidence is not deducted from gross margin to create a net-profit estimate.

The five actions proposed from these findings are in [recommendations](recommendations.md). They remain hypotheses and investigations until implementation and controlled measurement provide outcome evidence.
