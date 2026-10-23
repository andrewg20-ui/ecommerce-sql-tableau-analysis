# Finish the GitHub portfolio

The project is stored in [andrewg20-ui/ecommerce-sql-tableau-analysis](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis). The repository is a private draft containing the analysis, SQL definitions, seven aggregate exports, documentation, and validation script. Maven Analytics is credited as the dataset provider, with its Public Domain label recorded in [the data inventory](data/README.md).

## Next handoff

1. Add the Tableau Public share link. If the workbook is already published, use its existing link. Otherwise, save a local workbook copy, then choose **Server → Tableau Public → Save to Tableau Public**, sign in, and save as **Maven Fuzzy Factory: E-commerce Performance Analysis**. Publishing makes the workbook and its data accessible publicly. Open the published view and use **Share** to copy its link. [Official publishing instructions](https://help.tableau.com/current/pro/desktop/en-us/publish_workbooks_tableaupublic.htm), checked October 22, 2026.
2. Check the published workbook's three dashboards, reporting scopes, default filters, and representative KPI values. Preserve April 2012–February 2015 and the funnel's All device selection; first-purchase cohorts end in November 2014. Save locally after any further Tableau edit. Reuse prior checks for components unchanged by publication.
3. The SQL-file comparison is complete: all three previously log-recovered statements match the supplied scripts, and the other four saved definitions were already included. Keep any unrecovered import steps, original dataset version/retrieval date, and historical execution details explicitly unconfirmed. See [the execution record](docs/execution_record.md).
4. Complete [the release checklist](docs/release_checklist.md), choose how to license the author's original code/text, add the verified public dashboard link to the README, and make the repository public when ready.

## Portfolio presentation

Suggested repository description: **SQL and Tableau analysis of e-commerce growth, conversion, product economics, refunds, and repeat purchasing using Maven Fuzzy Factory data.**

Suggested topics: `sql`, `postgresql`, `tableau`, `data-analysis`, `ecommerce`, `cohort-analysis`.

After public release, pin this project alongside Cyclistic and Bellabeat. The README should give a visitor the business question, main results, dashboard preview and link, methods, reproducibility instructions, recommendations, source credit, and limitations without needing the working conversation log.

Official guidance: [repository best practices](https://docs.github.com/en/repositories/creating-and-managing-repositories/best-practices-for-repositories).
