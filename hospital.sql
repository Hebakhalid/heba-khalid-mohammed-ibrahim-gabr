USE [master]
GO
/****** Object:  Database [hospital1]    Script Date: 6/5/2020 10:25:09 PM ******/
CREATE DATABASE [hospital1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hospital1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\hospital1.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'hospital1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\hospital1_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [hospital1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hospital1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hospital1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hospital1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hospital1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hospital1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hospital1] SET ARITHABORT OFF 
GO
ALTER DATABASE [hospital1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hospital1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [hospital1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hospital1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hospital1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hospital1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hospital1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hospital1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hospital1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hospital1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hospital1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hospital1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hospital1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hospital1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hospital1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hospital1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hospital1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hospital1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hospital1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hospital1] SET  MULTI_USER 
GO
ALTER DATABASE [hospital1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hospital1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hospital1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hospital1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [hospital1]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[bill_no] [int] NOT NULL,
	[patient_id] [int] NULL,
	[doctor_charge] [int] NULL,
	[room_charge] [int] NULL,
	[no_of_days] [int] NULL,
	[lab_charge] [int] NULL,
	[bill] [int] NULL,
	[room_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[doctor]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[doctor](
	[doctor_id] [int] NOT NULL,
	[name] [varchar](60) NULL,
	[age] [int] NULL,
	[gender] [varchar](10) NULL,
	[address] [varchar](60) NULL,
	[patient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[inpatient]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inpatient](
	[inpatient] [int] NOT NULL,
	[patient_id] [int] NULL,
	[room_no] [int] NULL,
	[date_of_adm] [datetime] NULL,
	[date_of_dis] [datetime] NULL,
	[lab_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[inpatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lab]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lab](
	[lab_no] [int] NOT NULL,
	[patient_id] [int] NULL,
	[doctor_id] [int] NULL,
	[date] [datetime] NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[lab_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[outpatient]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[outpatient](
	[outpatient] [int] NOT NULL,
	[patient_id] [int] NULL,
	[date] [varchar](10) NULL,
	[lab_no] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[outpatient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[patient]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[patient](
	[patient_id] [int] NOT NULL,
	[Name] [int] NULL,
	[age] [int] NULL,
	[Gender] [varchar](10) NULL,
	[address] [varchar](60) NULL,
	[disease] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[room]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[room](
	[room_no] [int] NOT NULL,
	[room_type] [varchar](50) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[room_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tdoctor]    Script Date: 6/5/2020 10:25:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tdoctor](
	[doctor_id] [int] NOT NULL,
	[name] [varchar](60) NULL,
	[age] [int] NULL,
	[gender] [varchar](10) NULL,
	[address] [varchar](60) NULL,
	[patient_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[bill]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[doctor]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[inpatient]  WITH CHECK ADD FOREIGN KEY([lab_no])
REFERENCES [dbo].[lab] ([lab_no])
GO
ALTER TABLE [dbo].[inpatient]  WITH CHECK ADD FOREIGN KEY([room_no])
REFERENCES [dbo].[room] ([room_no])
GO
ALTER TABLE [dbo].[inpatient]  WITH CHECK ADD FOREIGN KEY([room_no])
REFERENCES [dbo].[room] ([room_no])
GO
ALTER TABLE [dbo].[lab]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[lab]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[patient] ([patient_id])
GO
ALTER TABLE [dbo].[outpatient]  WITH CHECK ADD FOREIGN KEY([lab_no])
REFERENCES [dbo].[lab] ([lab_no])
GO
USE [master]
GO
ALTER DATABASE [hospital1] SET  READ_WRITE 
GO
