USE [master]
GO
/****** Object:  Database [QLBHJava]    Script Date: 17/03/2021 2:25:15 PM ******/
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
/****** Object:  Table [dbo].[About]    Script Date: 17/03/2021 2:25:15 PM ******/
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
/****** Object:  Table [dbo].[AdminUser]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 17/03/2021 2:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[BillID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[ProductID] ASC,
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 17/03/2021 2:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 17/03/2021 2:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[MenuType]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[New]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[NewCategory]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[NewTag]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 17/03/2021 2:25:16 PM ******/
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
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[Tag]    Script Date: 17/03/2021 2:25:16 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 17/03/2021 2:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
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
SET IDENTITY_INSERT [dbo].[New] ON 

INSERT [dbo].[New] ([ID], [Name], [Title], [Description], [Image], [CategoryID], [NewDetail], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Tag], [Status]) VALUES (2, N'Tuyển dụng nhân viên bán hàng', N'tuyen-dung-nhan-vien-ban-hang', N'<p>
	<span style="font-size:20px;"><em><strong>Giày NVL</strong></em> tuyển dụng nhân viên bán hàng fulltime và parttime!</span></p>
', N'/Image/images/t%E1%BA%A3i%20xu%E1%BB%91ng.jpg', 3, N'<p>
	Tạm thời chưa có gì sẽ chỉnh sau vì mệt quá rồi !</p>
', CAST(N'2021-01-20T21:30:49.417' AS DateTime), N'admin', CAST(N'2021-01-21T10:31:30.420' AS DateTime), N'admin', NULL, NULL, NULL, N'banhang, tuyendung, nhanvienbanhang', 1)
SET IDENTITY_INSERT [dbo].[New] OFF
GO
SET IDENTITY_INSERT [dbo].[NewCategory] ON 

INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (1, N'Tin tức tuần', N'tin-tuc-tuan', NULL, 1, NULL, CAST(N'2021-01-20T14:29:36.767' AS DateTime), N'admin', CAST(N'2021-01-20T14:29:36.767' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (2, N'Tin khuyến mãi', N'tin-khuyen-mai', NULL, 2, NULL, CAST(N'2021-01-20T14:30:37.860' AS DateTime), N'admin', CAST(N'2021-01-20T14:30:37.860' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (3, N'Tin tuyển dụng', N'tin-tuyen-dung', NULL, 3, NULL, CAST(N'2021-01-20T14:32:13.897' AS DateTime), N'admin', CAST(N'2021-01-20T14:32:13.897' AS DateTime), N'admin', NULL, NULL, 1, 1)
INSERT [dbo].[NewCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (4, N'Tin giải trí', N'tin-giai-tri', NULL, 4, NULL, CAST(N'2021-01-20T15:22:10.003' AS DateTime), N'remove', CAST(N'2021-01-21T10:26:51.840' AS DateTime), N'admin', NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[NewCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (17, N'SamSung A12', N'ss-a12', N'SamSung-A12', NULL, N'/Image/images/SSA12.png', CAST(3500000 AS Decimal(18, 0)), CAST(3250000 AS Decimal(18, 0)), 12, 20, NULL, CAST(N'2021-02-26T10:18:00.000' AS DateTime), CAST(N'2021-02-02T10:18:58.613' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (18, N'SamSung A21S', N'ss-a21s', N'SamSung-A21S', NULL, N'/Image/images/SSA21s.png', CAST(4500000 AS Decimal(18, 0)), CAST(4199999 AS Decimal(18, 0)), 5, 20, NULL, NULL, CAST(N'2021-02-02T10:20:30.497' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (19, N'SamSung A31', N'ss-a31', N'SamSung-A31', NULL, N'/Image/images/SSA31.png', CAST(4999999 AS Decimal(18, 0)), CAST(4500000 AS Decimal(18, 0)), 7, 20, NULL, CAST(N'2021-03-07T10:21:00.000' AS DateTime), CAST(N'2021-02-02T10:21:57.227' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (20, N'SamSung A50', N'ss-a50', N'SamSung-A50', NULL, N'/Image/images/SSA50.png', CAST(6900000 AS Decimal(18, 0)), CAST(6499999 AS Decimal(18, 0)), 6, 20, NULL, CAST(N'2021-02-20T10:23:00.000' AS DateTime), CAST(N'2021-02-02T10:23:22.660' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (21, N'SamSung A51', N'ss-a51', N'SamSung-A51', NULL, N'/Image/images/SSA51.png', CAST(6999999 AS Decimal(18, 0)), CAST(6499999 AS Decimal(18, 0)), 5, 20, NULL, CAST(N'2021-02-27T10:25:00.000' AS DateTime), CAST(N'2021-02-02T10:25:25.710' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (22, N'SamSung M51', N'ss-m51', N'SamSung-M51', NULL, N'/Image/images/SSM51.png', CAST(6500000 AS Decimal(18, 0)), NULL, 5, 20, NULL, NULL, CAST(N'2021-02-02T10:28:39.497' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (23, N'SamSung Note10+', N'ss-10+', N'SamSung-Note10+', NULL, N'/Image/images/SSNote10plus.png', CAST(11000000 AS Decimal(18, 0)), CAST(10499999 AS Decimal(18, 0)), 12, 20, NULL, CAST(N'2021-03-06T10:38:00.000' AS DateTime), CAST(N'2021-02-02T10:30:34.280' AS DateTime), N'admin', CAST(N'2021-02-02T10:38:12.937' AS DateTime), N'admin', NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (24, N'SamSung S20', N'ss-s20', N'SamSung-S20', NULL, N'/Image/images/SSS20.png', CAST(4500000 AS Decimal(18, 0)), CAST(4299999 AS Decimal(18, 0)), 12, 20, NULL, CAST(N'2021-02-20T14:26:00.000' AS DateTime), CAST(N'2021-02-02T14:26:30.667' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (25, N'Iphone 6 Gold', N'ip6', N'Iphone-6-Gold', NULL, N'/Image/images/IP6Gold.png', CAST(1600000 AS Decimal(18, 0)), CAST(1399999 AS Decimal(18, 0)), 12, 21, NULL, CAST(N'2021-02-11T14:34:00.000' AS DateTime), CAST(N'2021-02-02T14:34:38.190' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (26, N'Iphone 6 Black', N'ip6b', N'Iphone-6-Black', NULL, N'/Image/images/IP6Black.png', CAST(1500000 AS Decimal(18, 0)), NULL, 12, 21, NULL, NULL, CAST(N'2021-02-02T14:35:49.473' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (27, N'Iphone 6 Silver', N'ip6sv', N'Iphone-6-Silver', NULL, N'/Image/images/IP6Silver.png', CAST(1500000 AS Decimal(18, 0)), CAST(1399999 AS Decimal(18, 0)), 7, 21, NULL, CAST(N'2021-02-27T15:02:00.000' AS DateTime), CAST(N'2021-02-02T15:02:41.797' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (28, N'Iphone 12 ProMax Black', N'ip12b', N'Iphone-12-ProMax-Black', NULL, N'/Image/images/12ProMaxBlack.png', CAST(25000000 AS Decimal(18, 0)), NULL, 12, 21, NULL, NULL, CAST(N'2021-02-02T15:30:53.920' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Product] ([ID], [Name], [ProductCode], [Title], [Description], [Image], [Price], [SalePrice], [Quantity], [CategoryID], [ProductDetail], [SaleDate], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [Views], [Status]) VALUES (29, N'Iphone 12 ProMax Blue', N'ip12bl', N'Iphone-12-ProMax-Blue', NULL, N'/Image/images/12ProMaxBlue.png', CAST(28000000 AS Decimal(18, 0)), CAST(26999999 AS Decimal(18, 0)), 12, 21, NULL, CAST(N'2021-02-19T15:32:00.000' AS DateTime), CAST(N'2021-02-02T15:32:37.390' AS DateTime), N'admin', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (19, N'Nokia', N'Nokia', NULL, 1, NULL, CAST(N'2021-02-02T09:12:47.973' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (20, N'SamSung', N'SamSung', NULL, 2, NULL, CAST(N'2021-02-02T09:13:00.277' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (21, N'Apple', N'Apple', NULL, 3, NULL, CAST(N'2021-02-02T09:13:13.983' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (22, N'Canon', N'Canon', NULL, 4, NULL, CAST(N'2021-02-02T09:13:28.120' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (23, N'HTC', N'HTC', NULL, 5, NULL, CAST(N'2021-02-02T09:13:41.457' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [Title], [ParentID], [DisplayOrder], [SeoTitle], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyword], [MetaDescription], [ShowOnHome], [Status]) VALUES (24, N'LG', N'LG', NULL, 6, NULL, CAST(N'2021-02-02T09:13:54.250' AS DateTime), N'admin', NULL, NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Image/images/h4-slide.png', 1, NULL, NULL, CAST(N'2021-02-01T08:48:10.973' AS DateTime), NULL, CAST(N'2021-02-01T08:48:10.973' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Image/images/h4-slide2.png', 2, NULL, NULL, CAST(N'2021-02-01T08:49:24.453' AS DateTime), NULL, CAST(N'2021-02-01T08:49:24.453' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Image/images/h4-slide3.png', 3, NULL, NULL, CAST(N'2021-02-01T08:49:36.787' AS DateTime), NULL, CAST(N'2021-02-01T08:49:36.787' AS DateTime), NULL, 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Image/images/h4-slide4.png', 4, NULL, NULL, CAST(N'2021-02-01T08:49:42.833' AS DateTime), NULL, CAST(N'2021-02-01T08:49:42.833' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
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
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [QLBHJava] SET  READ_WRITE 
GO
