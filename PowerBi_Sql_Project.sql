create database banking_db;
use banking_db;
LOAD DATA LOCAL INFILE 'Replace with Your File Path'
INTO TABLE credit_card_churn
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    client_num,
    Attrition_Flag,
    Customer_Age,
    Gender,
    Dependent_count,
    Education_Level,
    Marital_Status,
    Income_Category,
    Card_Category,
    Months_on_book,
    Total_Relationship_Count,
    Months_Inactive_12_mon,
    Contacts_Count_12_mon,
    Credit_Limit,
    Total_Revolving_Bal,
    Avg_Open_To_Buy,
    Total_Amt_Chng_Q4_Q1,
    Total_Trans_Amt,
    Total_Trans_Ct,
    Total_Ct_Chng_Q4_Q1,
    Avg_Utilization_Ratio,
    Naive_Bayes_1,
    Naive_Bayes_2
);
select count(*) from credit_card_churn;
select * from credit_card_churn;
select * from credit_card_churn limit 10; 

select client_num , count(*) from credit_card_churn 
group by client_num 
having count(*) > 1;

select sum(client_num is null) as client_numbers,
sum(Customer_Age is null) as client_age,
sum(Credit_Limit is null) as client_credit_limit,
sum(Total_Trans_Amt is null) as client_total_trans from credit_card_churn;

select Attrition_Flag , count(*) from credit_card_churn 
group by Attrition_Flag;

select distinct Income_Category from credit_card_churn;

select distinct Card_Category from credit_card_churn;

select Attrition_Flag , Card_Category , count(*) from credit_card_churn
group by Attrition_Flag , Card_Category order by Card_category;

select Attrition_Flag , Avg(Total_Trans_Amt) from credit_card_churn
group by Attrition_Flag;

select Attrition_Flag , avg(Total_Trans_Ct) from credit_card_churn
group by Attrition_Flag;

select Attrition_Flag, Months_Inactive_12_mon, count(*) from credit_card_churn
group by Attrition_Flag, Months_Inactive_12_mon order by Months_Inactive_12_mon;

select Attrition_Flag , round(avg(Avg_Utilization_Ratio), 3) from credit_card_churn 
group by Attrition_Flag;

SELECT 
    MIN(Avg_Utilization_Ratio) AS Min_Utilization,
    MAX(Avg_Utilization_Ratio) AS Max_Utilization,
    AVG(Avg_Utilization_Ratio) AS Avg_Utilization
FROM credit_card_churn;


SELECT 
    client_num,
    Avg_Utilization_Ratio
FROM credit_card_churn
LIMIT 20;




