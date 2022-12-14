USE [master]
GO
/****** Object:  Database [StudentsBase]    Script Date: 22.09.2022 6:27:25 ******/
CREATE DATABASE [StudentsBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentsBase', FILENAME = N'D:\Soft\SQL Base Files\Data\StudentsBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentsBase_log', FILENAME = N'D:\Soft\SQL Base Files\Data\StudentsBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentsBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentsBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentsBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentsBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentsBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentsBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentsBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentsBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentsBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentsBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentsBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentsBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentsBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentsBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentsBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentsBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentsBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentsBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentsBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentsBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentsBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentsBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentsBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentsBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentsBase] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentsBase] SET  MULTI_USER 
GO
ALTER DATABASE [StudentsBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentsBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentsBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentsBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentsBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentsBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentsBase', N'ON'
GO
ALTER DATABASE [StudentsBase] SET QUERY_STORE = OFF
GO
USE [StudentsBase]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 22.09.2022 6:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[HomeAddress] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HighSchools]    Script Date: 22.09.2022 6:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HighSchools](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[HighSchool] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_HighSchools] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 22.09.2022 6:27:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[FullName] [nvarchar](200) NOT NULL,
	[Birthday] [datetime] NOT NULL,
	[HomeAddressId] [int] NOT NULL,
	[HighSchoolId] [int] NOT NULL,
	[Course] [int] NOT NULL,
	[Speciality] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (0, N'Озерный пер., д. 19 кв.137')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (1, N'Сельская ул., д. 14 кв.116')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (2, N'Интернациональная ул., д. 19 кв.137')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (3, N'Рабочая ул., д. 16 кв.14')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (4, N'Сельская ул., д. 25 кв.72')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (5, N'Приозерная ул., д. 16 кв.52')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (6, N'Комсомольская ул., д. 20 кв.114')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (7, N'Мирная ул., д. 24 кв.46')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (8, N'Новая ул., д. 13 кв.89')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (9, N'Октябрьская ул., д. 1 кв.194')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (10, N'Кирова ул., д. 2 кв.103')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (11, N'Мирная ул., д. 7 кв.165')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (12, N'Центральный пер., д. 22 кв.71')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (13, N'Заречный пер., д. 10 кв.50')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (14, N'Сосновая ул., д. 7 кв.138')
INSERT [dbo].[Addresses] ([Id], [HomeAddress]) VALUES (15, N'Радужная ул., д. 4 кв.219')
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[HighSchools] ON 

INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (0, N'Лицей №4 города Ульяновска')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (1, N'Школа №6 города Тюмени
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (2, N'Лицей №96 города Кирова
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (3, N'Лицей №2 города Ярославля
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (4, N'Гимназия №98 города Хабаровска
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (5, N'Школа №40 города Хабаровска
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (6, N'Школа №22 города Геленджика
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (7, N'Гимназия №938 города Махачкалы
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (8, N'Гимназия №5 города Ярославля
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (9, N'Школа №7 города Владимира
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (10, N'Лицей №44 города Ростов-на-дону
')
INSERT [dbo].[HighSchools] ([Id], [HighSchool]) VALUES (11, N'Лицей №89 города Новороссийск
')
SET IDENTITY_INSERT [dbo].[HighSchools] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FullName], [Birthday], [HomeAddressId], [HighSchoolId], [Course], [Speciality]) VALUES (0, N'Янушко Алла Сократович', CAST(N'1999-05-01T00:00:00.000' AS DateTime), 0, 4, 4, N'ПМИ-83 2.182')
INSERT [dbo].[Students] ([Id], [FullName], [Birthday], [HomeAddressId], [HighSchoolId], [Course], [Speciality]) VALUES (1, N'Ягафаров Яков Казимировна', CAST(N'1996-12-15T00:00:00.000' AS DateTime), 1, 3, 4, N'ПМИ-81 3.782')
INSERT [dbo].[Students] ([Id], [FullName], [Birthday], [HomeAddressId], [HighSchoolId], [Course], [Speciality]) VALUES (2, N'Закрятин Жанна Александрович', CAST(N'1998-12-12T00:00:00.000' AS DateTime), 2, 2, 2, N'ПМ-82 4.422')
INSERT [dbo].[Students] ([Id], [FullName], [Birthday], [HomeAddressId], [HighSchoolId], [Course], [Speciality]) VALUES (3, N'Кирьянов Берта Кондратиевич', CAST(N'1998-08-16T00:00:00.000' AS DateTime), 3, 1, 1, N'ПМИ-81 3.857')
INSERT [dbo].[Students] ([Id], [FullName], [Birthday], [HomeAddressId], [HighSchoolId], [Course], [Speciality]) VALUES (4, N'Занин Эльвира Афанасиевна', CAST(N'1998-03-19T00:00:00.000' AS DateTime), 4, 0, 3, N'4 ПМИ-84 3.352')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Addresses] FOREIGN KEY([HomeAddressId])
REFERENCES [dbo].[Addresses] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Addresses]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_HighSchools] FOREIGN KEY([HighSchoolId])
REFERENCES [dbo].[HighSchools] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_HighSchools]
GO
USE [master]
GO
ALTER DATABASE [StudentsBase] SET  READ_WRITE 
GO
