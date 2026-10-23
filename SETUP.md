# Finish the GitHub portfolio

The project is stored in [andrewg20-ui/ecommerce-sql-tableau-analysis](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis). The repository is a private draft containing the analysis, SQL definitions, seven aggregate exports, documentation, and validation script. Maven Analytics is credited as the dataset provider, with its Public Domain label recorded in [the data inventory](data/README.md).

## Next handoff

1. The [Business Overview publication](https://public.tableau.com/app/profile/andrew.gerardo/viz/E-commercePerformanceAnalysis/BusinessOverview) is live and linked in the README. A signed-out visit on October 23, 2026 confirmed the five expected KPIs. The next step is dashboard navigation: while signed in on Tableau Public, open the visualization's **Edit Details**, enable **Show Sheets as Tabs**, and save. Confirm that all three dashboards are available. If only Business Overview remains, confirm that the published workbook includes the other two dashboards. [Official setting instructions](https://help.salesforce.com/s/articleView?id=001473332&language=en_US&type=1).
2. Check the other two published dashboards' reporting scopes, default filters, layout, and representative KPI values. Preserve April 2012–February 2015 and the funnel's All device selection; first-purchase cohorts end in November 2014. Save locally before and after any further Tableau workbook edit. For this Public Edition, publication uses **File → Save to Tableau Public As…**; the previously documented Server path did not match the author's interface. Reuse prior checks for components unchanged by publication.
3. The SQL-file comparison is complete: all three previously log-recovered statements match the supplied scripts, and the other four saved definitions were already included. Keep any unrecovered import steps, original dataset version/retrieval date, and historical execution details explicitly unconfirmed. See [the execution record](docs/execution_record.md).
4. Complete [the release checklist](docs/release_checklist.md), decide how to license the author's original code/text, and make the repository public when ready. The live dashboard link is already included.

## Portfolio presentation

Suggested repository description: **SQL and Tableau analysis of e-commerce growth, conversion, product economics, refunds, and repeat purchasing using Maven Fuzzy Factory data.**

Suggested topics: `sql`, `postgresql`, `tableau`, `data-analysis`, `ecommerce`, `cohort-analysis`.

After public release, pin this project alongside Cyclistic and Bellabeat. The README should give a visitor the business question, main results, dashboard preview and link, methods, reproducibility instructions, recommendations, source credit, and limitations without needing the working conversation log.

Official guidance: [repository best practices](https://docs.github.com/en/repositories/creating-and-managing-repositories/best-practices-for-repositories).
