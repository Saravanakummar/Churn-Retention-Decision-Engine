-- INITIAL SAMPLE DATA

INSERT INTO users VALUES
(1,'2023-01-10','Chennai'),
(2,'2023-02-15','Bangalore'),
(3,'2023-03-05','Mumbai'),
(4,'2023-03-20','Delhi'),
(5,'2023-04-01','Hyderabad');

INSERT INTO orders VALUES
(101,1,'2023-12-01',1200),
(102,1,'2024-01-05',800),
(103,2,'2024-02-10',1500);

INSERT INTO user_activity VALUES
(1,'2024-03-20',45),
(2,'2024-03-25',30),
(3,'2023-10-01',10);

-- DATA ENRICHMENT

ALTER TABLE users ADD acquisition_channel VARCHAR(50);
ALTER TABLE orders ADD product_category VARCHAR(50);

UPDATE users SET acquisition_channel =
CASE
    WHEN user_id % 4 = 0 THEN 'Facebook Ads'
    WHEN user_id % 4 = 1 THEN 'Google Ads'
    WHEN user_id % 4 = 2 THEN 'Organic'
    ELSE 'Referral'
END;

UPDATE orders SET product_category =
CASE
    WHEN order_id % 4 = 0 THEN 'Electronics'
    WHEN order_id % 4 = 1 THEN 'Clothing'
    WHEN order_id % 4 = 2 THEN 'Home'
    ELSE 'Beauty'
END;

-- SCALE DATA

INSERT INTO users (user_id, signup_date, city, acquisition_channel)
SELECT
    (SELECT MAX(user_id) FROM users) + ROW_NUMBER() OVER () AS user_id,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*365) DAY),
    ELT(FLOOR(1 + RAND()*6),
        'Chennai','Bangalore','Mumbai','Delhi','Hyderabad','Pune'
    ),
    ELT(FLOOR(1 + RAND()*4),
        'Google Ads','Facebook Ads','Organic','Referral'
    )
FROM information_schema.tables
LIMIT 500;

INSERT INTO orders (order_id, user_id, order_date, amount, product_category)
SELECT
    2000 + ROW_NUMBER() OVER () AS order_id,
    FLOOR(1 + RAND()*600),
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*180) DAY),
    ROUND(100 + (RAND()*5000), 2),
    ELT(FLOOR(1 + RAND()*4),
        'Electronics','Clothing','Home','Beauty'
    )
FROM information_schema.tables
LIMIT 800;

INSERT INTO user_activity (user_id, last_login, session_count)
SELECT
    u.user_id,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND()*60) DAY),
    FLOOR(1 + RAND()*100)
FROM users u
WHERE u.user_id > 15;
