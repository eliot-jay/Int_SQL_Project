EXPLAIN ANALYZE

WITH weekly_revenue AS (
    SELECT
        EXTRACT(WEEK FROM orderdate) AS order_week,
        SUM(quantity * netprice * exchangerate) AS week_revenue
    FROM sales
    WHERE EXTRACT(YEAR FROM orderdate) = 2023
    GROUP BY order_week
)
SELECT
    order_week,
    week_revenue,
    AVG(week_revenue) OVER () AS avg_weekly_revenue,
    100.0 * week_revenue / AVG(week_revenue) OVER () AS pct_of_avg
FROM weekly_revenue
ORDER BY order_week;

EXPLAIN
SELECT 
    s.customerkey,
    c.surname,
    COUNT(*) AS order_count,
    SUM(s.quantity * s.netprice * s.exchangerate) AS total_spent
FROM sales s
LEFT JOIN customer c ON s.customerkey = c.customerkey
WHERE s.orderdate >= '2023-01-01'
GROUP BY s.customerkey, c.surname
HAVING SUM(s.quantity * s.netprice * s.exchangerate) > 5000
ORDER BY total_spent DESC;