-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 22, 2022 at 05:55 PM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ED`
--

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `DepartmentID` bigint NOT NULL,
  `DepartmentName` varchar(24) NOT NULL,
  `OfficeNumber` varchar(10) NOT NULL,
  `InsertDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Department`
--

INSERT INTO `Department` (`DepartmentID`, `DepartmentName`, `OfficeNumber`, `InsertDate`) VALUES
(1, 'Dimond', '101', '2022-07-22 10:35:58'),
(2, 'IT', '101', '2022-07-22 10:35:58'),
(3, 'Press', '201', '2022-07-22 10:35:58'),
(4, 'Hospital', '201', '2022-07-22 10:35:58'),
(5, 'Pharmacy', '101', '2022-07-22 10:35:58'),
(6, 'Auto Mobile', '201', '2022-07-22 10:35:58'),
(7, 'Chemical', '201', '2022-07-22 10:35:58'),
(8, 'Non IT', '201', '2022-07-22 10:35:58'),
(9, 'Aeronotical', '201', '2022-07-22 10:37:47'),
(10, 'ISRO', '201', '2022-07-22 10:37:47');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `EmployeeID` bigint NOT NULL,
  `DepartmentID` bigint NOT NULL,
  `EmployeeName` varchar(24) NOT NULL,
  `Phone` varchar(16) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Cites` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Job` varchar(24) NOT NULL,
  `Position` enum('Manager','Clerk','Salesmen','Analysts') NOT NULL,
  `Salary` int NOT NULL,
  `HiredDate` date NOT NULL,
  `Commission` int DEFAULT NULL,
  `InsertDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`EmployeeID`, `DepartmentID`, `EmployeeName`, `Phone`, `Address`, `Cites`, `State`, `Country`, `Job`, `Position`, `Salary`, `HiredDate`, `Commission`, `InsertDate`) VALUES
(1, 2, 'Tirth', '983648442', '64/ sadhna soc', 'Ahmedabad', 'Gujarat', 'India', 'Backend', 'Manager', 3000, '2022-06-28', NULL, '2022-07-22 10:52:40'),
(2, 2, 'Sahil', '8121048442', 'Panchvati soc', 'Ahmedabad', 'Gujarat', 'India', 'Backend', 'Manager', 3000, '2021-06-28', NULL, '2022-07-22 11:23:27'),
(3, 2, 'Priyank', '8013448442', 'Madhav soc', 'Junagdh', 'Gujarat', 'India', 'Backend', 'Manager', 1000, '2021-07-01', NULL, '2022-07-22 11:23:27'),
(4, 6, 'Kenil', '5421048442', 'Madhav soc', 'Mumbai', 'Maharastr', 'India', 'Backend', 'Salesmen', 1300, '2020-01-09', 1000, '2022-07-22 11:23:27'),
(5, 5, 'Ankit', '7525148442', 'Pulin Park', 'Pune', 'Maharastr', 'India', 'Frontend', 'Salesmen', 1600, '2021-05-02', 1600, '2022-07-22 11:23:27'),
(6, 1, 'Sahil', '6535148442', 'Amul Park', 'Junagdh', 'Gujarat', 'India', 'Helper', 'Clerk', 800, '2021-05-22', 500, '2022-07-22 11:23:27'),
(7, 1, 'Rahul', '8531448442', 'Park', 'Ahmedabad', 'Gujarat', 'India', 'Helper', 'Clerk', 1800, '2020-06-22', 100, '2022-07-22 11:23:27'),
(8, 8, 'Chintan', '6531448442', 'sgdf', 'Goa', 'Goa', 'India', 'Worker', 'Manager', 1158, '2020-08-01', 300, '2022-07-22 11:23:27'),
(9, 7, 'Raj', '7534481442', 'dfhd', 'Ahm', 'Banglore', 'India', 'Helper', 'Salesmen', 2500, '2022-02-15', 500, '2022-07-22 11:23:27'),
(10, 10, 'Yagnik', '9525418442', 'dstyfug', 'Ahmedabad', 'Gujarat', 'India', 'Helper', 'Manager', 10000, '2022-01-08', 1000, '2022-07-22 11:23:27'),
(11, 2, 'Krupesh', '8535141242', 'sdfg', 'Surendrnagar', 'Gujarat', 'India', 'Helper', 'Analysts', 5000, '2021-09-02', 1500, '2022-07-22 11:23:27'),
(12, 5, 'Vinesh', '8534485211', 'sdrfg', 'Amreli', 'Gujarat', 'India', 'Helper', 'Salesmen', 5000, '2021-07-01', 2000, '2022-07-22 11:23:27'),
(13, 2, 'Prinjay', '8534459165', 'sdaf', 'Ahm', 'Banglore', 'India', 'Helper', 'Analysts', 1200, '2021-09-10', 2500, '2022-07-22 11:23:27'),
(14, 1, 'Pruthvik', '9831321316', 'adsfg', 'Ahmedabad', 'Gujarat', 'India', 'Salesmen', 'Clerk', 1100, '2022-05-19', 2000, '2022-07-22 11:23:27'),
(15, 1, 'Sagar', '8534454821', 'adsf', 'Surendrnagar', 'Gujarat', 'India', 'Analysts', 'Clerk', 1300, '2021-08-12', 1000, '2022-07-22 11:23:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EmployeeID` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `Department` (`DepartmentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;















MY TABLE 22-07-2022 Task-2
CREATE TABLE `Employee_Table`
(`Emp_ID` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 `Emp_Name` VARCHAR(50) NOT NULL,
 `DepartmentID` bigint NOT NULL,
 `Emp_Job_Name` VARCHAR(20) NOT NULL,
 `Emp_Address` VARCHAR(50) NOT NULL,
 `Emp_Cities` VARCHAR(20) NOT NULL,
 `Emp_State` VARCHAR(20) NOT NULL,
 `Emp_Country` VARCHAR(30) NOT NULL,
 `Emp_Number` VARCHAR(12) NOT NULL,
 `Emp_Salary` BIGINT NOT NULL,
 `Emp_Position` ENUM ('Manager','Clerk','Salesmen','Analysts') NOT NULL,
 `Emp_Commision` INT(10) NOT NULL,
 `No_Of_Emp` INT(16) NOT NULL,
 `Manager_ID` BIGINT NOT NULL,
 `Emp_Join_Date` DATE NOT NULL,
 `Emp_Insert_Date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`Emp__UpDatedDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 
 
 );
 
 
 
 
Query Solve
1.SELECT EmployeeName,Address,Cites from tbl_Employee 
where Job="FIRST BANK CORPORATION" AND Salary>10000
2.select * from tbl_Employee where DepartmentID=3 
3.select EmployeeName,Phone,DepartmentID from tbl_Employee WHERE Position ="Clerk" 
4.SELECT EmployeeName from tbl_Employee
5.select * from tbl_Employee where Commission>Salary 
6.select * from tbl_Employee where Commission>(Salary*0.6) 
7.select * from tbl_Employee where DepartmentID = 2 and Salary > 2000 
8.SELECT * FROM tbl_Employee WHERE DepartmentID = 3 AND Salary >1500 
9.select * from tbl_Employee WHERE Position= "Manager" OR Position="President" 
10.SELECT * FROM tbl_Employee 
WHERE Position="Manager"
and DepartmentID!=3;
11.select * from tbl_Employee where DepartmentID = 1 AND Position = "Manager" AND Position = "Clerk" 
12.SELECT EmployeeID, EmployeeName, Position, Salary, Job from tbl_Employee JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID where Position = 'Manager' or Position='Clerk' and OfficeNumber = 201 
13.SELECT EmployeeID, EmployeeName, Position, Salary, Job
    from tbl_Employee 
    JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID
    where Position != 'Manager' or Position != 'Clerk' and OfficeNumber = 201;
14.  SELECT EmployeeID, EmployeeName, Position, Salary, Job
    from tbl_Employee
    JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID
    where Position != 'Manager' or Position != 'Clerk' and OfficeNumber = 201;
15.select EmployeeName, Salary from tbl_Employee where Salary BETWEEN 5000 AND 10000 
16.select EmployeeName, Position, Job from tbl_Employee where Position != "Clerk" AND Position != "Analyst" AND Position != "Manager" 
17.SELECT EmployeeName, Salary, Position from tbl_Employee JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID where not Position ='Clerk' and not Position = 'Analysts' and not Position='Salesmen' 
18. SELECT EmployeeName, Salary, Position, Commission
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where Commission = 0;
 19.SELECT EmployeeName, Salary, Position,Commission from tbl_Employee JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID where Commission > 0 
 20.SELECT EmployeeName, Salary, Position, Commission from tbl_Employee JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID where Commission = 0 or Commission < 100 
 21.    select EmployeeName,
    CASE 
    	WHEN Commission = 0 THEN 250 + Salary * 12
    --     WHEN Commission > 0 THEN bonus = 0
        ELSE Commission + Salary * 12
        END AS TOTAL_SALARY
    	FROM tbl_Employee;            
22. SELECT EmployeeName, Salary, Commission
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where (Commission + Salary) > 2000;
23.SELECT EmployeeName from tbl_Employee JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID where EmployeeName Like 'R%' or EmployeeName Like '%k' 
24. SELECT EmployeeName
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where EmployeeName Like 's%' or EmployeeName Like '%l';
25. SELECT EmployeeName
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where length(EmployeeName)>2 and EmployeeName Like '__h%';
26.select EmployeeName, HiredDate from tbl_Employee 
inner join tbl_Department on tbl_Employee.DepartmentID=tbl_Department.DepartmentID;
28. SELECT EmployeeName, HiredDate
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where year(HiredDate) between 2019 and 2022 ;
27.select * from tbl_Employee where HiredDate=last_day(HiredDate);
29.SELECT EmployeeName,HiredDate 
FROM tbl_Employee 
WHERE YEAR(HiredDate)  LIKE '2022%';
30.SELECT CONCAT(EmployeeName," ",Job) AS Emp_Job
FROM tbl_Employee;
31. SELECT Lpad(EmployeeName,15,' '),Job as EmployeeName 
 from tbl_Employee;
32. SELECT rpad(EmployeeName,15,'*'),Job as EmployeeName 
 from tbl_Employee;
33. SELECT EmployeeName
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Employee.DepartmentID 
 where EmployeeName not like 'A%';
 34. SELECT EmployeeName
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where EmployeeName not like ('%r');
 35. SELECT substr(EmployeeName,1,3),reverse(substr(reverse(EmployeeName),1,3))
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID ;
 36. SELECT replace(EmployeeName,'R','r')
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID ;
 37. SELECT EmployeeName, POSITION('ar' in EmployeeName)
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID ;
 38. SELECT EmployeeName, Salary, round(Salary) as Monthly_Salary
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID ;
 39. SELECT EmployeeName, Salary, Job
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where Job in ('Helper', 'Worker', 'Backend')
 and Salary not in(3000, 5000, 10000); 
 40. SELECT EmployeeName, Salary, Job
 from tbl_Employee
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 Order by Job desc,
 Salary asc;
 41.SELECT e.EmployeeName, e.Job, e.HiredDate from tbl_Employee e, tbl_Department d WHERE e.DepartmentID = d.DepartmentID AND datediff(curdate(),HiredDate) > 365;
 42.SELECT EmployeeName, HiredDate, Salary, Job, DepartmentName
 from tbl_Employee 
 JOIN tbl_Department ON tbl_Employee.DepartmentID = tbl_Department.DepartmentID 
 where year(HiredDate)=2020
 Order by HiredDate asc;



 
