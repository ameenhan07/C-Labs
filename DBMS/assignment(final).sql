-- ASSIGNMENT Final
-- BY Ameen M Khan
-- Roll No 12CSS-11

--
-- Database: `assignmentfinal11`
--
DROP DATABASE `assignmentfinal11`;
CREATE DATABASE IF NOT EXISTS `assignmentfinal11` ;
USE `assignmentfinal11`;

--
-- Table structure for table `sales_rep11`
--
DROP TABLE IF EXISTS `sales_rep11`;
CREATE TABLE IF NOT EXISTS `sales_rep11` (
  `repcode` int(11) PRIMARY KEY,
  `repname` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL,
  `comname` varchar(40) NOT NULL  
);

--
-- Table structure for table `product11`
--
DROP TABLE IF EXISTS `product11`;
CREATE TABLE IF NOT EXISTS `product11` (
  `pcode` varchar(40) PRIMARY KEY,
  `pname` varchar(40) NOT NULL,
  `pcom` decimal(10,2) NOT NULL
);

--
-- Table structure for table `sales11`
--
DROP TABLE IF EXISTS `sales11`;
CREATE TABLE IF NOT EXISTS `sales11` (
  `repcode` int(11) NOT NULL,
  `pcode` varchar(40) NOT NULL,
  `qtysold` int(11) NOT NULL,
  FOREIGN KEY (repcode) references sales_rep11(repcode) ON UPDATE CASCADE ON DELETE CASCADE ,
  FOREIGN KEY (pcode) references product11(pcode) ON UPDATE CASCADE ON DELETE CASCADE
);

--
-- Table structure for table `company11`
--
DROP TABLE IF EXISTS `company11`;
CREATE TABLE IF NOT EXISTS `company11` (
  `comname` varchar(40) PRIMARY KEY,
  `comhq` varchar(40) NOT NULL
);
--
-- Table structure for table `owns11`
--
DROP TABLE IF EXISTS `owns11`;
CREATE TABLE IF NOT EXISTS `owns11` (
  `comname` varchar(40) NOT NULL ,
  `pcode` varchar(40) NOT NULL,
  FOREIGN KEY (pcode) references product11(pcode) ON UPDATE CASCADE ON DELETE CASCADE
);

--
-- Dumping data for table `sales_rep11`
--
INSERT INTO `sales_rep11` VALUES
(100,'PRERIT',45000,'ABC CORPORATION'),
(101,'AAMIR',35000,'ABC CORPORATION'),
(102,'SAIF',30000,'DGL FOOD PRODUCTS'),
(103,'RAHUL',40000,'DGL FOOD PRODUCTS');

--
-- Dumping data for table `product11`
--
INSERT INTO `product11` VALUES
('P1','HEALTH DRINK',0.3),
('P2','BUTTER',0.1),
('P3','BABY FOOD',0.15),
('P4','TINNED MUSHROOM',1000);

--
-- Dumping data for table `department11`
--
INSERT INTO `sales11` VALUES
(100,'P1',200),
(100,'P3',20),
(101,'P2',300),
(101,'P3',250),
(102,'P1',400),
(102,'P4',200),
(103,'P4',500);

--
-- Dumping data for table `company11`
--
INSERT INTO `company11` VALUES
('ABC CORPORATION','MUMBAI'),
('DGL FOOD PRODUCTS','KOLKATA');

--
-- Dumping data for table `owns11`
--
INSERT INTO `owns11` VALUES
('ABC CORPORATION','P1'),
('ABC CORPORATION','P2'),
('ABC CORPORATION','P3'),
('DGL FOOD PRODUCTS','P1'),
('DGL FOOD PRODUCTS','P2'),
('DGL FOOD PRODUCTS','P4');


-- QUESTION :
-- 1) List the product wise sale BY ABC CORPORATION
SELECT owns11.pcode,product11.pname , sum(sales11.qtysold) as sale
FROM product11,owns11,sales11,sales_rep11
WHERE owns11.comname="ABC CORPORATION" AND owns11.pcode=sales11.pcode 
AND product11.pcode=sales11.pcode AND sales11.repcode=sales_rep11.repcode
AND sales_rep11.comname="ABC CORPORATION"
GROUP bY sales11.pcode ;

-- 2) List the commision earned BY selling product 1
SELECT product11.pcode , SUM(product11.pcom*sales11.qtysold) AS COMMISION_EARNED 
FROM product11,sales11
WHERE product11.pcode=sales11.pcode AND product11.pcode="p1";

-- 3) List the representatives working n "DGL Food Products"
SELECT repname AS representatives_dgl 
FROM sales_rep11 
WHERE comname="DGL FOOD PRODUCTS";

-- 4) List the similar products manufactured BY different companies
SELECT owns11.pcode as similar_product, product11.pname FROM product11,owns11 
WHERE product11.pcode=owns11.pcode
GROUP BY owns11.pcode having count(owns11.pcode)>1;

-- 5) List the representatives who are selling the similar products BY different companies
SELECT sales_rep11.repname 
FROM sales_rep11 WHERE sales_rep11.repcode IN
(SELECT DISTINCT repcode FROM sales11 WHERE pcode IN 
  (SELECT pcode FROM owns11 WHERE comname='DGL FOOD PRODUCTS' AND pcode IN 
    ( SELECT pcode FROM owns11 WHERE comname='ABC CORPORATION')));


-- 6) List the earning FROM Butter selling
SELECT product11.pname , product11.pcom*sales11.qtysold AS EARNINGS FROM product11 , sales11 
WHERE product11.pcode=sales11.pcode AND product11.pname="BUTTER";

-- 7) List the products sold BY representative AAMIR
SELECT sales11.pcode,product11.pname FROM sales11,product11 
WHERE sales11.pcode=product11.pcode AND repcode IN
(SELECT repcode FROM sales_rep11 WHERE repname="AAMIR");

-- 8) List the representatives selling only one product
SELECT sales_rep11.repname AS Rep_selling_single_product 
FROM sales_rep11,sales11 
WHERE sales11.repcode=sales_rep11.repcode 
GROUP BY sales11.repcode having count(sales11.pcode)=1; 

-- 9) List the income of the representative who is drawing maximum salary (income=salary+commision*quantitysold )
SELECT sales_rep11.repname AS rep_name , 
sales_rep11.salary+SUM(sales11.qtysold*product11.pcom) as INCOME
FROM sales_rep11 , sales11 , product11 
WHERE sales_rep11.repcode=sales11.repcode
 AND product11.pcode=sales11.pcode AND salary IN
  ( SELECT MAX(sales_rep11.salary) FROM sales_rep11) ; 

-- 10) List the representative name , company name, product name, sale of product whose commision is minimum
SELECT sales_rep11.repname,sales_rep11.comname,
product11.pname,sum(sales11.qtysold) AS sale 
FROM sales_rep11,sales11,product11
WHERE  sales_rep11.repcode=sales11.repcode 
AND sales11.pcode=product11.pcode AND  product11.pcom IN
(SELECT min(product11.pcom) FROM product11);

-- 11) List the product details of ABC CORPORATION
SELECT product11.pcode,product11.pname,product11.pcom FROM product11,owns11
WHERE owns11.comname="ABC CORPORATION" AND product11.pcode=owns11.pcode;

-- 12)List the company details WHERE representative is drawing maximum salary
SELECT sales_rep11.comname ,company11.comhq 
FROM sales_rep11 , company11 , owns11 , product11
WHERE sales_rep11.comname=company11.comname 
AND owns11.comname=sales_rep11.comname AND product11.pcode=owns11.pcode 
AND sales_rep11.salary IN (SELECT MAX(salary) FROM sales_rep11);

-- 13) List the commision on maximum selling point
SELECT product11.pname AS max_sell_pt ,
SUM(sales11.qtysold) AS qtysold , product11.pcom AS commision 
FROM  product11 , sales11
WHERE sales11.pcode=product11.pcode 
GROUP BY sales11.pcode ORDER BY qtysold DESC LIMIT 1; 

-- 14) List total quantity of product sold BY ABC CORPORATION
SELECT sum(sales11.qtysold) FROM sales11,owns11,sales_rep11
WHERE sales11.pcode=owns11.pcode AND sales_rep11.repcode=sales11.repcode
AND sales_rep11.comname="ABC CORPORATION" AND owns11.comname="ABC CORPORATION" ;

-- 15) List the total sale of that product which is having maximum commision on it.
SELECT sum(sales11.qtysold)as toal_sale FROM sales11,product11
WHERE sales11.pcode=product11.pcode AND product11.pcom IN 
(SELECT max(product11.pcom) FROM product11);

-- 16) List the product details of maximum selling product of DGL FOOD PRODUCTS along with its QTSOLD AND representative code
SELECT sales11.repcode , product11.pname , sales11.qtysold  
FROM sales11,sales_rep11,product11 
WHERE product11.pcode=sales11.pcode AND sales11.repcode=sales_rep11.repcode 
AND sales_rep11.comname='DGL FOOD PRODUCTS' AND sales11.pcode IN
  (SELECT pcode FROM 
    (SELECT pcode,SUM(qtysold) AS qs FROM sales11 
     GROUP BY pcode order by pcode desc) as tmp
  having max(qs));

-- 17) List the earning BY BABY FOOD
SELECT SUM(sales11.qtysold*product11.pcom) AS earnings_by_baby_food 
FROM product11 , sales11 
WHERE sales11.PCODE=product11.PCODE AND product11.PNAME='BABY FOOD'; 




