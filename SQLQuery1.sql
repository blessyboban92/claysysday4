create database emp;
use emp;
create table Employee(
	empid int primary key,
	empname varchar(25) Not null,
	deptname varchar(25) not null,
	designation varchar(20) not null,
	basic_salary float not null,
	hra float not null,
	ta float not null,
	bonus float not null,
	pf float not null,
	total_salary float not null
	);
	drop table Employee;
	create table Employee(
	empid int primary key,
	empname varchar(25) Not null,
	deptname varchar(25) not null,
	designation varchar(20) not null,
	basic_salary float not null,
	hra float not null,
	ta float not null,
	bonus float not null,
	pf float not null,
	total_salary float not null
	);
	INSERT INTO Employee (empid, empname, deptname, designation, basic_salary, hra, ta, bonus, pf, total_salary)
VALUES 
    (1200, 'John Reddy', 'Finance', 'Manager', 50000, 10000, 5000, 2000, 3000,0),
    (1201, 'Dennis Ritchie', 'Software Engineer', 'Tester', 8000, 1500, 500, 200, 500,0),
    (1202, 'Jack Smith', 'Marketing', 'Manager', 50000, 10000, 500, 200, 30000,0),
    (1203, 'Franchy David', 'Accounts', 'Clerk', 2000, 1000, 500, 200, 1000,0),
    (1204, 'Komalam T. Raju', 'Housekeeping', 'Manager', 3000, 5000, 100, 200, 200,0);
UPDATE Employee
SET total_salary = basic_salary + hra + ta + bonus - pf;
select * from Employee;

SELECT deptname, COUNT(*) AS "Total Employees" 
FROM Employee
GROUP BY deptname;
INSERT INTO Employee (empid, empname, deptname, designation, basic_salary, hra, ta, bonus, pf, total_salary)
VALUES 
    (1206, 'John Desai', 'Finance', 'Office staff', 5000, 1000, 5000, 2000, 3000,0),
    (1207, 'Dennis Rithu', 'Software Engineer', 'Developer', 18000, 1500, 500, 200, 500,0),
    (1208, 'Jack Smith', 'Marketing', 'Business Analyst', 5000, 10000, 500, 200, 30000,0);
	UPDATE Employee
SET total_salary = basic_salary + hra + ta + bonus - pf;
select * from Employee;
/*Task:4 list the no. of employees in each department */
SELECT deptname, COUNT(*) AS "Total Employees" 
FROM Employee
GROUP BY deptname;
/* Task3:Finding the second highest salary */
SELECT MAX(total_salary) AS second_highest_salary
FROM Employee
WHERE total_salary < (SELECT MAX(total_salary) FROM Employee);
select * from Employee;
CREATE TABLE Department (
  deptid int PRIMARY KEY,
  deptname varchar(50) NOT NULL,
  location varchar(50) NOT NULL
);
CREATE TABLE Department (
  deptid int PRIMARY KEY,
  deptname varchar(50) NOT NULL,
  location varchar(50) NOT NULL,
  empid int  FOREIGN KEY (empid) REFERENCES Employee(empid)
);
select * from Department;
INSERT INTO Department (deptid, deptname, location, empid)
VALUES
  (1, 'Finance', 'New York', 1200),
  (2, 'House Keeping', 'San Francisco', 1204),
  (3, 'Marketing', 'London', 1202),
    (4, 'Marketing', 'London', 1208),
  (5, 'Software Engineer', 'Sydney', 1201),
  (6, 'Software Engineer', 'Sydney', 1207),
  (7, 'Operations', 'Tokyo', 1204),
  (8, 'Finance', 'New York', 1206),
   (9, 'Accounts', 'Japan', 1203),
  (10, 'Finance', 'New York', 1206);
  select * from Employee;
  select * from Department;
  /***********Joins *************/
  /*******1.Inner Join **********/
  SELECT *
FROM Department
INNER JOIN Employee ON Department.empid = Employee.empid;
/**********2.left Join ********/
SELECT *FROM Department
LEFT JOIN Employee ON Department.empid = Employee.empid;

