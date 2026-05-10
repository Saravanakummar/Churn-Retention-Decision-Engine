ALTER TABLE customer_metrics
ADD recommended_action VARCHAR(100);

UPDATE customer_metrics
SET recommended_action =
CASE
    WHEN segment = 'High Value At Risk'
    THEN 'Give 20% Discount'

    WHEN segment = 'Low Engagement'
    THEN 'Send Push Notification'

    WHEN segment = 'High Value Active'
    THEN 'Offer Loyalty Reward'

    WHEN segment = 'Churned Users'
    THEN 'Win-back Campaign'

    ELSE 'Monitor'
END;

ALTER TABLE customer_metrics
ADD revenue_at_risk DECIMAL(10,2);

UPDATE customer_metrics
SET revenue_at_risk =
CASE
    WHEN segment IN ('High Value At Risk', 'Churned Users')
    THEN monetary
    ELSE 0
END;

ALTER TABLE customer_metrics
ADD priority_level VARCHAR(20);

UPDATE customer_metrics
SET priority_level =
CASE
    WHEN segment = 'High Value At Risk'
    THEN 'HIGH'

    WHEN segment = 'Churned Users'
    THEN 'MEDIUM'

    WHEN segment = 'Low Engagement'
    THEN 'LOW'

    ELSE 'NORMAL'
END;

DROP TABLE IF EXISTS final_business_insights;

CREATE TABLE final_business_insights AS
SELECT
    segment,
    priority_level,
    COUNT(*) AS users,
    ROUND(SUM(monetary),2) AS total_revenue,
    ROUND(SUM(revenue_at_risk),2) AS revenue_at_risk
FROM customer_metrics
GROUP BY segment, priority_level;
