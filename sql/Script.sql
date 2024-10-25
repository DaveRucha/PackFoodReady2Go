USE [master]
GO
/****** Object:  Database [PackFoodReady2Go]    Script Date: 10/25/2024 10:38:44 AM ******/
CREATE DATABASE [PackFoodReady2Go]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PackFoodReady2Go', FILENAME = N'D:\SDSU\INTA\PackFoodReady2Go.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PackFoodReady2Go_log', FILENAME = N'D:\SDSU\INTA\PackFoodReady2Go_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PackFoodReady2Go] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PackFoodReady2Go].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PackFoodReady2Go] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET ARITHABORT OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PackFoodReady2Go] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PackFoodReady2Go] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PackFoodReady2Go] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PackFoodReady2Go] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET RECOVERY FULL 
GO
ALTER DATABASE [PackFoodReady2Go] SET  MULTI_USER 
GO
ALTER DATABASE [PackFoodReady2Go] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PackFoodReady2Go] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PackFoodReady2Go] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PackFoodReady2Go] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PackFoodReady2Go] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PackFoodReady2Go] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PackFoodReady2Go', N'ON'
GO
ALTER DATABASE [PackFoodReady2Go] SET QUERY_STORE = ON
GO
ALTER DATABASE [PackFoodReady2Go] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PackFoodReady2Go]
GO
/****** Object:  Table [dbo].[AboutUs]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutUs](
	[AboutUsId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[ADescription] [nvarchar](400) NULL,
	[ButtonText] [nvarchar](100) NULL,
	[TotalCustomer] [int] NULL,
	[SoldProduct] [int] NULL,
	[Awards] [int] NULL,
	[Ashortdescription] [varchar](500) NULL,
	[AboutImage] [nvarchar](500) NULL,
	[AboutImage2] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[AboutUsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adminn]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminn](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[LastLogin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[BannerImage] [nvarchar](400) NULL,
	[BannerTitle] [nvarchar](100) NULL,
	[BannerDescription] [nvarchar](400) NULL,
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CreatedBy] [datetime] NULL,
	[ModifiedBy] [datetime] NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryList]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryList](
	[CategoryListId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryListTitle] [nvarchar](100) NULL,
	[CategoryListImage] [nvarchar](400) NULL,
	[CategoryListDescripton] [nvarchar](400) NULL,
	[CategoryListButtonTitle] [nvarchar](100) NULL,
	[CategoryListTitle2] [varchar](500) NULL,
	[CategoryListTitle3] [varchar](500) NULL,
	[CategoryListTitle4] [varchar](500) NULL,
	[CategoryListTitle5] [varchar](500) NULL,
	[CategoryListImage2] [varchar](500) NULL,
	[CategoryListImage3] [varchar](500) NULL,
	[CategoryListImage4] [varchar](500) NULL,
	[CategoryListImage5] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[ContactImage] [nvarchar](400) NULL,
	[CustomerName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[CSubject] [nvarchar](100) NULL,
	[CMessage] [nvarchar](400) NULL,
	[ButtonText] [nvarchar](100) NULL,
	[CompanyAddress] [varchar](500) NULL,
	[CompanyContactNo] [varchar](500) NULL,
	[CompanyEmail] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[DiscountAmount] [decimal](18, 0) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Pincode] [nvarchar](20) NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](20) NULL,
	[CreatedBy] [datetime] NULL,
	[ModifiedBy] [datetime] NULL,
	[LastLogin] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [varchar](max) NULL,
	[Answer] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FooterInfo]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FooterInfo](
	[FooterId] [int] IDENTITY(1,1) NOT NULL,
	[Privacy_Title] [nvarchar](max) NULL,
	[Privacy_Discription] [nvarchar](max) NULL,
	[Terms_Title] [nvarchar](max) NULL,
	[Terms_Discription] [nvarchar](max) NULL,
	[Return_Title] [nvarchar](max) NULL,
	[Return_Discription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FooterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterHomePage]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterHomePage](
	[HomeId] [int] IDENTITY(1,1) NOT NULL,
	[DescriptionOffer] [nvarchar](100) NULL,
	[WebsiteTitle] [nvarchar](200) NULL,
	[FeaturedProductTitle] [nvarchar](100) NULL,
	[FeaturedProductDescription] [nvarchar](500) NULL,
	[PromoTitle] [nvarchar](100) NULL,
	[PromoTagline] [nvarchar](100) NULL,
	[PromoDescription] [nvarchar](500) NULL,
	[PromoProductname] [nvarchar](100) NULL,
	[PromoOffertag] [nvarchar](100) NULL,
	[CompanyContactNo] [varchar](20) NULL,
	[CompanyEmail] [nvarchar](100) NULL,
	[CompanyDescription] [nvarchar](500) NULL,
	[CompanyAddress] [nvarchar](500) NULL,
	[PromoImage] [nvarchar](max) NULL,
	[BgImage] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[HomeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[TotalAmount] [nvarchar](50) NULL,
	[Discount] [nvarchar](50) NULL,
	[SubTotal] [nvarchar](50) NULL,
	[OrderStatus] [nvarchar](55) NULL,
	[OrderDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Currency] [nvarchar](3) NULL,
	[Status] [nvarchar](55) NULL,
	[PaymentMethod] [nvarchar](255) NULL,
	[CustomerID] [int] NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[QuantityPerUnit] [int] NULL,
	[UnitPrice] [decimal](10, 2) NOT NULL,
	[Capacity] [nvarchar](255) NULL,
	[Size] [nvarchar](255) NULL,
	[Material] [nvarchar](255) NULL,
	[Discount] [decimal](5, 2) NULL,
	[UnitInStock] [int] NULL,
	[ImageURL] [nvarchar](255) NULL,
	[AltText] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [datetime] NULL,
	[ModifiedBy] [datetime] NULL,
	[IsDeleted] [int] NULL,
	[AverageRating] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerName] [nvarchar](200) NULL,
	[CustomerEmail] [nvarchar](100) NULL,
	[ReviewTitle] [nvarchar](200) NULL,
	[ReviewDescription] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[ReviewDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingAddress]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingAddress](
	[ShippingID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Mobile] [varchar](15) NULL,
	[Address] [varchar](255) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[PostCode] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[SliderId] [int] IDENTITY(1,1) NOT NULL,
	[SliderImage] [nvarchar](400) NULL,
	[SliderTitle] [nvarchar](100) NULL,
	[SliderDescription] [nvarchar](400) NULL,
	[SliderButtonTitle] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 10/25/2024 10:38:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CreatedBy] [datetime] NULL,
	[ModifiedBy] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AboutUs] ON 

INSERT [dbo].[AboutUs] ([AboutUsId], [Title], [ADescription], [ButtonText], [TotalCustomer], [SoldProduct], [Awards], [Ashortdescription], [AboutImage], [AboutImage2]) VALUES (1, N'ABOUT US', N'We try to stock the best quality products at the best possible price. If you would like any samples or need any advice about products please email or phone us and we will help to the best of our ability. Customer service is very important to us and we keep a large stock so that we can achieve same day dispatch for orders placed before 2.30pm Monday to Friday.', N'SHOP NOW', 10, 1888, 5, N'Welcome to PackFoodReady2Go', N'com.jpg', N's3.jpg')
SET IDENTITY_INSERT [dbo].[AboutUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Adminn] ON 

INSERT [dbo].[Adminn] ([AID], [Email], [Password], [LastLogin]) VALUES (1, N'admin.in', N'111', CAST(N'2024-09-12T06:30:59.603' AS DateTime))
INSERT [dbo].[Adminn] ([AID], [Email], [Password], [LastLogin]) VALUES (2, N'a', N'111', CAST(N'2024-09-16T12:01:56.763' AS DateTime))
SET IDENTITY_INSERT [dbo].[Adminn] OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([BannerId], [BannerImage], [BannerTitle], [BannerDescription]) VALUES (2, N'b1.png', N'FREE SHIPPING', N'ON ORDER OVER $100')
INSERT [dbo].[Banner] ([BannerId], [BannerImage], [BannerTitle], [BannerDescription]) VALUES (3, N'b2.png', N'ALWAYS FRESH', N'PRODUCT WELL PACKAGE')
INSERT [dbo].[Banner] ([BannerId], [BannerImage], [BannerTitle], [BannerDescription]) VALUES (4, N'b3.png', N'SUPERIOR QUALITY', N'QUALITY PRODUCTS')
INSERT [dbo].[Banner] ([BannerId], [BannerImage], [BannerTitle], [BannerDescription]) VALUES (5, N'b4.png', N'SUPPORT', N'24/7 SUPPORT')
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (3, N'Platters')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (4, N'Aluminium Foil Containers ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (5, N'Sandwich Packaing ')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (6, N'Bags')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (7, N'Tableware')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryList] ON 

INSERT [dbo].[CategoryList] ([CategoryListId], [CategoryListTitle], [CategoryListImage], [CategoryListDescripton], [CategoryListButtonTitle], [CategoryListTitle2], [CategoryListTitle3], [CategoryListTitle4], [CategoryListTitle5], [CategoryListImage2], [CategoryListImage3], [CategoryListImage4], [CategoryListImage5]) VALUES (1, N'FEATURED CATEGORIES', N'c1.jpg', N'Protect the health of every home', N'SHOP NOW', N'Platters', N'Sandwich Packaging', N'Cups & Glasses', N'Bags', N'c2.jpg', N'c3.jpg', N'c4.jpg', N'c5.jpg')
SET IDENTITY_INSERT [dbo].[CategoryList] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([ContactId], [ContactImage], [CustomerName], [Email], [CSubject], [CMessage], [ButtonText], [CompanyAddress], [CompanyContactNo], [CompanyEmail]) VALUES (1, N'com.jpg', NULL, NULL, NULL, NULL, N'Send Message', N'AA Catering Disposables Ltd 1 Grafton Place Morecambe Lancashire LA3 1RZ', N'9874561230', N'info@aacaterimgdisposables.co.uk')
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([Id], [Code], [DiscountAmount], [ExpiryDate]) VALUES (1, N'BUY20', CAST(20 AS Decimal(18, 0)), CAST(N'2024-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Coupon] ([Id], [Code], [DiscountAmount], [ExpiryDate]) VALUES (4, N'Buy50', CAST(50 AS Decimal(18, 0)), CAST(N'2024-05-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (1, N'Mohit', N'Vyas', N'Manav@gmail.com', N'aaaaa@', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', NULL, CAST(N'2024-04-17T14:17:53.953' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (3, N'Jaya', N'Joshi', N'jaya@gmail.com', N'qqqqqq@', N'pal gam', N'395009', N'India', N'Gujarat', N'SURAT', N'6599869688', CAST(N'2024-03-01T07:09:33.563' AS DateTime), CAST(N'2024-03-01T07:09:33.563' AS DateTime), CAST(N'2024-06-11T06:39:34.450' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (4, N'Chirag', N'Khalasi', N'chirag@gmail.com', N'111111', N'Gabheni', N'394230', N'India', N'Gujarat', N'Surat', N'9328380273', CAST(N'2024-03-08T09:55:27.487' AS DateTime), CAST(N'2024-03-08T09:55:27.487' AS DateTime), CAST(N'2024-03-18T11:23:07.113' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (5, N'Krisha', N'Jha', N'krisha@gmail.com', N'11111!', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', CAST(N'2024-03-11T05:54:12.100' AS DateTime), CAST(N'2024-03-11T05:54:12.100' AS DateTime), CAST(N'2024-03-11T05:54:24.250' AS DateTime))
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (6, N'Krisha', N'Joshi', N'daverucha2002@gmail.com', N'qqqqqqqq@', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', CAST(N'2024-03-11T06:48:18.547' AS DateTime), CAST(N'2024-03-11T06:48:18.547' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (7, N'ww', N'Joshi', N'daverucha2002@gmail.com', N'qqqqqww', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', CAST(N'2024-03-11T06:48:49.503' AS DateTime), CAST(N'2024-03-11T06:48:49.503' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (8, N'amita', N'Joshi', N'daverucha2002@gmail.com', N'qqqqqqqqqq', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', CAST(N'2024-03-11T06:51:56.283' AS DateTime), CAST(N'2024-03-11T06:51:56.690' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (9, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'qqqqqqqqqq', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', CAST(N'2024-03-11T06:57:21.547' AS DateTime), CAST(N'2024-03-11T06:57:22.040' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (10, N'amita', N'Joshi', N'daverucha2002@gmail.com', N'aaaaaaa', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'395009', N'India', N'Gujarat', N'SURAT', N'9865966663', CAST(N'2024-03-11T07:25:32.327' AS DateTime), CAST(N'2024-03-11T07:25:32.327' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (11, N'Vidhi', N'Goyani', N'vidhi@gmail.com', N'666666', N'1102,bharti royal', N'395009', N'India', N'Gujarat', N'Surat', N'8780114908', NULL, CAST(N'2024-04-17T14:21:17.957' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerID], [FirstName], [LastName], [Email], [Password], [Address], [Pincode], [Country], [State], [City], [ContactNo], [CreatedBy], [ModifiedBy], [LastLogin]) VALUES (12, N'radha', N'krishna', N'rk@gmail.com', N'111111', N'Dhwarka', N'000000', N'India', N'Gujarat', N'dhwarka', N'8780114908', CAST(N'2024-04-17T14:22:44.593' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([Id], [Question], [Answer]) VALUES (1, N'A', N'10')
INSERT [dbo].[FAQ] ([Id], [Question], [Answer]) VALUES (2, N'B', N'20')
INSERT [dbo].[FAQ] ([Id], [Question], [Answer]) VALUES (3, N'C', N'30')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[FooterInfo] ON 

INSERT [dbo].[FooterInfo] ([FooterId], [Privacy_Title], [Privacy_Discription], [Terms_Title], [Terms_Discription], [Return_Title], [Return_Discription]) VALUES (9, N'<p><span style="text-decoration: underline; font-size: 14pt;"><strong>Privacy Policy</strong></span></p>', N'<p>At Pack Food 2Go, accessible from https://www.packfood2go.co.uk, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by Pack Food 2Go and how we use it.</p>
<p>&nbsp;</p>
<p>If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.</p>
<p>&nbsp;</p>
<p>This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in Pack Food 2Go. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.</p>
<p>&nbsp;</p>
<p>Consent</p>
<p>By using our website, you hereby consent to our Privacy Policy and agree to its terms.</p>
<p>&nbsp;</p>
<p>Information we collect</p>
<p>The personal information that you are asked to provide, and the reasons why you are asked to provide it, will be made clear to you at the point we ask you to provide your personal information.</p>
<p>&nbsp;</p>
<p>If you contact us directly, we may receive additional information about you such as your name, email address, phone number, the contents of the message and/or attachments you may send us, and any other information you may choose to provide.</p>
<p>&nbsp;</p>
<p>When you register for an Account, we may ask for your contact information, including items such as name, company name, address, email address, and telephone number.</p>
<p>&nbsp;</p>
<p>How we use your information</p>
<p>We use the information we collect in various ways, including to:</p>
<p>&nbsp;</p>
<p>Provide, operate, and maintain our website</p>
<p>Improve, personalize, and expand our website</p>
<p>Understand and analyze how you use our website</p>
<p>Develop new products, services, features, and functionality</p>
<p>Communicate with you, either directly or through one of our partners, including for customer service, to provide you with updates and other information relating to the website, and for marketing and promotional purposes</p>
<p>Send you emails</p>
<p>Find and prevent fraud</p>
<p>Log Files</p>
<p>Pack Food 2Go follows a standard procedure of using log files. These files log visitors when they visit websites. All hosting companies do this and a part of hosting services&rsquo; analytics. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the site, tracking users&rsquo; movement on the website, and gathering demographic information.</p>
<p>&nbsp;</p>
<p>Advertising Partners Privacy Policies</p>
<p>You may consult this list to find the Privacy Policy for each of the advertising partners of Pack Food 2Go.</p>
<p>&nbsp;</p>
<p>Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Web Beacons that are used in their respective advertisements and links that appear on Pack Food 2Go, which are sent directly to users&rsquo; browser. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on websites that you visit.</p>
<p>&nbsp;</p>
<p>Note that Pack Food 2Go has no access to or control over these cookies that are used by third-party advertisers.</p>
<p>&nbsp;</p>
<p>Third Party Privacy Policies</p>
<p>Pack Food 2Go&rsquo;s Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.</p>
<p>&nbsp;</p>
<p>You can choose to disable cookies through your individual browser options. To know more detailed information about cookie management with specific web browsers, it can be found at the browsers&rsquo; respective websites.</p>
<p>&nbsp;</p>
<p>CCPA Privacy Rights (Do Not Sell My Personal Information)</p>
<p>Under the CCPA, among other rights, California consumers have the right to:</p>
<p>&nbsp;</p>
<p>Request that a business that collects a consumer&rsquo;s personal data disclose the categories and specific pieces of personal data that a business has collected about consumers.</p>
<p>&nbsp;</p>
<p>Request that a business delete any personal data about the consumer that a business has collected.</p>
<p>&nbsp;</p>
<p>Request that a business that sells a consumer&rsquo;s personal data, not sell the consumer&rsquo;s personal data.</p>
<p>&nbsp;</p>
<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>
<p>&nbsp;</p>
<p>GDPR Data Protection Rights</p>
<p>We would like to make sure you are fully aware of all of your data protection rights. Every user is entitled to the following:</p>
<p>&nbsp;</p>
<p>The right to access &ndash; You have the right to request copies of your personal data. We may charge you a small fee for this service.</p>
<p>&nbsp;</p>
<p>The right to rectification &ndash; You have the right to request that we correct any information you believe is inaccurate. You also have the right to request that we complete the information you believe is incomplete.</p>
<p>&nbsp;</p>
<p>The right to erasure &ndash; You have the right to request that we erase your personal data, under certain conditions.</p>
<p>&nbsp;</p>
<p>The right to restrict processing &ndash; You have the right to request that we restrict the processing of your personal data, under certain conditions.</p>
<p>&nbsp;</p>
<p>The right to object to processing &ndash; You have the right to object to our processing of your personal data, under certain conditions.</p>
<p>&nbsp;</p>
<p>The right to data portability &ndash; You have the right to request that we transfer the data that we have collected to another organization, or directly to you, under certain conditions.</p>
<p>&nbsp;</p>
<p>If you make a request, we have one month to respond to you. If you would like to exercise any of these rights, please contact us.</p>
<p>&nbsp;</p>
<p>Children&rsquo;s Information</p>
<p>Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.</p>
<p>&nbsp;</p>
<p>Pack Food 2Go does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our website, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.</p>', N'<p><span style="text-decoration: underline;"><span style="font-size: 14pt;"><strong>Terms and Conditions</strong></span></span></p>', N'<p>Welcome to Pack Food 2Go!</p>
<p>&nbsp;</p>
<p>These terms and conditions outline the rules and regulations for the use of Pack Food 2Go&rsquo;s Website, located at https://www.packfood2go.co.uk.</p>
<p>&nbsp;</p>
<p>By accessing this website we assume you accept these terms and conditions. Do not continue to use Pack Food 2Go if you do not agree to take all of the terms and conditions stated on this page.</p>
<p>&nbsp;</p>
<p>The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: &ldquo;Client&rdquo;, &ldquo;You&rdquo; and &ldquo;Your&rdquo; refers to you, the person log on this website and compliant to the Company&rsquo;s terms and conditions. &ldquo;The Company&rdquo;, &ldquo;Ourselves&rdquo;, &ldquo;We&rdquo;, &ldquo;Our&rdquo; and &ldquo;Us&rdquo;, refers to our Company. &ldquo;Party&rdquo;, &ldquo;Parties&rdquo;, or &ldquo;Us&rdquo;, refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client&rsquo;s needs in respect of provision of the Company&rsquo;s stated services, in accordance with and subject to, prevailing law of United Kingdom. Any use of the above terminology or other words in the singular, plural, capitalisation and/or he/she or they, are taken as interchangeable and therefore as referring to same.</p>
<p>&nbsp;</p>
<p>Cookies</p>
<p>We employ the use of cookies. By accessing Pack Food 2Go, you agreed to use cookies in agreement with the Pack Food 2Go&rsquo;s Privacy Policy.</p>
<p>&nbsp;</p>
<p>Most interactive websites use cookies to let us retrieve the user&rsquo;s details for each visit. Cookies are used by our website to enable the functionality of certain areas to make it easier for people visiting our website. Some of our affiliate/advertising partners may also use cookies.</p>
<p>&nbsp;</p>
<p>License</p>
<p>Unless otherwise stated, Pack Food 2Go and/or its licensors own the intellectual property rights for all material on Pack Food 2Go. All intellectual property rights are reserved. You may access this from Pack Food 2Go for your own personal use subjected to restrictions set in these terms and conditions.</p>
<p>&nbsp;</p>
<p>You must not:</p>
<p>&nbsp;</p>
<p>Republish material from Pack Food 2Go</p>
<p>Sell, rent or sub-license material from Pack Food 2Go</p>
<p>Reproduce, duplicate or copy material from Pack Food 2Go</p>
<p>Redistribute content from Pack Food 2Go</p>
<p>This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Terms And Conditions Generator and the Privacy Policy Generator.</p>
<p>&nbsp;</p>
<p>Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Pack Food 2Go does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Pack Food 2Go, its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Pack Food 2Go shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.</p>
<p>&nbsp;</p>
<p>Pack Food 2Go reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.</p>
<p>&nbsp;</p>
<p>You warrant and represent that:</p>
<p>&nbsp;</p>
<p>You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;</p>
<p>The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;</p>
<p>The Comments do not contain any defamatory, libellous, offensive, indecent or otherwise unlawful material which is an invasion of privacy</p>
<p>The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.</p>
<p>You hereby grant Pack Food 2Go a non-exclusive license to use, reproduce, edit and authorise others to use, reproduce and edit any of your Comments in any and all forms, formats or media.</p>
<p>&nbsp;</p>
<p>Hyperlinking to our Content</p>
<p>The following organisations may link to our Website without prior written approval:</p>
<p>&nbsp;</p>
<p>Government agencies;</p>
<p>Search engines;</p>
<p>News organisations;</p>
<p>Online directory distributors may link to our Website in the same manner as they hyperlink to the Websites of other listed businesses; and</p>
<p>System wide Accredited Businesses except soliciting non-profit organisations, charity shopping malls, and charity fundraising groups which may not hyperlink to our Web site.</p>
<p>These organisations may link to our home page, to publications or to other Website information so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products and/or services; and (c) fits within the context of the linking party&rsquo;s site.</p>
<p>&nbsp;</p>
<p>We may consider and approve other link requests from the following types of organisations:</p>
<p>&nbsp;</p>
<p>commonly-known consumer and/or business information sources;</p>
<p>dot.com community sites;</p>
<p>associations or other groups representing charities;</p>
<p>online directory distributors;</p>
<p>internet portals;</p>
<p>accounting, law and consulting firms; and</p>
<p>educational institutions and trade associations.</p>
<p>We will approve link requests from these organisations if we decide that: (a) the link would not make us look unfavourably to ourselves or to our accredited businesses; (b) the organisation does not have any negative records with us; (c) the benefit to us from the visibility of the hyperlink compensates the absence of Pack Food 2Go; and (d) the link is in the context of general resource information.</p>
<p>&nbsp;</p>
<p>These organisations may link to our home page so long as the link: (a) is not in any way deceptive; (b) does not falsely imply sponsorship, endorsement or approval of the linking party and its products or services; and (c) fits within the context of the linking party&rsquo;s site.</p>
<p>&nbsp;</p>
<p>If you are one of the organisations listed in paragraph 2 above and are interested in linking to our website, you must inform us by sending an e-mail to Pack Food 2Go. Please include your name, your organisation name, contact information as well as the URL of your site, a list of any URLs from which you intend to link to our Website, and a list of the URLs on our site to which you would like to link. Wait 2-3 weeks for a response.</p>
<p>&nbsp;</p>
<p>Approved organisations may hyperlink to our Website as follows:</p>
<p>&nbsp;</p>
<p>By use of our corporate name; or</p>
<p>By use of the uniform resource locator being linked to; or</p>
<p>By use of any other description of our Website being linked to that makes sense within the context and format of content on the linking party&rsquo;s site.</p>
<p>No use of Pack Food 2Go&rsquo;s logo or other artwork will be allowed for linking absent a trademark license agreement.</p>
<p>&nbsp;</p>
<p>iFrames</p>
<p>Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.</p>
<p>&nbsp;</p>
<p>Content Liability</p>
<p>We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libellous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.</p>
<p>&nbsp;</p>
<p>Your Privacy</p>
<p>Please read Privacy Policy</p>
<p>&nbsp;</p>
<p>Reservation of Rights</p>
<p>We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it&rsquo;s linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.</p>
<p>&nbsp;</p>
<p>Removal of links from our website</p>
<p>If you find any link on our Website that is offensive for any reason, you are free to contact and inform us any moment. We will consider requests to remove links but we are not obligated to or so or to respond to you directly.</p>
<p>&nbsp;</p>
<p>We do not ensure that the information on this website is correct, we do not warrant its completeness or accuracy; nor do we promise to ensure that the website remains available or that the material on the website is kept up to date.</p>
<p>&nbsp;</p>
<p>Disclaimer</p>
<p>To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:</p>
<p>&nbsp;</p>
<p>limit or exclude our or your liability for death or personal injury;</p>
<p>limit or exclude our or your liability for fraud or fraudulent misrepresentation;</p>
<p>limit any of our or your liabilities in any way that is not permitted under applicable law; or</p>
<p>exclude any of our or your liabilities that may not be excluded under applicable law.</p>
<p>The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.</p>
<p>&nbsp;</p>
<p>As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.</p>', N'<p><span style="text-decoration: underline; font-size: 14pt;"><strong>DELIVERY TERMS</strong></span></p>', N'<p>DELIVERY CHARGES</p>
<p>Packages are usually delivered in next working day after receipt of payment by 12pm via DPD.</p>
<p>&nbsp;</p>
<p>ORDERS OVER &pound;99.00 EXC VAT</p>
<p>Standard shipping is FREE on orders over &pound;99.00 exclusive of VAT to the UK Mainland (Not including Scottish Highland and certain rural addresses)*.</p>
<p>While we aim to supply a stellar delivery service at all times, there may on occasion be a slight delay, so generally allow up to 3 days. We will do our most to contact you should any delays arise.&nbsp;</p>
<p>Free delivery is for UK mainland only; it does not apply to Scottish Highlands and Islands, Northern Ireland, Southern Ireland, Isle of Man and all offshore Isles.</p>
<p>&nbsp;</p>
<p>ORDERS UNDER &pound;99.00 EXC VAT</p>
<p>Shipping costs are calculated based on total number of parcels &amp; total weight of the parcels. In the UK Mainland, for a consignment up to 20kg there is a charge &pound;7.99 + VAT &amp; &pound;0.31 per kg above 20kg.</p>
<p>&nbsp;</p>
<p>DELIVERY TERMS</p>
<p>It is the customers&rsquo; responsibility to be in when your order is due for delivery. It is essential to arrange to have your order delivered to an address where someone will be there to receive it. Packages are usually delivered in next working day after receipt of payment.</p>
<p>&nbsp;</p>
<p>The delivery service is based on a 1-3 working day service, meaning orders placed before 3pm Monday to Thursday will be delivered in 1-3 working days and orders placed before 3pm on Friday will be delivered on the following week. For UK mainland, we endeavour to provide a next day delivery service as long as you order within the correct time restrictions. Please note that although this service is generally reliable IT IS NOT GUARANTEED and no delivery time is stipulated.</p>
<p>&nbsp;</p>
<p>All our services are trackable and if you call us then we will be happy to supply you with tracking details of your parcel.</p>
<p>&nbsp;</p>
<p>Our usually delivery service is Monday &ndash; Friday (Our couriers can deliver on a Saturday, but it is a premium service at extra cost, and not quite as reliable.) Please contact us if you require a Saturday delivery &amp; we will be happy to help.</p>
<p>&nbsp;</p>
<p>Please note some UK destinations are too remote to receive a 1-3 day service. Please check to see whether your postcode is able to receive deliveries before placing an order and paying for this service.</p>
<p>&nbsp;</p>
<p>No deliveries will be made on Christmas Day, Boxing Day, New Years Day and bank holidays.</p>
<p>&nbsp;</p>
<p>*To qualify for free UK mainland delivery, your order must be over &pound;99.00 excluding VAT and cannot weigh more than 70kg or be more than five (5) parcels. If you order weighs more than 70kg or is more than five (5) parcels, extra delivery charges may apply.</p>
<p>&nbsp;</p>
<p>We contract a Third Party for deliveries, although we endeavour to achieve our 1-3 day delivery service we cannot be held responsible for hub depot break downs, vehicle breakdowns, extreme weather conditions acts of malicious or terrorist incidents or any unforeseen occurrences that delay or curtail your delivery. (Please order in plenty of time for vital deliveries) accidents do happen rarely. Our Third party deliveries are contracted only to deliver to customer&rsquo;s threshold (door) not to where the customer may want goods put. Any order refused because driver will not carry item to a specific area other than threshold will not be accepted and will be liable for return postage and incur a &pound;25 administration fee as the delivery company has fulfilled their contract you have broken yours by not accepting delivery. Any parcel delivered that in your opinion appears damaged parcel must be signed for as damaged, do not sign parcels as unchecked no claims for damages can be claimed at later date. Please report any problems with your order within 48 hours of receipt.</p>
<p>&nbsp;</p>
<p>If you have any questions or need further information regarding shipment please contact us &amp; we will be happy to help.</p>
<p>&nbsp;</p>
<p>BACK ORDER</p>
<p>If the items the Customer is ordering are not in stock, the Company will dispatch when back in stock, the Customer will be quoted an estimated delivery date or offered a suitable alternative if the item is no longer available. The Customer will always be emailed with the option to cancel their order if they do not accept the new delivery date or the alternative item offered is not acceptable.</p>
<p>&nbsp;</p>
<p>RETURNS</p>
<p>Should you wish to return an item please first contact head office for authorisation. Returns should be posted back at the customer&rsquo;s expense. Where items are being returned we insist that they are returned unopened and unused and in their own original packaging. Goods must be returned in full pack quantities. We cannot offer any refunds if a partial pack quantity is returned.</p>
<p>&nbsp;</p>
<p>Once items arrive back at our warehouse, we will inspect the product and upon acceptance, then issue a refund accordingly.</p>
<p>&nbsp;</p>
<p>We are unable to refund carriage charges due to incurred costs as soon as the goods are dispatched from our store.</p>
<p>&nbsp;</p>
<p>If your order includes a small order charge, this will not be included as part of the refund.</p>
<p>&nbsp;</p>
<p>Please make sure you get a receipt from the post office or delivery service when you return an item in case of damage or loss.</p>
<p>&nbsp;</p>
<p>Should you need to return an item that was incorrect due to an error on our side, we will arrange collection and a full refund will be issued.</p>')
SET IDENTITY_INSERT [dbo].[FooterInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterHomePage] ON 

INSERT [dbo].[MasterHomePage] ([HomeId], [DescriptionOffer], [WebsiteTitle], [FeaturedProductTitle], [FeaturedProductDescription], [PromoTitle], [PromoTagline], [PromoDescription], [PromoProductname], [PromoOffertag], [CompanyContactNo], [CompanyEmail], [CompanyDescription], [CompanyAddress], [PromoImage], [BgImage]) VALUES (9, N'3-5 BUSINESS DAYS DELIVERY & FREE RETURNS', N'PACKFOODREADY2GO', N'Featured Products', N'Be Creative. Be Green. Be Eco', N'Best Price For You', N'Deal of the Day', N'Be Creative. Be Green. Be Eco', N' Paper Accessories', N'Now with 20$ discount', N'999999999', N'info@aacaterimgdisposables.co.uk', N'We try to stock the best quality products at the best possible price. If you would like any samples or need any advice about products please email or phone us and we will help to the best of our ability.', N'AA Catering Disposables Ltd 1 Grafton Place Morecambe Lancashire LA3 1RZ', N'bg_img.jpg', N'com.jpg')
SET IDENTITY_INSERT [dbo].[MasterHomePage] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 1, 5, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 2, 4, 2, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 2, 5, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 5, 5, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 6, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (13, 8, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (14, 8, 5, 1, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (16, 10, 12, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (18, 12, 13, 1, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (19, 12, 14, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (20, 13, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (21, 14, 17, 1, CAST(789.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (24, 17, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (25, 18, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (26, 18, 17, 2, CAST(789.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (27, 19, 7, 1, CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (28, 20, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (29, 20, 11, 1, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (30, 21, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (31, 22, 4, 2, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (32, 23, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (33, 24, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (34, 25, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (35, 26, 7, 1, CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (36, 27, 7, 1, CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (37, 28, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (38, 29, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (39, 30, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (40, 31, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (41, 32, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (42, 33, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (43, 34, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (44, 35, 4, 2, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (45, 36, 5, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (46, 37, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (47, 38, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (48, 39, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (49, 39, 13, 1, CAST(68.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (50, 40, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (51, 41, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (52, 42, 16, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (53, 43, 5, 2, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (54, 43, 7, 2, CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (55, 44, 5, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (56, 44, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (57, 45, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (58, 46, 5, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (59, 47, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (60, 48, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (61, 49, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (62, 50, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (63, 50, 12, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (64, 50, 16, 2, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (65, 51, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (66, 51, 17, 3, CAST(79.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (67, 51, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (68, 52, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (69, 53, 10, 2, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (70, 53, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (71, 54, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (72, 54, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (73, 55, 13, 2, CAST(68.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (74, 56, 12, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (75, 56, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (76, 56, 18, 2, CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (77, 57, 10, 3, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (78, 57, 9, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (79, 58, 10, 5, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (80, 58, 5, 2, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (81, 59, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (82, 60, 10, 3, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (83, 60, 12, 3, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (84, 61, 9, 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (85, 62, 5, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (86, 62, 16, 1, CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (87, 63, 14, 2, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (88, 64, 9, 4, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (89, 65, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (90, 65, 14, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (91, 66, 9, 3, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1091, 1066, 4, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1092, 1066, 10, 1, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1093, 1067, 7, 1, CAST(55.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1094, 1067, 5, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1095, 1068, 10, 1, CAST(600.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (1, 1, N'10575.00', N'160.00', N'10735.00', N'Shipped', CAST(N'2024-02-27T15:09:44.993' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (2, 1, N'10167.00', N'33.00', N'10200.00', N'Processing', CAST(N'2024-02-27T18:12:02.477' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (3, 1, N'292.00', N'53.00', N'345.00', N'Shipped', CAST(N'2024-02-29T12:37:44.013' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (4, 1, N'292.00', N'53.00', N'345.00', N'Shipped', CAST(N'2024-02-29T12:44:17.830' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (5, 1, N'9989.00', N'11.00', N'10000.00', NULL, CAST(N'2024-02-29T12:51:31.777' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (6, 1, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-02-29T12:56:51.343' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (7, 1, N'290.00', N'10.00', N'300.00', NULL, CAST(N'2024-02-29T13:00:06.700' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (8, 1, N'10078.00', N'22.00', N'10100.00', NULL, CAST(N'2024-02-29T13:05:07.223' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (9, 1, N'290.00', N'10.00', N'300.00', NULL, CAST(N'2024-02-29T13:05:54.243' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (10, 1, N'130.00', N'20.00', N'150.00', NULL, CAST(N'2024-02-29T13:37:37.880' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (11, 1, N'290.00', N'10.00', N'300.00', NULL, CAST(N'2024-02-29T13:39:40.537' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (12, 1, N'75.00', N'30.00', N'105.00', NULL, CAST(N'2024-02-29T15:55:50.317' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (13, 1, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-02-29T16:26:06.030' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (14, 1, N'779.00', N'10.00', N'789.00', NULL, CAST(N'2024-02-29T16:28:42.397' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (15, 1, N'95.00', N'5.00', N'100.00', NULL, CAST(N'2024-02-29T16:31:38.460' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (16, 1, N'95.00', N'5.00', N'100.00', NULL, CAST(N'2024-02-29T16:43:11.690' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (17, 1, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-02-29T17:32:11.493' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (18, 3, N'1647.00', N'31.00', N'1678.00', NULL, CAST(N'2024-03-01T13:06:13.103' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (19, 3, N'35.00', N'20.00', N'55.00', NULL, CAST(N'2024-03-01T15:07:35.930' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (20, 3, N'329.00', N'21.00', N'350.00', NULL, CAST(N'2024-03-04T10:39:45.207' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (21, 3, N'69.00', N'31.00', N'100.00', NULL, CAST(N'2024-03-04T11:28:12.203' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (22, 3, N'158.00', N'42.00', N'200.00', NULL, CAST(N'2024-03-04T11:40:42.350' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (23, 3, N'69.00', N'31.00', N'100.00', NULL, CAST(N'2024-03-04T12:01:45.710' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (24, 3, N'69.00', N'31.00', N'100.00', NULL, CAST(N'2024-03-04T12:03:12.867' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (25, 3, N'69.00', N'31.00', N'100.00', NULL, CAST(N'2024-03-04T12:04:39.490' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (26, 3, N'35.00', N'20.00', N'55.00', NULL, CAST(N'2024-03-04T12:17:23.897' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (27, 3, N'35.00', N'20.00', N'55.00', NULL, CAST(N'2024-03-04T12:46:08.750' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (28, 3, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-03-04T13:02:09.907' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (29, 3, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-03-04T13:03:50.610' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (30, 3, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-03-04T13:05:17.210' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (31, 3, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-03-04T14:32:17.463' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (32, 3, N'89.00', N'11.00', N'100.00', NULL, CAST(N'2024-03-04T14:33:31.930' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (33, 3, N'69.00', N'31.00', N'100.00', NULL, CAST(N'2024-03-04T15:02:46.983' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (34, 3, N'550.00', N'50.00', N'600.00', NULL, CAST(N'2024-03-04T15:10:37.200' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (35, 3, N'178.00', N'22.00', N'200.00', NULL, CAST(N'2024-03-05T14:49:56.440' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (36, 3, N'139.00', N'11.00', N'150.00', NULL, CAST(N'2024-03-06T11:33:44.973' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (37, 3, N'580.00', N'20.00', N'600.00', NULL, CAST(N'2024-03-06T11:37:54.443' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (38, 3, N'257.00', N'43.00', N'300.00', NULL, CAST(N'2024-03-06T11:45:13.947' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (39, 3, N'588.00', N'80.00', N'668.00', NULL, CAST(N'2024-03-06T15:40:12.953' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (40, 1, N'257.00', N'43.00', N'300.00', NULL, CAST(N'2024-03-06T15:45:32.730' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (41, 1, N'257.00', N'43.00', N'300.00', NULL, CAST(N'2024-03-07T12:30:15.257' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (42, 1, N'40.00', N'10.00', N'50.00', NULL, CAST(N'2024-03-07T12:41:29.710' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (43, 3, N'155.8000', N'62.00', N'410.00', NULL, CAST(N'2024-03-08T11:10:01.373' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (44, 3, N'517.5000', N'31.00', N'750.00', NULL, CAST(N'2024-03-08T11:28:56.580' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (45, 1, N'580.00', N'20.00', N'600.00', NULL, CAST(N'2024-03-08T12:22:33.937' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (46, 1, N'139.00', N'11.00', N'150.00', NULL, CAST(N'2024-03-08T12:39:07.107' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (47, 1, N'257.00', N'43.00', N'300.00', NULL, CAST(N'2024-03-08T12:56:07.700' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (48, 1, N'89.0000', N'11.00', N'100.00', NULL, CAST(N'2024-03-11T12:23:45.857' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (49, 1, N'89.0000', N'11.00', N'100.00', NULL, CAST(N'2024-03-11T15:47:49.470' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (50, 3, N'340.0000', N'60.00', N'850.00', NULL, CAST(N'2024-03-12T11:30:23.457' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (51, 3, N'79.5900', N'93.00', N'1137.00', NULL, CAST(N'2024-03-12T11:38:40.620' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (52, 3, N'480.0000', N'20.00', N'600.00', NULL, CAST(N'2024-03-12T11:44:43.543' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (53, 3, N'255.0000', N'83.00', N'1500.00', NULL, CAST(N'2024-03-12T11:50:59.063' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (54, 3, N'333.0000', N'63.00', N'900.00', NULL, CAST(N'2024-03-12T11:57:23.907' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (55, 3, N'81.6000', N'40.00', N'136.00', NULL, CAST(N'2024-03-12T12:19:27.257' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (56, 3, N'161.5000', N'83.00', N'950.00', NULL, CAST(N'2024-03-12T12:22:41.027' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (57, 3, N'-84.0000', N'104.00', N'2100.00', NULL, CAST(N'2024-03-13T11:48:08.290' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (58, 3, N'2691.0000', N'23.00', N'3300.00', NULL, CAST(N'2024-03-13T12:36:34.247' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (59, 3, N'480.0000', N'20.00', N'600.00', NULL, CAST(N'2024-03-13T18:24:43.917' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (60, 3, N'1867.5000', N'25.00', N'2250.00', NULL, CAST(N'2024-03-15T13:27:10.930' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (61, 3, N'576.0000', N'24.00', N'600.00', NULL, CAST(N'2024-03-15T13:30:45.417' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (62, 1, N'190.5000', N'13.00', N'200.00', NULL, CAST(N'2024-03-15T15:00:32.253' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (63, 4, N'180.0000', N'30.00', N'200.00', NULL, CAST(N'2024-03-15T15:24:21.020' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (64, 3, N'1152.0000', N'4.00', N'1200.00', NULL, CAST(N'2024-03-15T18:10:36.967' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (65, 3, N'570.0000', N'30.00', N'700.00', NULL, CAST(N'2024-03-18T12:13:14.103' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (66, 4, N'864.0000', N'24.00', N'900.00', NULL, CAST(N'2024-03-18T17:20:23.490' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (1066, 3, N'573.0000', N'27.00', N'700.00', NULL, CAST(N'2024-04-15T15:41:15.483' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (1067, 3, N'195.0000', N'13.00', N'205.00', NULL, CAST(N'2024-04-18T19:01:52.907' AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [TotalAmount], [Discount], [SubTotal], [OrderStatus], [OrderDate]) VALUES (1068, 3, N'480.0000', N'20.00', N'600.00', NULL, CAST(N'2024-06-11T12:11:52.183' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (1, CAST(200.00 AS Decimal(18, 2)), N'INR', N'succeeded', N'Card', 1, CAST(N'2024-11-11T13:23:44.000' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (2, CAST(25700.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-06T09:56:43.993' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (3, CAST(257.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-06T10:03:50.730' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (4, CAST(588.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-06T10:11:01.790' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (5, CAST(257.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-06T10:16:10.600' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (6, CAST(257.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-07T07:01:55.167' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (7, CAST(40.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-07T07:12:22.183' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (9, CAST(517.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-08T05:59:33.897' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (10, CAST(517.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-08T05:59:46.100' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (11, CAST(517.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-08T06:03:45.043' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (12, CAST(517.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-08T06:04:54.680' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (13, CAST(580.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-08T06:53:26.817' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (15, CAST(139.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-08T07:09:53.637' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (16, CAST(257.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-08T07:26:49.190' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (22, CAST(89.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-11T06:54:37.270' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (49, CAST(89.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-11T10:19:13.303' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (55, CAST(340.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:01:00.663' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (56, CAST(79.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:09:11.227' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (59, CAST(79.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:13:40.393' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (60, CAST(79.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:14:13.820' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (61, CAST(79.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:14:20.187' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (62, CAST(480.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:15:09.523' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (64, CAST(255.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:21:30.677' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (65, CAST(333.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:28:18.577' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (66, CAST(333.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:46:02.160' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (67, CAST(81.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:49:56.420' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (70, CAST(161.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T06:53:06.920' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (71, CAST(161.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-12T07:05:30.243' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (74, CAST(2691.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-13T07:07:09.267' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (75, CAST(480.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-13T12:55:17.790' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (76, CAST(1867.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-15T07:57:44.487' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (77, CAST(576.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-15T08:01:28.320' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (78, CAST(190.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 1, CAST(N'2024-03-15T09:31:26.210' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (79, CAST(180.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 4, CAST(N'2024-03-15T09:56:03.523' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (80, CAST(1152.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-15T12:41:21.173' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (81, CAST(570.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-03-18T06:45:07.137' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (82, CAST(570.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 4, CAST(N'2024-03-18T11:45:38.417' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (83, CAST(864.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 4, CAST(N'2024-03-18T11:50:57.610' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (1082, CAST(573.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-04-15T10:12:04.563' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (1083, CAST(195.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-04-18T13:32:28.897' AS DateTime))
INSERT [dbo].[Payment] ([PaymentId], [Amount], [Currency], [Status], [PaymentMethod], [CustomerID], [CreatedAt]) VALUES (1084, CAST(480.00 AS Decimal(18, 2)), N'inr', N'succeeded', N'card', 3, CAST(N'2024-06-11T06:45:32.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (4, N'Rectangular Buffet Tray', 3, 2, 5, CAST(100.00 AS Decimal(10, 2)), N'22', N'100cm', N'Plastic', CAST(7.00 AS Decimal(5, 2)), 5, N'DS9C_Mini_Rectangular_Black_Buffet_Tray_Lid_Combo.jpg', N'Tray', N'Rectangular Platters are one of our largest sections and our most popular products. We stock  large quantities of the rectangular platters section so that we do not disappoint our  customers.', NULL, CAST(N'2024-03-13T11:32:44.210' AS DateTime), 0, 3.25)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (5, N'Rectangular Black Buffet Tray', 3, 2, 8, CAST(150.00 AS Decimal(10, 2)), N'22', N'11', N'Plastic', CAST(3.00 AS Decimal(5, 2)), 6, N'DS17_Rectangular_Black_Buffet_Tray.jpg', N'Tray', N'Rectangular Platters are one of our largest sections and our most popular products. We stock  large quantities of the rectangular platters section so that we do not disappoint our  customers.', NULL, CAST(N'2024-07-11T15:29:21.200' AS DateTime), 0, 4.666666666666667)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (7, N'Round Plastic Lid', 3, 3, 10, CAST(55.00 AS Decimal(10, 2)), N'12', N'98', N'Plastic', CAST(10.00 AS Decimal(5, 2)), 5, N'DSR12L_Round_Clear_Plastic_Lid_for_DSR12_12_Cased_50.jpg', N'tray', N'Round Plastic Platters are beautiful, stylish and available in 3 sizes with matching plastic  platter lids.', CAST(N'2024-02-27T14:48:33.887' AS DateTime), CAST(N'2024-03-13T11:34:11.893' AS DateTime), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (8, N'Black Sandwich platter ', 3, 6, 4, CAST(75.00 AS Decimal(10, 2)), N'67', N'7', N'Plastic', CAST(20.00 AS Decimal(5, 2)), 6, N'DSPL_B_17_Inch_Black_Sandwich_Platter_Base_.jpg', N'tary', N'Octagonal Platters are an elegant way to showcase your food. The Black Plastic Platter bases  with matching clear dome plastic lids are of the highest quality.', CAST(N'2024-02-27T14:51:39.897' AS DateTime), NULL, 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (9, N'Octagonal White Lid ', 3, 6, 7, CAST(300.00 AS Decimal(10, 2)), N'9', N'6', N'Plastic', CAST(4.00 AS Decimal(5, 2)), 1, N'DSPL_L_Lid_To_Fit_17_Inch_Platter_Base_Lid_cased_100.jpg', N'tray', N'Octagonal Platters are an elegant way to showcase your food. The Black Plastic Platter bases  with matching clear dome plastic lids are of the highest quality.', CAST(N'2024-02-27T14:53:30.870' AS DateTime), CAST(N'2024-03-13T11:35:10.363' AS DateTime), 0, 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (10, N'Paper Dinner Plate', 3, 4, 5, CAST(600.00 AS Decimal(10, 2)), N'7', N'8', N'Paper', CAST(20.00 AS Decimal(5, 2)), 1, N'Paper_Dinner_Plate_Compostable_Superior_Quality_PP9_cased_500.jpg', N'plate', N'If you are holding an event that requires Compostable or Biodegradable Platters and Plates,  then this section is for you! The Compostable Platters are now the same cost as the Black  Plastic Platters and fit the same lids.', CAST(N'2024-02-27T14:56:34.663' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (11, N'Square Foil Container', 4, 9, 5, CAST(250.00 AS Decimal(10, 2)), N'50', N'100cm', N'Aluminium', CAST(10.00 AS Decimal(5, 2)), 5, N'Square_Foil_Container_6_830570_cased_500.jpg', N'Foil', N'Another popular type of the Aluminium Foil Containers is the Square Foil Container. All three  of these take a lid if required. The containers with the foil codes 2820 and 2824 are excellent  for cooking a family sized chicken.', CAST(N'2024-02-27T16:28:30.317' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (12, N'Dish Foil Container', 4, 10, 10, CAST(150.00 AS Decimal(10, 2)), N'100', N'200', N'Aluminium', CAST(5.00 AS Decimal(5, 2)), 10, N'Ashet_Pie_Foil_Container_1lb_2662_cased_700.jpg', N'Dish', N'Our extensive range of Aluminium Dish Foils are perfect for meat pies, side dishes and cottage  pies. All our Dish Foils are part of our extensive Aluminium Foil Containers range. None of the  Dish Foils take a lid, so our Dish Foils are finished with a rolled edge', CAST(N'2024-02-27T16:36:04.573' AS DateTime), CAST(N'2024-03-13T11:35:33.477' AS DateTime), 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (13, N'Deep-Fill Self-Seal Snadwich Pack Kraft ', 5, 11, 10, CAST(68.00 AS Decimal(10, 2)), N'100', N'250', N'plastic ', CAST(20.00 AS Decimal(5, 2)), 10, N'Deep_fill_Self_Seal_Sandwich_Pack_(Kraft)_ES004C_SUN_Cased_500.jpg', N'try', N'There are so many ways to wrap sandwich products to make our lives convenient. Our  Sandwich Packaging is easy to use and is designed to enhance your products. This Sandwich  Packaging section contains sandwich wedges, heat seal bags, tortilla wraps and baguette  packaging.', CAST(N'2024-02-27T16:52:12.507' AS DateTime), NULL, 0, 2.2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (14, N'Film for Sealing Sandwich Wedge ', 5, 11, 8, CAST(100.00 AS Decimal(10, 2)), N'85', N'250', N'paper', CAST(10.00 AS Decimal(5, 2)), 7, N'Film_for_Sealing_ES004B_Sandwich_Wedge_F97M.jpg', N'vc', N'There are so many ways to wrap sandwich products to make our lives convenient. Our  Sandwich Packaging is easy to use and is designed to enhance your products. This Sandwich  Packaging section contains sandwich wedges, heat seal bags, tortilla wraps and baguette  packaging.', CAST(N'2024-02-27T16:58:41.317' AS DateTime), CAST(N'2024-07-11T15:17:21.290' AS DateTime), 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (15, N'Tortilla wrap kraft card', 5, 12, 345, CAST(65.00 AS Decimal(10, 2)), N'4', N'67', N'paper', CAST(2.00 AS Decimal(5, 2)), 6, N'Tortilla_Wrap_Kraft_Card_TS2K_cased_1000.jpg', N'cvbn', N'Tortilla Wraps and Baguette boxes are great individually designed products to showcase the  product fully. The clarity of the baguette trays allows the customer to see the contents of the  sandwiches and they have a secure closure. The two Kraft items can be heat seal bagged for  security and cleanliness. This tortilla wraps and baguettes section is also where you will find  the clear hinged plastic bap box.', CAST(N'2024-02-27T17:03:37.490' AS DateTime), NULL, 0, 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (16, N'Bap Box Shallow', 5, 11, 5, CAST(50.00 AS Decimal(10, 2)), N'100', N'250', N'Plastic', CAST(10.00 AS Decimal(5, 2)), 10, N'Bap_Box_Shallow_RB1_cased_300.jpg', N'box', N'Tortilla Wraps and Baguette boxes are great individually designed products to showcase the  product fully. The clarity of the baguette trays allows the customer to see the contents of the  sandwiches and they have a secure closure. The two Kraft items can be heat seal bagged for  security and cleanliness. This tortilla wraps and baguettes section is also where you will find  the clear hinged plastic bap box.', CAST(N'2024-02-27T17:05:58.627' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (17, N'High Density White Carrior Bags', 6, 13, 12, CAST(79.00 AS Decimal(10, 2)), N'45', N'12', N'Plastic', CAST(10.00 AS Decimal(5, 2)), 7, N'HDVC1117-copy-510x510.jpg', N'Bags', N'Quality Film Front Bags come in all sizes. In this section you can find block bottom bags with  side gussets either with or without a handle. The handles of the heritage bags are securely  fastened so as not to come off in use.', NULL, CAST(N'2024-03-11T13:22:12.297' AS DateTime), 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (18, N'Swamsoft Slip Covers Claret/Burgundy', 7, 16, 10, CAST(250.00 AS Decimal(10, 2)), N'100', N'2000', N'Plastic', CAST(10.00 AS Decimal(5, 2)), 5, N'Foil_Board_Lid.jpg', N'Cover', N'Slipcovers are measuring approximately 90cm squared, whereas Table Covers are  approximately 120cm squared. ', NULL, CAST(N'2024-03-13T12:45:39.840' AS DateTime), 0, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [SubCategoryID], [QuantityPerUnit], [UnitPrice], [Capacity], [Size], [Material], [Discount], [UnitInStock], [ImageURL], [AltText], [Description], [CreatedBy], [ModifiedBy], [IsDeleted], [AverageRating]) VALUES (164, N'vv', 3, 3, 1, CAST(1.00 AS Decimal(10, 2)), N'1', N'1', N'a', CAST(1.00 AS Decimal(5, 2)), 1, N'DS22L_Lid_for_Rectangular_Black_Buffet_Tray_22_Cased_50.jpg', N'w', N'e', CAST(N'2024-09-16T17:20:40.933' AS DateTime), CAST(N'2024-09-16T17:25:46.867' AS DateTime), 0, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Review] ON 

INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (1, 4, N'Manav', N'manav@gmail.com', N'Very good', N'Had a Great experience . Material quality was also very good.', 5, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (2, 5, N'Hetvi', N'hetvi@gmail.com', N'Good', N'I''m quite satisfied with the Rectangular Black Buffet Tray I purchased. It''s stylish, sturdy, and spacious enough to accommodate various dishes. The matte black finish adds a touch of elegance to my table setting, and I appreciate the durability of the tray. ', 4, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (3, 4, N'Mohit', N'mohit@gmail.com', N'Average', N'The Rectangular Buffet Tray is decent for the price. It''s spacious enough to hold a variety of dishes and has a simple, classic design. However, the quality is average at best. The tray feels a bit thin, and I''m concerned about its long-term durability. It''s suitable for basic serving needs but lacks any standout features.', 3, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (4, 4, N'Jaya', N'jaya@gmail.com', N'Moderate Product', N'I''m quite pleased with the Rectangular Buffet Tray. It''s sturdy and well-made, with a sleek design that complements any table setting. The tray is spacious enough to hold multiple dishes, and the surface is easy to clean. While it''s not perfect, it''s a reliable option for entertaining guests.', 3, CAST(N'2024-03-18' AS Date))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (1002, 4, N'v', N'jaya@gmail.com', N'Bad', N'not like', 2, NULL)
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (1003, 8, N'd', N'd@aa', N'bad', N'fdds', 1, NULL)
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (1004, 8, N'a', N'a@aa', N'bad', N'dsd', 1, NULL)
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (1005, 5, N'Nidhi', N'nidhi@gmail.com', N'Satisfied', N'Great product', 5, CAST(N'2024-04-15' AS Date))
INSERT [dbo].[Review] ([ReviewID], [ProductID], [CustomerName], [CustomerEmail], [ReviewTitle], [ReviewDescription], [Rating], [ReviewDate]) VALUES (1006, 5, N'jaya', N'jaya@gmail.com', N'Very good', N'Satisfied and good quality', 5, CAST(N'2024-04-18' AS Date))
SET IDENTITY_INSERT [dbo].[Review] OFF
GO
SET IDENTITY_INSERT [dbo].[ShippingAddress] ON 

INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (1, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (2, 1, N'Jaya', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (3, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'india', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (4, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (5, 1, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (6, 1, N'a', N'a', N'manav@gmail.com', N'a', N'a', N'a', N'a', N'aa', N'a')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (7, 1, N'a', N'a', N'a@gmail.com', N'a', N'a', N'a', N'a', N'a', N'a')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (8, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (9, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (10, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (11, 1, N'Manav', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (12, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (13, 1, N'aaa', N'a', N'daverucha2002@gmail.com', N'a', N'a', N'a', N'a', N'a', N'a')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (14, 1, N'Manav', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (15, 1, N'Manav', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (16, 1, N'a', N'a', N'daverucha2002@gmail.com', N'a', N'a', N'a', N'a', N'a', N'a')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (17, 1, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (18, 3, N'Jaya', N'Joshi', N'Jaya@gmail.com', N'9825171213', N'ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (19, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (20, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (21, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (22, 3, N'a', N'a', N'daverucha2002@gmail.com', N'9825171213', N'aa', N'a', N'a', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (23, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (24, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (25, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (26, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (27, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (28, 3, N'Jaya', N'JOSHI', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (29, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (30, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (31, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (32, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (33, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (34, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (35, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (36, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (37, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (38, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (39, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (40, 1, N'Manav', N'Vyas', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (41, 1, N'virat', N'kohli', N'vidhigoyani610@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (42, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (43, 3, N'Jaya', N'qq', N'daverucha2002@gmail.com', N'qq', N'qq', N'qq', N'qq', N'qq', N'qq')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (44, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (45, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (46, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (47, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (48, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (49, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (50, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (51, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (52, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (53, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (54, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (55, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (56, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (57, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (58, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (59, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (60, 3, N'Jaya', N'Joshi', N'Jaya@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (61, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (62, 1, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (63, 4, N'virat', N'kohli', N'vk@gmail.com', N'07894561230', N'qwertyuikmjnbvcd', N'India', N'Punjab', N'surat', N'394230')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (64, 3, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (65, 3, N'Jaya', N'Joshi', N'jaya@gmail.com', N'9825171213', N'ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (66, 4, N'Jaya', N'Joshi', N'daverucha2002@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (1066, 3, N'Jaya', N'Joshi', N'Jaya@gmail.com', N'9630026310', N'Adajan', N'India', N'Gujarat', N'Surat', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (1067, 3, N'Jaya', N'Joshi', N'jaya@gmail.com', N'9825171213', N'15, GREEN ENCLAVE ROW HOUSE, NEAR GUJARAT GAS CIRCLE, ADAJAN, SURAT', N'India', N'Gujarat', N'SURAT', N'395009')
INSERT [dbo].[ShippingAddress] ([ShippingID], [CustomerID], [FirstName], [LastName], [Email], [Mobile], [Address], [Country], [State], [City], [PostCode]) VALUES (1068, 3, N'vidhi', N'goyani', N'vg@gmail.com', N'07894561230', N'pal', N'India', N'gujrat', N'surat', N'394230')
SET IDENTITY_INSERT [dbo].[ShippingAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([SliderId], [SliderImage], [SliderTitle], [SliderDescription], [SliderButtonTitle]) VALUES (1, N's2.jpg', N'ECO FOOD & DRINK', N'Be Creative. Be Green. Be Eco', N'SHOP NOW')
INSERT [dbo].[Slider] ([SliderId], [SliderImage], [SliderTitle], [SliderDescription], [SliderButtonTitle]) VALUES (2, N's4.jpg', N'FRESH PACKAGING', N'Sustainable packaging for your everyday business needs.', N'SHOP NOW')
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (2, 3, N'Rectangle Platters')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (3, 3, N'Round Platters')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (4, 3, N'Compostable Platters & Plates')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (6, 3, N'Octagonal Platters')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (7, 3, N'Platter Bags')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (8, 4, N'Oblong Foils')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (9, 4, N'Square Foils')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (10, 4, N'Dish Foils and Basin Foils')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (11, 5, N'Sandwich Wedges')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (12, 5, N'Tortilla Wraps &  Baguettes')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (13, 6, N'Paper Bags & FIlms Front Bags')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (14, 7, N'Napkins, Banquet Rolls & Doyleys')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (15, 6, N'Carrier Bags & Refuse Sacks')
INSERT [dbo].[SubCategory] ([SubCategoryID], [CategoryID], [SubCategoryName]) VALUES (16, 7, N'Slip Cover & Table Cover')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[Wishlist] ON 

INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [CreatedBy], [ModifiedBy]) VALUES (3, 1, 10, CAST(N'2024-02-28T09:17:55.867' AS DateTime), CAST(N'2024-02-28T09:17:55.867' AS DateTime))
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [CreatedBy], [ModifiedBy]) VALUES (4, 1, 13, CAST(N'2024-02-28T09:18:01.403' AS DateTime), CAST(N'2024-02-28T09:18:01.403' AS DateTime))
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [CreatedBy], [ModifiedBy]) VALUES (6, 3, 10, CAST(N'2024-03-13T06:07:48.557' AS DateTime), CAST(N'2024-03-13T06:07:48.557' AS DateTime))
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [CreatedBy], [ModifiedBy]) VALUES (9, 3, 7, CAST(N'2024-04-18T13:25:11.950' AS DateTime), CAST(N'2024-04-18T13:25:11.950' AS DateTime))
INSERT [dbo].[Wishlist] ([WishlistID], [CustomerID], [ProductID], [CreatedBy], [ModifiedBy]) VALUES (10, 3, 5, CAST(N'2024-04-18T13:31:05.997' AS DateTime), CAST(N'2024-04-18T13:31:05.997' AS DateTime))
SET IDENTITY_INSERT [dbo].[Wishlist] OFF
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Customer]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDiscount] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_CategoryDiscount]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_Product_OrderDetails] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_Product_OrderDetails]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_CustomerID]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Customer]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_CategoryID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SubCategoryID] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SubCategoryID]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShippingAddress]  WITH CHECK ADD  CONSTRAINT [FK_Shippingaddress_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShippingAddress] CHECK CONSTRAINT [FK_Shippingaddress_CustomerID]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_CategoryID]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_CustomerID]
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD  CONSTRAINT [FK_Wishlist_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist] CHECK CONSTRAINT [FK_Wishlist_ProductID]
GO
USE [master]
GO
ALTER DATABASE [PackFoodReady2Go] SET  READ_WRITE 
GO
