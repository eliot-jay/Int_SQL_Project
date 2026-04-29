SELECT 
    s.orderkey, 
    c.customerkey, 
    st.storekey, 
    SUM(s.quantity * s.netprice * s.exchangerate) AS total_revenue
FROM sales s
    LEFT JOIN customer c ON s.customerkey = c.customerkey
    FULL OUTER JOIN store st ON s.storekey = st.storekey
GROUP BY 
    s.orderkey, 
    c.customerkey, 
    st.storekey
ORDER BY 
    c.customerkey, 
    st.storekey;

SELECT 
    orderkey, 
    customerkey, 
    storekey, 
    SUM(quantity * netprice * exchangerate) AS total_revenue
FROM sales
GROUP BY 
    orderkey, 
    customerkey, 
    storekey
ORDER BY
    customerkey, 
    storekey;


SELECT 
	customerkey,
    CONCAT(customerkey, orderdate)::INT AS order_line,
    orderdate,
    SUM(quantity * netprice * exchangerate) AS total_revenue
FROM sales
GROUP BY 
    orderkey,
    order_line,
    orderdate
ORDER BY
    total_revenue;

EXPLAIN ANALYZE
SELECT 
    customerkey,
    CONCAT(orderkey, linenumber)::INT AS order_line,
    orderdate,
    SUM(quantity * netprice * exchangerate) AS total_spent
FROM sales
GROUP BY 
    customerkey,
    order_line,
    orderdate
ORDER BY total_spent DESC;