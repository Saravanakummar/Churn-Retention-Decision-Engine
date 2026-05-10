CREATE TABLE customer_metrics AS
SELECT
    u.user_id,

    MAX(o.order_date) AS last_order_date,

    DATEDIFF(CURDATE(), MAX(o.order_date)) AS recency,

    COUNT(o.order_id) AS frequency,

    IFNULL(SUM(o.amount), 0) AS monetary,

    a.last_login,

    DATEDIFF(CURDATE(), a.last_login) AS days_since_login,

    a.session_count

FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id

LEFT JOIN user_activity a
ON u.user_id = a.user_id

GROUP BY u.user_id;
