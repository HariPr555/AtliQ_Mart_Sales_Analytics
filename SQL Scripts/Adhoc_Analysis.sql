-- ---------------------------------------------------------------------------------------------------------------------------------

-- Title : Adhoc Analysis for AtliQ Mart Sales Analytics
-- Author : Hari Prathap V
-- Date : 2024-10-24

-- ------------------------------------------------------------------------------------------------------------------------------------
-- Open the database to reference tables
use retail_events_db;

-- Business Questions

-- 1.Provide a list of products with a base price greater than 500 and that are featured in promo type of 'BOGOF'
select distinct p.product_name,
	   base_price
from events as e
inner join products as p 
on e.product_id = p.product_id
where e.base_price>500 and e.promo_type="BOGOF";

/* Insight : Atliq_Double_Bedsheet_set (1190) and  Atliq_waterproof_Immersion_Rod (1020) are the only products
			 with base price greater than 500 under BOGOF*/

-- 2. Generate a report that provides an overview of the number of stores in each city. 

select city,
	   count(store_id) as store_count
from stores
group by city
order by store_count desc, city;

-- Insights : Bangalore has the most stores (10) and Vijawada has the least (2).

-- 3. Generate a report that displays each campaign along with the total revenue generated before and after the campaign?
select max(c.campaign_name) as campaign,
	   concat(round(sum(e.base_price*e.quantity_before)/1000000, 2), " M") as revenue_before,
       concat(round(sum(e.base_price*e.quantity_after)/1000000, 2), " M") as revenue_after
from events as e 
inner join campaigns as c 
on e.campaign_id = c.campaign_id
group by c.campaign_id;

-- Insights : Diwali Campaign generated more revenue (207.46 M) compared to Sankranti (140.40 M)
-- All values in USD millions

/* 4. Produce a report that calculates the Incremental Sold Quantity (ISU%) for each category during the Diwali campaign. 
Additionally, provide rankings for the categories based on their ISU%. */

with diwali_sales as
(select p.category,
		sum(e.quantity_after)-sum(quantity_before) as ISU,
        round(100*(sum(e.quantity_after)-sum(quantity_before))/sum(quantity_before), 2) as `ISU%`
from events as e 
inner join campaigns as c 
on e.campaign_id = c.campaign_id
inner join products as p 
on e.product_id = p.product_id
where c.campaign_name = "Diwali"
group by p.category)

select category,
	   concat(`ISU%`, "%") as `ISU%`,
       rank() over(order by `ISU%` desc) as ISU_rank
from diwali_sales
order by ISU_rank;

-- Insights : Home Appliances tops the table with 244.23% ISU growth contrary to Grocery & Staples with only 18.05%

-- 5. Create a report featuring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), across all campaigns.
with product_sales as
(select p.category, 
		max(p.product_name) as product_name,
        sum(e.base_price*e.quantity_before) as revenue_before,
        sum(e.base_price*e.quantity_after) as revenue_after,
        sum(e.base_price*e.quantity_after)-sum(e.base_price*e.quantity_before) as IR,
        round(100*(sum(e.base_price*e.quantity_after)-sum(e.base_price*e.quantity_before))/sum(e.base_price*e.quantity_before),2)  as `IR%`
from events as e
inner join products as p 
on e.product_id = p.product_id
group by p.category, p.product_id)

select product_name,
	   category,
       concat(`IR%`, "%") as `IR%`,
       rank() over(order by `IR%` desc) as IR_rank
from product_sales
order by IR_rank, product_name
limit 5;

-- Insights : The 5 most successful products in terms of incremental revenue across our campaigns, assisting in product optimization.
