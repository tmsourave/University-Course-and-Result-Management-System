USE [master]
GO
/****** Object:  Database [UniversityResultManagement]    Script Date: 30-Sep-16 5:09:07 PM ******/
CREATE DATABASE [UniversityResultManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityResultManagement', FILENAME = N'E:\Personal\Visual C#\BITM\Final Project\UniversityResultManagement\UniversityResultManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityResultManagement_log', FILENAME = N'E:\Personal\Visual C#\BITM\Final Project\UniversityResultManagement\UniversityResultManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityResultManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityResultManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityResultManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityResultManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityResultManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityResultManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityResultManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityResultManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityResultManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityResultManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityResultManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityResultManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityResultManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityResultManagement]
GO
/****** Object:  Table [dbo].[AllocateClassroom]    Script Date: 30-Sep-16 5:09:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AllocateClassroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[FromTime] [time](7) NOT NULL,
	[ToTime] [time](7) NOT NULL,
	[Valid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AllocateClassroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](300) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignTeacher]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssignTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Valid] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourseAssignTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseEnroll]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnroll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_CourseEnroll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Day]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Day] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GradeLetter]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GradeLetter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_GradeLetter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomNo]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomNo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_RoomNo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeLetterId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](20) NOT NULL,
	[Date] [date] NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RegistrationNo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditTaken] [decimal](18, 2) NOT NULL,
	[RemainingCredit] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CourseStatics]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW 
[dbo].[CourseStatics]
AS
SELECT Course.Code, Course.Name, Course.DepartmentId, Semester.Name AS Semester, 
Teacher.Name AS AssignedTo, CourseAssignTeacher.Valid FROM Course 
LEFT JOIN Semester ON Course.SemesterId = Semester.Id  
LEFT JOIN CourseAssignTeacher ON Course.Id=CourseAssignTeacher.CourseId 
LEFT JOIN Teacher ON Teacher.Id=CourseAssignTeacher.TeacherId





GO
/****** Object:  View [dbo].[ViewClassSchedule]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewClassSchedule]
AS
SELECT Course.Code, Course.Name, Course.DepartmentId, RoomNo.Name AS RoomNumber, Day.Name AS Days, 
AllocateClassroom.FromTime,AllocateClassroom.ToTime,AllocateClassroom.Valid FROM Course
LEFT JOIN AllocateClassroom ON AllocateClassroom.CourseId=Course.Id
LEFT JOIN Day ON AllocateClassroom.DayId=Day.Id
LEFT JOIN RoomNo ON AllocateClassroom.RoomId=RoomNo.Id
GO
/****** Object:  View [dbo].[ViewResult]    Script Date: 30-Sep-16 5:09:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[ViewResult]
AS 
SELECT Students.Id AS StudentId, Students.RegistrationNo, Course.Code,Course.Name,GradeLetter.Name AS Grade FROM CourseEnroll 
left join StudentResult on StudentResult.StudentId=CourseEnroll.StudentId AND StudentResult.CourseId=CourseEnroll.CourseId
left join Students on Students.Id=CourseEnroll.StudentId
left join Course on Course.Id=CourseEnroll.CourseId
left join GradeLetter on GradeLetter.Id=StudentResult.GradeLetterId


GO
SET IDENTITY_INSERT [dbo].[AllocateClassroom] ON 

INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (1, 1, 1, 1, 1, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x070010ACD1530000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (2, 1, 2, 1, 1, CAST(0x070010ACD1530000 AS Time), CAST(0x0700E03495640000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (3, 1, 7, 8, 2, CAST(0x0700E03495640000 AS Time), CAST(0x0700B0BD58750000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (4, 2, 3, 14, 3, CAST(0x07007870335C0000 AS Time), CAST(0x0700E03495640000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (5, 2, 9, 16, 3, CAST(0x0700B0BD58750000 AS Time), CAST(0x070080461C860000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (6, 1002, 15, 10, 1, CAST(0x0700B0BD58750000 AS Time), CAST(0x07001882BA7D0000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (7, 1002, 13, 13, 4, CAST(0x07001882BA7D0000 AS Time), CAST(0x070080461C860000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (8, 1003, 5, 10, 2, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x070010ACD1530000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (9, 1003, 6, 11, 1, CAST(0x07007870335C0000 AS Time), CAST(0x0700E03495640000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (10, 1, 1, 2, 3, CAST(0x0700B0BD58750000 AS Time), CAST(0x07001882BA7D0000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (11, 1, 2, 3, 3, CAST(0x07001882BA7D0000 AS Time), CAST(0x070080461C860000 AS Time), N'True')
INSERT [dbo].[AllocateClassroom] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [FromTime], [ToTime], [Valid]) VALUES (1002, 1, 1, 9, 5, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x07007870335C0000 AS Time), N'True')
SET IDENTITY_INSERT [dbo].[AllocateClassroom] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (1, N'CSE-101', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'Basic Concept on Computer', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (2, N'CSE-102', N'Computer Fundamental unique', CAST(1.00 AS Decimal(18, 2)), N'Computer', 1, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (3, N'EEE-101', N'Basic Electronics', CAST(3.00 AS Decimal(18, 2)), N'Basic of Electronics ', 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (4, N'EEE-102', N'Basic Electronics Sessional', CAST(1.00 AS Decimal(18, 2)), N'Basic of Electronics Sessional', 2, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (5, N'ELL-101', N'English First Paper', CAST(3.00 AS Decimal(18, 2)), N'Basic of English First Paper', 1003, 1)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (6, N'ELL-102', N'English Second Paper', CAST(3.00 AS Decimal(18, 2)), N'Basic of English Second Paper', 1003, 2)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (7, N'CSE-2301', N'Programming With Java', CAST(3.00 AS Decimal(18, 2)), N'Basic of Programming With Java', 1, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (8, N'CSE-2302', N'Programming With Java Sessional', CAST(2.00 AS Decimal(18, 2)), N'Basic Programming With Java Sessional', 1, 4)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (9, N'EEE-2301', N'Digital Logic Design', CAST(3.00 AS Decimal(18, 2)), N'Basic of Digital Logic Design', 2, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (10, N'EEE-2302', N'Digital Logic Design Sessional', CAST(1.50 AS Decimal(18, 2)), N'Basic of Digital Logic Design Sessional', 2, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (11, N'ELL-1101', N'Requirement of English Course', CAST(4.00 AS Decimal(18, 2)), N'Fundamental of Requirement of English Course', 1003, 3)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (12, N'ELL-1102', N'Fundamental English Course', CAST(4.00 AS Decimal(18, 2)), N'Basic of Fundamental English Course', 1003, 5)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (13, N'BBA-4801', N'Economics', CAST(3.00 AS Decimal(18, 2)), N'Basic of Economics', 1002, 8)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (14, N'BBA-4805', N'Finance', CAST(4.00 AS Decimal(18, 2)), N'Basic of Finance', 1002, 8)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId]) VALUES (15, N'BBA-3604', N'Industrial Management', CAST(5.00 AS Decimal(18, 2)), N'Industrial Management', 1002, 6)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] ON 

INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1, 1, 1, 1, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (8, 1, 4, 2, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (9, 1003, 7, 5, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (10, 1003, 7, 6, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (11, 1, 4, 7, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (13, 2, 6, 9, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (14, 1002, 8, 13, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (15, 1002, 12, 14, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (16, 1002, 8, 15, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (17, 1003, 9, 11, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (18, 1, 1, 1, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (19, 1, 1, 2, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (20, 1, 1, 1, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (21, 1, 1, 2, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (22, 1, 4, 7, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (23, 1, 4, 8, N'False')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (24, 1, 1, 1, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (25, 1, 1, 7, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1018, 1, 4, 2, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1019, 1, 4, 8, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1020, 2, 6, 3, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1021, 2, 6, 4, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1022, 2, 2, 9, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1023, 2, 2, 10, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1024, 1002, 8, 13, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1025, 1002, 8, 14, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1026, 1003, 9, 5, N'True')
INSERT [dbo].[CourseAssignTeacher] ([Id], [DepartmentId], [TeacherId], [CourseId], [Valid]) VALUES (1027, 1003, 9, 11, N'True')
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] OFF
SET IDENTITY_INSERT [dbo].[CourseEnroll] ON 

INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (21, 1010, 1, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (22, 1010, 2, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (23, 1010, 7, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (24, 1010, 8, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (25, 1011, 1, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (26, 1011, 2, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (27, 1011, 7, CAST(0x75250B00 AS Date))
INSERT [dbo].[CourseEnroll] ([Id], [StudentId], [CourseId], [Date]) VALUES (28, 1011, 8, CAST(0x75250B00 AS Date))
SET IDENTITY_INSERT [dbo].[CourseEnroll] OFF
SET IDENTITY_INSERT [dbo].[Day] ON 

INSERT [dbo].[Day] ([Id], [Name]) VALUES (1, N'Saturday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (2, N'Sunday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (3, N'Monday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (4, N'Tuesday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (5, N'Wednesday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (6, N'Thursday')
INSERT [dbo].[Day] ([Id], [Name]) VALUES (7, N'Friday')
SET IDENTITY_INSERT [dbo].[Day] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1, N'CSE', N'Computer Science and Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2, N'EEE', N'Electrical and Electric Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1002, N'BBA', N'Bachelor of Business Administration')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1003, N'ELL', N'English Language and Letareture')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (2, N'Associate Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (3, N'Assistant Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (4, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[GradeLetter] ON 

INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (1, N'A+')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (2, N'A')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (3, N'A-')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (4, N'B+')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (5, N'B')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (6, N'B-')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (7, N'C+')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (8, N'C')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (9, N'C-')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (10, N'D+')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (11, N'D')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (12, N'D-')
INSERT [dbo].[GradeLetter] ([Id], [Name]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[GradeLetter] OFF
SET IDENTITY_INSERT [dbo].[RoomNo] ON 

INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (1, N'A-301')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (2, N'A-302')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (3, N'A-303')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (8, N'A-LAB-01')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (9, N'A-LAB-02')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (10, N'B-301')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (11, N'B-302')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (12, N'B-LAB-01')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (13, N'B-LAB-02')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (14, N'C-401')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (15, N'C-402')
INSERT [dbo].[RoomNo] ([Id], [Name]) VALUES (16, N'C-LAB-01')
SET IDENTITY_INSERT [dbo].[RoomNo] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'1st')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'2nd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'3rd')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'4th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'5th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'6th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'7th')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'8th')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (16, 1010, 7, 3)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (17, 1010, 1, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (18, 1010, 2, 2)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (19, 1011, 1, 4)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (20, 1011, 2, 5)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeLetterId]) VALUES (21, 1011, 7, 6)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1010, N'Talat Mahmud', N'tmsourave@gmail.com', N'01856538432', CAST(0xE33A0B00 AS Date), N'Sonaimuri, Noakhali, Chittagong', 1, N'CSE-2016-001')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1011, N'Osman Goni', N'osmangoni@yahoo.com', N'01815798385', CAST(0xE33A0B00 AS Date), N'Sonaimuri, Noakhali', 1, N'CSE-2016-002')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1012, N'Mirza Galib', N'galib@gmail.com', N'01791675438', CAST(0x2C3A0B00 AS Date), N'Chatkhil, Noakhali', 1002, N'BBA-2015-001')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1013, N'Asifujjaman Emon', N'asifujjaman@ymail.com', N'01689658280', CAST(0x78390B00 AS Date), N'Comilla', 1002, N'BBA-2015-002')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1014, N'Tanzimul Alom Tanim', N'tanim@gmail.com', N'01898238743', CAST(0x693C0B00 AS Date), N'Sitakundo, Chittagong', 2, N'EEE-2017-001')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1015, N'Sahadat Hossain Rimon', N'rimon@yahoo.com', N'01818909654', CAST(0x1F3D0B00 AS Date), N'Chittagong', 2, N'EEE-2017-002')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1016, N'Imran Hossain', N'imran@gmail.com', N'01515786593', CAST(0xE33A0B00 AS Date), N'Lokkhipur, Chittagong', 1003, N'ELL-2016-001')
INSERT [dbo].[Students] ([Id], [Name], [Email], [ContactNo], [Date], [Address], [DepartmentId], [RegistrationNo]) VALUES (1017, N'Hasnatul Korim', N'hasnat@yahoo.com', N'01617897653', CAST(0xE33A0B00 AS Date), N'Satkania, Chittagong', 1003, N'ELL-2016-002')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (1, N'Md. Shafiullah', N'Noakhali', N'shafiullah@gmail.com', N'01815798384', 2, 1, CAST(30.00 AS Decimal(18, 2)), CAST(24.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (2, N'Md. Arif Hasnain', N'Chittagong', N'arifhasnain@gmail.com', N'01670568342', 4, 2, CAST(20.00 AS Decimal(18, 2)), CAST(15.50 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (4, N'Md. Khalilujjaman', N'Chandgaon, Chittagong', N'khalil_01@yahoo.com', N'01786543925', 3, 1, CAST(35.00 AS Decimal(18, 2)), CAST(32.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (6, N'Md. Ruhul Amin', N'Agrabad', N'ruhulamin@ymail.com', N'01856548432', 3, 2, CAST(30.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (7, N'Habibullah Mohiuddin', N'Khulna', N'habibullah@ymail.com', N'01915653482', 2, 1003, CAST(5.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (8, N'Ayesha Ruma', N'Chatkhil, Noakhali', N'ruma@gmail.com', N'01675348294', 1, 1002, CAST(10.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (9, N'Jannat Shosi', N'Feni', N'shosi@gmail.com', N'01876349264', 2, 1003, CAST(8.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (10, N'Kazi Ruba', N'Chand Pur', N'ruba@gmail.com', N'01923846782', 3, 1003, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (11, N'Farjana Binte Momin', N'Maijdee, Noakhali', N'farjana@gmail.com', N'01752459302', 3, 1003, CAST(10.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditTaken], [RemainingCredit]) VALUES (12, N'Taslima Akter', N'Maijdee', N'taslima@yahoo.com', N'01756349854', 4, 1002, CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Course]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Day] FOREIGN KEY([DayId])
REFERENCES [dbo].[Day] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Day]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_Department]
GO
ALTER TABLE [dbo].[AllocateClassroom]  WITH CHECK ADD  CONSTRAINT [FK_AllocateClassroom_RoomNo] FOREIGN KEY([RoomId])
REFERENCES [dbo].[RoomNo] ([Id])
GO
ALTER TABLE [dbo].[AllocateClassroom] CHECK CONSTRAINT [FK_AllocateClassroom_RoomNo]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Department]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Semester] FOREIGN KEY([SemesterId])
REFERENCES [dbo].[Semester] ([Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Semester]
GO
ALTER TABLE [dbo].[CourseAssignTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTeacher_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTeacher] CHECK CONSTRAINT [FK_CourseAssignTeacher_Course]
GO
ALTER TABLE [dbo].[CourseAssignTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTeacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTeacher] CHECK CONSTRAINT [FK_CourseAssignTeacher_Department]
GO
ALTER TABLE [dbo].[CourseAssignTeacher]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssignTeacher_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([Id])
GO
ALTER TABLE [dbo].[CourseAssignTeacher] CHECK CONSTRAINT [FK_CourseAssignTeacher_Teacher]
GO
ALTER TABLE [dbo].[CourseEnroll]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnroll_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[CourseEnroll] CHECK CONSTRAINT [FK_CourseEnroll_Course]
GO
ALTER TABLE [dbo].[CourseEnroll]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnroll_CourseEnroll] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[CourseEnroll] CHECK CONSTRAINT [FK_CourseEnroll_CourseEnroll]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Department]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Designation]
GO
USE [master]
GO
ALTER DATABASE [UniversityResultManagement] SET  READ_WRITE 
GO
