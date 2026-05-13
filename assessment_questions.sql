USE usersprogressdb;

-- 1. Analyse the data
-- Hint: use a SELECT statements via a JOIN to sample the data
-- ****************************************************************
SELECT u.*, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u JOIN progress p ON u.user_id = p.user_id;

-- 2. What are the Top 25 schools (.edu domains)?
-- Hint: use an aggregate function to COUNT() schools with most students
-- ****************************************************************
SELECT email_domain AS school, COUNT(*) AS number_of_students
FROM users u JOIN progress p ON u.user_id = p.user_id
GROUP BY email_domain
ORDER BY number_of_students DESC
LIMIT 25;

-- 3. How many .edu learners are located in New York?
-- Hint: use an aggregate function to COUNT() students in New York
-- ****************************************************************
SELECT u.city, COUNT(*) AS number_of_learners
FROM users u JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'New York'
GROUP BY u.city
ORDER BY number_of_learners DESC;

-- 4. The mobile_app column contains either mobile-user or NULL. 
-- How many of these learners are using the mobile app?
-- Hint: COUNT()...WHERE...IN()...GROUP BY...
-- Hint: Alternate answers are accepted.
-- ****************************************************************
SELECT COUNT(*) AS mobile_app_users
FROM users u
JOIN progress p ON u.user_id = p.user_id
WHERE u.mobile_app = 'mobile-user'
GROUP BY u.mobile_app;

-- 5. Query for the sign up counts for each hour.
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
-- ****************************************************************
SELECT DATE_FORMAT(sign_up_at, '%Y-%m-%d %H:00:00') AS signup_hour,
       COUNT(*) AS signup_count
FROM users
GROUP BY signup_hour
ORDER BY signup_hour;

-- 6. What courses are the New Yorker Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++"
-- ****************************************************************
SELECT 
    SUM(CASE WHEN p.learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++",
    SUM(CASE WHEN p.learn_sql NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking SQL",
    SUM(CASE WHEN p.learn_html NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking HTML",
    SUM(CASE WHEN p.learn_javascript NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking JavaScript",
    SUM(CASE WHEN p.learn_java NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking Java"
FROM users u JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'New York'
GROUP BY u.city;

-- 7. What courses are the Chicago Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++"
-- ****************************************************************
SELECT 
    SUM(CASE WHEN p.learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++",
    SUM(CASE WHEN p.learn_sql NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking SQL",
    SUM(CASE WHEN p.learn_html NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking HTML",
    SUM(CASE WHEN p.learn_javascript NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking JavaScript",
    SUM(CASE WHEN p.learn_java NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking Java"
FROM users u JOIN progress p ON u.user_id = p.user_id
WHERE u.city = 'Chicago'
GROUP BY u.city;
