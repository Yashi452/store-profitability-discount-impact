-- Store Profitability & Discount Impact Analysis
-- Tool: PostgreSQL
-- Dataset: 1,000 sales records

-- 1. Total Sales & Total Profit
SELECT SUM(net_sales_inr) AS total_sales, SUM(profit_inr) AS total_profit
FROM sales_data;

-- 2. Profit by Category
SELECT category, SUM(profit_inr) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;

-- 3. Top 10 Products by Profit
SELECT product, SUM(profit_inr) AS total_profit
FROM sales_data
GROUP BY product
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Discount Impact on Profit
SELECT (discount_pct * 100)::INT AS discount_percentage,
       ROUND(AVG(profit_inr), 2) AS average_profit
FROM sales_data
GROUP BY discount_pct
ORDER BY discount_pct;

-- 5. Profit by State
SELECT state, ROUND(SUM(profit_inr), 2) AS total_profit
FROM sales_data
GROUP BY state
ORDER BY total_profit DESC;

-- 6. Profit by Sales Channel
SELECT sales_channel, ROUND(SUM(profit_inr), 2) AS total_profit
FROM sales_data
GROUP BY sales_channel
ORDER BY total_profit DESC;

-- 7. Monthly Sales & Profit
SELECT month_no, month,
       ROUND(SUM(net_sales_inr), 2) AS total_sales,
       ROUND(SUM(profit_inr), 2) AS total_profit
FROM sales_data
GROUP BY month_no, month
ORDER BY month_no;

-- 8. Average Profit Margin by Category
SELECT category,
       ROUND(AVG(profit_margin_pct), 2)::TEXT || '%' AS average_profit_margin
FROM sales_data
GROUP BY category
ORDER BY AVG(profit_margin_pct) DESC;
