
INSERT INTO customers VALUES
    (DEFAULT,'michaeljchapman@students.abtech.edu','Chapman','Michael','Asheville','NC',28803,'USA'),
    (DEFAULT,'madeup@students.abtech.edu','Donald','Ashley','Asheville','NC',28803,'USA');

INSERT INTO accountSecurity VALUES
    ('michaeljchapman@students.abtech.edu',(SELECT accountNum FROM customers WHERE email='michaeljchapman@students.abtech.edu'),'indiana',12345),
    ('madeup@students.abtech.edu',(SELECT accountNum FROM customers WHERE email='madeup@students.abtech.edu'),'southcarolina',67890);

INSERT INTO userProfiles VALUES
SELECT dietLogID,accountNum
FROM dietData
WHERE accountNum = 1;

INSERT INTO userProfiles VALUES
SELECT BSTestID, accountNum
FROM bloodspotData
WHERE accountNum = 1;

INSERT INTO userProfiles VALUES
SELECT BRKetoTestID, accountNum
FROM breathKetones
WHERE accountNum = 1;

