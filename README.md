                                                Lost and Found Portal - Database Management System Project



       Welcome to the Lost and Found Portal repository! This project implements a comprehensive Database Management System (DBMS) designed for the efficient tracking and administration of lost and found items within a large institutional campus.



PROJECT OVERVIEW:

     

       This system provides a centralized, relational platform for managing the lost and found items: reporting, matching, claiming, and administrative verification. The database structure is built for high data integrity, solving the common problem of unclaimed goods in large institutions by enforcing a structured workflow.



Technologies: MySQL / SQL



DATABASE SCHEMA AND ARCHITECTURE:


     The system utilizes a relational model with six core entities and appropriate relationships to track item status from initial report to final handover.



Core Entities:



1)Users: Stores user (student/admin) credentials.

2)Item\_Category: Classifies items (Electronics, Books, etc.).

3)Lost\_Items : Records details of missing goods

4)Found\_Items:  Records details of located goods.

5)Claims: Links a claimed Lost Item to a submitted Found Item.

6)Admin\_Verification: Records the admin's decision (approved/rejected) on a claim.



Setup Guide:



To set up and run the database schema locally, ensure you have a MySQL environment configured:

1)Prerequisites: MySQL installed (or compatible SQL environment).

2)Create Database: Log into your SQL client and execute:

                                  CREATE DATABASE project\_db;

3)Run Script: Execute the complete sql/lost\_found\_schema.sql file. This script creates all six tables and populates them with sample data for immediate testing.



Test Queries:



1)All currently open lost items :

                SELECT \* 

                FROM Lost\_Items
                WHERE status = 'open';



2)Display names of users who found items:

            SELECT Name
            FROM Users
            WHERE user\_id IN (SELECT user\_id FROM Found\_Items);







This project was developed by:



K Kruthika

Sai Jyothika

We welcome suggestions and contributions to improve the portal's efficiency and features!

