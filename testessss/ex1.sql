--ex2
SELECT customer_id,
       first_name,
       last_name,
       phone
FROM sales.customers
WHERE phone IS NOT NULL
  AND TRIM(phone) <> ''
ORDER BY last_name ASC, first_name DESC;


--ex3
SELECT first_name,
       city,
       LOWER(CONCAT(LEFT(first_name, 3), '-', city)) AS valor_composto
FROM sales.customers
WHERE city IS NOT NULL
  AND TRIM(city) <> ''
ORDER BY city ASC;


--ex4
SELECT category_id,
       category_name,
       CONCAT(
           RIGHT('0000000000' + CAST(category_id AS VARCHAR(10)), 10),
           '-',
           category_name
       ) AS identificador_formatado
FROM production.categories
ORDER BY identificador_formatado ASC;
--ex5


--ex6
UPDATE sales.customers
SET first_name = LOWER(first_name)
WHERE customer_id BETWEEN 1 AND 10;

SELECT customer_id,
       first_name,
       last_name
FROM sales.customers
WHERE customer_id BETWEEN 1 AND 10
ORDER BY customer_id;


--ex7
UPDATE sales.customers
SET phone = NULL
WHERE state IN ('NY', 'CA')
  AND customer_id BETWEEN 1 AND 30;

SELECT customer_id,
       first_name,
       state,
       phone
FROM sales.customers
WHERE state IN ('NY', 'CA')
  AND customer_id BETWEEN 1 AND 30
ORDER BY customer_id;


--ex8
UPDATE production.products
SET product_name = CONCAT(
    'bike_',
    LOWER(RIGHT(TRIM(product_name), 4))
)
WHERE product_id BETWEEN 1 AND 10
  AND product_name IS NOT NULL
  AND LEN(TRIM(product_name)) >= 4;

SELECT product_id,
       product_name
FROM production.products
WHERE product_id BETWEEN 1 AND 10
ORDER BY product_id;
--ex9