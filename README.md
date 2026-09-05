# SUNRISE DENTAL CLINIC MANAGEMENT SYSTEM

A complete web-based Dental Clinic Management System built with Java, JSP, Servlets, and PostgreSQL. This application helps dental clinics manage appointments, patient records, and billing efficiently.

---

## TABLE OF CONTENTS

1. Features
2. Technology Stack
3. Project Architecture
4. Project Structure
5. Installation Guide
6. Database Setup
7. How to Run
8. Default Credentials
9. Screenshots
10. API Endpoints
11. Contributing
12. License
13. Contact

---

## FEATURES

| No. | Feature | Description |
|-----|---------|-------------|
| 1 | User Authentication | Secure login with username and password validation |
| 2 | Register Appointment | Add new patient appointments with all necessary details |
| 3 | View Appointment | Search and view appointment details by appointment number |
| 4 | Generate Bill | Calculate treatment cost + consultation fee automatically |
| 5 | PDF Bill Download | Download professional PDF receipts with iTextPDF |
| 6 | All Appointments List | View all registered appointments in a table |
| 7 | Help Section | Step-by-step guide for new staff members |
| 8 | Secure Logout | Safely logout and end user session |
| 9 | Sunrise Theme | Beautiful warm orange/gold UI design |
| 10 | Responsive Design | Works on all devices (desktop, tablet, mobile) |

---

## TECHNOLOGY STACK

### Frontend

| Technology | Version | Purpose |
|------------|---------|---------|
| HTML5 | - | Page structure |
| CSS3 | - | Styling and Layout |
| JavaScript | - | Client-side interactions |
| JSP | 2.3 | Dynamic web pages |
| Font Awesome | 6.4.0 | Icons |
| Google Fonts (Inter) | - | Typography |

### Backend

| Technology | Version | Purpose |
|------------|---------|---------|
| Java | JDK 22 | Core programming language |
| Servlets | 4.0 | Request handling |
| JDBC | 4.3 | Database connectivity |

### Database

| Technology | Version | Purpose |
|------------|---------|---------|
| PostgreSQL | 16+ | Relational database |
| pgAdmin | - | Database management GUI |

### Server and Tools

| Technology | Version | Purpose |
|------------|---------|---------|
| Apache Tomcat | 9.0.113 | Web application server |
| NetBeans IDE | 21 | Development environment |
| Git | - | Version control |
| GitHub | - | Remote repository |

### Dependencies

| Library | Version | Purpose |
|---------|---------|---------|
| PostgreSQL JDBC Driver | 42.7.3 | Database connection |
| iTextPDF | 5.5.13.3 | PDF generation |

---

## PROJECT ARCHITECTURE

Client (Browser)
    |
    v
Apache Tomcat (Server)
    |
    +--> Servlets (Controller Layer)
    |       LoginServlet, RegisterServlet, ViewServlet, BillServlet
    |
    +--> Service Layer (Business Logic)
    |       AppointmentService
    |
    +--> DAO Layer (Data Access)
    |       UserDAO, PatientDAO, AppointmentDAO, BillDAO
    |
    +--> Model Layer (Data Objects)
    |       User, Patient, Appointment, Bill
    |
    +--> Database (PostgreSQL)
            users, patients, appointments, bills

---

## PROJECT STRUCTURE

SunriseDentalClinicWeb/
|
+-- src/java/
|   |
|   +-- dentalclinic.controller/
|   |       LoginServlet.java
|   |       RegisterAppointmentServlet.java
|   |       ViewAppointmentServlet.java
|   |       GenerateBillServlet.java
|   |       PDFBillServlet.java
|   |       LogoutServlet.java
|   |
|   +-- dentalclinic.dao/
|   |       UserDAO.java
|   |       PatientDAO.java
|   |       AppointmentDAO.java
|   |       BillDAO.java
|   |
|   +-- dentalclinic.model/
|   |       User.java
|   |       Patient.java
|   |       Appointment.java
|   |       Bill.java
|   |
|   +-- dentalclinic.service/
|   |       AppointmentService.java
|   |
|   +-- dentalclinic.util/
|           DBConnection.java
|           ValidationUtil.java
|
+-- web/
|   |
|   +-- WEB-INF/
|   |       web.xml
|   |
|   +-- META-INF/
|   |       context.xml
|   |
|   +-- index.jsp
|   +-- dashboard.jsp
|   +-- register.jsp
|   +-- view.jsp
|   +-- bill.jsp
|   +-- help.jsp
|
+-- lib/
|       postgresql-42.7.3.jar
|       itextpdf-5.5.13.3.jar
|
+-- README.md
+-- .gitignore
+-- build.xml

---

## INSTALLATION GUIDE

### Prerequisites

| Software | Version | Download Link |
|----------|---------|---------------|
| Java JDK | 22+ | https://www.oracle.com/java/technologies/downloads/ |
| NetBeans IDE | 21 | https://netbeans.apache.org/ |
| Apache Tomcat | 9.0.x | https://tomcat.apache.org/download-90.cgi |
| PostgreSQL | 16+ | https://www.postgresql.org/download/ |
| pgAdmin | Latest | https://www.pgadmin.org/download/ |
| Git | Latest | https://git-scm.com/downloads |

### Step 1: Clone the Repository

git clone https://github.com/Samadhi2003562/SunriseDentalClinicWeb.git

### Step 2: Open in NetBeans

1. Open NetBeans IDE
2. Click File -> Open Project
3. Navigate to the project folder
4. Select SunriseDentalClinicWeb and click Open Project

### Step 3: Add Dependencies

1. Right-click on project -> Properties
2. Go to Libraries -> Compile
3. Click Add JAR/Folder
4. Add the following JARs from the lib/ folder:
   - postgresql-42.7.3.jar
   - itextpdf-5.5.13.3.jar

### Step 4: Configure Tomcat

1. Go to Services tab
2. Right-click on Servers -> Add Server
3. Select Apache Tomcat -> Next
4. Browse to Tomcat installation folder
5. Click Finish

---

## DATABASE SETUP

### Step 1: Start PostgreSQL

Windows:
net start postgresql-x64-16

Mac/Linux:
sudo systemctl start postgresql

### Step 2: Open pgAdmin

1. Open pgAdmin
2. Connect to PostgreSQL server
3. Create database: dentalclinic_db

### Step 3: Create Tables

Run this SQL in dentalclinic_db:

-- =====================================================
-- DATABASE: dentalclinic_db
-- =====================================================

-- 1. Users Table
-- Stores login credentials
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    role VARCHAR(20) DEFAULT 'STAFF'
);

-- 2. Patients Table
-- Stores patient information
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    contact VARCHAR(15)
);

-- 3. Appointments Table
-- Stores appointment records
CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    appointment_number VARCHAR(20) UNIQUE NOT NULL,
    patient_id INT NOT NULL,
    dentist_name VARCHAR(100),
    treatment_type VARCHAR(50),
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20) DEFAULT 'SCHEDULED',
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);

-- 4. Bills Table
-- Stores bill records
CREATE TABLE bills (
    id SERIAL PRIMARY KEY,
    appointment_number VARCHAR(20),
    treatment_cost DECIMAL(10,2),
    consultation_fee DECIMAL(10,2) DEFAULT 50.00,
    total_cost DECIMAL(10,2),
    bill_date DATE,
    FOREIGN KEY (appointment_number) REFERENCES appointments(appointment_number)
);

-- 5. Insert Default Users
INSERT INTO users (username, password, role) VALUES 
('admin', 'admin123', 'ADMIN'),
('staff', 'staff123', 'STAFF');

### Step 4: Update Database Credentials

In DBConnection.java:

private static final String URL = "jdbc:postgresql://localhost:5432/dentalclinic_db";
private static final String USER = "postgres";
private static final String PASSWORD = "your_password";

---

## HOW TO RUN

### Step 1: Start Tomcat

1. Go to Services tab
2. Right-click on Apache Tomcat -> Start

### Step 2: Deploy Application

1. Right-click on DentalClinicWeb
2. Select Run

### Step 3: Open Browser

Go to: http://localhost:8081/DentalClinicWeb/

---

## DEFAULT CREDENTIALS

| Role | Username | Password |
|------|----------|----------|
| Admin | admin | admin123 |
| Staff | staff | staff123 |

---

## SCREENSHOTS

### Login Page
[Add screenshot: screenshots/login.png]

### Dashboard
[Add screenshot: screenshots/dashboard.png]

### Register Appointment
[Add screenshot: screenshots/register.png]

### View Appointment
[Add screenshot: screenshots/view.png]

### Generate Bill
[Add screenshot: screenshots/bill.png]

### PDF Bill
[Add screenshot: screenshots/pdf.png]

### Help Section
[Add screenshot: screenshots/help.png]

---

## API ENDPOINTS

| Endpoint | Method | Description |
|----------|--------|-------------|
| /login | POST | User authentication |
| /register | POST | Register new appointment |
| /view | POST | View appointment details |
| /bill | POST | Generate bill |
| /pdfbill | GET | Download PDF bill |
| /logout | GET | Logout user |

---

## CONTRIBUTING

1. Fork the repository
2. Create a new branch: git checkout -b feature-name
3. Make your changes
4. Commit: git commit -m "Added feature"
5. Push: git push origin feature-name
6. Create a Pull Request

---

## LICENSE

This project is licensed under the MIT License.

MIT License

Copyright (c) 2024 Samadhi Perera

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

## CONTACT

Samadhi Perera

Email: samadhiperera@example.com
GitHub: https://github.com/Samadhi2003562

---

## ACKNOWLEDGMENTS

- NetBeans IDE - Development environment
- Apache Tomcat - Web server
- PostgreSQL - Database
- Font Awesome - Icons
- Google Fonts (Inter) - Typography
- Git and GitHub - Version control

---

## VERSION HISTORY

| Version | Date | Changes |
|---------|------|---------|
| v1.0.0 | 2024-09-05 | Initial release |
| v1.0.1 | 2024-09-06 | Added PDF bill generation |
| v1.0.2 | 2024-09-07 | Updated UI with Sunrise theme |

---

Made with Love by Samadhi Perera
