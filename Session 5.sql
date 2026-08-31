# Ada berapa banyak produk yang sudah terjual? Dan berapa rata-rata retail price nya?
SELECT 
  p.name,
  AVG(p.retail_price) AS avg_retail_price
FROM bigquery-public-data.thelook_ecommerce.products p
INNER JOIN bigquery-public-data.thelook_ecommerce.order_items oi
  ON p.id = oi.product_id
GROUP BY p.name
ORDER BY avg_retail_price DESC;

# Tampilkan produk yang sudah terjual dengan rata-rata Retail Price dan rata-rata Sale Price
# Diurutkan berdasarkan rata-rata retail price terbesar sampai terkecil

SELECT 
  p.name,
  AVG(p.retail_price) AS avg_retail_price,
  AVG(oi.sale_price) AS avg_sale_price
FROM bigquery-public-data.thelook_ecommerce.products p
INNER JOIN bigquery-public-data.thelook_ecommerce.order_items oi
  ON p.id = oi.product_id
GROUP BY p.name
ORDER BY avg_retail_price DESC;
