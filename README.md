# AtliQ_Mart_Sales_Analytics
This analysis offers a comprehensive evaluation of AtliQ Mart's promotional strategies, focusing on sales performance, product trends, and store-specific insights. By leveraging MySQL for data manipulation and analysis, the project uncovers key insights into promotional effectiveness, popular products, and customer engagement metrics. These insights aim to inform data-driven strategies that optimize future promotions, enhance customer experience, and drive overall sales growth. The analysis also provides targeted recommendations to improve marketing efforts, inventory management, and promotional planning across AtliQ Mart’s extensive retail network.

## Background
AtliQ Mart is a retail giant with over 50 supermarkets in the southern region of India. All their 50 stores ran a massive promotion during the Diwali 2023 and Sankranti 2024 (festive time in India) on their AtliQ branded products. Now the sales director wants to understand which promotions did well and which did not so that they can make informed decisions for their next promotional period.

## Project Goals
The primary goal of this project is to gain insights into AtliQ Mart's sales data to understand the various factors influencing sales performance across different stores.
- Store Performance Analysis
- Promotion Type Analysis
- Product Analysis

## Techical Stack
**Data Analysis** : Excel, MySQL

## Data Understanding
This dataset contains 1500 sales transactions from  different stores.
- **Events**  : Event_ID, Store_ID, Campaign_ID, Product_ID, Base_Price, Promo_type, Quantity_before and Quantity_after.
- **Products** : product_code, product_name, category.
- **Stores** : Store_ID, City
- **Campaigns** : Campaign_ID, Campaign_name, Start_date and End_date.

## Data Preparation
### Data Wrangling
   - Creating a Database.
   - Creating a Table with constraints.
   - Loading and Inserting the values into the Table.

## Data Model
![image](https://github.com/user-attachments/assets/954ed1df-6d17-4ba7-a5e1-bcf5a730bea5)

 
## Business Questions
1. Which are the top 10 stores in terms of Incremental Revenue (IR) generated from the promotions?
2. Which are the bottom 10 stores when it comes to Incremental Sold Units (ISU) during the promotional period?
3. How does the performance of stores vary by city? Are there any common characteristics among the top-performing stores that could be leveraged across other stores?
4. What are the top 2 promotion types that resulted in the highest Incremental Revenue?
5. What are the bottom 2 promotion types in terms of their impact on Incremental Sold Units?
6. Is there a significant difference in the performance of discount-based promotions versus BOGOF (Buy One Get One Free) or cashback promotions?
7. Which promotions strike the best balance between Incremental Sold Units and maintaining healthy margins?
8. Which product categories saw the most significant lift in sales from the promotions?
9. Are there specific products that respond exceptionally well or poorly to promotions?

## Store Performance Analysis
### Top Performing Stores
  - **Highest Revenue Store**: Store STMYS-1 in Mysuru leads with an Incremental Revenue of 6,446,961.
  - **Strong Performance in Major Cities**: Stores in Bengaluru and Chennai dominate the top 10 list, indicating a robust market presence.

### Underperforming Stores
  - **Lowest Incremental Sold Units**: Store STMLR-0 in Mangalore has the least sold units at 1,952, suggesting potential issues with promotion relevance.
  - **Market Challenges**: Cities like Mangalore and Visakhapatnam show low ISU, indicating a need for improved promotional strategies.

### City-wise Performance
  - **Revenue Leaders**: Bengaluru shows the highest Total Incremental Revenue of 50,764,342 across 10 stores.
  - **Average Revenue Analysis**: Cities like Bengaluru and Chennai exhibit high Average Incremental Revenue per store, signaling effective promotion strategies.

## Promotion Type Analysis
### Top Performing Promotion Types
  - **Best Revenue Generators**: The 500 Cashback promotion leads with 122,643,000 in Incremental Revenue and 40,881 Sold Units.
  - **Effective BOGOF Promotions**: BOGOF promotions drive substantial units sold, contributing significantly to revenue.

### Underperforming Promotion Types
  - **Negative Impact of Discounts**: Promotions like 25% OFF show a decline in Incremental Revenue, indicating limited success.
  - **Low Effectiveness of Discount Promotions**: Overall, discount-based promotions yield lower impacts compared to cashback and BOGOF strategies.

### Promotion Performance by Category
  - **BOGOF vs. Cashback**: BOGOF promotions excel in unit sales, while Cashback offers maintain higher profit margins, suggesting a need for strategic balance.

## Product Analysis
### High-Performing Categories
  - **Top Sales Lift**: Grocery & Staples lead with an Incremental Sold Units of 119,374, reflecting strong customer demand.
  - **Combo1 Effectiveness**: Combo1 promotions show a significant response, indicating consumer interest in bundled offers.

### Underperforming Products
  - **Need for Repositioning**: Products like Atliq Scrub Sponge have low sales performance, highlighting areas for targeted promotional efforts.
  - **Opportunities in Other Categories**: Moderate lift in categories like Personal Care suggests potential for tailored campaigns.

### Category Performance Insights
  - **Promotion-Specific Success**: Grocery & Staples perform best with BOGOF promotions, while Combo categories excel with cashback offers.

## Recommendations:
### Store-Level Strategies
  - **City-Specific Targeting**: Expand successful promotional strategies from Bengaluru and Chennai to cities like Hyderabad to enhance Incremental Revenue.
  - **Localized Promotions**: Develop tailored promotions for smaller cities like Mangalore and Visakhapatnam to improve customer engagement and sales.

### Promotion-Level Strategies
  - **Focus on High-Impact Promotions**: Prioritize Cashback and BOGOF promotions for maximum revenue generation.
  - **Limit Discount Promotions**: Reduce reliance on high discount promotions, as they have shown negative revenue impact.

### Product-Level Strategies
  - **Enhance Promotions for High-Response Categories**: Increase promotional efforts for Grocery & Staples and Combo1 categories to capitalize on strong customer interest.
  - **Reevaluate Underperforming Products**: Consider repositioning strategies for low-performing products and experiment with limited-time offers to gauge market response.
  
## Future Scope
- **Customer Segmentation**: Develop personalized promotions by segmenting customers based on demographics, purchasing behavior, and preferences.
- **Predictive Analytics**: Utilize forecasting models to predict promotional impact, aligning promotions with anticipated demand patterns for maximum effectiveness.
- **A/B Testing for Promotion Optimization**: Implement A/B testing across different stores and regions to determine the most effective promotion types and strategies.
