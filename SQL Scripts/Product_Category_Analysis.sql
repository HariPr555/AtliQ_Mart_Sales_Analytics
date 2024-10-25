-- ---------------------------------------------------------------------------------------------------------------------------------

-- Title : Product and Category Analysis
-- Author : Hari Prathap V
-- Date : 2024-10-24

-- ---------------------------------------------------------------------------------------------------------------------------------
-- Open the data base to reference the tables 
use retail_events_db;

-- 1. Which product categories saw the most significant lift in sales from the promotions?
select p.category,
	   round((sum(e.quantity_after)-sum(e.quantity_before))/1000, 2) as ISU
from events as e 
inner join products as p 
on e.product_id = p.product_id
group by p.category
order by ISU desc;

-- Insights : Grocery & Staples have the highest sales after promotions with 119.37K units
-- All units in "Thousands"

-- 2. Are there specific products that respond exceptionally well or poorly to promotions?
with product_sales as
(select max(p.product_name) as product_name,
	   round((sum(e.base_price*e.quantity_after)-sum(e.base_price*e.quantity_before))/1000000, 2) as IR
from events as e
inner join products as p 
on e.product_id = p.product_id
group by p.product_id),
product_ranking as
(select product_name,
		IR,
	   rank() over(order by IR desc) as top_product,
       rank() over(order by IR) as bottom_product
from product_sales)

select product_name,
	   concat(IR, " M") as `IR (M)`
from product_ranking
where top_product<=5 or bottom_product<=5
order by IR desc;

-- Insights : Atliq_Farm_Chakki_Atta (1KG) has the best IR ow 18.25M and Atliq_Fusion_Container_Set_of_3 has a drop in revenue of 0.31M.