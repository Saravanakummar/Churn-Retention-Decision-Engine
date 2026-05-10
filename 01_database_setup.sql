CREATE DATABASE churn_engine;
USE churn_engine;

-- TABLE CREATION

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

CREATE TABLE user_activity (
    user_id INT PRIMARY KEY,
    last_login DATE,
    session_count INT
);
