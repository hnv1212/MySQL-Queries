-- 1. get Product name and quantity/unit
SELECT ProductName, QuantityPerUnit
FROM Products;

-- 2. get current Product list (Product ID and name).
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued = 'False'
ORDER BY ProductName;

-- 3. get discontinued Product list (Product ID and name).
SELECT ProductID, ProductName
FROM Products
WHERE Discontinued = 1
ORDER BY ProductName;

-- 4. get most expense and least expensive Product list (name and unit price)
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

-- 5. get Product list (id, name, unit price) where current products cost less than $20.
SELECT ProductID, ProductName, UnitPrice
FROM Products 
WHERE (((UnitPrice) < 20) AND ((Discontinued)=False))
ORDER BY UnitPrice DESC;

-- 6. get Product list (name, unit price) where products cost between $15 and $25.
SELECT ProductName, UnitPrice
FROM Products 
WHERE (((UnitPrice) >= 15 AND (UnitPrice)<=25) AND ((Products.Discontinued)=False))
ORDER BY Products.UnitPrice DESC;

-- 7. get Product list (id, name, unit price) of above average price.
SELECT DISTINCT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT avg(UnitPrice) FROM Products)
ORDER BY UnitPrice;

-- 8. get Product list (name, unit price) of twenty most expensive products.
SELECT DISTINCT ProductName as Twenty_Most_Expensive_Products, UnitPrice
FROM Products AS a 
WHERE 20 >= (SELECT COUNT(DISTINCT UnitPrice) 
             FROM Products AS b 
             WHERE b.UnitPrice >= a.UnitPrice)
ORDER BY UnitPrice desc; 

-- 9. count current and discontinued products.
SELECT Count(ProductName)
FROM Products
GROUP BY Discontinued;

-- 10. get Product list (name, units on order, units in stock) of stock is less than the quantity on order.
SELECT ProductName, UnitsOnOrder, UnitsInStock
FROM Products 
WHERE (((Discontinued)=False) AND ((UnitsInStock)<UnitsOnOrder));