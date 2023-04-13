CREATE DATABASE ketoPilot;

CREATE TABLE ketoPilot.customers
    (
        accountNum      INT             PRIMARY KEY     NOT NULL    AUTO_INCREMENT,
        lastName        VARCHAR(50)     NOT NULL,
        firstName       VARCHAR(50)     NOT NULL,
        city            VARCHAR(50)     NOT NULL,
        state           VARCHAR(50)     NOT NULL,
        zipCode         VARCHAR(50)     NOT NULL,
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