-- Set the company ID to match the query (172)
SET @companyId = 172;

-- Function to generate random strings
DELIMITER //
CREATE FUNCTION random_string(length INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE chars VARCHAR(255) DEFAULT 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    DECLARE result VARCHAR(255) DEFAULT '';
    DECLARE i INT DEFAULT 0;
    
    WHILE i < length DO
        SET result = CONCAT(result, SUBSTRING(chars, FLOOR(1 + RAND() * LENGTH(chars)), 1));
        SET i = i + 1;
    END WHILE;
    
    RETURN result;
END //
DELIMITER ;

-- Function to generate random dates
DELIMITER //
CREATE FUNCTION random_date() 
RETURNS DATE
DETERMINISTIC
BEGIN
    RETURN DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1000) DAY);
END //
DELIMITER ;

-- Generate fake data for object028
INSERT INTO object028 (id, companyId)
SELECT 
    CONCAT('obj', LPAD(n.n, 5, '0')),
    @companyId
FROM (
    SELECT a.N + b.N * 10 + c.N * 100 + 1 AS n
    FROM (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) a,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) b,
         (SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) c
    LIMIT 100
) n;

-- Generate fake data for object028_date000
INSERT INTO object028_date000 (companyId, objectId, dateValue)
SELECT 
    @companyId,
    id,
    random_date()
FROM object028;

-- Generate fake data for object028_text009
INSERT INTO object028_text009 (companyId, objectId, value)
SELECT 
    @companyId,
    id,
    CONCAT('Name-', random_string(5))
FROM object028
WHERE RAND() < 0.8; -- 80% of objects have this field

-- Generate fake data for object028_text010
INSERT INTO object028_text010 (companyId, objectId, value)
SELECT 
    @companyId,
    id,
    CONCAT('Email-', random_string(5), '@example.com')
FROM object028
WHERE RAND() < 0.7; -- 70% of objects have this field

-- Generate fake data for object028_text011
INSERT INTO object028_text011 (companyId, objectId, value)
SELECT 
    @companyId,
    id,
    CONCAT('Phone-', FLOOR(RAND() * 1000000000))
FROM object028
WHERE RAND() < 0.6; -- 60% of objects have this field

-- Generate fake data for object028_text013 (Closer/Setter role)
INSERT INTO object028_text013 (companyId, objectId, value)
SELECT 
    @companyId,
    id,
    CASE WHEN RAND() < 0.5 THEN 'Closer' ELSE 'Setter' END
FROM object028
WHERE RAND() < 0.4; -- 40% of objects have this field

-- Generate fake data for object028_text014 (Closer/Setter role)
INSERT INTO object028_text014 (companyId, objectId, value)
SELECT 
    @companyId,
    id,
    CASE WHEN RAND() < 0.5 THEN 'Closer' ELSE 'Setter' END
FROM object028
WHERE RAND() < 0.3; -- 30% of objects have this field

-- Generate fake data for object028_text015 (Closer/Setter role)
INSERT INTO object028_text015 (companyId, objectId, value)
SELECT 
    @companyId,
    id,
    CASE WHEN RAND() < 0.5 THEN 'Closer' ELSE 'Setter' END
FROM object028
WHERE RAND() < 0.2; -- 20% of objects have this field

-- Clean up functions
DROP FUNCTION IF EXISTS random_string;
DROP FUNCTION IF EXISTS random_date; 