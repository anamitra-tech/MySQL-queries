--Equality & Inequality (=, !=, <>)
SELECT *
FROM users
WHERE status = 1;

--Range filters (>, <, >=, <=)
SELECT *
FROM users
WHERE created_at >= '2025-01-01';

--BETWEEN (inclusive — be careful)
SELECT *
FROM users
WHERE salary BETWEEN 50000 AND 100000;

--IN (finite known values)
SELECT *
FROM users
WHERE role IN ('admin', 'manager', 'lead');

--NOT-EXISTS
SELECT *
FROM users u
WHERE NOT EXISTS (
  SELECT 1
  FROM banned_users b
  WHERE b.user_id = u.user_id
);

--LIKE (pattern matching)
SELECT *
FROM users
WHERE email LIKE '%@gmail.com';

--IS NULL / IS NOT NULL
SELECT *
FROM users
WHERE deleted_at IS NULL;

--AND / OR / NOT (logic traps)
SELECT *
FROM users
WHERE (country = 'India' OR country = 'USA')
  AND status = 1;

--Subquery-based WHERE (real analytics)
SELECT *
FROM users
WHERE user_id IN (
  SELECT user_id
  FROM orders
  WHERE amount > 10000
);
--alternative to the above
SELECT *
FROM users u
WHERE EXISTS (
  SELECT 1
  FROM orders o
  WHERE o.user_id = u.user_id
    AND o.amount > 10000
);
