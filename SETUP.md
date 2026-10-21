# Finish the GitHub portfolio

The project is stored in [andrewg20-ui/ecommerce-sql-tableau-analysis](https://github.com/andrewg20-ui/ecommerce-sql-tableau-analysis). The repository is a private draft containing the analysis, SQL definitions, seven aggregate exports, documentation, and validation script. Maven Analytics is credited as the dataset provider, with its Public Domain label recorded in [the data inventory](data/README.md).

## Next handoff

1. Compare the original SQL scripts saved in DBeaver with the seven packaged definitions. Four saved files are already supplied; the overview, product, and refund definitions were recovered from the project log. Recover any remaining original scripts if available, and record differences or missing originals in [the execution record](docs/execution_record.md).
2. The author-reported workflow is now recorded: recalled CSV import into PostgreSQL, with DBeaver used to write/run SQL. Preserve that uncertainty; recover the exact import/schema steps and dataset version from original files or notes if available. Do not ask the author to guess the PostgreSQL application's name or invent missing dates. Current PostgreSQL 18.4, session timezone America/Chicago, Tableau version, workbook, saved defaults, and all three images are already recorded.
3. Add a working Tableau Public link if publishing there. Check only changes caused by moving or publishing the workbook: source paths, default filters, layout, and representative KPI values. Preserve the overview's April 2012–February 2015 range and the funnel's all-device default. Save locally before publication and after any further edit; see [the Tableau handoff notes](tableau/README.md).
4. Complete [the release checklist](docs/release_checklist.md), choose how to license the author's original code/text, review the README as a visitor, and make the repository public when ready.

## Portfolio presentation

Suggested repository description: **SQL and Tableau analysis of e-commerce growth, conversion, product economics, refunds, and repeat purchasing using Maven Fuzzy Factory data.**

Suggested topics: `sql`, `postgresql`, `tableau`, `data-analysis`, `ecommerce`, `cohort-analysis`.

After public release, pin this project alongside Cyclistic and Bellabeat. The README should give a visitor the business question, main results, dashboard preview and link, methods, reproducibility instructions, recommendations, source credit, and limitations without needing the working conversation log.

Official guidance: [repository best practices](https://docs.github.com/en/repositories/creating-and-managing-repositories/best-practices-for-repositories).
