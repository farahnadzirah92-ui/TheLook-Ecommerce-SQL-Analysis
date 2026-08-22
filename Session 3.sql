#Tampilkan order id, status, created at, first name, country
SELECT o.order_id, status, u.created_at, first_name, u.gender, country,
FROM bigquery-public-data.thelook_ecommerce.orders o
INNER JOIN bigquery-public-data.thelook_ecommerce.users u
      ON o.user_id = u.id
WHERE u.gender = "F";

#Tampilkan user, country, jumlah produk dibeli, total sales

SELECT u.id, u.country, 
count(distinct(oi.product_id)) AS jumlah_produk_dibeli,
sum(oi.sale_price) AS total_sales
FROM bigquery-public-data.thelook_ecommerce.users AS u
INNER JOIN bigquery-public-data.thelook_ecommerce.order_items AS oi
      ON u.id = oi.user_id
GROUP BY 1, 2;

#Tampilkan data order_id, user_id, status, created_at, serta first_name dan last_name dari user yang melakukan order

SELECT o.order_id, u.id AS user_id, o.status, o.created_at, u.first_name, u.last_name,
FROM bigquery-public-data.thelook_ecommerce.orders o
INNER JOIN bigquery-public-data.thelook_ecommerce.users u
      ON u.id = o.user_id;

#Tampilkan nama user dan jumlah order yang mereka lakukan, tetapi hanya untuk order dengan status Complete. Urutkan dari jumlah order terbanyak.

SELECT u.id AS user_id, first_name, last_name,
COUNT(o.order_id) as total_order,
FROM bigquery-public-data.thelook_ecommerce.orders o
INNER JOIN bigquery-public-data.thelook_ecommerce.users u
      ON u.id = o.user_id
WHERE status = "Complete"
GROUP BY u.id, first_name, last_name
ORDER BY total_order DESC;

#Cari 10 customer dengan total nilai pembelian terbesar

SELECT 
  u.first_name, 
  u.last_name,
  COUNT(DISTINCT oi.order_id) AS total_transactions,
  SUM(oi.sale_price) AS total_purchase_value
FROM bigquery-public-data.thelook_ecommerce.users u
INNER JOIN bigquery-public-data.thelook_ecommerce.order_items oi
  ON u.id = oi.user_id
WHERE oi.status = "Complete"
GROUP BY u.first_name, u.last_name
ORDER BY total_purchase_value DESC
LIMIT 10;