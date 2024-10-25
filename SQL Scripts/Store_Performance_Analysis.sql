-- ---------------------------------------------------------------------------------------------------------------------------------

-- Title : Store Performance Analysis
-- Author : Hari Prathap V
-- Date : 2024-10-24

-- ---------------------------------------------------------------------------------------------------------------------------------
-- Open the data base to reference the tables 
use retail_events_db;

-- 1. Which are the top 10 stores in terms of Incremental Revenue (IR) generated from the promotions?
select s.store_id,
       concat(round((sum(e.base_price*e.quantity_after)-sum(e.base_price*e.quantity_before))/1000000, 2), " M") as IR
from events as e 
inner join stores as s 
on e.store_id = s.store_id
group by s.store_id
order by IR desc
limit 10;

-- Insights : The following display the top 10 stores with high Increamental Revenue(IR) with STMYS-1 generating a whooping 6.45 M
-- All values in USD millions

-- 2. Which are the bottom 10 stores when it comes to Incremental Sold Units (ISU) during the promotional period?
select s.store_id,
	   concat(round((sum(quantity_after)-sum(quantity_before))/1000, 2), " K") as ISU
from events as e 
inner join stores as s 
on e.store_id = s.store_id
group by e.store_id
order by ISU
limit 10;

-- Insights : The following are the bottom 10 stores that has the least Increamental Sales with STMLR-2 only managing to sell 2.66K products.

-- 3. How does the performance of stores vary by city? 
select s.city,
	   s.store_id,
       100*(sum(e.base_price*e.quantity_after)-sum(e.base_price*e.quantity_before))/sum(e.base_price*e.quantity_before) as `IR%`,
       100*(sum(e.quantity_after)-sum(e.quantity_before))/sum(e.quantity_before) as `ISU%`
from events as e 
inner join stores as s 
on e.store_id = s.store_id
group by s.city, s.store_id
order by city, `IR%` desc;
