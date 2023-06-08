/*
Creating a master dataset for an executive revenue dashboard.

Skills Used: INNER JOINs, Aggregate Functions, Concatenating
*/
SELECT 
	o.order_id,
	CONCAT(c.first_name, ' ', c.last_name) [customers],
	c.city,
	c.state, 
	o.order_date,
	SUM(i.quantity) [total units],
	SUM(i.quantity * i.list_price) [revenue],
	p.product_name,
	ca.category_name,
	b.brand_name,
	s.store_name,
	CONCAT(st.first_name, ' ', st.last_name) [sales rep]
FROM sales.orders o
	INNER JOIN sales.customers c
		ON o.customer_id = c.customer_id
	INNER JOIN sales.order_items i
		ON o.order_id = i.order_id
	INNER JOIN production.products p
		ON i.product_id = p.product_id
	INNER JOIN production.categories ca
		ON p.category_id = ca.category_id
	INNER JOIN production.brands b
		ON p.brand_id = b.brand_id
	INNER JOIN sales.stores s
		ON o.store_id = s.store_id
	INNER JOIN sales.staffs st
		ON o.staff_id = st.staff_id
GROUP BY 
	o.order_id,
	CONCAT(c.first_name, ' ', c.last_name), 
	c.city, 
	c.state, 
	o.order_date,
	p.product_name,
	ca.category_name,
	b.brand_name,
	s.store_name,
	CONCAT(st.first_name, ' ', st.last_name)
