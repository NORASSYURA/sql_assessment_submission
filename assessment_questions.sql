USE usersprogressdb;

-- 1. Analyse the data
-- Hint: use a SELECT statement via a JOIN to sample the data
-- ****************************************************************
SELECT u.*, p.learn_cpp, p.learn_sql, p.learn_html, p.learn_javascript, p.learn_java
FROM users u JOIN progress p ON u.user_id = p.user_id;

-- 2. What are the Top 25 schools (.edu domains)?
-- Hint: use an aggregate function to COUNT() schools with most students
-- ****************************************************************

-- 3. How many .edu learners are located in New York?
-- Hint: use an aggregate function to COUNT() students in New York
-- ****************************************************************

-- 4. The mobile_app column contains either mobile-user or NULL. 
-- How many of these learners are using the mobile app?
-- Hint: COUNT()...WHERE...IN()...GROUP BY...
-- Hint: Alternate answers are accepted.
-- ****************************************************************

-- 5. Query for the sign up counts for each hour.
-- Hint: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format 
-- ****************************************************************

-- 6. What courses are the New Yorker Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "New Yorker learners taking C++"
-- ****************************************************************

-- 7. What courses are the Chicago Students taking?
-- Hint: SUM(CASE WHEN learn_cpp NOT IN('') THEN 1 ELSE 0 END) AS "Chicago learners taking C++"
-- ****************************************************************

 