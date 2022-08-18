
CREATE TABLE [dbo].[DWH_employee](
	[Emp_No] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Salary] [int] NULL,
	[City] [varchar](50) NULL
)  
GO

CREATE TABLE [dbo].[employee](
	[Emp_No] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DOB] [varchar](100) NULL,
	[Gender] [varchar](100) NULL,
	[Salary] [int] NULL,
	[City] [varchar](20) NULL,
	[ActivityDateTime] [datetime] NULL
) 
GO
 select max(LastExtractDateTime) as LastExtractDateTime from LogRecorder where TableName='Employee'
CREATE TABLE [dbo].[LogRecorder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](30) NULL,
	[LastExtractDateTime] [datetime] NULL
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[staging_employee](
		[Emp_No] [int] NOT NULL,
		[Name] [varchar](50) NULL,
		[DOB] [varchar](100) NULL,
		[Gender] [varchar](100) NULL,
		[Salary] [int] NULL,
		[City] [varchar](20) NULL
) 
GO

INSERT INTO [dbo].[DWH_employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (100, 'Mahesh', '1965-12-01', 'Male', 30000, 'Delhi')
INSERT INTO [dbo].[DWH_employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (101, 'Suresh', '1963-11-14', 'Male', 34000, 'Delhi')
INSERT INTO [dbo].[DWH_employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (102, 'Rajat', '1969-12-21', 'Male', 23000, 'Shimla')
INSERT INTO [dbo].[DWH_employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City]) VALUES (103, 'Kalpana', '1961-12-01', 'Female', 40000, 'Goa')
INSERT INTO [dbo].[employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City], [ActivityDateTime]) VALUES (100, 'Mahesh', '1965-12-01', 'Male', 30000, 'Delhi', CAST('2020-02-29T20:04:53.823' AS DateTime))
INSERT INTO [dbo].[employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City], [ActivityDateTime]) VALUES (101, 'Suresh', '1963-11-14', 'Male', 34000, 'Delhi', CAST('2020-02-29T20:04:53.823' AS DateTime))
INSERT INTO [dbo].[employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City], [ActivityDateTime]) VALUES (102, 'Rajat', '1969-12-21', 'Male', 23000, 'Shimla', CAST('2020-02-29T20:04:53.823' AS DateTime))
INSERT INTO [dbo].[employee] ([Emp_No], [Name], [DOB], [Gender], [Salary], [City], [ActivityDateTime]) VALUES (103, 'Kalpana', '1961-12-01', 'Female', 40000, 'Goa', CAST('2020-02-29T20:04:53.823' AS DateTime))
INSERT INTO [dbo].[LogRecorder]([TableName],[LastExtractDateTime]) VALUES ('employee', CAST('2020-02-29T22:24:53.000' AS DateTime))
ALTER TABLE [dbo].[employee] ADD  DEFAULT (getdate()) FOR [ActivityDateTime]
GO



select * from employee
select * from LogRecorder
select * from staging_employee
select * from DWH_employee
	


	
select * from employee
select * from LogRecorder
select * from staging_employee
select * from DWH_employee



insert into Employee ([Emp_No],[Name],[DOB],[Gender],[Salary],[City]) values
(104,'Neha','1971-12-01','Female',19000,'Goa'),
(105,'Sunita','1958-12-01','Female',50000,'Delhi')

update employee set Salary = 35000 , ActivityDateTime =getdate()
where emp_no =100





insert into Employee ([Emp_No],[Name],[DOB],[Gender],[Salary],[City]) values
(106,'Neha','1971-12-01','Female',19000,'Goa'),
(107,'Sunita','1958-12-01','Female',50000,'Delhi')

update employee set Salary = 4000 , ActivityDateTime =getdate()
where emp_no =101
