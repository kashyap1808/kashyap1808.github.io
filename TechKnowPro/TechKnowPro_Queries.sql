use [master]
go
drop database if exists [TechKnowPro]
go
CREATE DATABASE [TechKnowPro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechKnowPro', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\TechKnowPro.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TechKnowPro_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\TechKnowPro_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TechKnowPro] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechKnowPro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechKnowPro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechKnowPro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechKnowPro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechKnowPro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechKnowPro] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechKnowPro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechKnowPro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechKnowPro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechKnowPro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechKnowPro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechKnowPro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechKnowPro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechKnowPro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechKnowPro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechKnowPro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechKnowPro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechKnowPro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechKnowPro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechKnowPro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechKnowPro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechKnowPro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechKnowPro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechKnowPro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TechKnowPro] SET  MULTI_USER 
GO
ALTER DATABASE [TechKnowPro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechKnowPro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechKnowPro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechKnowPro] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TechKnowPro] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TechKnowPro]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_ContactList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Incident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IncidentNo] [varchar](100) NULL,
	[CustomerId] [int] NOT NULL,
	[ReportTime] [datetime] NOT NULL,
	[Description] [int] NULL,
	[Comments] [nvarchar](max) NULL,
	[ContactVia] [nvarchar](max) NULL,
 CONSTRAINT [PK_Incident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Register](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfileName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[JoinDate] [datetime] NULL,
	[Email] [nvarchar](256) NULL,
	[Password] [nvarchar](max) NULL,
	[Position] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[UserLevel] [int] NULL,
	[Image] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Answer] [nvarchar](50) NULL,
	[SecurityQuestionId] [int] NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SecurityQuestions](
	[Id] [int] NOT NULL,
	[Questions] [varchar](1) NULL,
 CONSTRAINT [PK_SecurityQuestions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IncidentId] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[ResponseTime] [nvarchar](50) NULL,
	[Technician] [nvarchar](50) NULL,
	[ProblemRes] [nvarchar](50) NULL,
	[Comments] [nvarchar](max) NULL,
	[ContactVia] [nvarchar](max) NULL,
	[QusetionId] [int] NOT NULL,
	[Answer] [nvarchar](50) NULL,
 CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ContactList] ON 

INSERT [dbo].[ContactList] ([Id], [CustomerId], [UserId]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[ContactList] OFF
SET IDENTITY_INSERT [dbo].[Incident] ON 

INSERT [dbo].[Incident] ([Id], [IncidentNo], [CustomerId], [ReportTime], [Description], [Comments], [ContactVia]) VALUES (1, N'INC001', 1, CAST(N'2019-03-17 00:00:00.000' AS DateTime), 1, N'TEST', N'1')
INSERT [dbo].[Incident] ([Id], [IncidentNo], [CustomerId], [ReportTime], [Description], [Comments], [ContactVia]) VALUES (2, N'INC/2', 1, CAST(N'2019-03-17 15:26:29.000' AS DateTime), NULL, N'Test', N'2')
SET IDENTITY_INSERT [dbo].[Incident] OFF
SET IDENTITY_INSERT [dbo].[Register] ON 

INSERT [dbo].[Register] ([Id], [ProfileName], [FirstName], [LastName], [JoinDate], [Email], [Password], [Position], [PhoneNumber], [UserName], [UserLevel], [Image], [Address], [Answer], [SecurityQuestionId]) VALUES (1, N'Rrose5132', N'Abdul', N'Haseeb', NULL, N'hasi5132@hotmail.com', N'test123', N'Developer', NULL, N'hasi5132@hotmail.com', 3, NULL, NULL, N'TEST', NULL)
INSERT [dbo].[Register] ([Id], [ProfileName], [FirstName], [LastName], [JoinDate], [Email], [Password], [Position], [PhoneNumber], [UserName], [UserLevel], [Image], [Address], [Answer], [SecurityQuestionId]) VALUES (2, NULL, N'Admin', N'Admin', NULL, N'admin@gmail.com', N'admin123', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Register] ([Id], [ProfileName], [FirstName], [LastName], [JoinDate], [Email], [Password], [Position], [PhoneNumber], [UserName], [UserLevel], [Image], [Address], [Answer], [SecurityQuestionId]) VALUES (3, NULL, N'Technician', N'Technician', NULL, N'Technician@gmail.com', N'Technician123', NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Register] OFF
SET IDENTITY_INSERT [dbo].[Survey] ON 

INSERT [dbo].[Survey] ([Id], [IncidentId], [CustomerId], [ResponseTime], [Technician], [ProblemRes], [Comments], [ContactVia], [QusetionId], [Answer]) VALUES (1, 2, 1, N'NotSatisfied', N'SomeWhat Satisfied', N' Completely Satisfied', N'Test', N'Phone', 0, NULL)
SET IDENTITY_INSERT [dbo].[Survey] OFF
ALTER TABLE [dbo].[ContactList]  WITH CHECK ADD  CONSTRAINT [FK_ContactList_Register] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Register] ([Id])
GO
ALTER TABLE [dbo].[ContactList] CHECK CONSTRAINT [FK_ContactList_Register]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_Register1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Register] ([Id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Register1]
GO
ALTER TABLE [dbo].[Register]  WITH CHECK ADD  CONSTRAINT [FK_Register_SecurityQuestions] FOREIGN KEY([SecurityQuestionId])
REFERENCES [dbo].[SecurityQuestions] ([Id])
GO
ALTER TABLE [dbo].[Register] CHECK CONSTRAINT [FK_Register_SecurityQuestions]
GO
ALTER TABLE [dbo].[Survey]  WITH CHECK ADD  CONSTRAINT [FK_Survey_Incident] FOREIGN KEY([IncidentId])
REFERENCES [dbo].[Incident] ([Id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_Incident]
GO
USE [master]
GO
ALTER DATABASE [TechKnowPro] SET  READ_WRITE 
GO