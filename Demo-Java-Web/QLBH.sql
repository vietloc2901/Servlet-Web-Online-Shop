USE [master]
GO
/****** Object:  Database [QLBHJava]    Script Date: 10/05/2021 6:00:11 PM ******/
CREATE DATABASE [QLBHJava]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBHJava', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBHJava.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBHJava_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLBHJava_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QLBHJava] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBHJava].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBHJava] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBHJava] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBHJava] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBHJava] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBHJava] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBHJava] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBHJava] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBHJava] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBHJava] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBHJava] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBHJava] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBHJava] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBHJava] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBHJava] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBHJava] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBHJava] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBHJava] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBHJava] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBHJava] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBHJava] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBHJava] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBHJava] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBHJava] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBHJava] SET  MULTI_USER 
GO
ALTER DATABASE [QLBHJava] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBHJava] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBHJava] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBHJava] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBHJava] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBHJava', N'ON'
GO
ALTER DATABASE [QLBHJava] SET QUERY_STORE = OFF
GO
USE [QLBHJava]
GO
/****** Object:  User [loc]    Script Date: 10/05/2021 6:00:11 PM ******/
CREATE USER [loc] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[About]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NULL,
	[Name] [nvarchar](250) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ConfirmDate] [datetime] NULL,
	[ConfirmBy] [nvarchar](100) NULL,
	[Discount] [float] NULL,
	[Payment] [nvarchar](250) NULL,
	[Detail] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[BillID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [bigint] NOT NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ProductID] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
	[Facebook] [nvarchar](200) NULL,
	[Youtube] [nvarchar](200) NULL,
	[Gmail] [nvarchar](500) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](200) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NULL,
	[MenuTypeID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuType]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_MenuType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[New]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[New](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[CategoryID] [bigint] NULL,
	[NewDetail] [ntext] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Views] [bigint] NULL,
	[Tag] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewCategory]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[ShowOnHome] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_NewCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewTag]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewTag](
	[NewID] [bigint] NOT NULL,
	[TagID] [bigint] NOT NULL,
 CONSTRAINT [PK_NewTag] PRIMARY KEY CLUSTERED 
(
	[NewID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ProductCode] [varchar](50) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[SalePrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[CategoryID] [bigint] NULL,
	[ProductDetail] [ntext] NULL,
	[SaleDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[Views] [bigint] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[ParentID] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[ShowOnHome] [bit] NULL,
	[Status] [bit] NULL,
	[Image] [nvarchar](200) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/05/2021 6:00:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([ID], [Username], [Password], [Status]) VALUES (1, N'Admin', N'admin', 1)
INSERT [dbo].[AdminUser] ([ID], [Username], [Password], [Status]) VALUES (65, N'remove', N'123123', 1)
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([ID], [UserID], [Name], [Phone], [Email], [Address], [CreatedDate], [ConfirmDate], [ConfirmBy], [Discount], [Payment], [Detail], [Status]) VALUES (1, 0, N'  nguyen viet loc   ', N'0987-149-416', N'', N'TL - DP - HN', CAST(N'2021-05-10T11:49:02.900' AS DateTime), NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[Bill] ([ID], [UserID], [Name], [Phone], [Email], [Address], [CreatedDate], [ConfirmDate], [ConfirmBy], [Discount], [Payment], [Detail], [Status]) VALUES (2, 26, N'Nguyễn Viết Lộc', N'0987149416', N'mrloczzbatdiet@gmail.com', N'Cụm 2 - Tân Lập - Đan Phượng - Hà Nội', CAST(N'2021-05-10T14:27:26.120' AS DateTime), CAST(N'2021-05-10T17:56:22.167' AS DateTime), N'Admin', 0, NULL, NULL, 1)
INSERT [dbo].[Bill] ([ID], [UserID], [Name], [Phone], [Email], [Address], [CreatedDate], [ConfirmDate], [ConfirmBy], [Discount], [Payment], [Detail], [Status]) VALUES (3, 26, N'Nguyễn Viết Lộc', N'0987149416', N'mrloczzbatdiet@gmail.com', N'Cụm 2 - Tân Lập - Đan Phượng - Hà Nội', CAST(N'2021-05-10T14:32:04.717' AS DateTime), NULL, NULL, 0, NULL, NULL, 1)
INSERT [dbo].[Bill] ([ID], [UserID], [Name], [Phone], [Email], [Address], [CreatedDate], [ConfirmDate], [ConfirmBy], [Discount], [Payment], [Detail], [Status]) VALUES (4, 0, N'  nguyen viet loc   ', N'0987-149-416', N'', N'Cụm 2 - Tân Lập - Đan Phượng - Hà Nội', CAST(N'2021-05-10T14:35:01.223' AS DateTime), NULL, NULL, 0, NULL, NULL, 0)
INSERT [dbo].[Bill] ([ID], [UserID], [Name], [Phone], [Email], [Address], [CreatedDate], [ConfirmDate], [ConfirmBy], [Discount], [Payment], [Detail], [Status]) VALUES (5, 26, N'Nguyễn Viết Lộc', N'0987149416', N'mrloczzbatdiet@gmail.com', N'Cụm 2 - Tân Lập - Đan Phượng - Hà Nội', CAST(N'2021-05-10T16:30:53.567' AS DateTime), NULL, NULL, 0, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[BillDetail] ON 

INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (1, 29, 1, 1, 28000000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (2, 28, 1, 1, 25000000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (3, 28, 2, 1, 25000000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (4, 27, 2, 1, 1500000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (5, 26, 3, 1, 1500000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (6, 25, 3, 1, 1600000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (7, 19, 4, 2, 4999999)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (8, 28, 5, 1, 25000000)
INSERT [dbo].[BillDetail] ([ID], [ProductID], [BillID], [Quantity], [Price]) VALUES (9, 28, 5, 1, 25000000)
SET IDENTITY_INSERT [dbo].[BillDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Status], [Facebook], [Youtube], [Gmail]) VALUES (1, N'Here is our contact ! You can visit these site for more information', 1, N'https://facebook.com', N'https://youtube.com', N'nvloc29012000@gmail.com')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (1, N'TRANG CHỦ', N'/trang-chu', 1, NULL, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (2, N'SẢN PHẨM', N'/san-pham', 2, NULL, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (3, N'TIN TỨC', N'/tin-tuc', 3, NULL, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (4, N'VỀ CHÚNG TÔI', N'/ve-chung-toi', 4, NULL, 1, 1)
INSERT [dbo].[Menu] ([ID], [Text], [Link], [DisplayOrder], [Target], [Status], [MenuTypeID]) VALUES (5, N'LIÊN HỆ', N'/lien-he', 5, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuType] ON 

INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (1, N'Menu Chính')
INSERT [dbo].[MenuType] ([ID], [Name]) VALUES (2, N'Menu Phụ')
SET IDENTITY_INSERT [dbo].[MenuType] OFF
GO
SET IDENTITY_INSERT [dbo].[New] ON 

INSERT [dbo].[New] ([ID], [Name], [Title], [Description], [Image], [CategoryID], [NewDetail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Tag], [Status]) VALUES (12, N'Tuyển dụng nhân viên bán hàng', N'Tuyen-dung-nhan-vien-ban-hang', N'Hệ thống của hàng NVL Shop tuyển dụng nhân viên bán hàng full time và part time', N'/CKFinderJava/userfiles/images/abca.jpg', 3, N'<h2>Đ&Atilde;I NGỘ - THĂNG TIẾN</h2>

<ul>
	<li>L&agrave;m việc trong m&ocirc;i trường b&aacute;n lẻ c&aacute;c thiết bị di động rất năng động</li>
	<li>Được c&ocirc;ng ty đ&agrave;o tạo từ khi nhận việc để c&oacute; thể h&ograve;a nhập v&agrave; ho&agrave;n th&agrave;nh tốt c&ocirc;ng việc</li>
	<li>Lương v&agrave; thưởng KPI, thưởng hoa hồng, thưởng th&aacute;ng 13, thưởng nh&acirc;n vi&ecirc;n xuất sắc.., tăng lương, thăng chức l&ecirc;n quản l&yacute; được tổ chức thường xuy&ecirc;n v&agrave; r&otilde; r&agrave;ng.</li>
	<li>Được mua sắm c&aacute;c sản phẩm với gi&aacute; ưu đ&atilde;i d&agrave;nh cho nh&acirc;n vi&ecirc;n nội bộ</li>
	<li>Đồng nghiệp trẻ, đo&agrave;n kết, nhiệt t&igrave;nh v&agrave; hỗ trợ lẫn nhau, nhiều hoạt động gắn kết đội ngũ như tổ chức sinh nhật, teambuilding, tặng qu&agrave; 8/3...</li>
</ul>

<p style="text-align:center"><img alt="" src="/CKFinderJava/userfiles/images/abca.jpg" style="height:200px; width:300px" /></p>
', CAST(N'2021-04-16T22:19:10.127' AS DateTime), N'Admin', CAST(N'2021-04-23T10:45:38.327' AS DateTime), N'Admin', N'', N'', 0, N'tuyendung, nhanvien, banhang', 1)
INSERT [dbo].[New] ([ID], [Name], [Title], [Description], [Image], [CategoryID], [NewDetail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Tag], [Status]) VALUES (14, N'IPhone 12 cập bến Việt Nam', N'IPhone-12-cap-ben-Viet-Nam', N'Ngày hôm nay những chiếc điện thoại IPhone 12 mà IPhone 12 promax đã có mặt tại thị trường Việt Nam', N'/CKFinderJava/userfiles/images/1.jpg', 1, N'<p><strong>Đ&ecirc;m 23/10, những chiếc iPhone 12 đầu ti&ecirc;n đ&atilde; xuất hiện tại một cửa h&agrave;ng điện thoại lớn tại H&agrave; Nội. Chủ cửa h&agrave;ng cho biết, đ&acirc;y l&agrave; những chiếc m&aacute;y để cho kh&aacute;ch h&agrave;ng d&ugrave;ng thử chứ chưa b&aacute;n.</strong></p>

<p>&nbsp;</p>

<p>Khoảng 22h giờ đ&ecirc;m 23/10, những chiếc iPhone 12 v&agrave; iPhone 12 Pro đầu ti&ecirc;n đ&atilde; xuất hiện tại Việt Nam, c&ugrave;ng ng&agrave;y mở b&aacute;n tr&ecirc;n thế giới.</p>

<p>Theo đại diện một cửa h&agrave;ng tại quận Cầu Giấy, H&agrave; Nội, chiếc iPhone 12 đầu ti&ecirc;n được nhập khẩu từ&nbsp;Hong Kong.</p>

<p>Đại diện cửa h&agrave;ng cũng cho biết chỉ nhập m&aacute;y về để kh&aacute;ch tới d&ugrave;ng thử, c&ograve;n sản phẩm thương mại nhập ch&iacute;nh h&atilde;ng sẽ được b&aacute;n từ đầu th&aacute;ng 12/2020.</p>

<p>Những chiếc iPhone 12 đầu ti&ecirc;n được nhập về c&oacute; 5 m&agrave;u gồm đen, trắng, xanh l&aacute;, xanh dương v&agrave; đỏ, c&ograve;n iPhone 12 Pro chỉ c&oacute; 2 m&agrave;u gồm Pacific Blue v&agrave; Graphite.</p>

<p>So với iPhone 11 Seri, iPhone 12 Seri c&oacute; vẻ ngo&agrave;i cứng c&aacute;p, g&oacute;c cạnh v&agrave; nhỏ gọn hơn. Theo cảm nhận ban đầu, iPhone 12 v&agrave; iPhone 12 Pro cho cảm gi&aacute;c cầm nắm thoải m&aacute;i d&ugrave; khung đ&atilde; được l&agrave;m vu&ocirc;ng vức thay v&igrave; bo cong như thế hệ trước đ&oacute;.</p>

<p>Tuy nhi&ecirc;n, cả phần khung v&agrave; mặt k&iacute;nh b&oacute;ng bẩy, dễ b&aacute;m bẩn khi d&ugrave;ng. Phi&ecirc;n bản m&agrave;u xanh dương khiến c&aacute;c iFan thất vọng v&igrave; m&agrave;u sắc kh&ocirc;ng giống ảnh được Apple c&ocirc;ng bố.</p>

<p><em>Một số h&igrave;nh ảnh cận cảnh những chiếc&nbsp;<a href="https://www.vietnamplus.vn/tags/iPhone-12-%c4%91%e1%ba%a7u-ti%c3%aan-t%e1%ba%a1i-Vi%e1%bb%87t-Nam.vnp">iPhone 12 đầu ti&ecirc;n tại Việt Nam</a>:</em></p>

<p><em><img alt="" src="/CKFinderJava/userfiles/images/2.jpg" style="height:1067px; width:1600px" /></em></p>

<p>Hộp thế hệ iPhone 12 đ&atilde; mỏng hơn, kh&ocirc;ng c&ograve;n c&aacute;c phụ kiện cơ bản như sạc, tai nghe EarPods. M&aacute;y được b&aacute;n k&egrave;m d&acirc;y c&aacute;p USB-C Lightning. Cục sạc 18 W thế hệ cũ, tương th&iacute;ch với sợi c&aacute;p n&agrave;y được b&aacute;n với gi&aacute; gần 900 ng&agrave;n đồng tại Việt Nam.</p>
', CAST(N'2021-04-23T10:40:33.407' AS DateTime), N'Admin', NULL, NULL, N'', N'', 0, N'', 1)
SET IDENTITY_INSERT [dbo].[New] OFF
GO
SET IDENTITY_INSERT [dbo].[NewCategory] ON 

INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (1, N'Tin tức tuần', N'tin-tuc-tuan', 0, 0, N'', CAST(N'2021-01-20T14:29:36.767' AS DateTime), N'admin', CAST(N'2021-04-16T20:58:48.557' AS DateTime), N'Admin', N'', N'', 1, 1)
INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (2, N'Tin khuyến mãi', N'tin-khuyen-mai', NULL, 2, NULL, CAST(N'2021-01-20T14:30:37.860' AS DateTime), N'admin', CAST(N'2021-01-20T14:30:37.860' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (3, N'Tin tuyển dụng', N'tin-tuyen-dung', NULL, 3, NULL, CAST(N'2021-01-20T14:32:13.897' AS DateTime), N'admin', CAST(N'2021-01-20T14:32:13.897' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (4, N'Tin giải trí', N'tin-giai-tri', NULL, 4, NULL, CAST(N'2021-01-20T15:22:10.003' AS DateTime), N'remove', CAST(N'2021-01-21T10:26:51.840' AS DateTime), N'admin', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[NewCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (17, N'SamSung A12', N'ss-a12', N'SamSung-A12', N'', N'/CKFinderJava/userfiles/images/SSA12.jpg', CAST(3500000 AS Decimal(18, 0)), CAST(3250000 AS Decimal(18, 0)), 1, 20, N'<p>Đ&acirc;y l&agrave; SAMSUNG A12</p>
', NULL, CAST(N'2021-02-02T10:18:58.613' AS DateTime), N'admin', CAST(N'2021-04-15T17:32:56.833' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (18, N'SamSung A21S', N'ss-a21s', N'SamSung-A21S', N'', N'/CKFinderJava/userfiles/images/SSA21s.jpg', CAST(4500000 AS Decimal(18, 0)), CAST(4199999 AS Decimal(18, 0)), 1, 20, N'', NULL, CAST(N'2021-02-02T10:20:30.497' AS DateTime), N'admin', CAST(N'2021-04-15T19:19:38.600' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (19, N'SamSung A31', N'ss-a31', N'SamSung-A31', N'', N'/CKFinderJava/userfiles/images/SSA31.jpg', CAST(4999999 AS Decimal(18, 0)), CAST(4500000 AS Decimal(18, 0)), 1, 20, N'', NULL, CAST(N'2021-02-02T10:21:57.227' AS DateTime), N'admin', CAST(N'2021-04-15T19:20:06.353' AS DateTime), N'Admin', N'', N'', 180, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (20, N'SamSung A50', N'ss-a50', N'SamSung-A50', N'', N'/CKFinderJava/userfiles/images/SSA50.jpg', CAST(6900000 AS Decimal(18, 0)), CAST(6499999 AS Decimal(18, 0)), 1, 20, N'', NULL, CAST(N'2021-02-02T10:23:22.660' AS DateTime), N'admin', CAST(N'2021-04-15T19:20:38.803' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (21, N'SamSung A51', N'ss-a51', N'SamSung-A51', N'', N'/CKFinderJava/userfiles/images/SSA51.jpg', CAST(6999999 AS Decimal(18, 0)), CAST(6499999 AS Decimal(18, 0)), 1, 20, N'', NULL, CAST(N'2021-02-02T10:25:25.710' AS DateTime), N'admin', CAST(N'2021-04-15T19:21:15.567' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (22, N'SamSung M51', N'ss-m51', N'SamSung-M51', N'', N'/CKFinderJava/userfiles/images/SSM51.jpg', CAST(6500000 AS Decimal(18, 0)), NULL, 1, 20, N'', NULL, CAST(N'2021-02-02T10:28:39.497' AS DateTime), N'admin', CAST(N'2021-04-15T19:21:37.027' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (23, N'SamSung Note10+', N'ss-10+', N'SamSung-Note10+', N'', N'/CKFinderJava/userfiles/images/SSnote10%2B.jpg', CAST(11000000 AS Decimal(18, 0)), CAST(10499999 AS Decimal(18, 0)), 1, 20, N'', NULL, CAST(N'2021-02-02T10:30:34.280' AS DateTime), N'admin', CAST(N'2021-04-15T19:22:07.363' AS DateTime), N'Admin', N'', N'', 120, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (25, N'Iphone 6 Gold', N'ip6', N'Iphone-6-Gold', N'', N'/CKFinderJava/userfiles/images/IP6Gold.jpg', CAST(1600000 AS Decimal(18, 0)), CAST(1399999 AS Decimal(18, 0)), 1, 21, N'', NULL, CAST(N'2021-02-02T14:34:38.190' AS DateTime), N'admin', CAST(N'2021-04-15T19:23:23.527' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (26, N'Iphone 6 Black', N'ip6b', N'Iphone-6-Black', N'', N'/CKFinderJava/userfiles/images/IP6Black.jpg', CAST(1500000 AS Decimal(18, 0)), NULL, 1, 21, N'', NULL, CAST(N'2021-02-02T14:35:49.473' AS DateTime), N'admin', CAST(N'2021-04-15T19:23:58.077' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (27, N'Iphone 6 Silver', N'ip6sv', N'Iphone-6-Silver', N'', N'/CKFinderJava/userfiles/images/IP6Silver.jpg', CAST(1500000 AS Decimal(18, 0)), NULL, 1, 21, N'', NULL, CAST(N'2021-02-02T15:02:41.797' AS DateTime), N'admin', CAST(N'2021-04-15T19:24:38.160' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (28, N'Iphone 12 ProMax Black', N'ip12b', N'Iphone-12-ProMax-Black', N'', N'/CKFinderJava/userfiles/images/IP12ProMaxBlack.jpg', CAST(25000000 AS Decimal(18, 0)), CAST(24000000 AS Decimal(18, 0)), 1, 21, N'', CAST(N'2021-04-18T11:38:00.000' AS DateTime), CAST(N'2021-02-02T15:30:53.920' AS DateTime), N'admin', CAST(N'2021-04-19T22:08:38.773' AS DateTime), N'Admin', N'', N'', 0, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (29, N'Iphone 12 ProMax Blue', N'ip12bl', N'Iphone-12-ProMax-Blue', N'', N'/CKFinderJava/userfiles/images/IP12ProMaxBlue.jpg', CAST(28000000 AS Decimal(18, 0)), CAST(26999999 AS Decimal(18, 0)), 1, 21, N'', CAST(N'2021-04-26T03:18:00.000' AS DateTime), CAST(N'2021-02-02T15:32:37.390' AS DateTime), N'admin', CAST(N'2021-04-16T20:19:02.863' AS DateTime), N'Admin', N'', N'', 100, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status], [Image]) VALUES (19, N'Nokia', N'Nokia', 0, 0, N'', CAST(N'2021-02-02T09:12:47.973' AS DateTime), N'admin', CAST(N'2021-04-18T20:43:56.547' AS DateTime), N'Admin', N'', N'', 1, 0, N'/CKFinderJava/userfiles/images/brand1.png')
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status], [Image]) VALUES (20, N'SamSung', N'SamSung', 0, 0, N'', CAST(N'2021-02-02T09:13:00.277' AS DateTime), N'admin', CAST(N'2021-04-18T20:44:20.230' AS DateTime), N'Admin', N'', N'', 1, 0, N'/CKFinderJava/userfiles/images/brand3.png')
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status], [Image]) VALUES (21, N'Apple', N'Apple', 0, 0, N'', CAST(N'2021-02-02T09:13:13.983' AS DateTime), N'admin', CAST(N'2021-04-18T20:44:42.413' AS DateTime), N'Admin', N'', N'', 1, 0, N'/CKFinderJava/userfiles/images/brand4.png')
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status], [Image]) VALUES (22, N'Canon', N'Canon', 0, 0, N'', CAST(N'2021-02-02T09:13:28.120' AS DateTime), N'admin', CAST(N'2021-04-18T20:45:14.197' AS DateTime), N'Admin', N'', N'', 1, 0, N'/CKFinderJava/userfiles/images/brand2.png')
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status], [Image]) VALUES (23, N'HTC', N'HTC', 0, 0, N'', CAST(N'2021-02-02T09:13:41.457' AS DateTime), N'admin', CAST(N'2021-04-18T20:45:32.173' AS DateTime), N'Admin', N'', N'', 1, 0, N'/CKFinderJava/userfiles/images/brand5.png')
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status], [Image]) VALUES (24, N'LG', N'LG', 0, 0, N'', CAST(N'2021-02-02T09:13:54.250' AS DateTime), N'admin', CAST(N'2021-04-18T20:45:52.210' AS DateTime), N'Admin', N'', N'', 1, 0, N'/CKFinderJava/userfiles/images/brand6.png')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'/CKFinderJava/userfiles/images/h4-slide2.png', 1, NULL, NULL, CAST(N'2021-02-01T08:48:10.973' AS DateTime), NULL, CAST(N'2021-02-01T08:48:10.973' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'/CKFinderJava/userfiles/images/h4-slide3.png', 2, NULL, NULL, CAST(N'2021-02-01T08:49:24.453' AS DateTime), NULL, CAST(N'2021-02-01T08:49:24.453' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'/CKFinderJava/userfiles/images/h4-slide4.png', 3, NULL, NULL, CAST(N'2021-02-01T08:49:36.787' AS DateTime), NULL, CAST(N'2021-02-01T08:49:36.787' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'/CKFinderJava/userfiles/images/h4-slide7.png', 4, NULL, NULL, CAST(N'2021-02-01T08:49:42.833' AS DateTime), NULL, CAST(N'2021-02-01T08:49:42.833' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Phone], [Email], [Address], [Status]) VALUES (1, N'loc2909', N'vietloc2909', N'Nguyễn Viết Lộc', N'0987149416', N'nvloc29012000@gmail.com', N'Tân Lập - Đan Phượng - Hà Nội', 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Phone], [Email], [Address], [Status]) VALUES (24, N'loc2123123', N'123123', N'Nguyễn Viết Lộc', N'0987149416', NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Phone], [Email], [Address], [Status]) VALUES (25, N'a', N'123123', N'Nguyễn Viết Lộc', N'0987149416', NULL, NULL, 1)
INSERT [dbo].[Users] ([ID], [UserName], [Password], [Name], [Phone], [Email], [Address], [Status]) VALUES (26, N'admin', N'admin', N'Nguyễn Viết Lộc', N'0987149416', N'mrloczzbatdiet@gmail.com', N'Cụm 2 - Tân Lập - Đan Phượng - Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[About] ADD  CONSTRAINT [DF_About_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF_AdminUser_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Bill] ADD  CONSTRAINT [DF_Bill_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[BillDetail] ADD  CONSTRAINT [DF_BillDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Contact] ADD  CONSTRAINT [DF_Contact_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Menu] ADD  CONSTRAINT [DF_Menu_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[New] ADD  CONSTRAINT [DF_New_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[New] ADD  CONSTRAINT [DF_New_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[New] ADD  CONSTRAINT [DF_New_View]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[New] ADD  CONSTRAINT [DF_New_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[NewCategory] ADD  CONSTRAINT [DF_NewCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[NewCategory] ADD  CONSTRAINT [DF_NewCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NewCategory] ADD  CONSTRAINT [DF_NewCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[NewCategory] ADD  CONSTRAINT [DF_NewCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[NewCategory] ADD  CONSTRAINT [DF_NewCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_View]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_ShowOnHome]  DEFAULT ((0)) FOR [ShowOnHome]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_DisplayOrder]  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [QLBHJava] SET  READ_WRITE 
GO
