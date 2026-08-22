#5 country dengan jumlah order terbesar
--SELECT u.country, COUNT(order_id)

SELECT
  u.country,
  COUNT(*) AS total_orders
FROM bigquery-public-data.thelook_ecommerce.orders AS o
INNER JOIN bigquery-public-data.thelook_ecommerce.users AS u
  ON o.user_id = u.id
GROUP BY u.country
ORDER BY total_orders DESC;
