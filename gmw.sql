CREATE VIEW public.gmw AS
	SELECT 
		purchases.store_id,
		products.category_id,
		SUM(
			purchase_items.product_count * purchase_items.product_price
			) AS gmw_val
	FROM purchase_items
	INNER JOIN 
		products 
	ON
		 products.product_id = purchase_items.product_id 
	INNER JOIN 
		purchases  
	ON 
		purchase_items.purchase_id = purchases.purchase_id
	GROUP BY 
		store_id,
		category_id;
