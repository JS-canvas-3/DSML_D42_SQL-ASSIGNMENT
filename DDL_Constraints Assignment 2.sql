Create database Sales;

Use Sales;

CREATE TABLE Orders (
    Order_Id INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Product_Category VARCHAR(50) NOT NULL,
    Ordered_Item VARCHAR(100) NOT NULL,
    Contact_No VARCHAR(15) UNIQUE NOT NULL
);

-#Add a new column named order_quantity to the Orders table.
ALTER TABLE Orders ADD order_quantity INT;

-#Rename the Orders table to sales_orders.
ALTER TABLE Orders RENAME TO sales_orders;

-#Insert 10 rows into the sales_orders table.
INSERT INTO sales_orders (Order_Id, Customer_Name, Product_Category, Ordered_Item, Contact_No, order_quantity) VALUES
(1, 'John Doe', 'Electronics', 'Smartphone', '9745824535', 2),
(2, 'Jane Smith', 'Clothing', 'T-shirt', '8657742158', 5),
(3, 'Alice Johnson', 'Furniture', 'Chair', '7584256852', 1),
(4, 'Bob Brown', 'Electronics', 'Laptop', '9754824665', 1),
(5, 'Charlie Davis', 'Grocery', 'Rice', '8854245862', 10),
(6, 'Emma Wilson', 'Books', 'Novel', '7864215482', 3),
(7, 'Liam Miller', 'Stationery', 'Pen', '995682458', 20);

-#Retrieve Customer_Name and Ordered_Item from the sales_orders table.
SELECT Customer_Name, Ordered_Item FROM sales_orders;

-#Use the update command to change the name of the product for any row.
UPDATE sales_orders SET Ordered_Item = 'Gaming Laptop' WHERE Order_Id = 4;

-#Delete the sales_orders table from the database.
DROP TABLE sales_orders;