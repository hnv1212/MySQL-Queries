-- 1. insert a record with your own value into the table countries against each columns.
INSERT INTO countries VALUES('C1', 'India', 1001)

-- 2. insert one row into the table countries against the column country_id and country_name
INSERT INTO countries (country_id, country_name) VALUES('C1', 'India')

-- 3. create a duplicate of countries table named country_new with all structure and data.
CREATE TABLE IF NOT EXISTS country_new 
AS SELECT * FROM countries

-- 4. insert NULL values against region_id columnn for a row of countries table.
INSERT INTO countries (country_id, country_name, region_id) VALUES('C1', 'India', NULL)

-- 5. insert 3 rows by a single insert statement
INSERT INTO countries VALUES('C0001', 'India', 1001), ('C0002', 'USA', 1007), ('C0003', 'UK', 1003)

-- 6. insert rows from country_new table to countries table
INSERT INTO countries 
SELECT * FROM country_new

-- 7. insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column
/* 
Create the table jobs.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE , 
JOB_TITLE varchar(35) NOT NULL, 
MIN_SALARY decimal(6,0)
);
*/
INSERT INTO jobs VALUES(1001,'OFFICER',8000);

-- 8. insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.
/*
Create the table jobs.

CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL, 
MIN_SALARY decimal(6,0)
);
*/
INSERT INTO jobs VALUES(1001,'OFFICER',8000);

-- 9. insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once inn the table.
/*
Create the table countries.

CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID integer NOT NULL,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID integer NOT NULL,
PRIMARY KEY (COUNTRY_ID,REGION_ID)
);
*/
INSERT INTO countries VALUES(501,'Italy',185);

-- 10. insert rows into the table countries in which the value of country_id column will be unique and auto incremented
/*
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL,
REGION_ID integer NOT NULL
);
*/
INSERT INTO countries(COUNTRY_NAME, REGION_ID) VALUES('India', 185)

-- 11. insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column
/*
CREATE TABLE IF NOT EXISTS countries ( 
COUNTRY_ID integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
COUNTRY_NAME varchar(40) NOT NULL DEFAULT 'N/A',
REGION_ID integer NOT NULL
);
*/
INSERT INTO countries VALUES(501,'India',102);

-- 12. insert rows in the job_history table in which one column job_id is containing those values which are exists in job_id column of jobs table
/*
CREATE TABLE IF NOT EXISTS jobs ( 
JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
MIN_SALARY decimal(6,0) DEFAULT 8000, 
MAX_SALARY decimal(6,0) DEFAULT 20000
)ENGINE=InnoDB;

INSERT INTO jobs(JOB_ID,JOB_TITLE) VALUES(1001,'OFFICER');
INSERT INTO jobs(JOB_ID,JOB_TITLE) VALUES(1002,'CLERK');
*/
/*
CREATE TABLE job_history ( 
EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
JOB_ID integer NOT NULL, 
DEPARTMENT_ID integer DEFAULT NULL, 
FOREIGN KEY (job_id) REFERENCES jobs(job_id)
)ENGINE=InnoDB;
*/
INSERT INTO job_history VALUES(501, 1001, 60)

-- 13. insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table department
CREATE TABLE IF NOT EXISTS departments ( 
    DEPARTMENT_ID integer NOT NULL UNIQUE, 
    DEPARTMENT_NAME varchar(30) NOT NULL, 
    MANAGER_ID integer DEFAULT NULL, 
    LOCATION_ID integer DEFAULT NULL, 
    PRIMARY KEY (DEPARTMENT_ID,MANAGER_ID) 
)ENGINE=InnoDB;
INSERT INTO departments VALUES(60,'SALES',201,89);
INSERT INTO departments VALUES(61,'ACCOUNTS',201,89);
INSERT INTO departments VALUES(80,'FINANCE',211,90);
CREATE TABLE IF NOT EXISTS employees ( 
    EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
    FIRST_NAME varchar(20) DEFAULT NULL, 
    LAST_NAME varchar(25) NOT NULL, 
    JOB_ID varchar(10) NOT NULL, 
    SALARY decimal(8,2) DEFAULT NULL, 
    MANAGER_ID integer DEFAULT NULL, 
    DEPARTMENT_ID integer DEFAULT NULL, 
    FOREIGN KEY(DEPARTMENT_ID,MANAGER_ID) REFERENCES  departments(DEPARTMENT_ID,MANAGER_ID)
)ENGINE=InnoDB;

INSERT INTO employees VALUES(510,'Alex','Hanes','CLERK',18000,201,60);
INSERT INTO employees VALUES(511,'Kim','Leon','CLERK',18000,211,80);

-- 14. insert rows into the table employees in which a set of columns department_id and manager_id contains a unique value and that combined values must have exists into the table departments.
CREATE TABLE IF NOT EXISTS departments ( 
    DEPARTMENT_ID integer NOT NULL UNIQUE, 
    DEPARTMENT_NAME varchar(30) NOT NULL, 
    MANAGER_ID integer DEFAULT NULL, 
    LOCATION_ID integer DEFAULT NULL, 
    PRIMARY KEY (DEPARTMENT_ID) 
)ENGINE=InnoDB;
INSERT INTO departments VALUES(60,'SALES',201,89);
INSERT INTO departments VALUES(61,'ACCOUNTS',201,89);

CREATE TABLE IF NOT EXISTS jobs ( 
    JOB_ID integer NOT NULL UNIQUE PRIMARY KEY, 
    JOB_TITLE varchar(35) NOT NULL DEFAULT ' ', 
    MIN_SALARY decimal(6,0) DEFAULT 8000, 
    MAX_SALARY decimal(6,0) DEFAULT 20000
)ENGINE=InnoDB;
INSERT INTO jobs(JOB_ID,JOB_TITLE) VALUES(1001,'OFFICER');
INSERT INTO jobs(JOB_ID,JOB_TITLE) VALUES(1002,'CLERK');

CREATE TABLE IF NOT EXISTS employees ( 
    EMPLOYEE_ID integer NOT NULL PRIMARY KEY, 
    FIRST_NAME varchar(20) DEFAULT NULL, 
    LAST_NAME varchar(25) NOT NULL, 
    DEPARTMENT_ID integer DEFAULT NULL, 
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES  departments(DEPARTMENT_ID),
    JOB_ID integer NOT NULL, 
    FOREIGN KEY(JOB_ID) REFERENCES  jobs(JOB_ID),
    SALARY decimal(8,2) DEFAULT NULL
)ENGINE=InnoDB;

INSERT INTO employees VALUES(510,'Alex','Hanes',60,1001,18000);
