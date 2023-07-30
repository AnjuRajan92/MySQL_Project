CREATE DATABASE LIBRARY;
USE LIBRARY;
-- FIRST TABLE BRANCH
CREATE TABLE BRANCH(Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(150),
Contact_no VARCHAR(20));
SELECT * FROM BRANCH;

DELIMITER $$
CREATE PROCEDURE Insert_Branch_details(IN branch_no varchar(10),IN manager_id int,IN branch_address varchar(150),IN contact_no varchar(20))
BEGIN
INSERT INTO BRANCH VALUES(branch_no,manager_id,branch_address,contact_no);
SELECT * FROM BRANCH;
END $$
DELIMITER ;
call Insert_Branch_details(1,101,'Annanagar_West','8133324467');
call Insert_Branch_details(2,102,'Tnagar','9912345678');
call Insert_Branch_details(3,103,'Guindy','9447890450');
call Insert_Branch_details(4,104,'Porur','8900022334');
call Insert_Branch_details(5,105,'JJnagar','9845673211');
call Insert_Branch_details(6,106,'Avadi','8056781222');
call Insert_Branch_details(7,107,'Annanagar_East','8133326634');
call Insert_Branch_details(8,108,'Ambattur','8799000234');
call Insert_Branch_details(9,109,'Thambaram','9845673412');
call Insert_Branch_details(10,110,'Chennai_ctrl','9754064752');
-- SECOND TABLE EMPLOYEE
CREATE TABLE EMPLOYEE(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(30),
Position VARCHAR(30),
Salary DECIMAL(10,2),
CONSTRAINT fk_employee_branch
FOREIGN KEY (Emp_Id) REFERENCES BRANCH (Manager_Id));
CREATE INDEX idx_Branch_Manager_Id ON BRANCH (Manager_Id);

DELIMITER $$
CREATE PROCEDURE Insert_employee_details(IN employee_id varchar(20),IN emp_name varchar(30),IN position varchar(30),salary float)
BEGIN
INSERT INTO EMPLOYEE VALUES(employee_id,emp_name,position,salary);
SELECT * FROM EMPLOYEE;
END $$
DELIMITER ;

call Insert_employee_details(101,'Sandhya M','Manager',55000);
call Insert_employee_details(102,'Shiva A','Aaaiatant Manager',47000);
call Insert_employee_details(103,'Rajeev Raj','Manager',60000);
call Insert_employee_details(104,'Sakthi C','Assistant Manager',50500);
call Insert_employee_details(105,'Kaveri P','Assistant Manager',48000);
call Insert_employee_details(106,'Dhineshbabu P','Manager',52000);
call Insert_employee_details(107,'Ramesh P Raj','Manager',66000);
call Insert_employee_details(108,'Sudha M P','Assistant Manager',45000);
call Insert_employee_details(109,'Vinodh M H','Manager',56000);
call Insert_employee_details(110,'Mahalakshmi Prabhu','Assistant Manager',48000);
SELECT * FROM EMPLOYEE;

-- THIRD TABLE CUSTOMER
CREATE TABLE CUSTOMER(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(30),
Customer_address VARCHAR(150),
Reg_date DATE);

DELIMITER $$
CREATE PROCEDURE Insert_Customer_details(IN customer_id varchar(20),IN customer_name varchar(30),IN customer_address varchar(150),IN reg_date date)
BEGIN
INSERT INTO CUSTOMER VALUES(customer_id,customer_name,customer_address,reg_date);
SELECT * FROM CUSTOMER;
END $$
DELIMITER ;
call  Insert_Customer_details(201,'John Joseph','6/678 Annanagar_West','2021-12-06');
call  Insert_Customer_details(202,'Mallika M','3/57 Tnagar','2022-03-30');
call  Insert_Customer_details(203,'Vijay C','4/234 Guindy','2022-7-14');
call  Insert_Customer_details(204,'Suresh ST','8/23 Porur','2022-10-15');
call  Insert_Customer_details(205,'Dhiya S','6/98 JJnagar','2023-1-10');
call  Insert_Customer_details(206,'John James','7/890 Avadi','2021-08-14');
call  Insert_Customer_details(207,'Prem M E','2/456 Ambattur','21-12-31');
call  Insert_Customer_details(208,'Rebecca Anil','8/123 Thambaram','22-04-20');
call  Insert_Customer_details(209,'Saran Shankar','9/110 Avadi','23-05-22');
call  Insert_Customer_details(210,'Abhijith K V','5/432 Annanagar_East','23-01-31');

-- FOURTH TABLE ISSUE_STATUS
CREATE TABLE ISSUE_STATUS(
Issue_Id INT PRIMARY KEY,
Issue_cust INT,
Issue_bookname VARCHAR(200),
Issue_date DATE,
Isbn_book varchar(50),
FOREIGN KEY (Issue_cust) REFERENCES CUSTOMER(Customer_Id));
INSERT INTO ISSUE_STATUS VALUES(401,201,'War and Peace','22-04-21','978-0451004215');
INSERT INTO ISSUE_STATUS VALUES(402,202,'The Alchemist','23-04-25','978-8172234980');
INSERT INTO ISSUE_STATUS VALUES(403,203,'Down under','23-06-01','978-0385408172');
INSERT INTO ISSUE_STATUS VALUES(404,204,'In The Woods','23-06-14','978-0670038602');
INSERT INTO ISSUE_STATUS VALUES(405,205,'The Hungry Tide','23-07-02','978-8172236137');
INSERT INTO ISSUE_STATUS VALUES(406,206,'INDIA: A History','22-01-22','978-0802145581');
INSERT INTO ISSUE_STATUS VALUES(407,207,'Treasure Island ','22-02-04','978-8172344764');
INSERT INTO ISSUE_STATUS VALUES(408,208,'The Wealth of Nations','22-06-12','978-9387779464');
INSERT INTO ISSUE_STATUS VALUES(409,209,'Time Machine','23-06-05','978-8175992955');
INSERT INTO ISSUE_STATUS VALUES(410,210,'Discovery of India','23-05-31','978-0143031031');
SELECT * FROM ISSUE_STATUS;

-- FIFTH TABLE
CREATE TABLE RETURN_STATUS(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_bookname VARCHAR(200),
Return_date DATE,
Isbn_book2 VARCHAR (50),
FOREIGN KEY (Return_cust) REFERENCES CUSTOMER(Customer_Id),
FOREIGN KEY (Isbn_book2) REFERENCES BOOKS(ISBN));
INSERT INTO RETURN_STATUS VALUES(501,201,'War and Peace','22-06-21','978-0451004215');
INSERT INTO RETURN_STATUS VALUES(502,202,'The Alchemist','23-06-01','978-8172234980');
INSERT INTO RETURN_STATUS VALUES(503,203,'Down under','23-07-12','978-0385408172');
INSERT INTO RETURN_STATUS VALUES(504,204,'In The Woods','23-07-15','978-0670038602');
INSERT INTO RETURN_STATUS VALUES(505,205,'The Hungry Tide','23-08-01','978-8172236137');
INSERT INTO RETURN_STATUS VALUES(506,206,'INDIA: A History','22-05-25','978-0802145581');
INSERT INTO RETURN_STATUS VALUES(507,207,'Treasure Island ','22-06-04','978-8172344764');
INSERT INTO RETURN_STATUS VALUES(508,208,'The Wealth of Nations','23-01-01','978-9387779464');
INSERT INTO RETURN_STATUS VALUES(509,209,'Time Machine','23-07-25','978-8175992955');
INSERT INTO RETURN_STATUS VALUES(510,210,'Discovery of India','23-07-30','978-0143031031');
SELECT * FROM RETURN_STATUS;
-- SIXTH TABLE
CREATE TABLE BOOKS(
ISBN VARCHAR(50) PRIMARY KEY,
Book_title VARCHAR(200),
Category VARCHAR(50),
Rental_price DECIMAL(10,2),
Status ENUM('YES','NO'),
Author VARCHAR(60),
Publisher VARCHAR(150),
FOREIGN KEY (ISBN) REFERENCES ISSUE_STATUS(Isbn_book));
CREATE INDEX idx_Isbn_book ON ISSUE_STATUS(Isbn_book);
INSERT INTO BOOKS VALUES('978-0451004215','War and Peace','Novel',15,'Yes','Leo Tolstoy','Fingerprint Publishing');
INSERT INTO BOOKS VALUES('978-8172234980','The Alchemist','Novel',10.5,'Yes','Paulo Coelho','Harper');
INSERT INTO BOOKS VALUES('978-0385408172','Down under','Travel writing',16.5,'Yes','Bryson Bill','Transworld');
INSERT INTO BOOKS VALUES('978-0670038602','In The Woods','Mystery',18.0,'Yes','Tana French','Crown');
INSERT INTO BOOKS VALUES('978-8172236137','The Hungry Tide','Novel',14.5,'Yes','Amitav Ghosh','Harper Collins');
INSERT INTO BOOKS VALUES('978-0802145581','INDIA: A History','History',10.0,'Yes','John Keay','Harper Press');
INSERT INTO BOOKS VALUES('978-8172344764','Treasure Island ','Novel',12.5,'Yes','Robert Louis Stevenson','Fingerprint! Publishing');
INSERT INTO BOOKS VALUES('978-9387779464','The Wealth of Nations','Economics',20.0,'Yes','Adam Smith','Fingerprint! Publishing');
INSERT INTO BOOKS VALUES('978-8175992955','Time Machine','Science fiction',25.0,'Yes','H. G. Wells','Fingerprint! Publishing');
INSERT INTO BOOKS VALUES('978-0143031031','Discovery of India','History',17.5,'Yes','Pandit Jawaharlal Nehru','Penguin India');
SELECT * FROM BOOKS;
-- TRIGGER
DELIMITER $$
CREATE TRIGGER Before_insert_issuestatus
BEFORE INSERT ON ISSUE_STATUS
FOR EACH ROW
BEGIN
DECLARE Errmsg varchar(250);
DECLARE Status1 varchar(20);
SELECT STATUS INTO Status1 FROM BOOKS WHERE ISBN=new.Isbn_book;
SET Errmsg = CONCAT(new.Isbn_book,'Is not available');
if Status1 = 'No' then signal sqlstate '45000'
SET message_text=Errmsg;
END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER After_insert_issuestatus
AFTER INSERT ON ISSUE_STATUS
FOR EACH ROW
BEGIN
UPDATE BOOKS SET Status='No' WHERE ISBN=new.Isbn_book;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER After_insert_Returnstatus2
AFTER INSERT ON RETURN_STATUS
FOR EACH ROW
BEGIN
UPDATE BOOKS SET Status='Yes' WHERE ISBN=new.Isbn_book2;
END $$
DELIMITER ;

-- 1. Retrieve the book title ,category and rental price of all available books.
SELECT Book_title,Category,Rental_price FROM BOOKS WHERE Status='Yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
 SELECT Emp_name,Salary FROM EMPLOYEE ORDER BY Salary DESC;
 
 -- 3. Retrieve the book titles and the corresponding customers who have issued those books.
 SELECT b.Book_title,c.Customer_name 
 FROM BOOKS b
JOIN ISSUE_STATUS i ON b.ISBN=i.Isbn_book
JOIN CUSTOMER c ON i.Issue_cust=c.Customer_Id;

-- 4. Display the total count of books in each category
SELECT Category, COUNT(ISBN) FROM BOOKS GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
SELECT Emp_name, Position FROM EMPLOYEE WHERE Salary >= 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM CUSTOMER WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT DISTINCT Issue_cust FROM ISSUE_STATUS);

-- 7. Display the branch numbers and the total count of employees in each branch. 
select b.Branch_no, IFNULL(COUNT(e.Emp_Id),0) AS Total_countof_employees
FROM BRANCH b
LEFT JOIN EMPLOYEE e ON b.Manager_Id=e.Emp_Id
GROUP BY b.Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023. 
SELECT DISTINCT(Customer_name) FROM CUSTOMER INNER JOIN ISSUE_STATUS ON 
CUSTOMER.Customer_Id=ISSUE_STATUS.Issue_cust
WHERE monthname(ISSUE_STATUS.Issue_date)='June' AND YEAR(ISSUE_STATUS.Issue_date)='2023';

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title FROM BOOKS WHERE Category='History';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT b.Branch_no,IFNULL(COUNT(e.Emp_Id),0) AS Count_of_Employees
FROM BRANCH b
LEFT JOIN EMPLOYEE e ON b.Manager_Id =e.Emp_Id
GROUP BY b.Branch_no
HAVING IFNULL(COUNT(e.Emp_Id),0) > 5;

DROP PROCEDURE Insert_Branch_details;
DROP PROCEDURE Insert_employee_details;
DROP PROCEDURE Insert_Customer_details;

DROP TRIGGER Before_insert_issuestatus;
DROP TRIGGER After_insert_issuestatus;
DROP TRIGGER After_insert_Returnstatus2;

DROP TABLE BRANCH;
DROP TABLE EMPLOYEE;
DROP TABLE CUSTOMER;
DROP TABLE ISSUE_STATUS;
DROP TABLE RETURN_STATUS;
DROP TABLE BOOKS;

 




