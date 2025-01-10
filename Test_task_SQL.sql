CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    signup_date DATE,
    domain VARCHAR(255)
);
SELECT signup_date, COUNT(*) AS user_count
FROM users
GROUP BY signup_date
ORDER BY signup_date;
SELECT DISTINCT domain
FROM users;
SELECT *
FROM users
WHERE signup_date::timestamp >= CURRENT_DATE - INTERVAL '7 days';
SELECT domain, COUNT(*) AS domain_count
FROM users
GROUP BY domain
ORDER BY domain_count DESC
LIMIT 1;
DELETE FROM users
WHERE domain NOT IN ('gmail.com', 'yahoo.com', 'example.com');