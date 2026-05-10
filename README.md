# 🚀 Churn & Retention Decision Engine

An end-to-end customer intelligence system built using SQL and Power BI to detect churn risk, segment users, estimate revenue impact, and recommend retention actions.

This project simulates how modern businesses identify high-risk customers and make data-driven retention decisions before revenue loss occurs.

---

# 📌 Business Problem

Customer acquisition is expensive, but customer retention directly impacts long-term profitability.

Businesses often struggle to:

- Identify users likely to churn
- Understand customer behavior patterns
- Prioritize high-value at-risk customers
- Estimate revenue exposure from churn
- Decide what retention action to take

This project solves those problems using a complete churn intelligence workflow.

---

# 🎯 Project Objectives

- Detect churn-prone users using behavioral analysis
- Perform customer segmentation using RFM logic
- Calculate churn risk scores
- Estimate revenue at risk
- Build a business decision engine for retention actions
- Create an interactive Power BI dashboard for executive-level insights

---

# 🏗️ System Architecture

```text
Raw Data
(users, orders, activity)
        ↓
Data Cleaning
        ↓
Transformation Layer
(customer_metrics)
        ↓
Churn Detection
        ↓
Customer Segmentation
        ↓
Decision Engine
        ↓
Top Risk User Targeting
        ↓
Power BI Dashboard


🧠 Key Features
✅ Customer Behavior Analysis

Engineered customer-level behavioral metrics including:

Recency
Frequency
Monetary Value (RFM)
Login inactivity
Session activity
✅ Churn Detection Engine

Identified churn-prone users using:

Purchase inactivity
Login inactivity
Behavioral thresholds
✅ Customer Segmentation

Users were segmented into:

High Value Active
High Value At Risk
Churned Users
Low Engagement Users
Regular Users
✅ Churn Risk Scoring

Built weighted churn scoring logic using:

Recency
Login inactivity
Purchase frequency
✅ Revenue at Risk Analysis

Estimated potential revenue exposure from churn-prone users.

✅ Decision Engine

Generated business actions dynamically:

Discount campaigns
Win-back campaigns
Loyalty rewards
Push notifications
Monitoring recommendations
✅ Top Risk User Targeting

Identified top high-priority users based on:

Churn risk score
Revenue contribution
Business impact
📊 Dashboard Pages
1️⃣ Executive Overview

High-level business KPIs:

Total Users
Churn Rate
Revenue at Risk
Average Risk Score
2️⃣ Churn Analysis

Behavioral churn analysis:

Churn by Segment
Login Inactivity vs Churn
Recency vs Risk Analysis
3️⃣ Customer Segmentation

Customer value and risk segmentation:

Revenue by Segment
Users by Segment
Segment Risk Comparison
4️⃣ Decision Panel

Business action layer:

Revenue at Risk by Segment
Priority Distribution
Recommended Actions
5️⃣ Top Risk Users

Execution-focused targeting layer:

Top 50 high-risk users
Revenue impact
Recommended actions
Priority levels
🛠️ Tech Stack
Tool	Purpose
MySQL	Data processing & transformation
SQL	Data cleaning, feature engineering, analytics
Power BI	Dashboard visualization
CSV	Data storage/export
DAX	KPI calculations
🧱 Data Model
Raw Tables
users
orders
user_activity
Analytical Tables
customer_metrics
churn_summary
final_business_insights
top_risk_users
🔄 Transformation & Feature Engineering
Transformation
Table joins
Aggregations
Null handling
Behavioral consolidation
Feature Engineering
Recency
Frequency
Monetary
Churn Flag
Risk Score
Revenue at Risk
Priority Score
📈 Business Insights Generated
High Value At Risk users contributed the majority of revenue exposure
Login inactivity strongly correlated with churn probability
Low engagement users showed elevated future churn potential
Revenue concentration existed within a small set of high-risk users
💡 Business Impact

This system helps businesses:

Reduce churn proactively
Protect high-value customers
Prioritize retention campaigns
Minimize revenue loss
Improve customer lifetime value
📂 Repository Structure
/churn-retention-engine
 ├── data/
 │    ├── customer_metrics.csv
 │    ├── churn_summary.csv
 │    ├── final_business_insights.csv
 │    └── top_risk_users.csv
 │
 ├── sql/
 │    ├── 01_database_setup.sql
 │    ├── 02_data_generation.sql
 │    ├── 03_transformation.sql
 │    ├── 04_churn_logic.sql
 │    ├── 05_segmentation.sql
 │    ├── 06_decision_engine.sql
 │    ├── 07_targeting_layer.sql
 │    └── 08_export_queries.sql
 │
 ├── dashboard/
 │    └── Churn_Retention_Engine.pbix
 │
 └── README.md
▶️ How to Run the Project
Step 1

Create database and tables using:

01_database_setup.sql
Step 2

Generate and scale data:

02_data_generation.sql
Step 3

Build transformation layer:

03_transformation.sql
Step 4

Run churn detection & segmentation:

04_churn_logic.sql
05_segmentation.sql
Step 5

Build decision engine:

06_decision_engine.sql
07_targeting_layer.sql
Step 6

Export datasets and load into Power BI.

📷 Dashboard Preview

Add Power BI screenshots here

🎤 Interview Explanation

I built an end-to-end churn intelligence system that transforms raw customer, transaction, and activity data into actionable business insights.

The system detects churn-prone users, segments customers based on value and engagement, calculates revenue exposure, and recommends retention actions using a decision-engine approach.

I also developed an interactive Power BI dashboard to help businesses monitor churn risk and prioritize high-impact retention strategies.

📌 Future Improvements
Machine Learning-based churn prediction
Real-time data pipeline integration
Automated campaign triggering
Cohort retention analysis
Customer lifetime value forecasting


👨‍💻 Author

Saravana Kumaar
