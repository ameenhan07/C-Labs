    -- ASSIGNMENT I
-- BY Ameen M Khan
-- Roll No 12CSS-11

--
-- Database: `assignment11`
--
DROP DATABASE IF EXISTS `assignment11`;
CREATE DATABASE IF NOT EXISTS `assignment11` ;
USE `assignment11`;

--
-- Table structure for table `department11`
--

DROP TABLE IF EXISTS `department11`;
CREATE TABLE IF NOT EXISTS `department11` (
  `deptno` int(11) PRIMARY KEY,
  `dname` varchar(20) NOT NULL,
  `manager` varchar(20) NOT NULL,
  `loc` varchar(20) NOT NULL  
);


--
-- Table structure for table `employee11`
--

DROP TABLE IF EXISTS `employee11`;
CREATE TABLE IF NOT EXISTS `employee11` (
  `empno` int(11) PRIMARY KEY,
  `name` varchar(20) NOT NULL,
  `deptno` int(11) NOT NULL,
  `job` varchar(20) NOT NULL,
  `hiredate` DATE ,
  `sal` int(11) NOT NULL,
  `commision` int(20) NOT NULL,
  `dob` DATE ,
  `city` varchar(20) NOT NULL,
  `phone` int(20) NOT NULL,
  FOREIGN KEY (deptno) references department11(deptno) ON UPDATE CASCADE ON DELETE CASCADE
);

--
-- Table structure for table `salary11`
--

DROP TABLE IF EXISTS `salary11`;
CREATE TABLE IF NOT EXISTS `salary11` (
  `eno` int(11) PRIMARY KEY,
  `basic` int(11) NOT NULL,
  `HR` int(11) NOT NULL,
  `DA` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  FOREIGN KEY (eno) references employee11(empno) ON UPDATE CASCADE ON DELETE CASCADE
);


--
-- Dumping data for table `department11`
--

INSERT INTO `department11` (`deptno`, `dname`, `manager`, `loc`) VALUES
(10, 'Human Resources', 'X', 'Kolkata'),
(2, 'Accounting', 'Y', 'Delhi'),
(4,'EC' , 'B' , 'Gaya'),
(30, 'Legal' , 'Z', 'Mumbai');


--
-- Dumping data for table `employee11`
--

INSERT INTO `employee11` (`empno`, `name`, `deptno`, `job`, `hiredate`,`sal`, `commision`, `dob`, `city`, `phone`) VALUES
(01 , "a. khan" , 10, 'manager', '2014-10-7', 100000 , 100, '1993-9-7', 'Delhi', 9654327656),
(02 , "Bryan" , 2 , 'clerk', '2013-11-7', 10000 , 10, '1996-9-7', 'Mumbai', 9876543210),
(04 , "c. khan" , 2 , 'engineer', '2012-1-9', 100034 , 105,' 1995-3-4', 'Kolkata', 9687328766),
(03 , "raj", 2 , "salesman", '1993-02-04', 59192, 5919, '1971-02-04', "Delhi", 9912345678),
(05 , "ram", 2 , "salesman", '1979-08-31', 82050, 8275, '1957-08-31', "Mumbai", 9923456789),
(06 , "shyam", 10 , "manager", '1981-06-02', 69200, 6920, '1981-07-08', "Kolkata", 9934567890),
(07 , "b.khan", 2 , "manager",  '1982-04-18',82750, 8275, '1960-04-18', "Chicago", 9956789012),
(09 , "ali", 10 , "clerk",  '1993-06-04',28750, 2875, '1971-06-04', "Mumbai", 9967890123),
(10 , "william", 30 , "clerk ", '1987-06-05', 3140, 3314, '1965-06-05', "Delhi", 9978901234),
(11 , "d.khan", 2 , "clerk", '1992-05-12',  28750,2875, '1970-05-12', "Kolkata", 9989012345),
(12 , "James", 2 , "clerk", '1991-09-30', 13300, 1330, '1969-09-30', "Chicago", 9990123456);



--
-- Dumping data for table `salary11`
--

INSERT INTO `salary11` (`eno`, `basic`, `HR`, `DA`, `tax`) VALUES
(01 , 1000, 1000 , 1000 , 2000),
(02 , 2000, 2000 , 2000 , 3000),
(03 , 3000, 3000 , 3000 , 2000),
(04 , 79440, 8275, 13240, 1655),
(05 , 66432, 6920, 11072, 1384),
(06 , 56824, 5919, 9470, 1183),
(07 , 79440, 8275, 13240, 1655),
(09 , 31814, 3314, 5302, 662),
(10 , 27600, 2875, 4600, 575),
(11 , 12768, 1330, 2128, 266),
(12 , 8592, 895, 1432, 179);


--
--QUESTIONs 1-30                                             
--

-- 1) Get the name and city of the employee working for the accounting department
SELECT name,city 
FROM employee11,department11 
WHERE employee11.deptno=department11.deptno AND department11.dname='accounting';

-- 2) Get the name, department name of all the employees whose pay is greater than 10000
SELECT  employee11.name,department11.dname 
FROM employee11,department11 
WHERE employee11.sal>10000 AND employee11.deptno=department11.deptno;

-- 3) Get the name of the employee in ascending and descending ORDER
SELECT name FROM employee11 ORDER BY name;  
SELECT name FROM employee11 ORDER BY name DESC;

-- 4) UPDATE the city of the employee no.2 FROM Mumbai to Delhi.
UPDATE employee11 SET city='Delhi' WHERE city='Mumbai' AND empno=2;

-- 5) Get the sum of the basic salary of the employees belonging to Delhi city.
SELECT SUM(basic) 
FROM employee11,salary11 
WHERE salary11.eno=employee11.empno AND employee11.city='Delhi';

-- 6)Get the details of the highest income tax payee
SELECT * FROM employee11 , salary11 , department11 
WHERE employee11.empno=salary11.eno  AND department11.deptno=employee11.deptno 
AND salary11.tax IN (SELECT MAX(tax) from salary11);
 
-- 7) Which employee is the senior most?
SELECT name FROM employee11 
WHERE dob in (SELECT min(dob) FROM employee11);
 
-- 8) Give the details of second highest salary employee (without use of '<' operator).
SELECT * FROM employee11 WHERE sal IN 
  (SELECT MAX(sal) from employee11  WHERE sal NOT IN 
    (SELECT MAX(sal) from employee11)
  );

-- 9) Give the details of second highest salary employee (without use of max and limit operator)
SELECT * FROM employee11 a where 
(1)=(SELECT COUNT(DISTINCT(b.sal)) from employee11 b where b.sal>a.sal);

-- select count(distinct(sal)) from employee11;

-- 10) Give the details of second highest salary employee (with the use of MINUS operator)
MINUS OPERATOR IS NOT APPLICABLE IN MYSQL

-- 11) Give the details of all employees of 5th highest salary ( or nth highest salary).
SELECT * FROM employee11 ORDER BY sal DESC limit 4,1;

-- 12) How many clerks are there in the company?
SELECT count(job) as no_of_clerks FROM employee11 WHERE job='clerk';

-- 13) Which department has exactly one employee as clerk?
SELECT dname,employee11.deptno,count(job) 
FROM employee11,department11
WHERE employee11.deptno=department11.deptno
GROUP BY deptno,job having count(job)=1 and job='clerk';

-- 14) Which department has the highest number of clerks? Show the deptno and count
SELECT dname,employee11.deptno,count(job),job 
FROM employee11,department11 
WHERE employee11.deptno=department11.deptno 
GROUP BY deptno,job having job='clerk' ORDER BY count(job) DESC limit 1; 
 
-- 11) How many employees are there in each department?
SELECT deptno,count(empno) FROM employee11 GROUP BY deptno;
 
-- 16) List the lowest salary for different jobs used in a company and list them in descending ORDER
SELECT job,min(sal) 
FROM employee11 
GROUP BY job 
ORDER BY min(sal) DESC;

-- 17) Which department average salary is the lowest among all? Show the deptno,average salary.
SELECT deptno,avg(sal) 
FROM employee11 
GROUP BY deptno 
ORDER BY avg(sal) limit 0,1;

-- 18) List the minimum, maximum and average salary for each job.
SELECT job,min(sal) as Minimum_Salary, max(sal) as Maximum_Salary 
FROM employee11 GROUP BY job;

-- 19) Compute the difference between maximum and minimum salary
SELECT max(sal)-min(sal) as Difference_Between_Max_And_Min_Salary
FROM employee11;

-- 20) List the names of the employees whose name contains LA.
SELECT name FROM employee11 WHERE name like "%LA%";

-- 21) List the names of the employees whose joining date is between 2nd April,1981 and 8th Sept,1981.
SELECT name FROM employee11 
WHERE hiredate>'1981-04-02' and hiredate<'1981-09-08';

-- 22) How many different job titles exist in the employee table?
 SELECT count(DISTINCT job) AS Distinct_Job_Titles 
 FROM employee11;

-- 23) Compute the sum of all salaries of employee working under deptno=30.
SELECT sum(sal) FROM employee11
WHERE deptno=30;

-- 24) For each salesman in the emp table retrieve the deptno and department name.
SELECT dname,employee11.deptno 
FROM (employee11 inner join department11 on employee11.deptno=department11.deptno) 
WHERE job='salesman';

-- 25) List the names of all the employees with their name of the manager.
SELECT name,manager 
FROM (employee11 inner join department11 on employee11.deptno=department11.deptno);

select name,manager
from employee11,department11
where employee11.deptno=department11.deptno;

-- 26) List all employees who are working in department located at CHICAGO.
SELECT name FROM employee11 WHERE city='Chicago';

-- 27) List all the employees who are working in same department as their managers.
SELECT manager,name 
FROM (employee11 inner join department11 on employee11.deptno=department11.deptno) 
GROUP BY manager,empno;


-- 28) Retrieve all the employees who are working in deptno=10 and who earn salary 
    -- atleast as much as any employee working in deptno=30.
SELECT name FROM employee11 
WHERE deptno=10 
AND sal >= (SELECT min(sal) FROM employee11 WHERE deptno=10);

select a.name from employee11 a, employee11 b
where a.deptno=10 and a.sal>b.sal and b.sal in (select min(sal) from employee11 where deptno=30);

-- 29) List all the department who have no employees
SELECT dname FROM department11 
WHERE dname NOT IN 
(SELECT dname FROM (employee11 inner join department11 on employee11.deptno=department11.deptno));

-- 30)DELETE the EC department
DELETE FROM department11 WHERE dname='EC';



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------



-- ASSIGNMENT II
-- BY Ameen M Khan
-- Roll No 12CSS-11

-- using previous database
USE `assignment11`;

-- changing delimiter to //
delimiter //

-- QUESTIONS 1-5

-- 1) Write a function and a stored PROCEDURE to print Hello ! How are you?

-- FUNCTION
DROP FUNCTION IF EXISTS myfunc1;
CREATE function myfunc1()
RETURNS text
    BEGIN
    return "Hello ! How are you?";
END;
//
SELECT myfunc1()//

-- PROCEDURE
DROP PROCEDURE IF EXISTS mypro1//
CREATE PROCEDURE mypro1()
BEGIN
    SELECT 'Hello ! How are you?';
END;
//
call mypro1//
 
-- 2) Write a function and a stored PROCEDURE to count the number of employees IN the table employee?

-- FUNCTION
DROP FUNCTION IF EXISTS myfunc2//
CREATE function myfunc2()
RETURNS int
BEGIN
    RETURN (SELECT count(*) from employee11);
END;
//
SELECT myfunc2()//

-- PROCEDURE
DROP PROCEDURE IF EXISTS mypro2//
CREATE PROCEDURE mypro2()
BEGIN
    DECLARE total int;
    SELECT count(employee11.empno) from employee11;
END;
//
call mypro2//


-- 3) Write a function and a stored PROCEDURE to calculate the factorial of the given number.

-- FUNCTION
DROP FUNCTION IF EXISTS myfunc3//
CREATE function myfunc3(n int)
RETURNS int
BEGIN
    DECLARE i int default 1;
    DECLARE s int default 1;
    myloop:loop
    IF i > n THEN
    leave myloop;
    ELSE
    SET s = s*i;
    SET i = i+1;
    END IF;
    ITERATE myloop;
    END loop;
    RETURN s;
END;
//
SELECT myfunc3(3)//

-- PROCEDURE
DROP PROCEDURE IF EXISTS mypro3//
CREATE PROCEDURE mypro3(IN n int)
BEGIN
    DECLARE i int default 1;
    DECLARE s int default 1;
    myloop:loop
    IF i > n THEN
    leave myloop;
    ELSE
    SET s = s*i;
    SET i = i+1;
    END IF;
    ITERATE myloop;
    END loop;
    SELECT s;
END;
//
call mypro3(3)//
    
-- 4) Write a function and a stored PROCEDURE to calculate the average of three numbers.

-- FUNCTION
DROP FUNCTION IF EXISTS myfunc4//
CREATE function myfunc4(a float,b float,c  float)
RETURNS float
BEGIN 
    DECLARE avg float default 0.0;
    SET avg = ( a + b + c ) / 3;
    RETURN avg;
END;
//
SELECT myfunc4(12,12,12)//

-- PROCEDURE
DROP PROCEDURE IF EXISTS mypro4//
CREATE PROCEDURE mypro4(IN a float,IN b float,IN c  float)
BEGIN 
    DECLARE avg float default 0.0;
    SET avg = ( a + b + c ) / 3;
    SELECT avg;
END;
//
call mypro4(12,12,12)//


-- 5) Write a function and stored PROCEDURE to find fibonacci series and its sum?

-- FUNCTION
DROP FUNCTION IF EXISTS myfunc5//
CREATE FUNCTION myfunc5(n INT)
returns VARCHAR(40)
BEGIN
    DECLARE s INT default 1;
    DECLARE a INT default 0;
    DECLARE b INT default 1;
    DECLARE c INT default 0;
    DECLARE con varchar(40);
    DECLARE i INT;
    SET i = 3;
    SET con = concat("0"," ","1"," ");
    myloop:loop
    if i > n then
    leave myloop;
    else 
    SELECT a + b into s;
    SET a = b;
    SET b = c;
    
    SET s = s + c;
    SET i = i + 1;
    SELECT concat(con," ",c) into con;
    iterate myloop;
    end if;
    end loop;
    -- SELECT r;
    return con ;
END;
//
SELECT myfunc5(3)//
    
    
-- PROCEDURE
DROP PROCEDURE IF EXISTS mypro5//
CREATE PROCEDURE mypro5(IN n int)
BEGIN
    DECLARE s int default 1;
    DECLARE a int default 0;
    DECLARE b int default 1;
    DECLARE c int default 0;
    DECLARE con varchar(20);
    DECLARE i int;
    SET i = 3;
    SET con = concat("0"," ","1"," ");
    myloop:loop
        IF i > n THEN
            leave myloop;
        ELSE 
            SET c = a + b;
            SET a = b;
            SET b = c;
            SET s = s + c;
            SET i = i + 1;
            SET con =  concat(con," ",c);
            ITERATE myloop;
        END IF;
    END loop;
    SELECT con as fibonacci_series,s as sum;
END;
//
call mypro5(4)//


delimiter ;



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------



-- ASSIGNMENT III
-- BY Ameen M Khan
-- Roll No 12CSS-11

--
-- Database: `assignment11`
-- --
DROP DATABASE `assignment11`;
CREATE DATABASE IF NOT EXISTS `assignment11` ;
USE `assignment11`;

--
-- Table structure for table `faculty11`
--

DROP TABLE IF EXISTS `faculty11`;
CREATE TABLE faculty11
(
    fid int PRIMARY KEY,
    fname varchar(20),
    deptid int
);
 

--
-- Table structure for table `class11`
--

DROP TABLE IF EXISTS `class11`;
CREATE TABLE class11
(
    name varchar(20) PRIMARY KEY,
    meets_at timestamp,
    room varchar(20),
    fid int,
    FOREIGN KEY(fid) references faculty11(fid) ON UPDATE CASCADE  ON DELETE  CASCADE
);

--
-- Table structure for table `student11`
--

DROP TABLE IF EXISTS `student11`; 
CREATE TABLE student11
    (
    snum int PRIMARY KEY,
    sname varchar(20),
    major varchar(20),
    level varchar(20),
    age int
);


--
-- Table structure for table `enrolled11`
--

DROP TABLE IF EXISTS `enrolled11`; 
CREATE TABLE enrolled11
    (
    snum int,
    cname varchar(20),
    PRIMARY KEY(snum,cname)
);
 
INSERT into faculty11 values
    (01,'A',01),
    (02,'B',02),
    (03,'C',03),
    (04,'D',01),
    (05,'I. Teach',02);

INSERT into class11 values
    ('Computer','10-00-00','R128',01),
    ('Networking','02-30-00','R128',05),
    ('Support Services','10-00-00','BA1080',01),
    ('Journalism','12-30-00','R128',03),
    ('Communication Sciences','06-30-00','R678',02);   

INSERT into student11 values
    (01,'u','Science','SR',22),
    (02,'v','Aviation','JR',21),
    (03,'x','Mathematics and Statistics','SR',22),
    (04,'y','Engineering','JR',21),
    (05,'z','Communication Technologies','SR',23),
    (06,'p','Engineering','JR',20),
    (07,'q','Engineering','SR',21),
    (08,'r','Computer and Information Sciences','JR',20),
    (09,'s','Engineering','JR',19),
    (10,'t','Engineering','JR',20),
    (11,'w','Computer and Information Sciences','JR',21);

INSERT into enrolled11 values
    (01,'Computer'),
    (01,'Support Services'),
    (02,'Support Services'),
    (02,'Networking'),
    (03,'Journalism'),
    (04,'Science'),
    (04,'Networking'),
    (05,'Computer'),
    (05,'Support Services'),
    (06,'Science'),
    (07,'Science'),
    (07,'Networking'),
    (08,'Networking');



-- QUESTIONS 1-10
-- 1) Find the names of all Juniors (level = JR) who are enrolled in a class taught BY I. Teach.
SELECT student11.sname as JUNIORS 
FROM student11,enrolled11,class11,faculty11 
WHERE student11.snum=enrolled11.snum AND enrolled11.cname=class11.name 
AND class11.fid=faculty11.fid AND level='JR' AND faculty11.fname='I. Teach';
 
-- 2) Find the age of the oldest student who is either a Science major or enrolled in a course taught BY I. Teach.
SELECT max(student11.age) 
FROM student11,enrolled11,class11,faculty11 
WHERE student11.snum=enrolled11.snum AND enrolled11.cname=class11.name AND class11.fid=faculty11.fid 
AND (student11.major='Science' OR faculty11.fname='I. Teach');
 
-- 3) Find the names of all classes that either meet in room BA1080 or have 2 or more students enrolled.
SELECT class11.name 
FROM ((enrolled11 INNER JOIN student11 ON enrolled11.snum=student11.snum) INNER JOIN class11 ON class11.name=enrolled11.cname) 
GROUP BY class11.name HAVING COUNT(class11.name) >=2 UNION SELECT class11.name FROM class11 WHERE class11.room='BA1080';

-- 4) Find the names of all students who are enrolled in two classes that meet at the same time.
SELECT student11.sname 
FROM ((enrolled11 INNER JOIN student11 ON enrolled11.snum=student11.snum) INNER JOIN class11 ON class11.name=enrolled11.cname) 
GROUP BY class11.meets_at,student11.snum HAVING COUNT(enrolled11.cname) >= 2;

-- 5) Find the names of faculty members who teach in every room in which some class is taught.
SELECT faculty11.fname 
FROM (class11 INNER JOIN faculty11 ON class11.fid=faculty11.fid) 
GROUP BY faculty11.fid HAVING COUNT( DISTINCT(class11.room))=(SELECT COUNT(DISTINCT (class11.room)) FROM class11);

-- 6) Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five.

SELECT distinct f.fname from faculty11 f 
where 5 > (SELECT count(e.snum) from class11 c, enrolled11 e 
 where c.name = e.cname and c.fid = f.fid);

-- 7) For each level, print the level AND the average age of students for that level.
SELECT student11.level ,avg(age) as AVG_age 
FROM student11 
GROUP BY student11.level;

-- 8)For all levels except JR, print the level AND the average age of students for that level.
SELECT student11.level ,avg(student11.age) as AVG_NOT_JR 
FROM student11 
WHERE student11.level != 'JR' 
GROUP BY student11.level;

-- 9) For each faculty member that has taught classes only in room R128, print the faculty members name 
--    AND the total number of classes she or he has taught.
SELECT DISTINCT(faculty11.fname),COUNT(class11.name) as COUNT 
FROM (class11 INNER JOIN faculty11 ON class11.fid=faculty11.fid) 
WHERE class11.room='R128'
GROUP BY class11.fid; 

-- 10) Find the names of students enrolled in the maximum number of classes. <CHANGE>
SELECT DISTINCT(sname) FROM student11  WHERE snum IN  
(SELECT  snum FROM enrolled11  GROUP BY snum HAVING count(*) >= all (SELECT count(*) FROM enrolled11 group by snum ));

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------



-- ASSIGNMENT IV
-- BY Ameen M Khan
-- Roll No 12CSS-11

--
-- Database: `assignment11`
-- 
-- DROP DATABASE `assignment11`;
-- CREATE DATABASE IF NOT EXISTS `assignment11` ;
USE `assignment11`;



--
-- Table structure for table `book11`
--

DROP TABLE IF EXISTS `book11`;
CREATE table book11(
    bookid INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(40) NOT NULL,
    copyright VARCHAR(40) NOT NULL,
    no_of_pages INT(11) NOT NULL
);


--
-- Table structure for table `author11`
--

DROP TABLE IF EXISTS `author11`;
CREATE table author11(
    authid INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    authFirst VARCHAR(40) NOT NULL,
    authMid VARCHAR(40),
    authLast VARCHAR(40) NOT NULL,
    authCity VARCHAR(40) NOT NULL,
    age DATE NOT NULL
);


--
-- Table structure for table `writtenBy11`
--

DROP TABLE IF EXISTS `writtenBy11`;
CREATE table writtenBy11(
    publisher VARCHAR(40) NOT NULL,
    bookid INT(11) NOT NULL,
    authid INT(11) NOT NULL,
    PRIMARY KEY(bookid,authid),
    FOREIGN KEY(bookid) REFERENCES book11(bookid) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(authid) REFERENCES author11(authid) ON UPDATE CASCADE ON DELETE CASCADE
);


--
-- Dumping data for table `book11`
--

INSERT INTO book11 VALUES
(1,'Introduction to Algorithms','2011',1299),
(2,'Database System Comcepts','2010',300),
(3,'Operating System Concepts','2012',919),
(4,'Computer Architecture','2010',453);


--
-- Dumping data for table `book11`
--

INSERT INTO author11 (`authFirst`,`authMid`,`authLast`,`age`,`authCity`) VALUES
('Thomas','H','Cormen','1994-11-16','Connecticut'),
('Henry','F','Korth','1954-10-16','Angola'),
('Abraham','','Silberschatz','1968-09-16','Boston'),
('Peter','B','Galvin','1962-12-16','Ahemedabad');


--
-- Dumping data for table `book11`
--

INSERT INTO writtenBy11 VALUES 
('Prentice Hall India',1,1),
('McGraw Hill',2,2),
('Wiley',3,3),
('Wiley',4,3);

--
-- NOTE : HELPER FUNCTION TO VALIDATE AGE
--
delimiter //
DROP FUNCTION IF EXISTS ageValidate//
CREATE FUNCTION ageValidate(dob DATE)
RETURNS INT
BEGIN
    declare age int;
    set age = DATEDIFF(curdate(),dob)/365;
    IF (age > 18  and age < 60)
    then
        return 1;
    else
        return 0;
    END IF;
END
//
delimiter ;
select ageValidate('1993-09-07');
select ageValidate('2003-09-07');

-- QUESTIONS 1-6

-- 1) Get the title,author name,publisher name for author whose city contain total no of a=2?
 SELECT author11.*,book11.title,writtenBy11.publisher
 FROM author11 ,writtenBy11 ,book11  
 WHERE author11.authCity IN ( SELECT authCity FROM author11 WHERE authCity like '%a%a%') 
 and author11.authid=writtenBy11.authid and book11.bookid=writtenBy11.bookid;

-- 2) Give the details of the book which is written by at least two authors.
SELECT book11.bookid,book11.title,book11.no_of_pages,book11.copyright
FROM author11,book11,writtenBy11
WHERE book11.bookid=writtenBy11.bookid AND author11.authid=writtenBy11.authid
GROUP BY author11.authid having COUNT(*) >= 2;


-- 3) Write a stored procedure (SP Name : insertIntoAuth) to insert the Author information.
delimiter //
DROP PROCEDURE IF EXISTS insertIntoAuth//
CREATE PROCEDURE insertIntoAuth(IN authid INT(11),IN authFirst VARCHAR(40),
IN authMid VARCHAR(40),IN authLast VARCHAR(40),IN authCity VARCHAR(40),IN age DATE)
BEGIN
    DECLARE c INT(2) DEFAULT 0;
    DECLARE a INT(2);
    
    -- Check IF auhor already exists
    SELECT COUNT(*) into c FROM author11 WHERE authid=author11.authid;
    -- Check age of author
    
    SELECT ageValidate(age) into a;
    
    IF c>0 then
        SELECT "Author ID already exists";
    ELSEIF a=0 then
        SELECT "INVALID AGE";
    ELSE
    INSERT INTO author11 VALUES(authid,authFirst,authMid,authLast,authCity,age);
    END IF;
END;
//
delimiter ;

-- TEST CASES
call insertIntoAuth(5,"Ameen","M","Khan","New Delhi",'1993-09-07');
call insertIntoAuth(5,"Ameen","M","Khan","New Delhi",'1993-09-07');
call insertIntoAuth(8,"Ameen","M","Khan","New Delhi",'2003-09-07');


-- 4) Write a stored procedure (SP Name : insertBookInfo) to insert the book information 
-- such as bookid, title, no. of pages, copyright,  authorId, Publisher Name. 
-- (Use two stored procedure and call it FROM one stored procedure i.e nested SP). 
-- (SP Name : insertBook, insertWBy).
delimiter //

DROP PROCEDURE IF EXISTS insertBook//
create procedure insertBook(IN bookid INT(11),IN title VARCHAR(40),IN copyright VARCHAR(40),IN pages INT(11))
begin
  INSERT INTO book11 VALUES(bookid,title,copyright,no_of_pages);
end;
//

DROP PROCEDURE IF EXISTS insertWBy//
create procedure insertWBy(IN publisher VARCHAR(40),IN bookid INT(11),IN authid INT(11))
begin
  INSERT INTO writtenBy11 VALUES(publisher,bookid,authid);
end;
//

DROP PROCEDURE IF EXISTS insertBookInfo//
CREATE PROCEDURE insertBookInfo
(IN bookid INT(11),IN title varchar(40),IN copyright varchar(40),IN no_of_pages INT(11),IN authid INT(11),IN publisher VARCHAR(40))
BEGIN
    DECLARE c INT(2);
    SELECT COUNT(*) into c FROM book11 WHERE bookid=book11.bookid;
    IF c=0 then
        call insertBook(bookid,title,copyright,no_of_pages);
        call insertWBy(publisher,bookid,authid);
    ELSE 
        SELECT "Book ID already exists";
    END IF;    
END
//
delimiter ;

-- TEST CASES

call insertBookInfo(1,"Harry Potter",'2001',700,5,'Bloomsbury');
select * from book11;
call insertBookInfo(5,"Harry Potter",'2001',700,5,'Bloomsbury');

-- 5) Write a stored procedure to DELETE the Author information using its AuthID. 
-- (Note: IF Author book(in Book Table) exists for AuthID, 
-- then it should display message as You cant DELETE Author because total no book exist in BookTable. 
-- First DELETE all the books written by him).

delimiter //
DROP PROCEDURE  IF exists deleteAuth//
CREATE procedure deleteAuth(IN aid INT)
BEGIN
    declare books int;  
    SET books=(SELECT count(*) FROM book11 WHERE bookid IN ( SELECT bookid FROM  writtenBy11 WHERE authid=aid));  
    IF books > 0  then  
        SELECT concat('You cant DELETE author because total ',books, ' books exist in book11 Table. First DELETE all the books written by him') 
                AS error;  
    ELSE  
        DELETE FROM author11  WHERE authid=aid ;  
        SELECT 'author11 information deleted' AS done;  
 END IF;
END
//
delimiter ;

-- TEST CASES
call deleteAuth(4); -- WORKS
call deleteAuth(3); -- ERROR PRINTED AS REQUESTED


-- 6) Write a stored procedure to DELETE the Book using AuthID.
delimiter //
DROP PROCEDURE IF EXISTS delete_book//
CREATE PROCEDURE delete_book(IN aid INT)
BEGIN
  DECLARE c INT(2);
    SELECT COUNT(*) into c FROM author11 WHERE author11.authid=aid;
    IF c=0 then
        SELECT "Author ID does not exists" as "ERROR";
    ELSE
        DELETE FROM book11  WHERE bookid IN ( SELECT bookid FROM writtenBy11 WHERE authid=aid );  
    END IF;
END;
//
delimiter ;

-- TEST CASES
call delete_book(4);
call delete_book(1);

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------



-- ASSIGNMENT V
-- BY Ameen M Khan
-- Roll No 12CSS-11

USE `assignment11`;

-- QUESTION
--  CREATE function that validate the age of employee. Function accept the dob of employee and return 1 if age lies between 18 and 60 else return 0
--
delimiter //
DROP FUNCTION IF EXISTS ageValidate//
CREATE FUNCTION ageValidate(dob DATE)
RETURNS INT
BEGIN
    declare age int;
    set age = DATEDIFF(curdate(),dob)/365;
    IF (age > 18  and age < 60)
    then
        return 1;
    else
        return 0;
    END IF;
END
//
delimiter ;



-- TEST CASES
SELECT ageValidate('1993-09-09');
SELECT ageValidate('2003-09-09');
SELECT ageValidate('1943-09-09');



-- ---------------------------------------------------------------------------------------------------------------------------------------------------------



-- ASSIGNMENT VI
-- BY Ameen M Khan
-- Roll No 12CSS-11

-- DROP DATABASE `assignment11`;
-- CREATE DATABASE IF NOT EXISTS `assignment11` ;
USE `assignment11`;

DROP TABLE IF EXISTS `books11`;
CREATE TABLE books11(
    bid INT(11) NOT NULL PRIMARY KEY,
    bname VARCHAR(20) NOT NULL,
    authname VARCHAR(20)
);

DROP TABLE IF EXISTS `logger11`;
CREATE TABLE logger11(
    user varchar(20),
    operation varchar(20),
    pbid int(11),
    pbname varchar(20),
    pauthname varchar(20),
    nbid int(11),
    nbname varchar(20),
    nauthname varchar(20),
    timeofop TIMESTAMP 
);

delimiter //

-- TRIGGER 1:
DROP TRIGGER IF EXISTS logIn;
CREATE TRIGGER logIn AFTER INSERT ON books11
FOR EACH ROW
BEGIN
    INSERT INTO logger11(user,timeofop,operation,pbid,pbname,pauthname,nbid,nbname,nauthname)
        VALUES(user(),now(),'INSERT',NULL,NULL,NULL,NEW.bid,NEW.bname,NEW.authname);
END;
//

-- TRIGGER 2:
DROP TRIGGER IF EXISTS logUp;
CREATE TRIGGER logUp AFTER UPDATE ON books11
FOR EACH ROW
BEGIN
    INSERT INTO logger11(user,timeofop,operation,pbid,pbname,pauthname,nbid,nbname,nauthname)
        VALUES(user(),now(),'UPDATE',OLD.bid,OLD.bname,OLD.authname,NEW.bid,NEW.bname,NEW.authname);
END;
//

-- TRIGGER 3:
DROP TRIGGER IF EXISTS logDe;
CREATE TRIGGER logDe BEFORE delete ON books11
FOR EACH ROW
BEGIN
    INSERT INTO logger11(user,timeofop,operation,pbid,pbname,pauthname,nbid,nbname,nauthname)
        VALUES(user(),now(),'DELETE',OLD.bid,OLD.bname,OLD.authname,NULL,NULL,NULL);
END;
//

delimiter ;

SELECT * FROM books11;
SELECT * FROM logger11;

-- TEST CASES

-- 1
INSERT INTO books11 VALUES
(1,"Automata","K L P MISHRA"),
(2,"Database Concept","Korth"),
(3,"Data Structure","D Samantha");

SELECT * FROM books11;
SELECT * FROM logger11;

-- 2
UPDATE books11 SET bname="Theory of AUTOMOATA" where bid=1;
UPDATE books11 SET bname="Database System Concept" where bid=2;
UPDATE books11 SET bname="Theory of AUTOMOATA" where bid=3;

SELECT * FROM books11;
SELECT * FROM logger11;

-- 3
DELETE FROM books11 WHERE bid=1;
DELETE FROM books11 WHERE bid=2;
DELETE FROM books11 WHERE bid=3;

SELECT * FROM books11;
SELECT * FROM logger11;



-- THATS ALL FOLKS
