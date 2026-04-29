# Intermediate SQL - Sales Analysis

## Overview
Analysis of customer behavior, retention, and livetime value for an e-commerce company to improve customer retention and maximize revenue. 

## Business Questions
1. **Customer Segmentation:** Who are our most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** Who hasn't purchased recently?

## Analysis Approach

### 1. Customer Segmentation Analysis
- Categorized customers based on total lifetime value (LTV)
-  Assigned customers to high, mid, and low value segments based on money spent
- Calculated key metrics: total revenue

Query: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

**Visualization:**

![Customer segmentation pie chart](/images/1_customer_segmentation_ltv.png)

**Key Findings**
- High-value segment (or the top 25% of customers) drives 66% of revenue
- Mid-value segment (or 50% of customers) generates 32% of revenue
- Low-value customers (or the bottom 25% of customers) accounts for only 2% of revenue

**Business Insights**
- Offer premium membership program to the ***High-Value*** 'VIP Customers', because losing even one significantly impacts revenue
- Create upgrate paths for the ***Mid-Value*** customers through personalized promotions for a potential increase in revenue
- Design email campaigns with price-sensitive promotions to increase purchase frequency for ***Low-Value*** as they might not spend more in one lump sum, but might be more willing for an increase in their smaller purchases 

### 2. Cohort Analysis
- Tracked revenue and customer counts per cohorts
- Cohorts were then grouped by the year of their first purchase
- Analyzed customer retention at a cohort level

Query: [2_cohort_analysis.sql](/2_cohort_analysis.sql)

**Visualization:**

![Customer revenue by first purchase year bar chart with trendline](/images/2_customer_rev_by_year.png)

**Key Findings**
- Revenue per customer shows a decreasing trend over time
    - 2022-2024 cohorts are consistently performing worse than ealier cohorts
    - NOTE: Although net revenue is increasing, this is likely due to a larger customer base, which is not reflective of customer value

**Business Insights**
- Value from customers is decreasing  over  time and needs to be investigated to discover why
- In 2023, there was a drop in number of customers acquired, which should also be looked into
- Lifetime customer value and customer acquisition are both decreasing, meaning the company is facing a ppotential revenue decline

### 3. Customer Retention
- Identified customers at risk of churning
- Analyzed last purchase patterns
- Calculated customer-specific metrics

Query: [3_retention_analysis.sql](/3_retention_analysis.sql)

**Visualization:**

![Customer retention stacked bar chart](/images/3_customer_retention_churn_cohort.png)

![pie chart showing overall customer status across all cohorts](/images/3b_overall_customers_status.png)

**Key Findings**
- Cohort church stabilizes at ~90% after 2-3 years, indicating a predictable, long-term retention pattern
- Retention rates are consistently low (8-10%) across all cohorts, suggesting retention issues are systematic rather than specific to certian years
- Newer cohorts (2022-2023) show similar churn trajectories, signaling that without intervention similar results will soon follow

**Business Insights**
- Strengthen early engagement strategies to target the first 1-2 years with onboarding incentives, loyalty rewards, and personlized offers to improve long-term retention
- Re-engage high-value churned customers by focusing on targeted "win-back" campaigns rather than broad retention efforts, as reactivating valuable clients may yeild a higher ROI
- predict & preempt church risk and use customer-specific warning indicators to proactively intervine with "at-risk" clients *before* they lapse 


## Strategic Recommendations

1. **Focus on improving retention early in the customer lifecycle** - High churn (~90%) suggests the biggest opportunity is keeping customers beyond their first few years.
2. **Protect and grow high-value customers** - A small segment drives most revenue, so retaining and expanding these customers should be a priority.
3. **Address systemic churn with targeted lifecycle strategies** - Consistent churn across cohorts indicates a broader issue that requires better onboarding, engagement, and win-back efforts.

## Technical Details
- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL
- **Data Visualization:** ChatGPT/Claude
- **Other Tools:** Google Colab & DBeaver