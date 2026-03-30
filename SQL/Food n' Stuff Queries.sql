-- Category – Analysis
SELECT a.category, a.total_sales AS sales_2020, b.total_sales AS sales_2021, (b.total_sales - a.total_sales) / a.total_sales * 100 AS sales_percentage_change
FROM (
  SELECT p.category, SUM(CASE WHEN year(s.sale_date) = 2020 THEN s.quantity * s.price ELSE 0 END) AS total_sales
  FROM food_n_stuff_sales s
  LEFT JOIN food_n_stuff_products p ON s.item_id = p.product_id
  WHERE year(sale_date) = 2020
  GROUP BY p.category
) a
JOIN (
  SELECT p.category, SUM(CASE WHEN year(s.sale_date) = 2021 THEN s.quantity * s.price ELSE 0 END) AS total_sales
  FROM food_n_stuff_sales s
  LEFT JOIN food_n_stuff_products p ON s.item_id = p.product_id
  WHERE year(sale_date) = 2021
  GROUP BY p.category
) b ON a.category = b.category;

-- Division – Analysis
SELECT a.division, 2020_sales, 2021_sales, 2021_sales - 2020_sales AS "sales difference", (2021_sales - 2020_sales) / 2020_sales * 100 AS "percentage change"
FROM (
    SELECT SUM(s.quantity * s.price) AS "2020_sales", stores.division
    FROM food_n_stuff_sales s
    LEFT JOIN food_n_stuff_stores stores ON s.store_id = stores.store_id
    WHERE YEAR(s.sale_date) = 2020
    GROUP BY stores.division
) a
LEFT JOIN (
    SELECT SUM(s.quantity * s.price) AS "2021_sales", stores.division
    FROM food_n_stuff_sales s
    LEFT JOIN food_n_stuff_stores stores ON s.store_id = stores.store_id
    WHERE YEAR(s.sale_date) = 2021
    GROUP BY stores.division
) b ON a.division = b.division;

-- Product - Analysis
SELECT a.product_name, a.total_sales_2020, b.total_sales_2021, (b.total_sales_2021 - a.total_sales_2020) AS sales_difference,
    (ROUND(((b.total_sales_2021 - a.total_sales_2020) / a.total_sales_2020) * 100, 2)) AS percent_difference
FROM
(
    SELECT b.product_name, 
		SUM(CASE WHEN YEAR(a.sale_date) = 2020 THEN a.price * a.quantity ELSE 0 END) AS total_sales_2020,
        SUM(CASE WHEN YEAR(a.sale_date) = 2020 THEN a.price * a.quantity ELSE 0 END) AS total_sales_2021
    FROM food_n_stuff_sales a
    LEFT JOIN food_n_stuff_products b ON a.item_id = b.product_id
    WHERE YEAR(a.sale_date) IN (2020, 2021)
    GROUP BY b.product_name
) a
LEFT JOIN
(
    SELECT b.product_name,
        SUM(CASE WHEN YEAR(a.sale_date) = 2021 THEN a.price * a.quantity ELSE 0 END) AS total_sales_2021
    FROM food_n_stuff_sales a
    LEFT JOIN food_n_stuff_products b ON a.item_id = b.product_id
    WHERE YEAR(a.sale_date) IN (2020, 2021)
    GROUP BY b.product_name
) b ON a.product_name = b.product_name
ORDER BY b.total_sales_2021 DESC
Limit 5;

-- Hobbies – Analysis
WITH ProductSales AS (
    SELECT b.product_name,
        SUM(CASE WHEN YEAR(a.sale_date) = 2020 THEN a.price * a.quantity ELSE 0 END) AS total_sales_2020,
        SUM(CASE WHEN YEAR(a.sale_date) = 2021 THEN a.price * a.quantity ELSE 0 END) AS total_sales_2021
    FROM food_n_stuff_sales a
    LEFT JOIN food_n_stuff_products b ON a.item_id = b.product_id
    LEFT JOIN food_n_stuff_stores c ON c.store_id = a.store_id
    WHERE YEAR(a.sale_date) IN (2020, 2021) AND category = 'Hobbies' AND division = 'Mountain'
    GROUP BY b.product_name
)

SELECT product_name, total_sales_2020, total_sales_2021, (total_sales_2021 - total_sales_2020) AS sales_difference,
    ROUND(((total_sales_2021 - total_sales_2020) / total_sales_2020) * 100, 2) AS percent_difference
FROM ProductSales
ORDER BY product_name asc;

-- Mountain – Analysis
SELECT * 
from 
(SELECT store_id, total_sales_2020, total_sales_2021, (total_sales_2021 - total_sales_2020) AS difference,
    ROUND(((total_sales_2021 - total_sales_2020) / total_sales_2020) * 100, 2) AS percent_difference
FROM (
    SELECT stores.store_id,
        SUM(CASE WHEN YEAR(sales.sale_date) = 2020 THEN sales.price * sales.quantity ELSE 0 END) AS total_sales_2020,
        SUM(CASE WHEN YEAR(sales.sale_date) = 2021 THEN sales.price * sales.quantity ELSE 0 END) AS total_sales_2021
    FROM food_n_stuff_sales sales
    LEFT JOIN food_n_stuff_stores stores ON sales.store_id = stores.store_id
    LEFT JOIN food_n_stuff_products products ON products.product_id = sales.item_id
    WHERE division = "Mountain"
    GROUP BY stores.store_id
) AS a
ORDER BY store_id
) as b
WHERE percent_difference < 0
ORDER BY store_id
