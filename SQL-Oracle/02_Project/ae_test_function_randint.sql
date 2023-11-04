

SELECT person_id,COUNT(1) FROM a_order_history GROUP BY person_id ORDER BY person_id DESC;
SELECT product_id,COUNT(1) FROM a_order_history GROUP BY product_id ORDER BY product_id  DESC;