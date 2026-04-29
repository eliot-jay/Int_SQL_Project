WITH sales_data AS (
	SELECT
		customerkey,
		SUM(quantity * netprice * exchangerate) AS net_revenue
	FROM sales 
	GROUP BY
		customerkey
)

SELECT
	AVG(s.net_revenue) AS spending_customers_avg_net_revenue,
	AVG(COALESCE(s.net_revenue, 0)) AS all_customers_net_revenue

	
	
FROM customer c
LEFT JOIN sales_data s ON c.customerkey = s.customerkey;

SELECT 
    storekey,
    COALESCE(NULLIF(storekey, 999999), 0) AS storekey_clean
FROM store;

SELECT
    st.storekey,
    st.description,
    SUM(s.quantity * s.netprice * s.exchangerate) AS total_revenue,
    COALESCE(SUM(s.quantity * s.netprice * s.exchangerate), 0) AS total_revenue_coalesce
FROM store st
LEFT JOIN sales s ON st.storekey = s.storekey
GROUP BY st.storekey, st.description
ORDER BY st.storekey;

WITH store_revenue AS (
    SELECT
        st.storekey,
        st.description,
        SUM(s.quantity * s.netprice * s.exchangerate) AS total_revenue,
        COALESCE(SUM(s.quantity * s.netprice * s.exchangerate), 0) AS total_revenue_coalesce
    FROM store st
    LEFT JOIN sales s ON st.storekey = s.storekey
    GROUP BY st.storekey, st.description
)
SELECT
    AVG(total_revenue) AS avg_store_revenue_with_nulls,
    AVG(total_revenue_coalesce) AS avg_store_revenue_with_zeros
FROM store_revenue;