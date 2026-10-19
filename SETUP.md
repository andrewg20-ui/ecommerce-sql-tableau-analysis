# Finish the GitHub portfolio

The project is stored in [andrewg20-ui/ecommerce-sql-tableau-analysis](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis). The repository is a private draft containing the analysis, SQL definitions, seven aggregate exports, documentation, and validation script. Maven Analytics is credited as the dataset provider, with its Public Domain label recorded in [the data inventory](data/README.md).

## Next handoff

1. The revised [packaged workbook](tableau/ecommerce.twbx) is included, and both requested corrections are confirmed in the saved file. Next add full-size presentation images of all three dashboards and a working Tableau Public link if publishing there. Follow [the Tableau handoff notes](tableau/README.md). Save locally before preparing exports and after any further edit.
2. Confirm the packaged SQL against the queries actually run. Complete [the execution record](docs/execution_record.md) with the import process, PostgreSQL and Tableau versions, timestamp convention, and dataset download/version details. Record actual reruns if needed.
3. Check only changes caused by moving or publishing the workbook: source paths, default filters, layout, and representative KPI values. The overview's April 2012–February 2015 filter and the funnel's all-device default are confirmed in the revised workbook; preserve them.
4. Replace the pending Tableau notes in the README with the verified links and images. Complete [the release checklist](docs/release_checklist.md), choose how to license the author's original code/text, and make the repository public when ready.

## Portfolio presentation

Suggested repository description: **SQL and Tableau analysis of e-commerce growth, conversion, product economics, refunds, and repeat purchasing using Maven Fuzzy Factory data.**

Suggested topics: `sql`, `postgresql`, `tableau`, `data-analysis`, `ecommerce`, `cohort-analysis`.

After public release, pin this project alongside Cyclistic and Bellabeat. The README should give a visitor the business question, main results, dashboard preview and link, methods, reproducibility instructions, recommendations, source credit, and limitations without needing the working conversation log.

Official guidance: [repository best practices](https://docs.github.com/en/repositories/creating-and-managing-repositories/best-practices-for-repositories).
