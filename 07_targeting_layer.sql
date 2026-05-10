ALTER TABLE customer_metrics
ADD final_priority_score FLOAT;

UPDATE customer_metrics
SET final_priority_score =
    (churn_risk_score * 0.7) +
    (monetary * 0.3);

DROP TABLE IF EXISTS top_risk_users;

CREATE TABLE top_risk_users AS
SELECT
    user_id,
    segment,
    monetary,
    churn_risk_score,
    final_priority_score,
    revenue_at_risk,
    priority_level,
    recommended_action
FROM customer_metrics
WHERE segment IN ('High Value At Risk', 'Churned Users')
ORDER BY final_priority_score DESC
LIMIT 50;
