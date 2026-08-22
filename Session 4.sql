#5 country dengan jumlah order terbesar

SELECT
  u.country,
  COUNT(*) AS total_orders
FROM bigquery-public-data.thelook_ecommerce.orders AS o
INNER JOIN bigquery-public-data.thelook_ecommerce.users AS u
  ON o.user_id = u.id
GROUP BY u.country
ORDER BY total_orders DESC;

SELECT u.country,
       u.gender,
       COUNT(*) AS total_order,
FROM  bigquery-public-data.thelook_ecommerce.users AS u
INNER JOIN bigquery-public-data.thelook_ecommerce.orders AS o
ON u.id = o.user_id
GROUP BY 1,2
ORDER BY 2 DESC
LIMIT 5;

-- SELECT
-- COUNT(order_id) AS COUNT_ORDER,
-- COUNT(DISTINCT(order_id)) AS COUNT_UNIQUE_ORDER FROM bigquery-public-data.thelook_ecommerce.orders

#total order
#status:complete
SELECT u.country,
  COUNT(*) AS total_orders
FROM bigquery-public-data.thelook_ecommerce.orders AS o
INNER JOIN bigquery-public-data.thelook_ecommerce.users AS u
  ON o.user_id = u.id
WHERE status = 'Complete'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

#Status Order paling banyak
SELECT status,
  COUNT(*) AS total_orders
FROM bigquery-public-data.thelook_ecommerce.orders AS o
GROUP BY 1
ORDER BY 2 DESC;