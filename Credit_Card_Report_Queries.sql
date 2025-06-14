Create database ccdb;

use ccdb;

# Creating credit card detail table
create table cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Vol INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

# Creating customer detail table 
CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

#Loading Credit Card Data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Client_Num, @Card_Category, @Annual_Fees, @Activation_30_Days, @Customer_Acq_Cost, 
@Week_Start_Date, @Week_Num, @Qtr, @current_year, @Credit_Limit, @Total_Revolving_Bal, 
@Total_Trans_Amt, @Total_Trans_Vol, @Avg_Utilization_Ratio, @Use_Chip, @Exp_Type, 
@Interest_Earned, @Delinquent_Acc)
SET
  Client_Num = @Client_Num,
  Card_Category = @Card_Category,
  Annual_Fees = @Annual_Fees,
  Activation_30_Days = @Activation_30_Days,
  Customer_Acq_Cost = @Customer_Acq_Cost,
  Week_Start_Date = STR_TO_DATE(@Week_Start_Date, '%d-%m-%Y'),
  Week_Num = @Week_Num,
  Qtr = @Qtr,
  current_year = @current_year,
  Credit_Limit = @Credit_Limit,
  Total_Revolving_Bal = @Total_Revolving_Bal,
  Total_Trans_Amt = @Total_Trans_Amt,
  Total_Trans_Vol = @Total_Trans_Vol,
  Avg_Utilization_Ratio = @Avg_Utilization_Ratio,
  Use_Chip = @Use_Chip,
  Exp_type = @Exp_type,
  Interest_Earned = @Interest_Earned,
  Delinquent_Acc = @Delinquent_Acc;
  
#Loading Customer Data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Client_Num, @Customer_Age, @Gender, @Dependent_Count, @Education_Level, 
@Marital_Status, @state_cd, @Zipcode, @Car_Owner, @House_Owner, @Personal_loan, 
@contact, @Customer_Job, @Income, @Cust_Satisfaction_Score)
SET
  Client_Num = @Client_Num,
  Customer_Age = @Customer_Age,
  Gender = @Gender,
  Dependent_Count = @Dependent_Count,
  Education_Level = @Education_Level,
  Marital_Status = @Marital_Status,
  state_cd = @state_cd,
  Zipcode = @Zipcode,
  Car_Owner = @Car_Owner,
  House_Owner = @House_Owner,
  Personal_loan = @Personal_loan,
  contact = @contact,
  Customer_Job = @Customer_Job,
  Income = @Income,
  Cust_Satisfaction_Score = @Cust_Satisfaction_Score;

# Loading another credit card data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cc_add.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Client_Num, @Card_Category, @Annual_Fees, @Activation_30_Days, @Customer_Acq_Cost, 
@Week_Start_Date, @Week_Num, @Qtr, @current_year, @Credit_Limit, @Total_Revolving_Bal, 
@Total_Trans_Amt, @Total_Trans_Vol, @Avg_Utilization_Ratio, @Use_Chip, @Exp_Type, 
@Interest_Earned, @Delinquent_Acc)
SET
  Client_Num = @Client_Num,
  Card_Category = @Card_Category,
  Annual_Fees = @Annual_Fees,
  Activation_30_Days = @Activation_30_Days,
  Customer_Acq_Cost = @Customer_Acq_Cost,
  Week_Start_Date = STR_TO_DATE(@Week_Start_Date, '%d-%m-%Y'),
  Week_Num = @Week_Num,
  Qtr = @Qtr,
  current_year = @current_year,
  Credit_Limit = @Credit_Limit,
  Total_Revolving_Bal = @Total_Revolving_Bal,
  Total_Trans_Amt = @Total_Trans_Amt,
  Total_Trans_Vol = @Total_Trans_Vol,
  Avg_Utilization_Ratio = @Avg_Utilization_Ratio,
  Use_Chip = @Use_Chip,
  Exp_type = @Exp_type,
  Interest_Earned = @Interest_Earned,
  Delinquent_Acc = @Delinquent_Acc;
  
# Loading another customer data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_add.csv'
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@Client_Num, @Customer_Age, @Gender, @Dependent_Count, @Education_Level, 
@Marital_Status, @state_cd, @Zipcode, @Car_Owner, @House_Owner, @Personal_loan, 
@contact, @Customer_Job, @Income, @Cust_Satisfaction_Score)
SET
  Client_Num = @Client_Num,
  Customer_Age = @Customer_Age,
  Gender = @Gender,
  Dependent_Count = @Dependent_Count,
  Education_Level = @Education_Level,
  Marital_Status = @Marital_Status,
  state_cd = @state_cd,
  Zipcode = @Zipcode,
  Car_Owner = @Car_Owner,
  House_Owner = @House_Owner,
  Personal_loan = @Personal_loan,
  contact = @contact,
  Customer_Job = @Customer_Job,
  Income = @Income,
  Cust_Satisfaction_Score = @Cust_Satisfaction_Score;
  
  Select * from cc_detail;
  Select * from cust_detail