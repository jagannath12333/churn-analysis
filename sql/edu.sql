drop database pracice;

create database placement_practice;
use placement_practice;

create table employees;
create table employees(
id INT,
Name VARCHAR(50),
age INT,
department VARCHAR(50),
salary INT);


insert into employees(id,name,age,department,salary) VALUES
(1,'rAHIL',22,"IT",50000);
SELECT * FROM EMPLOYEES;

SELECT NAME,salary  from employees;

select * from employees
where department="hr";
select * from employees
where age >30;

select * from employees
where department="hr" or department="it";

SELECT * FROM employees
WHERE age BETWEEN 25 AND 30;

select name from employees
where name like '%p';
SELECT * FROM employees
ORDER BY salary DESC;
select * from employees
order by salary desc;

select * from employees
order by age asc
limit 1;

select distinct department
from employees;

select count(*) as total_employees
from employees;

select avg(salary) as avg_salary
from employees;

select min(salary) as min_salary,
	   max(SALARY) AS max_Salary
       FROM EMPLOYEES;
       SELECT DEPARTMENT,COUNT(*) AS TOTAL
       FROM EMPLOYEES
       GROUP BY DEPARTMENT;
       
	SELECT DEPARTMENT,AVG(SALARY) as avg_salary
    from employees
    group by department;
    
    
select department,avg(salary) as avg_salary
from employees
group by department
having avg(Salary) > 50000;

update employees
set salary =salary * 1.10;

select * from employees;

DELETE FROM employees
WHERE id = 1;

drop table employees;


update employees
set department ='finance'
where name ='priya';

delete from employees
where department ="hr";


CREATE DATABASE CHURN_ANALYSIS;
use churn_analysis;

CREATE TABLE ChurnData (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(50),
    InternetService VARCHAR(50),
    OnlineSecurity VARCHAR(50),
    OnlineBackup VARCHAR(50),
    DeviceProtection VARCHAR(50),
    TechSupport VARCHAR(50),
    StreamingTV VARCHAR(50),
    StreamingMovies VARCHAR(50),
    Contract VARCHAR(50),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(100),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(10)
);

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100 * AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END), 2) AS churn_rate
FROM ChurnData;


SELECT 
    Contract,
    COUNT(*) AS total_customers,
    ROUND(100 * AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END), 2) AS churn_rate_percentage
FROM ChurnData
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;


SELECT 
    customerID,
    Contract,
    tenure,
    MonthlyCharges,
    PaymentMethod
FROM ChurnData
WHERE 
    Churn = 'No'
    AND Contract = 'Month-to-month'
    AND tenure < 12
ORDER BY MonthlyCharges DESC
LIMIT 100;



SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    
    COUNT(*) AS total_customers,
    
    ROUND(100 * AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END), 2) AS churn_rate_percentage

FROM ChurnData

GROUP BY tenure_group

ORDER BY churn_rate_percentage DESC;