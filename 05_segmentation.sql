ALTER TABLE customer_metrics
ADD segment VARCHAR(50);

UPDATE customer_metrics
SET segment =
CASE
    WHEN monetary >= 3000
         AND churn_flag = 0
    THEN 'High Value Active'

    WHEN monetary >= 3000
         AND churn_flag = 1
    THEN 'High Value At Risk'

    WHEN frequency = 1
         AND recency > 20
    THEN 'Low Engagement'

    WHEN churn_flag = 1
    THEN 'Churned Users'

    ELSE 'Regular Users'
END;

DROP TABLE IF EXISTS churn_summary;

CREATE TABLE churn_summary AS
SELECT
    segment,
    COUNT(*) AS users,
    ROUND(AVG(churn_risk_score),2) AS avg_risk,
    ROUND(SUM(monetary),2) AS total_revenue
FROM customer_metrics
GROUP BY segment;
