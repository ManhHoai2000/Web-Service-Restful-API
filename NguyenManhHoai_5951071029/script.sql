USE [master]
GO
/****** Object:  Database [DemoCRUD]    Script Date: 3/22/2021 6:17:30 PM ******/
CREATE DATABASE [DemoCRUD] ON  PRIMARY 
( NAME = N'DemoCRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoCRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoCRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DemoCRUD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoCRUD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoCRUD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoCRUD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoCRUD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoCRUD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoCRUD] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoCRUD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoCRUD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoCRUD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoCRUD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoCRUD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoCRUD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoCRUD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoCRUD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoCRUD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoCRUD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoCRUD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoCRUD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoCRUD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoCRUD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoCRUD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoCRUD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoCRUD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoCRUD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoCRUD] SET  MULTI_USER 
GO
ALTER DATABASE [DemoCRUD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoCRUD] SET DB_CHAINING OFF 
GO
USE [DemoCRUD]
GO
/****** Object:  Table [dbo].[StudentsTb]    Script Date: 3/22/2021 6:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsTb](
	[StudentID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[FatherName] [varchar](50) NULL,
	[RollNumber] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
 CONSTRAINT [PK_StudentsTb] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Employee]    Script Date: 3/22/2021 6:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Employee](
	[Sr_no] [int] NOT NULL,
	[Emp_name] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NULL,
	[STATE] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Department] [nvarchar](50) NULL,
	[flag] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Employee] PRIMARY KEY CLUSTERED 
(
	[Sr_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Employee]    Script Date: 3/22/2021 6:17:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Khai bao thuoc tinh
CREATE PROC [dbo].[Sp_Employee]
@Sr_no int, @Emp_name nvarchar(500),
@City nvarchar(500), @STATE nvarchar(500),
@Country nvarchar(500), @Department nvarchar(500),
@flag nvarchar(50)


--Cau lenh Insert
AS BEGIN 
	IF (@flag = 'insert')
	BEGIN
		INSERT INTO dbo.tbl_Employee
		(Emp_name, City, STATE, Country, Department)
		Values
		(@Emp_name, @City, @STATE, @Country, @Department)
	END
--Cau lenh UPDATE
	ELSE IF (@flag = 'update')
	BEGIN 
		UPDATE dbo.tbl_Employee SET
			Emp_name = @Emp_name, City = @City, STATE = @STATE, Country = @Country, Department = @Department
		WHERE Sr_no = @Sr_no
	END
--Cau lenh DELETE
	ELSE IF (@flag = 'delete')
	BEGIN
		DELETE FROM tbl_Employee
		WHERE Sr_no = @Sr_no
	END
--Cau lenh Select
	ELSE IF (@flag = 'getid')
	BEGIN
		SELECT * FROM tbl_Employee WHERE Sr_no = @Sr_no
	END
	ELSE IF (@flag = 'get')
	BEGIN
		SELECT * FROM tbl_Employee
	END
END
GO
USE [master]
GO
ALTER DATABASE [DemoCRUD] SET  READ_WRITE 
GO
