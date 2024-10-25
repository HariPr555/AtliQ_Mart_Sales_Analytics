-- -------------------------------------------------------------------------------------------------------------------------
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
-- Host : localhost 
-- Database : retail_events_db
-- Date : 2024-10-24
-- -------------------------------------------------------------------------------------------------------------------------

-- Create a AtliQ Retail Events Database
create database retail_events_db;

-- Open the database to create tables inside it
use retail_events_db;

-- Create a Campaigns table in retail_events_db
create table if not exists campaigns
(campaign_id varchar(15) not null,
 campaign_name varchar(15) not null,
 start_date date not null,
 end_date date not null,
 primary key (campaign_id));
 
 -- Table structure of `campaigns` table
 describe campaigns;
 
-- Path to upload the file to import data
show variables like 'secure_file_priv';

-- Insert values into `campaigns` table using csv file
load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Campaigns.csv"
into table campaigns
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

-- View all records from `campaigns` table
select * from campaigns;

-- Create a `products` table in retail_events_db
create table if not exists products
(product_id varchar(5) not null,
 product_name varchar(50) not null,
 category varchar(20) not null,
 primary key (product_id));
 
 -- Table structure of `products` table
 describe products;
 
 -- Load values into `products` table using csv file
 load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Products.csv"
 into table products
 fields terminated by ','
 lines terminated by '\n'
 ignore 1 rows;
 
 -- View all records of `products` Table
 select * from products;
 
 -- Create a `sotres` table in retail_events_db
 create table if not exists stores
 (store_id varchar(10) not null,
  city varchar(20) not null,
  primary key (store_id));
  
-- Table structure of `stores` Table
describe stores;
  
-- Load values into `stores` Table using csv file
load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Stores.csv"
into table stores
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;
  
-- View all recors of `stores` Table
select * from stores;
  
-- Create a `events` table in retail_events_db
create table if not exists events
(event_id varchar(15) not null,
 store_id varchar(10) not null,
 campaign_id varchar(15) not null,
 product_id varchar(5) not null,
 base_price int not null,
 promo_type varchar(15) not null,
 quantity_before int not null,
 quantity_after int not null,
 primary key (event_id),
 constraint fk_events_products foreign key (product_id) references products(product_id),
 constraint fk_events_campaigns foreign key (campaign_id) references campaigns(campaign_id),
 constraint fk_events_stores foreign key (store_id) references stores(store_id));
 
 -- Table structure of `events' table
 describe events;
 
 -- Load values into `events` Table using csv file
 load data infile "C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Events.csv"
 into table events
 fields terminated by ','
 lines terminated by '\n'
 ignore 1 rows;
 
 -- View all records of `events` table
 select * from events;

-- Dump completed on 2024-10-24 09:54:00
 
 
   