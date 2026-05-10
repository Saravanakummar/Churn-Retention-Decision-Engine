ALTER TABLE customer_metrics
ADD churn_flag INT;

UPDATE customer_metrics
SET churn_flag =
CASE
    WHEN recency > 30
         OR days_since_login > 20
    THEN 1
    ELSE 0
END;

ALTER TABLE customer_metrics
ADD churn_risk_score FLOAT;

UPDATE customer_metrics
SET churn_risk_score =
    (recency * 0.6) +
    (days_since_login * 0.3) -
    (frequency * 0.1);
