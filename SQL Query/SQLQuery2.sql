select * from employee
select * from LogRecorder
select * from staging_employee
select * from DWH_employee



MERGE DWH_employee  as DWH
USING staging_employee as STA  ON DWH.Emp_No = STA.Emp_No
WHEN  NOT matched  
then Insert (Emp_No,name,DOB,Gender,Salary,City) values(STA.Emp_No,name,STA.DOB,STA.Gender,STA.Salary,STA.City);