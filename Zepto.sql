Drop table if exists zepto;
--TABLE CREATION
create table zepto(
sku_id SERIAL PRIMARY KEY,
Category varchar(120),
name varchar(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity Integer,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--DATA EXPLORATION

SELECT * 
FROM zepto
LIMIT 10;

SELECT COUNT(*) 
FROM zepto;

SELECT DISTINCT category
FROM zepto
ORDER BY category;

SELECT outofstock, COUNT(sku_id) as NUMBER_OF_SKU
FROM zepto 
GROUP BY outofstock;

SELECT name, COUNT(sku_id) as NUMBER_OF_SKU
FROM zepto
GROUP BY name 
HAVING COUNT(SKU_ID)> 1
ORDER BY COUNT(sku_id) DESC;

--DATA CLEANING

SELECT *
FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE 
FROM zepto 
WHERE mrp = 0 OR discountedsellingprice = 0;

UPDATE zepto
SET mrp = mrp/100.0, discountedsellingprice = discountedsellingprice/100.0;

SELECT mrp, discountedsellingprice
FROM zepto;

--DATA ANALYSIS 

SELECT DISTINCT name, discountpercent
FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

SELECT DISTINCT name,outofstock,mrp
FROM zepto
WHERE outofstock = 'true' and mrp >300
ORDER BY mrp DESC;

SELECT category, SUM(availablequantity*discountedsellingprice) as Total_revenue
FROM zepto
GROUP BY category
ORDER BY Total_revenue DESC;

SELECT name,mrp, discountpercent
FROM zepto
WHERE mrp>500 and discountpercent<10
ORDER BY discountpercent DESC;

SELECT category, ROUND(AVG(discountpercent),2) as Average 
FROM zepto
GROUP BY category

ORDER BY Average DESC 
LIMIT 5;








 
