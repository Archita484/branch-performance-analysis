# Branch Performance Analysis

## Project Overview

This project analyzes sample financial application data to evaluate branch performance, application approval rates, customer behavior, and application drop-offs.

The goal is to identify performance trends, understand potential operational bottlenecks, and develop data-driven recommendations to support better business decisions.

**Project Type:** Business Analytics | Data Analysis  
**Tools:** Microsoft Excel, MySQL, SQL  
**Dataset:** 6,500 application records across 20 branches

## Business Problem

Financial service providers need to understand why application outcomes differ across branches, customer segments, and acquisition channels.

This project explores the following business questions:

- Which branches receive the most applications?
- What proportion of applications are approved, rejected, in progress, or dropped?
- How do approval rates vary across customer segments?
- Which acquisition channels generate the highest application volumes?
- Which branches may require further investigation due to high drop-off rates?

## Tools and Technologies

- **Microsoft Excel:** Dashboard creation, KPI tracking, and data visualization.
- **MySQL:** Database management and querying.
- **SQL:** Data aggregation, filtering, grouping, and JOIN operations.
- **Business Analytics:** Performance analysis, insight generation, and recommendations.

## Project Workflow

1. Defined the business problem and key performance indicators (KPIs).
2. Prepared sample application and customer datasets.
3. Loaded the data into MySQL tables.
4. Used SQL queries to analyze application status, branch performance, customer segments, acquisition channels, and city-level trends.
5. Built an Excel dashboard to summarize KPIs and compare branch performance.
6. Documented key findings and potential business recommendations.

## Key Performance Indicators

- Total applications
- Application approval rate
- Application rejection rate
- Application drop-off rate
- Applications by branch
- Applications by customer segment
- Applications by acquisition channel

## Key Findings

- Analyzed 6,500 sample application records across 20 branches.
- Identified differences in application outcomes and drop-off rates across branches.
- Compared approval performance across customer segments and acquisition channels.
- Observed that the Digital acquisition channel had the highest application volume and approval rate among the analyzed channels.
- Flagged branches with elevated drop-off rates for further investigation.

## Business Recommendations

- Investigate branches with high drop-off rates to understand potential process issues.
- Review incomplete applications and follow-up processes to identify opportunities to reduce drop-offs.
- Compare acquisition channels using both application volume and approval rate before allocating additional resources.
- Monitor branch-level KPIs regularly to identify performance changes and areas requiring attention.

## Repository Contents

| File | Description |
|---|---|
| `branch_performance_analysis.sql` | SQL queries used for analysis |
| `FinServe_360_Dashboard 1.xlsx` | Excel dashboard |
| `Branch_Performance_analytics_report.docx` | Project report |
| `application.csv` | Sample application dataset |
| `customer.csv` | Sample customer dataset |

*File names may be updated as the repository is organized.*

## Limitations

This is a practice project using synthetic sample data. The findings are illustrative and should not be interpreted as actual financial institution performance or verified business outcomes.

The analysis identifies patterns in the available dataset; further investigation would be required before implementing operational changes.

## Future Enhancements

- Develop an interactive Power BI dashboard.
- Add more detailed KPI comparisons and visualizations.
- Expand the analysis with additional customer and branch performance metrics.
- Refine recommendations based on further analysis.

---

**Author:** Archita Debnath  
**Focus Areas:** Business Analytics | SQL | Excel | Data Visualization
