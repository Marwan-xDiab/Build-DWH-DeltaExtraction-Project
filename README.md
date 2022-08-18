# Delta Extraction ETL

## General Info
With delta extraction, only the data that has changed since the last extraction is loaded into the DWH. Data that has already been loaded and has not changed is not extracted and does not need to be deleted before a new load.

## Introduction
About Project Info
Extract new and updated data from the Employee Table, then move it to the staging area and combine it with the Employees data warehouse, which only accepts new data ,after that  inserts logrecorded data that content last extraction date then truncate Staging Area.

## Data Sources
- Employees Table (OLTP)
- Staging Employee (Staging Area)
- DWH_Employee
- LogRecord 

![staging](https://user-images.githubusercontent.com/90741989/185493553-0f763e7e-caa0-4660-8fbe-805c622ba224.png)

## Steps 
1- select data where start date equale last extract date 
```sh
select 
[Emp_No]  ,
	[Name] ,
	[DOB] ,
	[Gender]  ,
	[Salary] ,
	[City]
from Employee
where ActivityDateTime  > ? and ActivityDateTime <= ?
```
2- Load data to Staging Employee (Staging Area) and insert LogRecord 
![Screenshot (365)](https://user-images.githubusercontent.com/90741989/185494505-f6345a62-5d7c-4af5-98ee-dbb6975948a0.png)
![Screenshot (366)](https://user-images.githubusercontent.com/90741989/185494821-acfac389-f1cd-4642-853b-046451062e81.png)

3- combine staging area and the Employees data warehouse which only accepts new data ,then truncate Staging Area
```sh
MERGE DWH_employee  as DWH
USING staging_employee as STA  ON DWH.Emp_No = STA.Emp_No
WHEN  NOT matched  
then Insert (Emp_No,name,DOB,Gender,Salary,City) values(STA.Emp_No,name,STA.DOB,STA.Gender,STA.Salary,STA.City);
```
![Screenshot (368)](https://user-images.githubusercontent.com/90741989/185495556-5e5cd9f0-badf-40a1-84ff-0a2803f87f27.png)
