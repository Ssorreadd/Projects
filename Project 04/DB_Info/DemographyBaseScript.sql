USE [master]
GO
/****** Object:  Database [DemographyBase]    Script Date: 22.09.2022 1:34:53 ******/
CREATE DATABASE [DemographyBase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemographyBase', FILENAME = N'D:\Soft\SQL Base Files\Data\DemographyBase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemographyBase_log', FILENAME = N'D:\Soft\SQL Base Files\Data\DemographyBase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemographyBase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemographyBase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemographyBase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemographyBase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemographyBase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemographyBase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemographyBase] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemographyBase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemographyBase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemographyBase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemographyBase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemographyBase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemographyBase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemographyBase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemographyBase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemographyBase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemographyBase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemographyBase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemographyBase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemographyBase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemographyBase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemographyBase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemographyBase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemographyBase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemographyBase] SET RECOVERY FULL 
GO
ALTER DATABASE [DemographyBase] SET  MULTI_USER 
GO
ALTER DATABASE [DemographyBase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemographyBase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemographyBase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemographyBase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemographyBase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemographyBase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DemographyBase', N'ON'
GO
ALTER DATABASE [DemographyBase] SET QUERY_STORE = OFF
GO
USE [DemographyBase]
GO
/****** Object:  Table [dbo].[CauseOfDeath]    Script Date: 22.09.2022 1:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauseOfDeath](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[CauseOfDeath] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_CauseOfDeath] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryInfo]    Script Date: 22.09.2022 1:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryInfo](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[PlaceOfBirth] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CountryInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeathPeople]    Script Date: 22.09.2022 1:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeathPeople](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Surname] [nvarchar](70) NOT NULL,
	[Patronymic] [nvarchar](70) NULL,
	[Gender] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[PlaceOfBirthID] [int] NOT NULL,
	[Deathday] [date] NOT NULL,
	[PlaceOfDeathId] [int] NOT NULL,
	[CauseOfDeathId] [int] NOT NULL,
 CONSTRAINT [PK_DeathPeople] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GenderType]    Script Date: 22.09.2022 1:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GenderType](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Gender] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_GenderType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewbornPeople]    Script Date: 22.09.2022 1:34:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewbornPeople](
	[Id] [int] IDENTITY(0,1) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Surname] [nvarchar](70) NOT NULL,
	[Patronymic] [nvarchar](70) NULL,
	[GenderId] [int] NOT NULL,
	[BirthdayDate] [date] NOT NULL,
	[PlaceOfBirthId] [int] NOT NULL,
	[MotherInfo] [nvarchar](150) NULL,
	[FatherInfo] [nvarchar](150) NULL,
 CONSTRAINT [PK_NewbornPeople] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CauseOfDeath] ON 

INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (0, N'Ишемическая болезнь сердца')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (1, N'Инсульт')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (2, N'Хроническая обструктивная болезнь легких')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (3, N'Инфекции нижних дыхательных путей')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (4, N'Неонатальные патологические состояния')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (5, N'Рак трахеи')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (6, N'Рак бронхов')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (7, N'Рак легких')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (8, N'Рак мозга')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (9, N'Инфаркт')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (10, N'Рак кожи')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (11, N'Деменция')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (12, N'Кишечные инфекции')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (13, N'Сахарный диабет')
INSERT [dbo].[CauseOfDeath] ([Id], [CauseOfDeath]) VALUES (14, N'Заболевания почек')
SET IDENTITY_INSERT [dbo].[CauseOfDeath] OFF
GO
SET IDENTITY_INSERT [dbo].[CountryInfo] ON 

INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (0, N'Абхазия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (1, N'Авдаленд')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (2, N'Австралия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (3, N'Австрия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (4, N'Азавад')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (5, N'Азад Джамму и Кашмир')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (6, N'Азания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (7, N'Азербайджан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (8, N'Азорские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (9, N'Аландские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (10, N'Албания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (11, N'Алжир')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (12, N'Американское Самоа')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (13, N'Ангилья')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (14, N'Ангола')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (15, N'Андорра')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (16, N'Антарктида')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (17, N'Антигуа и Барбуда')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (18, N'Аргентина')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (19, N'Армения')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (20, N'Аруба')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (21, N'Афганистан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (22, N'Багамские Острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (23, N'Бангладеш')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (24, N'Барбадос')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (25, N'Бахрейн')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (26, N'Белиз')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (27, N'Белоруссия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (28, N'Бельгия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (29, N'Бенин')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (30, N'Бермудские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (31, N'Бир-Тавиль')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (32, N'Болгария')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (33, N'Боливия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (34, N'Бонэйр')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (35, N'Босния и Герцеговина')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (36, N'Ботсвана')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (37, N'Бразилия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (38, N'Британская территория в Индийском океане')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (39, N'Британские Виргинские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (40, N'Бруней')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (41, N'Буркина-Фасо')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (42, N'Бурунди')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (43, N'Бутан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (44, N'Вазиристан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (45, N'Вануату')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (46, N'Ватикан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (47, N'Великобритания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (48, N'Венгрия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (49, N'Венесуэла')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (50, N'Виргинские острова США')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (51, N'Восточный Тимор')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (52, N'Вьетнам')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (53, N'Габон')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (54, N'Гавайи')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (55, N'Гаити')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (56, N'Гайана')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (57, N'Галмудуг')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (58, N'Гамбия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (59, N'Гана')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (60, N'Гваделупа')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (61, N'Гватемала')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (62, N'Гвиана')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (63, N'Гвинея')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (64, N'Гвинея-Бисау')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (65, N'Германия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (66, N'Гернси')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (67, N'Гибралтар')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (68, N'Голанские высоты')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (69, N'Гондурас')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (70, N'Гонконг')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (71, N'Государство Ва')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (72, N'Государство Палестина')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (73, N'Государство Шан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (74, N'Гренада')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (75, N'Гренландия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (76, N'Греция')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (77, N'Грузия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (78, N'Гуам')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (79, N'Дания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (80, N'Джерси')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (81, N'Джибути')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (82, N'Джубаленд')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (83, N'Доминика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (84, N'Доминиканская Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (85, N'Донецкая Народная Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (86, N'ДР Конго')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (87, N'Египет')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (88, N'Замбия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (89, N'Зимбабве')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (90, N'Израиль')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (91, N'Индия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (92, N'Индонезия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (93, N'Иордания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (94, N'Ирак')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (95, N'Иран')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (96, N'Ирландия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (97, N'Исландия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (98, N'Испания')
GO
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (99, N'Италия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (100, N'Йемен')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (101, N'Кабо-Верде')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (102, N'Казахстан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (103, N'Каймановы острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (104, N'Камбоджа')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (105, N'Камерун')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (106, N'Канада')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (107, N'Канарские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (108, N'Катар')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (109, N'Кения')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (110, N'Кипр')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (111, N'Киргизия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (112, N'Кирибати')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (113, N'Китай')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (114, N'Китайская Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (115, N'КНДР')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (116, N'Кокосовые острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (117, N'Колумбия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (118, N'Коморские Острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (119, N'Коста-Рика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (120, N'Куба')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (121, N'Кувейт')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (122, N'Кука острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (123, N'Кюрасао')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (124, N'Лаос')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (125, N'Латвия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (126, N'Лесото')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (127, N'Либерия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (128, N'Ливан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (129, N'Ливия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (130, N'Литва')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (131, N'Лихтенштейн')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (132, N'Луганская Народная Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (133, N'Люксембург')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (134, N'Маврикий')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (135, N'Мавритания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (136, N'Мадагаскар')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (137, N'Мадейра')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (138, N'Майотта')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (139, N'Макао')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (140, N'Малави')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (141, N'Малайзия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (142, N'Мали')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (143, N'Мальдивские Острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (144, N'Мальта')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (145, N'Мальтийский орден')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (146, N'Марокко')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (147, N'Мартиника')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (148, N'Маршалловы Острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (149, N'Мексика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (150, N'Мелилья')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (151, N'Мозамбик')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (152, N'Молдавия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (153, N'Монако')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (154, N'Монголия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (155, N'Монтсеррат')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (156, N'Мьянма')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (157, N'Нагорно-Карабахская Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (158, N'Намибия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (159, N'Науру')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (160, N'Непал')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (161, N'Нигер')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (162, N'Нигерия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (163, N'Нидерланды')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (164, N'Никарагуа')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (165, N'Ниуэ')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (166, N'Новая Зеландия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (167, N'Новая Каледония')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (168, N'Норвегия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (169, N'ОАЭ')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (170, N'Оман')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (171, N'Остров Мэн')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (172, N'Остров Норфолк')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (173, N'Остров Рождества')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (174, N'Острова Питкэрн')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (175, N'Острова Святой Елены, Вознесения и Тристан-да-Кунья')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (176, N'Пакистан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (177, N'Палау')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (178, N'Панама')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (179, N'Папуа - Новая Гвинея')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (180, N'Парагвай')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (181, N'Перу')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (182, N'Польша')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (183, N'Португалия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (184, N'Приднестровская Молдавская Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (185, N'Пунтленд')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (186, N'Пуэрто-Рико')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (187, N'Республика Конго')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (188, N'Республика Корея')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (189, N'Республика Косово')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (190, N'Реюньон')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (191, N'Россия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (192, N'Руанда')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (193, N'Румыния')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (194, N'Саба')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (195, N'Сальвадор')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (196, N'Самоа')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (197, N'Сан-Марино')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (198, N'Сан-Томе и Принсипи')
GO
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (199, N'Саудовская Аравия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (200, N'Сахарская Арабская Демократическая Республика')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (201, N'Северная Македония')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (202, N'Северные Марианские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (203, N'Сейшельские Острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (204, N'Сен-Бартелеми')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (205, N'Сенегал')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (206, N'Сен-Мартен')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (207, N'Сен-Пьер и Микелон')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (208, N'Сент-Винсент и Гренадины')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (209, N'Сент-Китс и Невис')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (210, N'Сент-Люсия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (211, N'Сербия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (212, N'Сеута')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (213, N'Силенд')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (214, N'Сингапур')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (215, N'Синт-Мартен')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (216, N'Синт-Эстатиус')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (217, N'Сирия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (218, N'Словакия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (219, N'Словения')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (220, N'Соломоновы Острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (221, N'Сомали')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (222, N'Сомалиленд')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (223, N'Судан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (224, N'Суринам')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (225, N'США')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (226, N'Сьерра-Леоне')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (227, N'Таджикистан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (228, N'Таиланд')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (229, N'Танзания')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (230, N'Теркс и Кайкос')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (231, N'Того')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (232, N'Токелау')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (233, N'Тонга')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (234, N'Тринидад и Тобаго')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (235, N'Тувалу')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (236, N'Тунис')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (237, N'Турецкая Республика Северного Кипра')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (238, N'Туркмения')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (239, N'Турция')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (240, N'Уганда')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (241, N'Узбекистан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (242, N'Украина')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (243, N'Уоллис и Футуна')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (244, N'Уругвай')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (245, N'Фарерские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (246, N'Федеративные Штаты Микронезии')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (247, N'Фиджи')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (248, N'Филиппины')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (249, N'Финляндия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (250, N'Фолклендские острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (251, N'Франция')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (252, N'Французская Полинезия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (253, N'Французские Южные и Антарктические территории')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (254, N'Химан и Хеб')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (255, N'Хорватия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (256, N'ЦАР')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (257, N'Чад')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (258, N'Черногория')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (259, N'Чехия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (260, N'Чили')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (261, N'Швейцария')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (262, N'Швеция')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (263, N'Шпицберген')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (264, N'Шри-Ланка')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (265, N'Эквадор')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (266, N'Экваториальная Гвинея')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (267, N'Эритрея')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (268, N'Эсватини')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (269, N'Эстония')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (270, N'Эфиопия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (271, N'ЮАР')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (272, N'Южная Георгия и Южные Сандвичевы острова')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (273, N'Южная Осетия')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (274, N'Южный Судан')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (275, N'Ямайка')
INSERT [dbo].[CountryInfo] ([Id], [PlaceOfBirth]) VALUES (276, N'Япония')
SET IDENTITY_INSERT [dbo].[CountryInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[DeathPeople] ON 

INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (7, N'Зоя', N'Боньча', N'Семеновна', 1, CAST(N'1975-03-04' AS Date), 178, CAST(N'2019-07-22' AS Date), 276, 0)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (8, N'Давид', N'Акулов', N'Себастьянович', 0, CAST(N'1977-02-16' AS Date), 69, CAST(N'2016-12-19' AS Date), 146, 4)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (9, N'Нонна', N'Мамина', N'Юлиановна', 1, CAST(N'1985-02-04' AS Date), 142, CAST(N'2020-06-23' AS Date), 79, 8)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (10, N'Антонина', N'Андрианова', N'Давидовна', 1, CAST(N'1972-02-15' AS Date), 1, CAST(N'2016-11-20' AS Date), 0, 14)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (11, N'Надежда', N'Сырова', N'Акимовна', 1, CAST(N'1991-09-14' AS Date), 88, CAST(N'2015-03-19' AS Date), 0, 14)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (12, N'Леонтий', N'Щеткин', N'Вениаминович', 0, CAST(N'1983-04-21' AS Date), 2, CAST(N'2020-05-23' AS Date), 21, 4)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (14, N'Егор', N'Грачев', N'Тимофеевич', 0, CAST(N'1996-05-07' AS Date), 276, CAST(N'2014-10-27' AS Date), 276, 0)
INSERT [dbo].[DeathPeople] ([Id], [Name], [Surname], [Patronymic], [Gender], [Birthday], [PlaceOfBirthID], [Deathday], [PlaceOfDeathId], [CauseOfDeathId]) VALUES (15, N'Антон', N'Евреев', N'Дмитриевич', 0, CAST(N'2000-01-01' AS Date), 0, CAST(N'2004-01-01' AS Date), 0, 14)
SET IDENTITY_INSERT [dbo].[DeathPeople] OFF
GO
SET IDENTITY_INSERT [dbo].[GenderType] ON 

INSERT [dbo].[GenderType] ([Id], [Gender]) VALUES (0, N'Мужской')
INSERT [dbo].[GenderType] ([Id], [Gender]) VALUES (1, N'Женский')
SET IDENTITY_INSERT [dbo].[GenderType] OFF
GO
SET IDENTITY_INSERT [dbo].[NewbornPeople] ON 

INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (0, N'Аполлинария', N'Рыжанова', N'Ефремовна', 1, CAST(N'2022-07-11' AS Date), 56, N'Рыжанова Евгения Потапова', N'Рыжанов Ефрем Олегович')
INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (1, N'Константин', N'Цыринский', N'Порфирьевич', 0, CAST(N'2022-02-12' AS Date), 174, N'Цыринская Александра Владимировна', N'Цыринский Порфий Владиславович')
INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (2, N'Леонтий', N'Бортник', N'Трофимович', 0, CAST(N'2022-05-03' AS Date), 100, N'Бортник Арина Юрьевна', N'Бортник Трофим Александрович')
INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (3, N'Людмила', N'Эрнет', N'Адамовна', 1, CAST(N'2022-12-24' AS Date), 0, N'Эрнет Татьяна Юрьевна', N'Эрнет Адам Сергеевич')
INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (4, N'Константин', N'Епанчин', N'Феоктистович', 0, CAST(N'2022-10-14' AS Date), 98, N'Епанчина Мария Сергеевна', N'Епанчин Феоктист Павлович')
INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (5, N'Алина', N'Бурцова', N'Семеновна', 1, CAST(N'2022-10-21' AS Date), 46, N'Бурцова Елизавета Петровна', N'Бурцов Семён Игоревич')
INSERT [dbo].[NewbornPeople] ([Id], [Name], [Surname], [Patronymic], [GenderId], [BirthdayDate], [PlaceOfBirthId], [MotherInfo], [FatherInfo]) VALUES (6, N'Алексей', N'Кузин', N'Арсеньевич', 0, CAST(N'2022-03-12' AS Date), 202, N'Кузина Яна Дмитриевна', N'Кузин Арсен Джамалов')
SET IDENTITY_INSERT [dbo].[NewbornPeople] OFF
GO
ALTER TABLE [dbo].[DeathPeople]  WITH CHECK ADD  CONSTRAINT [FK_DeathPeople_CauseOfDeath1] FOREIGN KEY([CauseOfDeathId])
REFERENCES [dbo].[CauseOfDeath] ([Id])
GO
ALTER TABLE [dbo].[DeathPeople] CHECK CONSTRAINT [FK_DeathPeople_CauseOfDeath1]
GO
ALTER TABLE [dbo].[DeathPeople]  WITH CHECK ADD  CONSTRAINT [FK_DeathPeople_CountryInfo] FOREIGN KEY([PlaceOfBirthID])
REFERENCES [dbo].[CountryInfo] ([Id])
GO
ALTER TABLE [dbo].[DeathPeople] CHECK CONSTRAINT [FK_DeathPeople_CountryInfo]
GO
ALTER TABLE [dbo].[DeathPeople]  WITH CHECK ADD  CONSTRAINT [FK_DeathPeople_CountryInfo1] FOREIGN KEY([PlaceOfDeathId])
REFERENCES [dbo].[CountryInfo] ([Id])
GO
ALTER TABLE [dbo].[DeathPeople] CHECK CONSTRAINT [FK_DeathPeople_CountryInfo1]
GO
ALTER TABLE [dbo].[DeathPeople]  WITH CHECK ADD  CONSTRAINT [FK_DeathPeople_GenderType] FOREIGN KEY([Gender])
REFERENCES [dbo].[GenderType] ([Id])
GO
ALTER TABLE [dbo].[DeathPeople] CHECK CONSTRAINT [FK_DeathPeople_GenderType]
GO
ALTER TABLE [dbo].[NewbornPeople]  WITH CHECK ADD  CONSTRAINT [FK_NewbornPeople_CountryInfo] FOREIGN KEY([PlaceOfBirthId])
REFERENCES [dbo].[CountryInfo] ([Id])
GO
ALTER TABLE [dbo].[NewbornPeople] CHECK CONSTRAINT [FK_NewbornPeople_CountryInfo]
GO
ALTER TABLE [dbo].[NewbornPeople]  WITH CHECK ADD  CONSTRAINT [FK_NewbornPeople_GenderType] FOREIGN KEY([GenderId])
REFERENCES [dbo].[GenderType] ([Id])
GO
ALTER TABLE [dbo].[NewbornPeople] CHECK CONSTRAINT [FK_NewbornPeople_GenderType]
GO
USE [master]
GO
ALTER DATABASE [DemographyBase] SET  READ_WRITE 
GO
