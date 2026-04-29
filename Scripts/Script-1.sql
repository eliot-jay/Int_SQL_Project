CREATE VIEW daily_revenue AS
SELECT 
	orderdate,
	SUM(quantity * netprice * exchangerate) AS total_revenue
FROM  sales 
GROUP BY orderdate