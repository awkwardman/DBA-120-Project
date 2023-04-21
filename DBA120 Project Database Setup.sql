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
        energyCalories  DECIMAL(9,2),
        carbGrams       DECIMAL(9,2),     
        fatGrams        DECIMAL(9,2),
        proteinGrams    DECIMAL(9,2)
    );

CREATE TABLE ketoPilot.breathKetones
    (
        BRKetoTestID    VARCHAR(50)     PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        accountNum      INT             REFERENCES customers (accountNum),
        brDate          DATE            NOT NULL,
        acetoResult     INT   
    );

CREATE TABLE ketoPilot.bloodspotData
    (
        BSTestID        VARCHAR(50)     PRIMARY KEY     NOT NULL,
        accountNum      INT             REFERENCES customers (accountNum),
        bsDate          DATE            NOT NULL,
        bsTime          TIME,
        bsAnalyte       VARCHAR(50)     NOT NULL,
        bsTestResult    DECIMAL(9,2),
        unit            VARCHAR(50),
        gkiResult       DECIMAL(9,1)
    );

CREATE TABLE ketoPilot.userProfiles
    (
        profileID       INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        accountNum      INT             REFERENCES customers (accountNum),
        dietLogID       VARCHAR(50)             REFERENCES dietData (dietLogID),     
        BSTestID        VARCHAR(50)             REFERENCES bloodspotData (BSTestID),
        BRKetoTestID    VARCHAR(50)             REFERENCES breathKetones (BRKetoTestID)
    );
