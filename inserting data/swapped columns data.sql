USE wscube;

-- 1️⃣ Drop temporary table if it exists
DROP TABLE IF EXISTS users_new;

-- 2️⃣ Create the new table
CREATE TABLE users_new (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(100),
    contact VARCHAR(20),
    address VARCHAR(255),
    dob DATE,
    gender CHAR(1),
    status TINYINT
);

-- 3️⃣ Insert data, swapping email and password
-- Use GROUP BY id to keep one row per id
INSERT INTO users_new (id, name, email, password, contact, address, dob, gender, status)
SELECT id,
       MAX(name) AS name,
       MAX(password) AS email,
       MAX(email) AS password,
       MAX(contact) AS contact,
       MAX(address) AS address,
       MAX(dob) AS dob,
       MAX(gender) AS gender,
       MAX(status) AS status
FROM users
GROUP BY id;

-- 4️⃣ Check new table
SELECT * FROM users_new LIMIT 10;

-- 5️⃣ Replace old table
DROP TABLE users;
RENAME TABLE users_new TO users;

-- 6️⃣ Verify
SELECT * FROM users LIMIT 10;

