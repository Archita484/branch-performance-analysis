create database finserve_360;
use finserve_360;
select * from customers;
select * from applications;
select count(*) AS total_customers From customers;
select count(*) AS total_applications From applications;
SELECT
    c.acquisition_channel,
    COUNT(a.application_id) AS total_applications
FROM customers c
JOIN applications a
    ON c.customer_id = a.customer_id
GROUP BY c.acquisition_channel
ORDER BY total_applications DESC;



SELECT
    c.acquisition_channel,
    COUNT(a.application_id) AS total_applications,
    SUM(CASE
        WHEN a.application_status = 'Approved'
        THEN 1 ELSE 0
    END) AS approved_applications,
    ROUND(
        100.0 * SUM(CASE
            WHEN a.application_status = 'Approved'
            THEN 1 ELSE 0
        END) / COUNT(a.application_id),
        2
    ) AS approval_rate
FROM customers c
JOIN applications a
    ON c.customer_id = a.customer_id
GROUP BY c.acquisition_channel
ORDER BY approval_rate DESC;



SELECT
    c.acquisition_channel,
    COUNT(a.application_id) AS total_applications,
    SUM(
        CASE
            WHEN a.application_status = 'Dropped'
            THEN 1
            ELSE 0
        END
    ) AS dropped_applications,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.application_status = 'Dropped'
                THEN 1
                ELSE 0
            END
        ) / COUNT(a.application_id),
        2
    ) AS drop_off_rate
FROM customers c
JOIN applications a
    ON c.customer_id = a.customer_id
GROUP BY c.acquisition_channel
ORDER BY drop_off_rate DESC;


SELECT
    drop_off_reason,
    COUNT(*) AS dropped_applications
FROM applications
WHERE application_status = 'Dropped'
GROUP BY drop_off_reason
ORDER BY dropped_applications DESC;


SELECT
    kyc_status,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN application_status = 'Approved'
            THEN 1 ELSE 0
        END
    ) AS approved_applications
FROM applications
GROUP BY kyc_status
ORDER BY total_applications DESC;



SELECT
    kyc_status,
    COUNT(*) AS total_applications,
    SUM(
        CASE
            WHEN application_status = 'Approved'
            THEN 1 ELSE 0
        END
    ) AS approved_applications,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN application_status = 'Approved'
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS approval_rate
FROM applications
GROUP BY kyc_status
ORDER BY approval_rate DESC;



SELECT
    branch_id,
    COUNT(application_id) AS total_applications,
    SUM(
        CASE
            WHEN application_status = 'Dropped'
            THEN 1
            ELSE 0
        END
    ) AS dropped_applications,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN application_status = 'Dropped'
                THEN 1
                ELSE 0
            END
        ) / COUNT(application_id),
        2
    ) AS drop_off_rate
FROM applications
GROUP BY branch_id
ORDER BY drop_off_rate DESC;




SELECT
    branch_id,
    drop_off_reason,
    COUNT(*) AS dropped_applications
FROM applications
WHERE application_status = 'Dropped'
GROUP BY branch_id, drop_off_reason
ORDER BY branch_id, dropped_applications DESC;



SELECT
    branch_id,
    COUNT(*) AS total_applications,

    SUM(
        CASE
            WHEN application_status = 'Approved'
            THEN 1 ELSE 0
        END
    ) AS approved_applications,

    SUM(
        CASE
            WHEN application_status = 'Dropped'
            THEN 1 ELSE 0
        END
    ) AS dropped_applications,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN application_status = 'Approved'
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS approval_rate,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN application_status = 'Dropped'
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS drop_off_rate

FROM applications
GROUP BY branch_id
ORDER BY drop_off_rate DESC;



SELECT
    drop_off_reason,
    COUNT(*) AS dropped_applications,
    ROUND(
        100.0 * COUNT(*) /
        (
            SELECT COUNT(*)
            FROM applications
            WHERE branch_id = 'B011'
              AND application_status = 'Dropped'
        ),
        2
    ) AS percentage_of_branch_dropoffs
FROM applications
WHERE branch_id = 'B011'
  AND application_status = 'Dropped'
GROUP BY drop_off_reason
ORDER BY dropped_applications DESC;






SELECT
    branch_id,
    COUNT(*) AS total_applications,

    SUM(CASE
        WHEN application_status = 'Approved'
        THEN 1 ELSE 0
    END) AS approved_applications,

    SUM(CASE
        WHEN application_status = 'Dropped'
        THEN 1 ELSE 0
    END) AS dropped_applications,

    ROUND(
        100.0 * SUM(CASE
            WHEN application_status = 'Approved'
            THEN 1 ELSE 0
        END) / COUNT(*),
        2
    ) AS approval_rate,

    ROUND(
        100.0 * SUM(CASE
            WHEN application_status = 'Dropped'
            THEN 1 ELSE 0
        END) / COUNT(*),
        2
    ) AS drop_off_rate

FROM applications
GROUP BY branch_id
ORDER BY drop_off_rate DESC;







SELECT
    branch_id,
    COUNT(*) AS total_applications,

    SUM(CASE
        WHEN application_status = 'Approved'
        THEN 1 ELSE 0
    END) AS approved_applications,

    SUM(CASE
        WHEN application_status = 'Dropped'
        THEN 1 ELSE 0
    END) AS dropped_applications,

    ROUND(
        100.0 * SUM(CASE
            WHEN application_status = 'Approved'
            THEN 1 ELSE 0
        END) / COUNT(*), 2
    ) AS approval_rate,

    ROUND(
        100.0 * SUM(CASE
            WHEN application_status = 'Dropped'
            THEN 1 ELSE 0
        END) / COUNT(*), 2
    ) AS drop_off_rate,

    CASE
        WHEN 100.0 * SUM(CASE
            WHEN application_status = 'Dropped'
            THEN 1 ELSE 0
        END) / COUNT(*) >= 15
        THEN 'High Drop-off'
        ELSE 'Lower Drop-off'
    END AS performance_flag

FROM applications
GROUP BY branch_id
ORDER BY drop_off_rate DESC;
show databases;
select database();
show tables;

USE finserve_360;
describe applications;
describe customers;


USE finserve_360;

SELECT
    c.customer_id,
    c.city,
    c.customer_segment,
    c.acquisition_channel,
    a.application_id,
    a.branch_id,
    a.application_status
FROM customers c
INNER JOIN applications a
    ON c.customer_id = a.customer_id
LIMIT 10;

ON c.customer_id = a.customer_id

ON c.customer_id = a.customer_id
SELECT
    c.customer_segment,
    COUNT(a.application_id) AS total_applications,
    SUM(
        CASE
            WHEN a.application_status = 'Approved'
            THEN 1
            ELSE 0
        END
    ) AS approved_applications,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.application_status = 'Approved'
                THEN 1
                ELSE 0
            END
        ) / COUNT(a.application_id),
        2
    ) AS approval_rate
FROM finserve_360.customers c
INNER JOIN finserve_360.applications a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_segment
ORDER BY total_applications DESC;



USE finserve_360;

SELECT
    c.customer_segment,
    COUNT(a.application_id) AS total_applications,

    SUM(
        CASE
            WHEN a.application_status = 'Approved'
            THEN 1
            ELSE 0
        END
    ) AS approved_applications,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.application_status = 'Approved'
                THEN 1
                ELSE 0
            END
        ) / COUNT(a.application_id),
        2
    ) AS approval_rate

FROM customers c

INNER JOIN applications a
    ON c.customer_id = a.customer_id

GROUP BY c.customer_segment

ORDER BY total_applications DESC;



USE finserve_360;

SELECT
    c.acquisition_channel,
    COUNT(a.application_id) AS total_applications,

    SUM(
        CASE
            WHEN a.application_status = 'Approved'
            THEN 1
            ELSE 0
        END
    ) AS approved_applications,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.application_status = 'Approved'
                THEN 1
                ELSE 0
            END
        ) / COUNT(a.application_id),
        2
    ) AS approval_rate

FROM customers c

INNER JOIN applications a
    ON c.customer_id = a.customer_id

GROUP BY c.acquisition_channel

ORDER BY total_applications DESC;





USE finserve_360;

SELECT
    c.city,
    COUNT(a.application_id) AS total_applications,

    SUM(
        CASE
            WHEN a.application_status = 'Approved'
            THEN 1
            ELSE 0
        END
    ) AS approved_applications,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN a.application_status = 'Approved'
                THEN 1
                ELSE 0
            END
        ) / COUNT(a.application_id),
        2
    ) AS approval_rate

FROM customers c

INNER JOIN applications a
    ON c.customer_id = a.customer_id

GROUP BY c.city

ORDER BY total_applications DESC;



USE finserve_360;

SELECT
    application_status,
    COUNT(*) AS total_applications,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM applications),
        2
    ) AS percentage_of_applications
FROM applications
GROUP BY application_status
ORDER BY total_applications DESC;
