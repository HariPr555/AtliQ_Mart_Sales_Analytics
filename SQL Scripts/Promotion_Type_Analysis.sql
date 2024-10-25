-- ---------------------------------------------------------------------------------------------------------------------------------

-- Title : Promotion Type Analysis
-- Author : Hari Prathap V
-- Date : 2024-10-24

-- ---------------------------------------------------------------------------------------------------------------------------------
-- Open the data base to reference the tables 
use retail_events_db;

-- 1. What are the top 2 promotion types that resulted in the highest Incremental Revenue?
select promo_type,
	   round((sum(base_price*quantity_after)-sum(base_price*quantity_before))/1000000, 2) as IR
from events
group by promo_type
order by IR desc
limit 2;

-- Insights : 500 Cahback is the most successful promotion with the highest Inreamental Revenue of 122.64 M and BOGOF is second on the list by a distance margin.
-- All values in USD Millions

-- 2. What are the bottom 2 promotion types in terms of their impact on Incremental Sold Units?
select promo_type,
	   round((sum(quantity_after)-sum(quantity_before))/1000, 2) as ISU
from events
group by promo_type
order by ISU
limit 2;

-- Insights : 25% OFF is the least performing promotion with a sales decrease of 5.72K units and 50% OFF has very small sales increase of 6.93K units.
-- Quantity in "Thousand"

/* 3. Is there a significant difference in the performance of discount-based promotions 
versus BOGOF (Buy One Get One Free) or cashback promotions? */

with promotion_segmentation as
(select *,
		case
        when promo_type regexp "OFF" then "Offer Discount"
        when promo_type regexp "Cashback" then "Cashback"
        else "BOGOF" end as promotion_category
from events)

select promotion_category,
	   round(100*(sum(base_price*quantity_after)-sum(base_price*quantity_before))/sum(base_price*quantity_before), 2) as `IR%`,
       round(100*(sum(quantity_after)-sum(quantity_before))/sum(quantity_before), 2) as `ISU%`
from promotion_segmentation
group by promotion_category
order by `IR%` desc, `ISU%` desc;

-- Insights : BOGOF is the best promotion category that strikes the best balance between Increamental Revenue and Sales Unit.
