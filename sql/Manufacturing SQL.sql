create database manufacturing_project;
use manufacturing_project;

select *from manufacturing_analytics_cleaned_mysql;

select count(*) from manufacturing_analytics_cleaned_mysql;

-- 1. Manufactured Qty
SELECT SUM(manufactured_qty) AS total_manufactured_qty
FROM manufacturing_analytics_cleaned_mysql;

-- 2. Rejected Qty
SELECT SUM(rejected_qty) AS total_rejected_qty
FROM manufacturing_analytics_cleaned_mysql;

-- 3. Processed Qty
SELECT SUM(produced_qty) AS total_processed_qty
FROM manufacturing_analytics_cleaned_mysql;

-- 4. Wastage Qty %
SELECT (SUM(rejected_qty) / SUM(produced_qty)) * 100 AS wastage_qty_percentage
FROM manufacturing_analytics_cleaned_mysql;

-- 5. Employee Wise Rejected Qty
SELECT emp_name, SUM(rejected_qty) AS employee_rejected_qty
FROM manufacturing_analytics_cleaned_mysql
GROUP BY emp_name
ORDER BY employee_rejected_qty DESC;

-- 6. Machine Wise Rejected Qty
SELECT machine_name, SUM(rejected_qty) AS machine_rejected_qty
FROM manufacturing_analytics_cleaned_mysql
GROUP BY machine_name
order by machine_rejected_qty desc;

-- 7. Production Comparison Trend
SELECT doc_date, SUM(manufactured_qty) AS total_production
FROM manufacturing_analytics_cleaned_mysql
GROUP BY doc_date
ORDER BY doc_date;

-- 8. Manufacture Vs Rejected
SELECT doc_date, SUM(manufactured_qty) AS total_manufactured_qty, SUM(rejected_qty) AS total_rejected_qty
FROM manufacturing_analytics_cleaned_mysql
GROUP BY doc_date
ORDER BY doc_date;

-- 9. Department Wise Manufacture Vs Rejected
SELECT department_name, SUM(manufactured_qty) AS total_manufactured_qty, SUM(rejected_qty) AS total_rejected_qty
FROM manufacturing_analytics_cleaned_mysql
GROUP BY department_name;

-- 10. Emp Wise Rejected Qty
SELECT emp_name, SUM(rejected_qty) AS total_rejected_qty
FROM manufacturing_analytics_cleaned_mysql
GROUP BY emp_name
Order BY total_rejected_qty desc;