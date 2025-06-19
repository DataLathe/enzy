-- Run the original query to verify our data
SELECT
    CONCAT (
        object028.id,
        "-",
        object028_text009.value,
        "-closer"
    ),
    object028_text009.value
FROM
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
    AND object028.id = object028_text009.objectId
    LEFT JOIN object028_text013 ON object028.companyId = object028_text013.companyId
    AND object028.id = object028_text013.objectId
WHERE
    object028.companyid = 172
    AND object028_text013.value = "Closer"
UNION ALL
SELECT
    CONCAT (
        object028.id,
        "-",
        object028_text010.value,
        "-closer"
    ),
    object028_text010.value
FROM
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text010 ON object028.companyId = object028_text010.companyId
    AND object028.id = object028_text010.objectId
    LEFT JOIN object028_text014 ON object028.companyId = object028_text014.companyId
    AND object028.id = object028_text014.objectId
WHERE
    object028.companyid = 172
    AND object028_text014.value = "Closer"
UNION ALL
SELECT
    CONCAT (
        object028.id,
        "-",
        object028_text011.value,
        "-closer"
    ),
    object028_text011.value
FROM
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text011 ON object028.companyId = object028_text011.companyId
    AND object028.id = object028_text011.objectId
    LEFT JOIN object028_text015 ON object028.companyId = object028_text015.companyId
    AND object028.id = object028_text015.objectId
WHERE
    object028.companyid = 172
    AND object028_text015.value = "Closer"
UNION ALL
select
    CONCAT (
        object028.id,
        "-",
        object028_text009.value,
        "-closer"
    ),
    object028_text009.value
from
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
    AND object028.id = object028_text009.objectId
    LEFT JOIN object028_text013 ON object028.companyId = object028_text013.companyId
    AND object028.id = object028_text013.objectId
WHERE
    object028.companyid = 172
    AND object028_text013.value IS NULL
    AND object028_text009.value IS NOT NULL
    and object028.id is not null
UNION ALL
select
    CONCAT (
        object028.id,
        "-",
        object028_text010.value,
        "-setter"
    ),
    object028_text010.value
from
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
    AND object028.id = object028_text009.objectId
    LEFT JOIN object028_text010 ON object028.companyId = object028_text010.companyId
    AND object028.id = object028_text010.objectId
    LEFT JOIN object028_text014 ON object028.companyId = object028_text014.companyId
    AND object028.id = object028_text014.objectId
WHERE
    object028.companyid = 172
    AND object028_text014.value IS NULL
    AND object028_text010.value IS NOT NULL
    and object028.id is not null
UNION ALL
select
    CONCAT (
        object028.id,
        "-",
        object028_text011.value,
        "-setter"
    ),
    object028_text011.value
from
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
    AND object028.id = object028_text009.objectId
    LEFT JOIN object028_text011 ON object028.companyId = object028_text011.companyId
    AND object028.id = object028_text011.objectId
    LEFT JOIN object028_text015 ON object028.companyId = object028_text015.companyId
    AND object028.id = object028_text015.objectId
WHERE
    object028.companyid = 172
    AND object028_text015.value IS NULL
    AND object028_text011.value IS NOT NULL
    and object028.id is not null
UNION ALL
SELECT
    CONCAT (
        object028.id,
        "-",
        object028_text009.value,
        "-setter"
    ),
    object028_text009.value
FROM
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
    AND object028.id = object028_text009.objectId
    LEFT JOIN object028_text013 ON object028.companyId = object028_text013.companyId
    AND object028.id = object028_text013.objectId
WHERE
    object028.companyid = 172
    AND object028_text013.value = "Setter"
UNION ALL
SELECT
    CONCAT (
        object028.id,
        "-",
        object028_text010.value,
        "-setter"
    ),
    object028_text010.value
FROM
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text010 ON object028.companyId = object028_text010.companyId
    AND object028.id = object028_text010.objectId
    LEFT JOIN object028_text014 ON object028.companyId = object028_text014.companyId
    AND object028.id = object028_text014.objectId
WHERE
    object028.companyid = 172
    AND object028_text014.value = "Setter"
UNION ALL
SELECT
    CONCAT (
        object028.id,
        "-",
        object028_text011.value,
        "-setter"
    ),
    object028_text011.value
FROM
    object028
    INNER JOIN object028_date000 ON object028.companyId = object028_date000.companyId
    AND object028.id = object028_date000.objectId
    LEFT JOIN object028_text011 ON object028.companyId = object028_text011.companyId
    AND object028.id = object028_text011.objectId
    LEFT JOIN object028_text009 ON object028.companyId = object028_text009.companyId
    AND object028.id = object028_text009.objectId
    LEFT JOIN object028_text015 ON object028.companyId = object028_text015.companyId
    AND object028.id = object028_text015.objectId
WHERE
    object028.companyId = 172
    AND CONCAT (
        object028.id,
        "-",
        object028_text009.value,
        "-closer"
    ) IS NOT NULL
    AND (object028_text015.value = "Setter");