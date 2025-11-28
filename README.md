#  Lost and Found Portal - Database Management System Project

Welcome to the **Lost and Found Portal** repository! This project implements a comprehensive Database Management System (DBMS) designed for the efficient tracking and administration of lost and found items within a large institutional campus.

---

### 📝 Project Overview

This system provides a centralized, relational platform for managing the lost and found items: reporting, matching, claiming, and administrative verification. The database structure is built for high data integrity, solving the common problem of unclaimed goods in large institutions by enforcing a structured workflow.

**Technologies:** MySQL / SQL

---

###  Database Schema & Architecture

The system utilizes a relational model with six core entities and appropriate relationships.

#### Core Entities:
| Entity | Primary Role |
| :--- | :--- |
| **Users** | Stores user (student/admin) credentials. |
| **Item_Category** | Classifies items (Electronics, Books, etc.). |
| **Lost_Items** | Records details of missing goods. |
| **Found_Items** | Records details of located goods. |
| **Claims** | Links a claimed Lost Item to a submitted Found Item. |
| **Admin_Verification** | Records the admin's decision (approved/rejected) on a claim. |

---

### 🚀 Setup Guide

To set up and run the database schema locally, ensure you have a MySQL environment configured:

1.  **Prerequisites:** MySQL installed (or compatible SQL environment).
2.  **Create Database:** Log into your SQL client and execute `CREATE DATABASE project_db;`.
3.  **Run Script:** Execute the complete `sql/lost_found_schema.sql` file. This script creates all six tables and populates them with sample data for immediate testing.

---

### 🔍 Test Queries

These queries demonstrate key functionalities and relationships:

| Query | Description |
| :--- | :--- |
| `SELECT * FROM Lost_Items WHERE status = 'open';` | **All Currently Open Lost Items**. |
| `SELECT C.category_name, COUNT(L.lost_id) AS Total_Lost FROM Lost_Items L JOIN Item_Category C ON L.category_id = C.category_id GROUP BY C.category_name ORDER BY Total_Lost DESC;` | **Count of Lost Items Per Category** (demonstrates GROUP BY and JOIN). |
| `SELECT Name FROM Users WHERE user_id IN (SELECT user_id FROM Found_Items);` | **Users Who Found Items**. |
| `SELECT DISTINCT name FROM Users WHERE user_id IN (SELECT claimant_id FROM Claims);` | **Users Who Raised a Claim**. |

---

###  Contributors

This project was developed by:

* **K Kruthika**
* **Sai Jyothika**

We welcome suggestions and contributions to improve the portal's efficiency and features!     

