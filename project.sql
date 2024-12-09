-- Create the database
CREATE DATABASE library;

-- Use the database
USE library;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('Yes', 'No')),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
-- Insert sample data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES 
(1, 101, '123 Main St, City A', '1234567890'),
(2, 102, '456 Elm St, City B', '0987654321'),
(3, 103, '789 Oak St, City C', '1122334455'),
(4, 104, '321 Pine St, City D', '6677889900'),
(5, 105, '654 Maple St, City E', '7788990011');

-- Insert sample data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES 
(101, 'John Doe', 'Manager', 60000, 1),
(102, 'Jane Smith', 'Manager', 58000, 2),
(103, 'Alice Johnson', 'Librarian', 45000, 1),
(104, 'Bob Brown', 'Assistant', 30000, 2),
(105, 'Chris Green', 'Assistant', 32000, 3),
(106, 'Emma White', 'Librarian', 47000, 3),
(107, 'Liam Black', 'Clerk', 25000, 4),
(108, 'Sophia Blue', 'Clerk', 26000, 4),
(109, 'Ethan Gray', 'Assistant', 31000, 5),
(110, 'Olivia Violet', 'Librarian', 48000, 5);

-- Insert sample data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
(1001, 'Learn SQL Basics', 'Education', 20.00, 'Yes', 'John Miller', 'TechBooks Inc.'),
(1002, 'Advanced SQL', 'Education', 25.00, 'No', 'Jane Taylor', 'TechBooks Inc.'),
(1003, 'Python for Data Science', 'Technology', 30.00, 'Yes', 'Alice Brown', 'DataPress'),
(1004, 'Java Programming', 'Technology', 35.00, 'No', 'Robert Green', 'CodeBooks'),
(1005, 'History of Europe', 'History', 18.00, 'Yes', 'Emma White', 'History House'),
(1006, 'Modern Art', 'Art', 22.00, 'Yes', 'Liam Gray', 'ArtBooks Ltd.'),
(1007, 'Cooking Made Easy', 'Cooking', 15.00, 'Yes', 'Sophia Black', 'Food Press'),
(1008, 'Physics for Beginners', 'Science', 28.00, 'No', 'Ethan Blue', 'ScienceWorks'),
(1009, 'Mystery Novel', 'Fiction', 12.00, 'Yes', 'Chris Green', 'NovelWorld'),
(1010, 'Romantic Tales', 'Fiction', 10.00, 'Yes', 'Olivia Black', 'LoveBooks Inc.');

-- Insert sample data into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(201, 'Michael Brown', '12 Elm St, City A', '2021-11-15'),
(202, 'Sarah Green', '34 Pine St, City B', '2022-01-20'),
(203, 'David White', '56 Maple St, City C', '2023-03-10'),
(204, 'Sophia Black', '78 Oak St, City D', '2022-12-05'),
(205, 'James Blue', '90 Main St, City E', '2020-05-12'),
(206, 'Emma Violet', '12 Elm St, City A', '2021-08-15'),
(207, 'Liam Gray', '34 Pine St, City B', '2023-04-10'),
(208, 'Olivia Brown', '56 Maple St, City C', '2021-07-22'),
(209, 'Ethan Green', '78 Oak St, City D', '2022-10-19'),
(210, 'Mia Black', '90 Main St, City E', '2020-01-10');

-- Insert sample data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES 
(301, 201, 'Learn SQL Basics', '2023-06-01', 1001),
(302, 203, 'Python for Data Science', '2023-06-10', 1003),
(303, 207, 'Cooking Made Easy', '2023-05-20', 1007),
(304, 202, 'Romantic Tales', '2023-07-05', 1010),
(305, 205, 'Mystery Novel', '2023-06-15', 1009),
(306, 208, 'Modern Art', '2023-04-12', 1006),
(307, 209, 'History of Europe', '2023-06-25', 1005),
(308, 206, 'Java Programming', '2023-03-10', 1004),
(309, 210, 'Advanced SQL', '2023-02-20', 1002),
(310, 204, 'Physics for Beginners', '2023-01-15', 1008);

-- Insert sample data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES 
(401, 201, 'Learn SQL Basics', '2023-07-01', 1001),
(402, 203, 'Python for Data Science', '2023-08-01', 1003),
(403, 207, 'Cooking Made Easy', '2023-06-20', 1007),
(404, 202, 'Romantic Tales', '2023-08-05', 1010),
(405, 205, 'Mystery Novel', '2023-07-15', 1009),
(406, 208, 'Modern Art', '2023-05-12', 1006),
(407, 209, 'History of Europe', '2023-07-25', 1005),
(408, 206, 'Java Programming', '2023-04-10', 1004),
(409, 210, 'Advanced SQL', '2023-03-20', 1002),
(410, 204, 'Physics for Beginners', '2023-02-15', 1008);
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'Yes';
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;
SELECT Category, COUNT(*) AS Book_Count
FROM Books
GROUP BY Category;
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (
    SELECT Issued_cust FROM IssueStatus
);
SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no;
SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';
SELECT Branch_no, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
SELECT Employee.Emp_name, Branch.Branch_address
FROM Branch
JOIN Employee ON Branch.Manager_Id = Employee.Emp_Id;
SELECT ISBN
FROM Books
WHERE Rental_Price > 25;
SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Isbn_book IN (
    SELECT ISBN FROM Books WHERE Rental_Price > 25
);



































