CREATE DATABASE IF NOT EXISTS project_db;
USE project_db;
CREATE TABLE Users (
    user_id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(30),
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(10),
    role VARCHAR(10), -- 'student' or 'admin'
    password VARCHAR(20)
);
CREATE TABLE Item_Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(30) -- 'Electronics', 'Books', etc.
);
CREATE TABLE Lost_Items (
    lost_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    item_name VARCHAR(50),
    category_id INT,
    description VARCHAR(100),
    location_lost VARCHAR(50),
    date_lost DATE,
    status VARCHAR(10), -- 'open', 'claimed', 'resolved'
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Item_Category(category_id)
);
CREATE TABLE Found_Items (
    found_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10),
    item_name VARCHAR(50),
    category_id INT,
    description VARCHAR(100),
    location_found VARCHAR(50),
    date_found DATE,
    status VARCHAR(10), -- 'pending', 'matched', 'handed'
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Item_Category(category_id)
);
CREATE TABLE Claims (
    claim_id VARCHAR(10) PRIMARY KEY,
    lost_id VARCHAR(10),
    found_id VARCHAR(10),
    user_id VARCHAR(10),
    claim_date DATE,
    status VARCHAR(10),
    FOREIGN KEY (lost_id) REFERENCES Lost_Items(lost_id),
    FOREIGN KEY (found_id) REFERENCES Found_Items(found_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Admin_Verification (
    verification_id VARCHAR(10) PRIMARY KEY,
    claim_id VARCHAR(10),
    admin_id VARCHAR(10),
    decision_date DATE,
    decision VARCHAR(10), -- 'approved', 'rejected'
    notes VARCHAR(100),
    FOREIGN KEY (claim_id) REFERENCES Claims(claim_id),
    FOREIGN KEY (admin_id) REFERENCES Users(user_id)
);
SHOW TABLES;
INSERT INTO Users VALUES ('U001', 'Ravi', 'ravi@nitw.ac.in', '9876543210', 'student', 'ravi123');
INSERT INTO Users VALUES ('U002', 'Aditya S', 'aditya@nitw.ac.in', '9123456789', 'student', 'adi2025');
INSERT INTO Users VALUES ('U003', 'Sneha R', 'sneha@nitw.ac.in', '9988776655', 'student', 'sneha321');
INSERT INTO Users VALUES ('U004', 'Rahul M', 'rahul@nitw.ac.in', '9345612780', 'student', 'rahulpwd');
INSERT INTO Users VALUES ('U005', 'Admin Sir', 'admin@nitw.ac.in', '9000012345', 'admin', 'adminnitw');
INSERT INTO Users VALUES ('U006', 'Varsha T', 'varsha@nitw.ac.in', '9800765432', 'student', 'varsha456');
INSERT INTO Users VALUES ('U007', 'Siddharth V', 'sidv@nitw.ac.in', '9812345678', 'student', 'sid123');
INSERT INTO Users VALUES ('U008', 'Neha P', 'neha@nitw.ac.in', '9944556677', 'student', 'neha123');
INSERT INTO Users VALUES ('U009', 'Yashwanth R', 'yash@nitw.ac.in', '9955667788', 'student', 'yash098');
INSERT INTO Users VALUES ('U010', 'Meghana L', 'meghana@nitw.ac.in', '9789012345', 'student', 'megha111');
INSERT INTO Users VALUES ('U011', 'Karan M', 'karan@nitw.ac.in', '9877000001', 'student', 'karan321');
INSERT INTO Users VALUES ('U012', 'Deepika J', 'deepika@nitw.ac.in', '8899001122', 'student', 'deepi234');
INSERT INTO Users VALUES ('U013', 'Abhishek D', 'abhi@nitw.ac.in', '8877665544', 'student', 'abhids');
INSERT INTO Users VALUES ('U014', 'Pooja K', 'pooja@nitw.ac.in', '8123456700', 'student', 'pooj123');
INSERT INTO Users VALUES ('U015', 'Manoj S', 'manoj@nitw.ac.in', '9001234567', 'student', 'manoj789');
INSERT INTO Users VALUES ('U016', 'Harsha V', 'harsha@nitw.ac.in', '7890654321', 'student', 'harsha987');
INSERT INTO Users VALUES ('U017', 'Divya B', 'divya@nitw.ac.in', '9012345678', 'student', 'divyab12');
INSERT INTO Users VALUES ('U018', 'Tanmay G', 'tanmay@nitw.ac.in', '8765432109', 'student', 'tan987');
INSERT INTO Users VALUES ('U019', 'Lavanya T', 'lavanya@nitw.ac.in', '9654321098', 'student', 'lava998');
INSERT INTO Users VALUES ('U020', 'Ankit R', 'ankit@nitw.ac.in', '9786432109', 'student', 'ankit222');
SHOW TABLES;
SELECT * FROM USERS;
INSERT INTO Item_Category VALUES (1, 'Electronics');
INSERT INTO Item_Category VALUES (2, 'Books');
INSERT INTO Item_Category VALUES (3, 'Clothing');
INSERT INTO Item_Category VALUES (4, 'Accessories');
INSERT INTO Item_Category VALUES (5, 'Documents');
INSERT INTO Item_Category VALUES (6, 'Stationery');
SHOW TABLES;
SELECT * FROM Item_Category;
INSERT INTO Lost_Items VALUES ('L001', 'U001', 'Scientific Calculator', 1, 'CASIO fx-991EX', 'Seminar hall 2nd Floor', '2025-07-01', 'open');
INSERT INTO Lost_Items VALUES ('L002', 'U002', 'Discrete Math Book', 2, 'Blue cover with name tag', 'Library Reading Hall', '2025-06-28', 'open');
INSERT INTO Lost_Items VALUES ('L003', 'U003', 'Wallet', 4, 'Black wallet', 'Food Street', '2025-07-02', 'claimed');
INSERT INTO Lost_Items VALUES ('L004', 'U006', 'Sweatshirt', 3, 'Grey hoodie, size M', 'LH Ground Floor', '2025-07-03', 'open');
INSERT INTO Lost_Items VALUES ('L005', 'U007', 'Notebook', 6, 'Signals and Systems notes', 'ECE Dept 1st Floor', '2025-06-30', 'open');
INSERT INTO Lost_Items VALUES ('L006', 'U008', 'Aadhar Card', 5, 'Original Aadhar card', 'SBI ATM', '2025-07-01', 'open');
INSERT INTO Lost_Items VALUES ('L007', 'U009', 'Bluetooth Earbuds', 1, 'Boat Airdopes 181', 'Data Center Main Lab', '2025-07-04', 'open');
INSERT INTO Lost_Items VALUES ('L008', 'U011', 'Python Textbook', 2, 'Red cover, Python Basics', 'Library reading room', '2025-06-29', 'resolved');
INSERT INTO Lost_Items VALUES ('L009', 'U013', 'Water Bottle', 3, 'Blue Milton 1L', 'Gym Area', '2025-07-05', 'open');
INSERT INTO Lost_Items VALUES ('L010', 'U014', 'Wrist watch', 4, 'Fastrack watch with brown strap', 'Near SAC', '2025-07-01', 'open');
SELECT * FROM Lost_Items;
INSERT INTO Found_Items VALUES ('F001', 'U004', 'Scientific Calculator', 1, 'CASIO fx-991EX', 'Seminar hall 2nd Floor', '2025-07-01', 'matched');
INSERT INTO Found_Items VALUES ('F002', 'U005', 'Wallet', 4, 'Black wallet with cash', 'Food Street', '2025-07-02', 'matched');
INSERT INTO Found_Items VALUES ('F003', 'U012', 'Bluetooth Earbuds', 1, 'Boat Airdopes', 'Data Center Main Lab', '2025-07-04', 'pending');
INSERT INTO Found_Items VALUES ('F004', 'U010', 'Notebook', 6, 'Signals notes - ECE Dept', 'ECE Dept 1st Floor', '2025-06-30', 'handed');
INSERT INTO Found_Items VALUES ('F005', 'U020', 'Wrist watch', 4, 'Fastrack brown strap', 'SAC Bench', '2025-07-02', 'pending');
INSERT INTO Claims VALUES ('C001', 'L001', 'F001', 'U001', '2025-07-02', 'approved');
INSERT INTO Claims VALUES ('C002', 'L003', 'F002', 'U003', '2025-07-03', 'approved');
INSERT INTO Claims VALUES ('C003', 'L005', 'F004', 'U007', '2025-07-01', 'approved');
INSERT INTO Claims VALUES ('C004', 'L007', 'F003', 'U009', '2025-07-04', 'pending');
INSERT INTO Claims VALUES ('C005', 'L010', 'F005', 'U014', '2025-07-05', 'pending');

INSERT INTO Admin_Verification VALUES ('V001', 'C001', 'U005', '2025-07-02', 'approved', 'matched');
INSERT INTO Admin_Verification VALUES ('V002', 'C002', 'U005', '2025-07-03', 'approved', 'verified');
INSERT INTO Admin_Verification VALUES ('V003', 'C003', 'U005', '2025-07-01', 'approved', 'returned');
INSERT INTO Admin_Verification VALUES ('V004', 'C004', 'U005', '2025-07-04', 'pending', 'confirm serial');
INSERT INTO Admin_Verification VALUES ('V005', 'C005', 'U005', '2025-07-06', 'pending', 'awaiting ID');
SELECT * FROM Admin_Verification;