-- Fetch distinct countries
SELECT DISTINCT country FROM mini_net.users;

-- Fetch distinct cities
SELECT DISTINCT city FROM mini_net.users;

-- Export all users
SELECT * FROM mini_net.users;

-- Export all users from a specific country
SELECT * FROM mini_net.users WHERE country = '{country}';

-- Export data to find users between specific age range
SELECT * FROM mini_net.users WHERE age >= {age_min} AND age <= {age_max} ALLOW FILTERING;

-- Export data to find users between 22-30 years old
SELECT * FROM mini_net.users WHERE age >= 22 AND age <= 30 ALLOW FILTERING;

-- Count how many users exist per specific city
SELECT * FROM mini_net.users WHERE city = '{city}' ALLOW FILTERING;

-- Get All Count how many users exist per city
SELECT city FROM mini_net.users;