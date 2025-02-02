USE [master]
GO
/****** Object:  Database [AssgnPRJ]    Script Date: 3/10/2024 10:02:00 PM ******/
CREATE DATABASE [AssgnPRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssgnPRJ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AssgnPRJ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssgnPRJ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AssgnPRJ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AssgnPRJ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssgnPRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssgnPRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssgnPRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssgnPRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssgnPRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssgnPRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssgnPRJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssgnPRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssgnPRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssgnPRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssgnPRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssgnPRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssgnPRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssgnPRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssgnPRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssgnPRJ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssgnPRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssgnPRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssgnPRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssgnPRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssgnPRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssgnPRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssgnPRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssgnPRJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssgnPRJ] SET  MULTI_USER 
GO
ALTER DATABASE [AssgnPRJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssgnPRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssgnPRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssgnPRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssgnPRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssgnPRJ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AssgnPRJ] SET QUERY_STORE = OFF
GO
USE [AssgnPRJ]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[AccountID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[create_date] [date] NULL,
	[shipping_id] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/10/2024 10:02:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1, N'aaa', N'123456', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (2, N'Anjolie', N'234', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (3, N'Ferris', N'234', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (4, N'Katell', N'333', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (5, N'Zahir', N'2222', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (6, N'Conan', N'3', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (7, N'Cade', N'333', 1, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (8, N'Micah', N'2', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (9, N'Rowan', N'3', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (10, N'Kirby', N'3', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (11, N'Tanisha', N'22', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (12, N'Howard', N'2', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (13, N'Tana', N'2', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (14, N'Hadassah', N'2', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (15, N'Echo', N'IGE8TN', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (16, N'Slade', N'4', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (17, N'Devin', N'5', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (18, N'Rowan', N'5', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (19, N'Rafael', N'5', 1, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (20, N'Madaline', N'5', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (21, N'Vera', N'5', 0, 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (22, N'Declan', N'5', 1, 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (23, N'Katell', N'5', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (24, N'Summer', N'5', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (25, N'Robin', N'5', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (26, N'Dominique', N'5', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (27, N'admin', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (28, N'mra', N'5', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (29, N'mrb', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (30, N'Camden', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (31, N'manhdsz', N'123456', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (32, N'sfdfds', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (33, N'aaaaa', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (34, N'bbbb', N'1234', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (35, N'luong', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (38, N'mit', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (39, N'aaaaaaaa', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (40, N'efef', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (41, N'fef', N'123', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (42, N'cd', N'1234', 0, 0, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (43, N'fefr', N'123', 1, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (44, N'fdef', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (45, N'fds', N'123', 0, 0, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (46, N'thang01', N'123', 0, 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin], [active]) VALUES (1046, N'dinhcongthanh00', N'12345678', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Áo sơ mi')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Nike')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (6, N'123')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (7, N'456')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (8, N'Vest')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (46, 19, N'Áo Polo Gucci Jacquard Striped', N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/03/ao-polo-gucci-jacquard-striped-polo-shirt-phoi-mau-size-s-6230070b491da-15032022102459.jpg', 140, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (47, 19, N'Áo Polo Adidas Tennis ', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2021/10/ao-polo-adidas-tennis-club-gl5437-mau-den-size-m-617a24517e93f-28102021111721.jpg', 150, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (48, 20, N'Áo Sơ Mi Burberry Check Cotton ', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-so-mi-burberry-check-cotton-poplin-shirt-size-m-620713a007892-12022022085544.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (49, 21, N'Áo Thun Dolce & Gabbana Short', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-thun-dolce-gabbana-short-sleeve-t-shirt-mau-xam-den-62062ac681f6f-11022022162214.jpg', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (50, 22, N'Áo Polo Gucci Logo-Patch Shirt', N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-polo-gucci-logo-patch-shirt-mau-xanh-la-620c9736470e6-16022022131830.jpg', 160, 3)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (51, 22, N'Áo Thun Dolce & Gabbana Short', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-thun-dolce-gabbana-short-sleeve-t-shirt-mau-xam-den-62062ac681f6f-11022022162214.jpg', 100, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1050, 1022, N'Áo Polo Gucci Logo-Patch Shirt', N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-polo-gucci-logo-patch-shirt-mau-xanh-la-620c9736470e6-16022022131830.jpg', 160, 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (19, 1, 290, N'hang de vo', CAST(N'2022-04-23' AS Date), 19, 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (20, 1, 100, N'', CAST(N'2023-02-10' AS Date), 20, 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (21, 4, 100, N'1', CAST(N'2023-02-10' AS Date), 21, 0)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (22, 1, 680, N'Nice', CAST(N'2024-03-04' AS Date), 22, 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [create_date], [shipping_id], [status]) VALUES (1022, 4, 320, N'abc', CAST(N'2024-03-10' AS Date), 1022, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (21, N'Áo Polo Gucci Logo-Patch Shirt', N'https://cdn.vuahanghieu.com/unsafe/0x900/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-polo-gucci-logo-patch-shirt-mau-xanh-la-620c9736470e6-16022022131830.jpg', 160.0000, N'Áo Polo Gucci Logo-Patch Shirt Màu Xanh Lá', N'Áo Polo Gucci Logo-Patch Shirt Màu Xanh Lá được làm từ chất vải Cotton thoáng mát mang lại cảm giác thoải mái cho người mặc. Form áo chuẩn đẹp, đường may tinh tế, tỉ mỉ từng chi tiết. Áo mềm mịn, không nhăn, không xù, không phai màu. Họa tiết logo thương hiệu Gucici phía ngực áo tạo điểm nhấn vô cùng độc đáo.', 4, 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (27, N'Áo Thun Dolce & Gabbana Short', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-thun-dolce-gabbana-short-sleeve-t-shirt-mau-xam-den-62062ac681f6f-11022022162214.jpg', 100.0000, N'Áo Thun Dolce & Gabbana Short Sleeve T-Shirt Màu Xám Đen', N'Áo Thun Dolce & Gabbana Short Sleeve T-Shirt Màu Xám Đen được làm từ chất vải cotton, polyester thoáng mát, thấm hút mồ hôi tốt mang lại cảm giác thoải mái cho người mặc. Form áo chuẩn đẹp, đường may tinh tế, tỉ mỉ từng chi tiết làm hài lòng ngay cả với khách hàng khó tính.

Áo cổ tròn, tay ngắn với họa tiết trang trí viền kẻ đỏ-vàng tạo điểm nhấn độc đáo. Màu sắc áo đơn giản bạn có thể kết hợp với nhiều phong cách khác nhau... Khéo léo kết hợp những bộ trang phục với nhau chắc chắn bạn sẽ có những sét đồ thời trang ưng ý khi xuống phố.', 4, 6, 0)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (28, N'Áo Sơ Mi Burberry Check Cotton ', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-so-mi-burberry-check-cotton-poplin-shirt-size-m-620713a007892-12022022085544.jpg', 100.0000, N'Áo Sơ Mi Burberry Check Cotton Poplin Shirt Size M', N'Áo Sơ Mi Burberry Check Cotton được may từ chất liệu vải Cotton cao cấp với nhiều ưu điểm nổi trội như bề mặt vải mịn, nhẹ, không xù, không co khi giặt, thoáng khí, đem đến cho phái mạnh sự thoải mái tối đa. Sản phẩm có đường chỉ may tỉ mỉ, tinh tế.Bạn có thể kết hợp áo với nhiều trang phục và phụ kiện khác nhau để diện trong những đi chơi, dạo phố cùng bạn bè hoặc có thể mặc đi làm.', 3, 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (29, N'Áo Sơ Mi Burberry Brit Short', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2019/07/ao-so-mi-burberry-brit-short-sleeve-check-cotton-shirt-size-m-5d1d6b0e7b334-04072019095718.jpg', 120.0000, N'Áo Sơ Mi Burberry Brit Short Sleeve Check Cotton Shirt Size M', N'Burberry là một hãng thời trang sang trọng của Anh, phân phối quần áo thể thao độc đáo sang trọng, phụ kiện thời trang, nước hoa, kính mát, và mỹ phẩm.

Thương hiệu Burberry là 1 trong những tượng đài của thời trang thế giới, với phong cách hiện đại, lịch lãm và mang đậm bản sắc tinh thần của vương quốc Anh. Đặc trưng của Burberry từ ban đầu đến nay vẫn là phong cách lịch lãm, đơn giản và toát lên một vẻ lạnh lùng độc đáo.', 3, 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (30, N'Quần Shorts Dolce & Gabbana Embroidered ', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/03/quan-shorts-dolce-gabbana-embroidered-logo-swimming-trunks-mau-den-62300ee13023f-15032022105825.jpg', 120.0000, N'Quần Shorts Dolce & Gabbana Embroidered Logo Swimming Trunks Màu Đen', N'Quần Shorts Dolce & Gabbana Embroidered Logo Swimming Trunks Màu Đen được làm từ chất liệu vải polyester cao cấp, mang lại sử thoải mái, thoáng mát cho người mặc. 

Kiểu dáng: theo form chuẩn mới nhất, Kiểu dáng trên gối, ôm nhẹ tạo cảm giác thoải mái khi sử dụng.
Thiết kế tiện lợi, lưng thun, dây rút co giãn, tự điều chỉnh phù hợp
Mặc đi tập gym, café, du lịch, mặc nhà, mặc nhóm đều ổn
Màu sắc: ĐEN cực dễ phối đồ,
Chất liệu cao cấp, co giãn tối đa thoải mái vận động
Đặc biệt: chống nhăn tuyệt đối, không sợ gây nóng bức, khó chịu và thoáng khí.', 4, 7, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (31, N'Áo Khoác Burberry Band Collar', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-khoac-burberry-band-collar-track-jacket-mau-den-size-m-620a18ab6a1a8-14022022155403.jpg', 165.0000, N'Áo Khoác Burberry Band Collar Track Jacket Màu Đen Size M', N'Áo Khoác Burberry Band Collar Track Jacket được làm từ chất liệu vải cao cấp mang lại sự thoải mái cho người mặc. Form áo chuẩn đẹp từng đường kim mũi chỉ đảm bảo hài lòng ngay cả với khách hàng khó tính nhất.Áo không nhăn, không xù, không phai màu. Màu sắc đơn giản dễ dàng kết hợp với các trang phục khác nhau theo sở thích của bản thân.

Với chiếc áo thời trang này bạn có thể kết hợp với nhiều phong cách khác nhau từ lịch lãm, công sở đến phong cách thể thao, dạo phố... Khéo léo kết hợp những bộ trang phục với nhau chắc chắn bạn sẽ có những sét đồ thời trang ưng ý khi xuống phố.

Đây là một mẫu áo dành cho các chàng trai yêu thích sự đơn giản nhưng không kém phần tinh tế và nổi bật.', 3, 19, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (32, N'Áo Sơ Mi Dolce & Gabbana Long Sleeve Shirt', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/02/ao-so-mi-dolce-gabbana-long-sleeve-shirt-hoa-tiet-size-39-62105ede64747-19022022100710.jpg', 150.0000, N'Áo Sơ Mi Dolce & Gabbana Long Sleeve Shirt Họa Tiết Size 39', N'Áo Sơ Mi Dolce & Gabbana Long Sleeve Shirt Họa Tiết được làm từ chất vải cotton thoáng mát, thấm hút mồ hôi tốt mang lại cảm giác thoải mái cho người mặc. Form áo chuẩn đẹp, đường may tinh tế, tỉ mỉ từng chi tiết làm hài lòng ngay cả với khách hàng khó tính.Áo cổ bẻ, tay dài với điểm nhấn độc đáo ở phần cổ áo. Màu sắc áo đơn giản bạn có thể kết hợp với nhiều phong cách khác nhau... Khéo léo kết hợp những bộ trang phục với nhau chắc chắn bạn sẽ có những sét đồ thời trang ưng ý khi xuống phố.', 4, 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (33, N'Quần Short Burberry', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2020/03/quan-short-burberry-new-ss-mau-do-5e69eb0c16cc8-12032020145556.jpg', 185.0000, N'Quần Short Burberry New SS Màu Đỏ', N'Quần được làm từ chất vải cotton thoáng mát, thấm hút mồ hôi tốt mang lại cảm giác thoải mái cho người mặc.

- Form quần chuẩn đẹp, đường may tinh tế, tỉ mỉ từng chi tiết làm hài lòng ngay cả với khách hàng khó tính.

- Quần họa tiết trang trí sọc ô vuông tạo điểm nhấn. 

Với chiếc quần thời trang này bạn có thể kết hợp với nhiều phong cách khác nhau từ lịch lãm, công sở đến phong cách thể thao, dạo phố... Khéo léo kết hợp những bộ trang phục với nhau chắc chắn bạn sẽ có những sét đồ thời trang ưng ý khi xuống phố.

Đây là một mẫu quần dành cho các chàng trai yêu thích sự đơn giản nhưng không kém phần tinh tế và nổi bật.', 3, 18, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (34, N'Quần Short Burberry New SS ', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2020/03/quan-short-burberry-new-ss-mau-soc-xanh-vang-5e6f37d361bcd-16032020152451.jpg', 150.0000, N'Quần Short Burberry New SS Màu Sọc Xanh Vàng', N'Burberry là một hãng thời trang sang trọng của Anh, phân phối quần áo thể thao độc đáo sang trọng, phụ kiện thời trang, nước hoa, kính mát, và mỹ phẩm.

Thương hiệu Burberry là 1 trong những tượng đài của thời trang thế giới, với phong cách hiện đại, lịch lãm và mang đậm bản sắc tinh thần của vương quốc Anh. Đặc trưng của Burberry từ ban đầu đến nay vẫn là phong cách lịch lãm, đơn giản và toát lên một vẻ lạnh lùng độc đáo.', 3, 17, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (35, N'Quần Bò Shorts Dolce & Gabbana Stretch', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2021/08/quan-bo-shorts-dolce-gabbana-stretch-denim-bermuda-shorts-610787debf6b6-02082021125126.jpeg', 180.0000, N'Quần Bò Shorts Dolce & Gabbana Stretch Denim Bermuda Shorts', N'Quần Dolce & Gabbana Stretch Denim Bermuda Shorts được làm từ chất vải bò thoáng mát, thấm hút mồ hôi tốt mang lại cảm giác thoải mái cho người mặc. Form quần chuẩn đẹp, đường may tinh tế, tỉ mỉ từng chi tiết làm hài lòng ngay cả với khách hàng khó tính.Quần dáng suông thoải mái dễ mặc. Màu sắc quần đơn giản bạn có thể kết hợp với nhiều phong cách khác nhau... Khéo léo kết hợp những bộ trang phục với nhau chắc chắn bạn sẽ có những sét đồ thời trang ưng ý khi xuống phố.', 4, 15, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (36, N'Áo Phông Dolce & Gabbana Pig Family Short', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2020/03/ao-phong-dolce-gabbana-pig-family-short-sleeved-t-shirt-mau-trang-5e7ac493739a1-25032020094019.jpg', 200.0000, N'Áo Phông Dolce & Gabbana Pig Family Short Sleeved T-Shirt Màu Trắng', N'Áo Phông Dolce & Gabbana Pig Family Short Sleeved T-Shirt Màu Trắng thiết kế trẻ trung hiện đại. Áo được làm từ 100% cotton thoáng mát, mang lại cảm giác thoải mái cho người mặc.

Họa tiết in hình gia đình ngộ nghĩnh, bắt mắt. Hình dáng áo cổ tròn, tay áo ngắn, dáng thon dễ mặc và kết hợp với các trang phục khác nhau. Bạn có thể kết hợp với quần short, quần jean, kaki... đều giúp bạn trở nên nổi bật khi gặp gỡ mọi người xung quanh.

Đây là một trong những mẫu áo Hot trong bộ sưu tập áo của Dolce & Gabbana khi mới ra mắt đã được rất nhiều khách hàng yêu thích.', 4, 1, 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID], [status]) VALUES (37, N'Tweed Green', N'https://tse1.mm.bing.net/th?id=OIP.TSDCb3B2Jm-5YUUviyV94QHaKs&pid=Api&P=0&h=220', 100.0000, N'Tweed Green', N'Tweed Green', 8, 1, 0)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (19, N'viet', N'12345678', N'hanoi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (20, N'', N'', N'')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (21, N'1', N'1', N'1')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (22, N'Red Fox ', N'0866624403', N'Hai Duong')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1022, N'Bottlenose Dolphin', N'0866324403', N'Hai Duong')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_product] FOREIGN KEY([AccountID])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Account]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Shipping] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Shipping]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_Category] FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_Category]
GO
USE [master]
GO
ALTER DATABASE [AssgnPRJ] SET  READ_WRITE 
GO
