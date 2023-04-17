CREATE DATABASE ketoPilot;

CREATE TABLE ketoPilot.customers
    (
        accountNum      INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        email           VARCHAR(50)     NOT NULL        UNIQUE,
        lastName        VARCHAR(50)     NOT NULL,
        firstName       VARCHAR(50)     NOT NULL,
        city            VARCHAR(50)     NOT NULL,
        state           VARCHAR(2)      NOT NULL,
        zipCode         INT(5)          NOT NULL,
        country         VARCHAR(50)     NOT NULL
    );

CREATE TABLE ketoPilot.accountSecurity
    (
        accountEmail    VARCHAR(50)     PRIMARY KEY     NOT NULL    UNIQUE,
        accountNum      INT             REFERENCES customers (accountNum),
        password        VARCHAR(50)     NOT NULL,
        pinNumber       INT(5)          NOT NULL
    );

CREATE TABLE ketoPilot.dietData
    (
        dietLogID       INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        accountNum      INT             REFERENCES customers (accountNum),
        dietDate        DATE            NOT NULL,
        carbGrams       DECIMAL(9,2),     
        fatGrams        DECIMAL(9,2),
        proteinGrams    DECIMAL(9,2)
    );

CREATE TABLE ketoPilot.breathKetones
    (
        BRKetoTestID    INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        accountNum      INT             REFERENCES customers (accountNum),
        brDate          DATE            NOT NULL,
        acetoResult     DECIMAL(9,2)   
    );

CREATE TABLE ketoPilot.bloodspotData
    (
        BSTestID        INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        accountNum      INT             REFERENCES customers (accountNum),
        bsDate          DATE            NOT NULL,
        bhbResult       DECIMAL(9,2),
        glucoseResult   DECIMAL(9,2),
        gkiResult       DECIMAL(9,2)
    );

CREATE TABLE ketoPilot.userProfiles
    (
        profileID       INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        accountNum      INT             REFERENCES customers (accountNum),
        dietLogID       INT             REFERENCES dietData (dietLogID),     
        BSTestID        INT             REFERENCES bloodspotData (BSTestID),
        BRKetoTestID    INT             REFERENCES breathKetones (BRKetoTestID)
    );

INSERT INTO customers VALUES
    (DEFAULT,'michaeljchapman@students.abtech.edu','Chapman','Michael','Asheville','NC',28803,'USA'),
    (DEFAULT,'madeup@students.abtech.edu','Donald','Ashley','Asheville','NC',28803,'USA');

INSERT INTO accountSecurity VALUES
    ('michaeljchapman@students.abtech.edu',(SELECT accountNum FROM customers WHERE email='michaeljchapman@students.abtech.edu'),'indiana',12345),
    ('madeup@students.abtech.edu',(SELECT accountNum FROM customers WHERE email='madeup@students.abtech.edu'),'southcarolina',67890);



    import csv
import mysql.connector

# Connect to MySQL database
mydb = mysql.connector.connect(
  host="localhost",
  user="yourusername",
  password="yourpassword",
  database="yourdatabase"
)

# Open the CSV file and read the data
with open('data.csv', 'r') as file:
    reader = csv.reader(file)
    next(reader)  # skip header row
    for row in reader:
        date = row[0]
        result = row[1]
        
        # Insert the data into the MySQL table
        cursor = mydb.cursor()
        sql = "INSERT INTO yourtable (date, result) VALUES (%s, %s)"
        val = (date, result)
        cursor.execute(sql, val)
        mydb.commit()
