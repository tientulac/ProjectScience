USE [ScienceHY]
GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Load]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_TinTuc_Load]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_TinTuc_Load]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Menu__menu_paren__4F7CD00D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Menu]'))
ALTER TABLE [dbo].[Menu] DROP CONSTRAINT [FK__Menu__menu_paren__4F7CD00D]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Comment__account__6477ECF3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT [FK__Comment__account__6477ECF3]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
DROP TABLE [dbo].[Video]
GO
/****** Object:  Table [dbo].[UrlLink]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UrlLink]') AND type in (N'U'))
DROP TABLE [dbo].[UrlLink]
GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlideImage]') AND type in (N'U'))
DROP TABLE [dbo].[SlideImage]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
DROP TABLE [dbo].[Role]
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recruitment]') AND type in (N'U'))
DROP TABLE [dbo].[Recruitment]
GO
/****** Object:  Table [dbo].[QuanLyGopY]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QuanLyGopY]') AND type in (N'U'))
DROP TABLE [dbo].[QuanLyGopY]
GO
/****** Object:  Table [dbo].[Proceduree]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proceduree]') AND type in (N'U'))
DROP TABLE [dbo].[Proceduree]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy]') AND type in (N'U'))
DROP TABLE [dbo].[Policy]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[News]') AND type in (N'U'))
DROP TABLE [dbo].[News]
GO
/****** Object:  Table [dbo].[MenuParent]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MenuParent]') AND type in (N'U'))
DROP TABLE [dbo].[MenuParent]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
DROP TABLE [dbo].[Menu]
GO
/****** Object:  Table [dbo].[LoaiTinTuc]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoaiTinTuc]') AND type in (N'U'))
DROP TABLE [dbo].[LoaiTinTuc]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
DROP TABLE [dbo].[Comment]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Blog]') AND type in (N'U'))
DROP TABLE [dbo].[Blog]
GO
/****** Object:  Table [dbo].[AlbumImage]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlbumImage]') AND type in (N'U'))
DROP TABLE [dbo].[AlbumImage]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/5/2023 8:21:16 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
DROP TABLE [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[active] [bit] NULL,
	[address] [nvarchar](max) NULL,
	[admin] [bit] NULL,
	[avatar] [nvarchar](max) NULL,
	[full_name] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[role_code] [nvarchar](max) NULL,
	[user_name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[id_town] [nvarchar](max) NULL,
	[id_district] [nvarchar](max) NULL,
	[id_city] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumImage]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumImage](
	[album_image_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[album_image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[content_html] [nvarchar](max) NULL,
	[descript] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[star] [int] NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiTinTuc]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTinTuc](
	[id_loai_tin_tuc] [int] IDENTITY(1,1) NOT NULL,
	[Ma_loai] [nchar](10) NULL,
	[Loai_tin_tuc] [nvarchar](500) NULL,
 CONSTRAINT [PK_LoaiTinTuc] PRIMARY KEY CLUSTERED 
(
	[id_loai_tin_tuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_code] [nvarchar](50) NULL,
	[menu_name] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[menu_parent_id] [int] NULL,
	[status] [int] NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuParent]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuParent](
	[menu_parent_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_parent_code] [nvarchar](50) NULL,
	[menu_parent_name] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[status] [int] NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[news_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK__News__4C27CCD8F9F43341] PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[policy_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[policy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proceduree]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proceduree](
	[procedure_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[procedure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanLyGopY]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanLyGopY](
	[id_gop_y] [int] IDENTITY(1,1) NOT NULL,
	[Ho_ten] [nvarchar](50) NULL,
	[Email] [nchar](20) NULL,
	[So_dien_thoai] [nchar](10) NULL,
	[Tieu_de] [nvarchar](max) NULL,
	[Noi_dung] [nvarchar](max) NULL,
	[Ngay_hoi] [datetime] NULL,
 CONSTRAINT [PK_QuanLyGopY] PRIMARY KEY CLUSTERED 
(
	[id_gop_y] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruitment](
	[recruiment_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[Address] [nvarchar](500) NULL,
	[poster] [nchar](100) NULL,
	[wage] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[recruiment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_code] [nvarchar](50) NULL,
	[role_name] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SlideImage](
	[slide_image_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[slide_image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrlLink]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrlLink](
	[url_link_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[url] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[url_link_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[video_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[status] [int] NULL,
	[descrip] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[video_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([account_id], [active], [address], [admin], [avatar], [full_name], [password], [phone], [role_code], [user_name], [email], [created_at], [updated_at], [deleted_at], [id_town], [id_district], [id_city]) VALUES (1, NULL, NULL, 1, NULL, NULL, N'123', NULL, NULL, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiTinTuc] ON 
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (1, N'KHVCN     ', N'KHOA HỌC VÀ CÔNG NGHỆ')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (2, N'ATBXVHN   ', N'AN TOÀN BỨC XẠ VÀ HẠT NHÂN')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (3, N'TCDLCL    ', N'TIÊU CHUẨN - ĐO LƯỜNG - CHẤT LƯỢNG')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (4, N'TTK       ', N'KHÁC')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (5, N'TVA       ', N'THƯ VIỆN ẢNH')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (6, N'PCCV      ', N'PHÒNG CHỐNG COVID')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (7, N'TCKHVCN   ', N'TẠP CHÍ KHOA HỌC VÀ CÔNG NGHỆ')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (8, N'TB        ', N'THÔNG BÁO')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (9, N'LSVPT     ', N'LỊCH SỬ VÀ PHÁT TRIỂN')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (10, N'CNVNV     ', N'CHỨC NĂNG VÀ NHIỆM VỤ')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (11, N'BGD       ', N'BAN GIÁM ĐỐC')
GO
INSERT [dbo].[LoaiTinTuc] ([id_loai_tin_tuc], [Ma_loai], [Loai_tin_tuc]) VALUES (12, N'CCTC      ', N'CƠ CẤU TỔ CHỨC')
GO
SET IDENTITY_INSERT [dbo].[LoaiTinTuc] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (1, N'lich-su-va-phat-trien', N'Lịch Sử và phát triển', NULL, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (2, N'chuc-nang-va-nhiem-vu', N'Chức năng và nhiệm vụ', NULL, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (3, N'ban-giam-doc', N'Ban giám đốc', NULL, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (4, N'co-cau-to-chuc', N'Cơ cấu tổ chức', NULL, 2, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (5, N'thu-tuc-hanh-chinh', N'Thủ tục hành chính', NULL, 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (6, N'chinh-sach-ho-tro', N'Chính sách hỗ trợ', NULL, 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (7, N'dich-vu-cong', N'Dịch vụ công trực tuyến', NULL, 3, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (10, N'dich-vu-cong', N'Khoa học và công nghệ', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (11, N'dich-vu-cong', N'An toàn bức xạ và hạt nhân', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (12, N'dich-vu-cong', N'Tiêu chuẩn - Đo lường - Chất lượng', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (13, N'dich-vu-cong', N'Tin tức khác', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (14, N'dich-vu-cong', N'Thư viện ảnh', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (15, N'dich-vu-cong', N'Phòng chống covid', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (16, N'dich-vu-cong', N'Tạp chí khoa học và công nghệ', NULL, 4, 1, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuParent] ON 
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (1, N'trang-chu', N'Trang Chủ', NULL, 1, NULL, NULL, CAST(N'2023-06-05T11:55:31.457' AS DateTime), NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (2, N'gioi-thieu', N'Giới thiệu', NULL, 1, NULL, NULL, CAST(N'2023-06-05T15:05:09.953' AS DateTime), NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (3, N'hanh-chinh-cong', N'Hành chính công', NULL, 1, NULL, NULL, CAST(N'2023-06-05T15:05:38.790' AS DateTime), NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (4, N'tin-tuc', N'Tin tức', NULL, 1, NULL, NULL, CAST(N'2023-06-05T15:05:48.237' AS DateTime), NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (5, N'so-huu-tri-tue', N'Sở hữu trí tuệ', NULL, 1, NULL, NULL, CAST(N'2023-06-05T15:05:56.550' AS DateTime), NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (6, N'tuyen-dung', N'Tuyển dụng', NULL, 1, NULL, NULL, CAST(N'2023-06-05T15:06:03.363' AS DateTime), NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (8, N'dong-gop-y-kien', N'Đóng góp ý kiến', NULL, 1, NULL, NULL, CAST(N'2023-06-05T15:06:31.127' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[MenuParent] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (1, N'TẬP ĐOÀN COT (SINGAPORE) CHỌN HƯNG YÊN LÀ ĐỊA ĐIỂM MỞ RỘNG ĐẦU TƯ', N'https://baohungyen.vn/file//4028eaa4679b32c401679c0c74382a7e/052023/o_nam_20230531140042.jpg', 1, N'Tại buổi làm việc, đại diện Tập đoàn COT cho biết, sau một thời gian khảo sát, Tập đoàn đã chọn Hưng Yên là địa điểm mở rộng đầu tư. Theo kế hoạch, giai đoạn đầu, Tập đoàn COT sẽ thuê 6,6ha đất tại KCN Thăng Long II để đầu tư xây dựng dự án. Trong 5 - 8 năm tới, Tập đoàn sẽ mở rộng quy mô đầu tư với nhu cầu sử dụng đất khoảng 20ha, tổng vốn đầu tư khoảng 500 - 800 triệu USD. Để phục vụ sản xuất, Tập đoàn đầu tư các trang thiết bị tân tiến nhất vào các dây chuyền sản xuất. Tập đoàn mong muốn tìm hiểu môi trường đầu tư, các thủ tục pháp lý theo quy định của Việt Nam, những chính sách ưu đãi của tỉnh trong việc thuê đất. Bên cạnh đó, Tập đoàn mong muốn tỉnh tạo điều kiện thuận lợi trong việc hoàn thiện các quy trình, thủ tục giao đất, thuê đất, cấp phép xây dựng…

Phát biểu tại buổi làm việc, Phó Chủ tịch UBND tỉnh Nguyễn Hùng Nam nhấn mạnh, tỉnh luôn quan tâm tạo điều kiện thuận lợi cho các doanh nghiệp đầu tư vào địa bàn. Với kế hoạch đầu tư vào địa bàn tỉnh của Tập đoàn COT, Phó Chủ tịch UBND tỉnh khẳng định tỉnh sẽ đồng hành với Tập đoàn trong quá trình đầu tư; đề nghị Chủ đầu tư hạ tầng KCN Thăng Long II khẩn trương hoàn thành các thủ tục nộp tiền sử dụng đất; phối hợp với các sở, ngành của tỉnh hoàn thiện các thủ tục pháp lý để tạo thuận lợi cho các doanh nghiệp đầu tư vào địa bàn. Ngay sau khi chủ đầu tư hạ tầng KCN Thăng Long II hoàn thành nghĩa vụ tài chính, tỉnh sẽ cấp giấy chứng nhận quyền sử dụng đất đối với diện tích mở rộng tại KCN Thăng Long II. Quá trình đầu tư, Tập đoàn COT phối hợp với chủ đầu tư hạ tầng KCN Thăng Long II và các sở, ngành hoàn thiện các thủ tục đầu tư; quá trình đầu tư phải chấp hành nghiêm các quy định của pháp luật Việt Nam. Tỉnh sẽ hỗ trợ tối đa những nội dung về tiến độ mà Tập đoàn COT và chủ đầu tư hạ tầng KCN Thăng Long II ký kết. Các sở, ngành, địa phương khẩn trương hoàn thành các thủ tục pháp lý để chủ đầu tư hạ tầng KCN Thăng Long II sớm có đủ căn cứ để thu hút doanh nghiệp đầu tư vào KCN.', N'Ngày 31/5, tại trụ sở HĐND-UBND tỉnh, đồng chí Nguyễn Hùng Nam, Phó Chủ tịch UBND tỉnh có buổi làm việc với Tập đoàn COT (Singapore).', CAST(N'2023-06-05T00:00:00.000' AS DateTime), NULL, NULL, N'TTK')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (2, N'CHỨNG NHẬN HOẠT ĐỘNG CHI NHÁNH: VIỆN NGHIÊN CỨU TÂM LÝ- GIÁO DỤC ĐẶC BIỆT CHI NHÁNH HƯNG YÊN', N'https://cdnimg.vietnamplus.vn/uploaded/ngtmbh/2021_12_19/ttxvn_tong_bi_thu_ky_niem_190_nam_tinh_hung_yen_33.jpg', 1, NULL, NULL, CAST(N'2023-06-05T00:00:00.000' AS DateTime), NULL, NULL, N'TB')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (3, N'
THỜI GIAN LÀM VIỆC MÙA HÈ NĂM 2023', N'http://khcnhungyen.gov.vn/upload/images/2-174201_732.jpg', 1, NULL, N'Ngày 11/4/2023 UBND tỉnh Hưng Yên ban hành Thông báo số 861/TB-UBND về Thời gian làm việc mùa Hè năm 2023. Sở Khoa học và Công nghệ trân trọng giới thiệu toàn văn Thông báo số 861/TB-UBND.', CAST(N'2023-06-05T00:00:00.000' AS DateTime), NULL, NULL, N'TB')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (4, N'
KHOA HỌC - CÔNG NGHỆ VÀ ĐỔI MỚI SÁNG TẠO: ĐỘNG LỰC PHÁT TRIỂN BỀN VỮNG CỦA HƯNG YÊN', N'http://khcnhungyen.gov.vn/upload/images/vai-trung-HY(1).jpg', 1, N'Theo Ông Trần Tùng Chuẩn, Giám đốc Sở KHCN tỉnh Hưng Yên, ngành KHCN đã đóng góp nhiều thành tựu quan trọng trong phát triển KT-XH tỉnh như: Chuyển dịch cơ cấu kinh tế, tăng năng suất, chất lượng sản phẩm, hàng hóa, dịch vụ; phát triển công nghiệp công nghệ cao; xây dựng nông thôn mới… giai đoạn 2015 - 2020, Sở KHCN đã tham mưu UBND tỉnh Hưng Yên xác định, tuyển chọn, phê duyệt, triển khai thực hiện khoảng gần 200 nhiệm vụ KHCN với tổng kinh phí khoảng 150 tỷ đồng và được ứng dụng triển khai thực hiện ở hầu hết các lĩnh vực sản xuất và đời sống.

Dấu ấn Khoa học công nghệ
Trong giai đoạn 2020-2023, Sở KHCN Hưng Yên đã tham mưu Tỉnh ủy, HĐND tỉnh, UBND tỉnh ban hành 37 văn bản và 23 chương trình, đề án, kế hoạch thuộc lĩnh vực KHCN; tham mưu UBND tỉnh phê duyệt 88 nhiệm vụ KHCN cấp tỉnh đã được triển khai thực hiện trên nhiều lĩnh vực như: nông nghiệp; công nghiệp; TTCN; CNTT; sở hữu trí tuệ… Đến nay, Sở đã hỗ trợ xây dựng và đăng ký bảo hộ quyền sở hữu trí tuệ cho 30 sản phẩm đặc sản, chủ lực của địa phương, gồm: 01 Chỉ dẫn địa lý “Hưng Yên ” cho sản phẩm nhãn lồng; 12 Nhãn hiệu chứng nhận như: Vải trứng Hưng Yên; Mật ong hoa nhãn Hưng Yên; Cam Hưng Yên…; 17 nhãn hiệu tập thể như: Tương bần; Quất cảnh Văn Giang; Gà Đông Tảo... Đây là điều kiện rất thuận lợi để thúc đẩy hoạt động xúc tiến thương mại cho các sản phẩm chủ lực của tỉnh Hưng Yên tại các thị trường trong và ngoài nước.

Kết quả hoạt động KHCN và đổi mới sáng tạo (ĐMST) đã góp phần nâng cao chất lượng tăng trưởng và năng lực cạnh tranh của nền kinh tế. Tỷ phần đóng góp (%) của tăng năng suất các nhân tố tổng hợp (TFP) vào tăng trưởng kinh tế GRDP của tỉnh ngày càng cao, bình quân giai đoạn 2015-2021 đạt 53,23% (bình quân giai đoạn 2020-2021 đạt 66,16%). Từ đó cho thấy, KHCN thực sự là động lực cho tăng trưởng kinh tế của tỉnh. Để đẩy mạnh phong trào tăng năng suất, chất lượng trên địa bàn tỉnh, ngày 30/6/2021, UBND tỉnh Hưng Yên ban hành Kế hoạch số 101/KH-UBND thực hiện chương trình quốc gia hỗ trợ tổ chức, doanh nghiệp nâng cao năng suất và chất lượng sản phẩm, hàng hóa giai đoạn 2021- 2030.

Khuyến khích đổi mới sáng tạo
UBND tỉnh Hưng Yên đã ban hành Kế hoạch số 142/KH-UBND ngày 16/9/2021 hỗ trợ hệ sinh thái khởi nghiệp đổi mới sáng tạo giai đoạn 2021-2025 nhằm thúc đẩy hoạt động khởi nghiệp đổi mới sáng tạo và tạo nên phong trào “Khởi nghiệp” lan tỏa, rộng khắp trong thanh niên, phụ nữ, các trường đại học, cao đẳng trên địa bàn tỉnh. Sở đã hỗ trợ xây dựng trên 20 mô hình khởi nghiệp cho thanh niên, phụ nữ; tham mưu Hội đồng sáng kiến tỉnh công nhận trên 150 sáng kiến có phạm vi áp dụng toàn tỉnh.

Từ năm 2015 đến nay, Sở đã góp ý về công nghệ đối với 400 dự án đầu tư; hỗ trợ các doanh nghiệp của tỉnh được tham gia trưng bày, trình diễn giới thiệu các công nghệ mới tại các sự kiện kết nối cung cầu - công nghệ do Bộ KHCN và địa phương tổ chức, giúp các doanh nghiệp địa phương có cơ hội hợp tác các doanh nghiệp trong và ngoài nước. Hướng dẫn, hỗ trợ cho hơn 20 doanh nghiệp nhỏ và vừa trên địa bàn tỉnh áp dụng các hệ thống, công cụ quản lý chất lượng tiên tiến, công bố hàng hóa phù hợp tiêu chuẩn, quy chuẩn kỹ thuật; hỗ trợ 02 doanh nghiệp đăng ký tham gia đạt Giải vàng chất lượng quốc gia, được Thủ tướng Chính phủ tặng Bằng khen.

Ngày 05/12/2022, UBND tỉnh Hưng Yên đã ban hành Kế hoạch số 196/KH-UBND thực hiện Chiến lược phát triển KHCN&ĐMST đến năm 2030, với mục tiêu đóng góp của năng suất nhân tố tổng hợp (TFP) vào tăng trưởng GRDP của tỉnh trên 50%; tăng đầu tư, đa dạng hóa và sử dụng hiệu quả các nguồn lực cho phát triển KHCN&ĐMST, phấn đấu đến năm 2025, tổng đầu tư từ nguồn ngân sách nhà nước và xã hội cho KHCN&ĐMST đạt 1,2%-1,5% GRDP, đến năm 2030, phấn đấu đạt 1,5%-2% GRDP; phấn đấu đến năm 2030, hỗ trợ triển khai áp dụng, cập nhật dữ liệu truy xuất nguồn gốc cho các sản phẩm chủ lực, sản phẩm OCOP của tỉnh; nhân lực nghiên cứu khoa học và phát triển công nghệ đạt 12 người/1 vạn dân, trong đó chú trọng phát triển nhân lực trong khu vực doanh nghiệp.

Để phát huy vai trò của KHCN&ĐMST phục vụ phát triển kinh tế - xã hội, cần xác định KHCN&ĐMST là nhiệm vụ trọng tâm của các cấp, các ngành; gắn các mục tiêu, nhiệm vụ KHCN&ĐMST với các mục tiêu, nhiệm vụ phát triển kinh tế - xã hội; tập trung xây dựng và thực hiện có hiệu quả các chương trình, kế hoạch phát triển KHCN&ĐMST của tỉnh để nâng cao năng suất, chất lượng, hiệu quả, sức cạnh tranh của sản phẩm hàng hóa, dịch vụ, thúc đẩy tái cơ cấu và đổi mới mô hình tăng trưởng kinh tế, ứng dụng thành tựu của cuộc Cách mạng công nghiệp lần 4 gắn với chuyển đổi số trong những ngành, lĩnh vực có tiềm năng, lợi thế của tỉnh.', N'Kết quả hoạt động KHCN và đổi mới sáng tạo (ĐMST) đã góp phần nâng cao chất lượng tăng trưởng và năng lực cạnh tranh của nền kinh tế của tỉnh Hưng Yên', CAST(N'2023-06-05T00:00:00.000' AS DateTime), NULL, NULL, N'TTK')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (5, N'Quá trình hình thành và phát triển', N'http://khcnhungyen.gov.vn/upload/images/Tin%20tuc/Development-history.jpg', 1, N'<p><strong>Thời kỳ 1997-2002</strong></p><p>Ngày 06 tháng 11 năm 1996, tại kỳ họp thứ 10, Quốc hội khóa IX, đã ra Nghị quyết “ Về việc chia và điểu chỉnh địa giới hành chính một số tỉnh”. Theo Nghị quyết của Quốc hội, từ ngày 01 tháng 01 năm 1997 tỉnh Hải Hưng được chia tách thành tỉnh Hải Dương và tỉnh Hưng Yên. Sở Khoa học, Công nghệ và Môi trường tỉnh Hải Hưng được tách thành Sở Khoa học, Công nghệ và Môi trường tỉnh Hải Dương và Sở Khoa học, Công nghệ và Môi trường (KHCN&amp;MT) tỉnh Hưng Yên.</p><p>Ngày 07 tháng 01 năm 1997, Ủy ban nhân dân tỉnh Hưng Yên ra Quyết định số 03/QĐ-UB thành lập Sở Khoa học, Công nghệ và Môi trường tỉnh Hưng Yên. Trên cơ sở đó, ngày 28/02/1997, YBND tỉnh Hưng Yên đã ban hành Quyết định số 133/QĐ-UB về chức năng , nhiệm vụ, tổ chức bộ máy của Sở Khoa học, Công nghệ và Môi trường. Sở là cơ quan chuyên môn của UBND tỉnh, giúp UBND tỉnh thực hiện chức năng quản lý nhà nước về KHCN&amp;MT.</p><p>Lúc này, cơ cấu tổ chức của sở gồm có 05 phòng chuyên môn: Phòng Hành chính Tổng hợp, Phòng&nbsp; Quản lý khoa học và công nghệ, Phòng Thông tin Tư liệu- Sở hữu công nghiệp, Phòng Quản lý Môi trường, Thanh tra sở và đơn vị trực thuốc là Chi cục Tiêu chuẩn Đo lường Chất lượng.</p><p>&nbsp;</p><p><strong>Thời kỳ 2003 đến nay</strong></p><p>Ngày 05/8/2002, tại kỳ họp thứ nhất, Quốc hội khóa XI, ra Nghị quyết số 02/2002/NQ-QH11 thành lập Bộ Khoa học và Công nghệ. Ngày 2/4/2003, Thủ tướng Chính phủ ra Quyết định số 45/2003/QĐ-TTg “về việc thành lập Sở Tài Nguyên và Môi trường, đổi tên Sở Khoa học, Công nghệ và Môi trường thành Sở Khoa học và Công nghệ thuộc UBND các tỉnh, thành phố trực thuộc Trung ương.”</p><p>Thực hiện Quyết định của Thủ tướng Chính phủ về việc chia tách Sở Khoa học, Công nghệ và Môi trường thuộc UBND tỉnh, ngày 07/10/2003, UBND tỉnh Hưng Yên ban hành Quyết định số 56/QĐ-UB về việc đổi tên &nbsp;Sở Khoa học, Công nghệ và Môi trường thành Sở Khoa học và Công nghệ trực thuộc UBND tỉnh, chuyển giao biên chế, nhiệm vụ quản lý nhà nước về môi trường sang Sở Tài nguyên và Môi trường; bổ sung nhiệm vụ nhà nước về an toàn bức xạ hạt nhân và tiềm lực khoa học công nghệ.</p><p>Ngày 29/5/2004, Trung tâm Ứng dụng Tiến bộ Khoa học và Công nghệ được thành lập theo Quyết định số 66/QĐ-UBND của Ủy ban nhân dân tỉnh. Tháng 5/2005, chức năng quản lý nhà nước về công nghệ thông tin được chuyển sang Sở Bưu chính- Viễn thông.</p><p>Ngày 16/4/2009, UBND tỉnh ban hành Quyết định số 734/QĐ-UBND về việc quy định chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của Sở Khoa học và Công nghệ tỉnh Hưng Yên.&nbsp; Trong thời gian này Sở có cơ cấu gồm 06 phòng chuyên môn ( phòng Kế hoạch Tài Chính, phòng Quản lý khoa học, phòng Quản lý công nghệ, Văn phòng Sở, phòng Quản lý chuyên ngành, Thanh tra sở) và 02 đơn vị trực thuộc (Chi cục TĐC và Trung tâm Ứng dụng tiến bộ Khoa học và Công nghệ).</p><p>&nbsp;</p><p><strong>Ban giám đốc</strong></p><p>&nbsp;</p><p>1.<i><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Giám đốc qua các thời kỳ</strong></i></p><p>Đồng chí Phạm Văn Chính: tháng 4/1998-1999.</p><p>Đồng chí Ngô Hùng Mạnh: tháng 03/2000-10/2010.</p><p>Đồng chí Đỗ Tiến Hùng: tháng 12/2010-12-2011.</p><p>Đồng chí Ngô Xuân Thái: tháng 01/2012-6/2019</p><p>.Đồng chí Trần Minh Hải: tháng 9/2019- 31/12/2019</p><p>Đồng chí Trần Tùng Chuẩn: 1/1/2020- đến nay</p><p>&nbsp;</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i><strong>Phó giám đốc qua các thời kỳ</strong></i></p><p>Đồng chí Phạm Văn Chính: tháng 01/1997-3/1998.</p><p>Đồng chí Ngô Hùng Mạnh: tháng 05/1998- 02/2000.</p><p>Đồng chí Nguyễn Xuân Đỉnh: tháng&nbsp; 01/2000- 3/2010.</p><p>Đồng chí Đỗ Tiến Hùng: tháng 09/2009-11/2010.</p><p>Đồng chí Phạm Thị Lý: tháng 09/2009-10/2015.</p><p>Đồng chí Lê Thị Thắm: tháng 7/2010- đến nay.</p><p>Đồng chí Vũ Văn Thắng: tháng 02/2013- đến nay.</p>', N'<p><strong>Thời kỳ 1997-2002</strong></p><p>Ngày 06 tháng 11 năm 1996, tại kỳ họp thứ 10, Quốc hội khóa IX, đã ra Nghị quyết “ Về việc chia và điểu chỉnh địa giới hành chính một số tỉnh”. Theo Nghị quyết của Quốc hội, từ ngày 01 tháng 01 năm 1997 tỉnh Hải Hưng được chia tách thành tỉnh Hải Dương và tỉnh Hưng Yên. Sở Khoa học, Công nghệ và Môi trường tỉnh Hải Hưng được tách thành Sở Khoa học, Công nghệ và Môi trường tỉnh Hải Dương và Sở Khoa học, Công nghệ và Môi trường (KHCN&amp;MT) tỉnh Hưng Yên.</p><p>Ngày 07 tháng 01 năm 1997, Ủy ban nhân dân tỉnh Hưng Yên ra Quyết định số 03/QĐ-UB thành lập Sở Khoa học, Công nghệ và Môi trường tỉnh Hưng Yên. Trên cơ sở đó, ngày 28/02/1997, YBND tỉnh Hưng Yên đã ban hành Quyết định số 133/QĐ-UB về chức năng , nhiệm vụ, tổ chức bộ máy của Sở Khoa học, Công nghệ và Môi trường. Sở là cơ quan chuyên môn của UBND tỉnh, giúp UBND tỉnh thực hiện chức năng quản lý nhà nước về KHCN&amp;MT.</p><p>Lúc này, cơ cấu tổ chức của sở gồm có 05 phòng chuyên môn: Phòng Hành chính Tổng hợp, Phòng&nbsp; Quản lý khoa học và công nghệ, Phòng Thông tin Tư liệu- Sở hữu công nghiệp, Phòng Quản lý Môi trường, Thanh tra sở và đơn vị trực thuốc là Chi cục Tiêu chuẩn Đo lường Chất lượng.</p><p>&nbsp;</p><p><strong>Thời kỳ 2003 đến nay</strong></p><p>Ngày 05/8/2002, tại kỳ họp thứ nhất, Quốc hội khóa XI, ra Nghị quyết số 02/2002/NQ-QH11 thành lập Bộ Khoa học và Công nghệ. Ngày 2/4/2003, Thủ tướng Chính phủ ra Quyết định số 45/2003/QĐ-TTg “về việc thành lập Sở Tài Nguyên và Môi trường, đổi tên Sở Khoa học, Công nghệ và Môi trường thành Sở Khoa học và Công nghệ thuộc UBND các tỉnh, thành phố trực thuộc Trung ương.”</p><p>Thực hiện Quyết định của Thủ tướng Chính phủ về việc chia tách Sở Khoa học, Công nghệ và Môi trường thuộc UBND tỉnh, ngày 07/10/2003, UBND tỉnh Hưng Yên ban hành Quyết định số 56/QĐ-UB về việc đổi tên &nbsp;Sở Khoa học, Công nghệ và Môi trường thành Sở Khoa học và Công nghệ trực thuộc UBND tỉnh, chuyển giao biên chế, nhiệm vụ quản lý nhà nước về môi trường sang Sở Tài nguyên và Môi trường; bổ sung nhiệm vụ nhà nước về an toàn bức xạ hạt nhân và tiềm lực khoa học công nghệ.</p><p>Ngày 29/5/2004, Trung tâm Ứng dụng Tiến bộ Khoa học và Công nghệ được thành lập theo Quyết định số 66/QĐ-UBND của Ủy ban nhân dân tỉnh. Tháng 5/2005, chức năng quản lý nhà nước về công nghệ thông tin được chuyển sang Sở Bưu chính- Viễn thông.</p><p>Ngày 16/4/2009, UBND tỉnh ban hành Quyết định số 734/QĐ-UBND về việc quy định chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của Sở Khoa học và Công nghệ tỉnh Hưng Yên.&nbsp; Trong thời gian này Sở có cơ cấu gồm 06 phòng chuyên môn ( phòng Kế hoạch Tài Chính, phòng Quản lý khoa học, phòng Quản lý công nghệ, Văn phòng Sở, phòng Quản lý chuyên ngành, Thanh tra sở) và 02 đơn vị trực thuộc (Chi cục TĐC và Trung tâm Ứng dụng tiến bộ Khoa học và Công nghệ).</p><p>&nbsp;</p><p><strong>Ban giám đốc</strong></p><p>&nbsp;</p><p>1.<i><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Giám đốc qua các thời kỳ</strong></i></p><p>Đồng chí Phạm Văn Chính: tháng 4/1998-1999.</p><p>Đồng chí Ngô Hùng Mạnh: tháng 03/2000-10/2010.</p><p>Đồng chí Đỗ Tiến Hùng: tháng 12/2010-12-2011.</p><p>Đồng chí Ngô Xuân Thái: tháng 01/2012-6/2019</p><p>.Đồng chí Trần Minh Hải: tháng 9/2019- 31/12/2019</p><p>Đồng chí Trần Tùng Chuẩn: 1/1/2020- đến nay</p><p>&nbsp;</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i><strong>Phó giám đốc qua các thời kỳ</strong></i></p><p>Đồng chí Phạm Văn Chính: tháng 01/1997-3/1998.</p><p>Đồng chí Ngô Hùng Mạnh: tháng 05/1998- 02/2000.</p><p>Đồng chí Nguyễn Xuân Đỉnh: tháng&nbsp; 01/2000- 3/2010.</p><p>Đồng chí Đỗ Tiến Hùng: tháng 09/2009-11/2010.</p><p>Đồng chí Phạm Thị Lý: tháng 09/2009-10/2015.</p><p>Đồng chí Lê Thị Thắm: tháng 7/2010- đến nay.</p><p>Đồng chí Vũ Văn Thắng: tháng 02/2013- đến nay.</p>', CAST(N'2023-06-05T19:21:42.083' AS DateTime), CAST(N'2023-06-05T19:53:29.890' AS DateTime), NULL, N'LSVPT     ')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (6, N'Chức năng và nhiệm vụ', N'http://khcnhungyen.gov.vn/upload/images/t%E1%BA%A3i%20xu%E1%BB%91ng.jpg', 1, N'<p><strong>Vị trí và chức năng</strong></p><p>1.&nbsp;Sở Khoa học và Công nghệ tỉnh Hưng Yên (sau đây gọi tắt là Sở) là cơ quan chuyên môn thuộc Ủy ban nhân dân tỉnh Hưng Yên, thực hiện chức năng tham mưu, giúp Ủy ban nhân dân tỉnh quản lý nhà nước về khoa học và công nghệ, bao gồm: hoạt động nghiên cứu khoa học, phát triển công nghệ, đổi mới sáng tạo; phát triển tiềm lực khoa học và công nghệ; tiêu chuẩn, đo lường, chất lượng; sở hữu trí tuệ; ứng dụng bức xạ và đồng vị phóng xạ; an toàn bức xạ và hạt nhân; quản lý và tổ chức thực hiện các dịch vụ sự nghiệp công về các lĩnh vực thuộc phạm vi chức năng của Sở theo quy định của pháp luật.</p><p>2. Sở Khoa học và Công nghệ có tư cách pháp nhân, có con dấu và tài khoản riêng theo quy định của pháp luật; chấp hành sự chỉ đạo, quản lý về tổ chức và hoạt động của Ủy ban nhân dân tỉnh theo thẩm quyền, đồng thời chấp hành sự chỉ đạo, kiểm tra, hướng dẫn về chuyên môn, nghiệp vụ của Bộ Khoa học và Công nghệ.</p><p>3. Trụ sở làm việc: Đường An Vũ, phường Hiến Nam, thành phố Hưng Yên, tỉnh Hưng Yên.</p><p><strong>Nhiệm vụ và quyền hạn</strong></p><p>1. Trình Ủy ban nhân dân cấp tỉnh:</p><p>a) Dự thảo quyết định liên quan đến lĩnh vực khoa học, công nghệ và đổi mới sáng tạo thuộc phạm vi quản lý và các văn bản khác theo phân công của Ủy ban nhân dân tỉnh;</p><p>b) Dự thảo kế hoạch phát triển về lĩnh vực khoa học, công nghệ và đổi mới sáng tạo; dự thảo chương trình, đề án, dự án, biện pháp tổ chức thực hiện các nhiệm vụ trong lĩnh vực khoa học, công nghệ và đổi mới sáng tạo trên địa bàn tỉnh thuộc phạm vi quản lý;</p><p>c) Dự thảo quyết định việc phân cấp, ủy quyền nhiệm vụ quản lý nhà nước trong lĩnh vực khoa học, công nghệ và đổi mới sáng tạo cho Sở, Ủy ban nhân dân cấp huyện;</p><p>d) Dự thảo quyết định quy định cụ thể chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của Sở; dự thảo quyết định quy định chức năng, nhiệm vụ, quyền hạn và cơ cấu tổ chức của chi cục và đơn vị sự nghiệp công lập thuộc Sở; dự thảo quyết định thành lập và quy định về tổ chức và hoạt động của Quỹ phát triển khoa học và công nghệ của địa phương theo quy định của pháp luật;</p><p>đ) Dự thảo quyết định thực hiện xã hội hóa các hoạt động cung ứng dịch vụ sự nghiệp công trong lĩnh vực khoa học và công nghệ thuộc thẩm quyền của Ủy ban nhân dân cấp tỉnh và theo phân cấp của cơ quan nhà nước cấp trên.</p><p>2. Trình Chủ tịch Ủy ban nhân dân tỉnh: Dự thảo các văn bản thuộc thẩm quyền ban hành của Chủ tịch Ủy ban nhân dân tỉnh theo phân công.</p><p>3. Hướng dẫn, kiểm tra và tổ chức thực hiện các văn bản pháp luật, quy hoạch, kế hoạch, đề án, dự án, cơ chế, chính sách về khoa học, công nghệ và đổi mới sáng tạo sau khi được ban hành, phê duyệt; thông tin, tuyên truyền, hướng dẫn, phổ biến, giáo dục, theo dõi thi hành pháp luật về khoa học và công nghệ của địa phương; hướng dẫn các Sở, ban, ngành, Ủy ban nhân dân cấp huyện, tổ chức khoa học và công nghệ của địa phương về quản lý khoa học và công nghệ.</p><p>4. Quản lý, đăng ký, cấp, điều chỉnh, thu hồi, gia hạn các loại giấy phép, giấy chứng nhận, giấy đăng ký, văn bằng, chứng chỉ trong phạm vi chức năng, nhiệm vụ được giao theo quy định của pháp luật, theo phân công, phân cấp hoặc ủy quyền của Ủy ban nhân dân tỉnh, Chủ tịch Ủy ban nhân dân tỉnh.</p><p>5. Lập kế hoạch và xây dựng đề xuất dự toán chi đầu tư phát triển, chi sự nghiệp khoa học và công nghệ từ ngân sách nhà nước hằng năm dành cho lĩnh vực khoa học, công nghệ và đổi mới sáng tạo của địa phương trên cơ sở tổng hợp dự toán của các sở, ban, ngành, Ủy ban nhân dân cấp huyện và các cơ quan liên quan. Theo dõi, kiểm tra việc sử dụng ngân sách nhà nước cho lĩnh vực khoa học, công nghệ và đổi mới sáng tạo của tỉnh theo quy định của Luật ngân sách nhà nước và Luật khoa học và công nghệ.</p><p>6. Về quản lý hoạt động nghiên cứu khoa học, phát triển công nghệ và đổi mới sáng tạo:</p><p>a) Tổ chức việc xác định, đặt hàng, tuyển chọn, giao trực tiếp, đánh giá, nghiệm thu nhiệm vụ khoa học và công nghệ; tổ chức giao quyền sở hữu và quyền sử dụng kết quả nghiên cứu khoa học và phát triển công nghệ sử dụng ngân sách nhà nước;</p><p>b) Theo dõi, kiểm tra, đánh giá quá trình thực hiện và sau nghiệm thu các nhiệm vụ khoa học và công nghệ có sử dụng ngân sách nhà nước;</p><p>c) Tiếp nhận, tổ chức ứng dụng, đánh giá hiệu quả ứng dụng kết quả thực hiện nhiệm vụ khoa học và công nghệ do Ủy ban nhân dân tỉnh đề xuất đặt hàng hoặc đặt hàng sau khi được đánh giá, nghiệm thu;</p><p>d) Tổ chức đánh giá, thẩm định kết quả thực hiện nhiệm vụ khoa học và công nghệ không sử dụng ngân sách nhà nước của tổ chức, cá nhân trên địa bàn tỉnh theo quy định của pháp luật;</p><p>đ) Phối hợp với các Sở, ban, ngành của địa phương và các cơ quan liên quan đề xuất danh mục các nhiệm vụ khoa học và công nghệ sử dụng ngân sách nhà nước cấp quốc gia có tính liên ngành, liên vùng phục vụ phát triển kinh tế - xã hội của địa phương;</p><p>e) Thành lập các Hội đồng tư vấn khoa học và công nghệ theo quy định tại Luật khoa học và công nghệ và theo phân cấp hoặc ủy quyền của Ủy ban nhân dân tỉnh, Chủ tịch Ủy ban nhân dân tỉnh;</p><p>g) Hướng dẫn và tổ chức triển khai hoạt động đổi mới sáng tạo, khởi nghiệp đổi mới sáng tạo; khai thác, ứng dụng công nghệ, thương mại hóa kết quả nghiên cứu khoa học và phát triển công nghệ, tuyên truyền kết quả nghiên cứu khoa học, phát triển công nghệ và đổi mới sáng tạo; huy động nguồn lực đầu tư cho hoạt động nghiên cứu khoa học và phát triển công nghệ, đổi mới sáng tạo, khởi nghiệp đổi mới sáng tạo tại địa phương;</p><p>h) Hỗ trợ tổ chức, cá nhân đổi mới công nghệ, thương mại hóa kết quả nghiên cứu khoa học và phát triển công nghệ, tìm kiếm công nghệ, nhập khẩu công nghệ, khai thác sáng chế, giải mã và làm chủ công nghệ; cho ý kiến về công nghệ đối với các dự án đầu tư; đánh giá năng lực công nghệ và xây dựng định hướng phát triển công nghệ theo quy định của pháp luật.</p><p>7. Về phát triển thị trường khoa học và công nghệ, doanh nghiệp khoa học và công nghệ, tổ chức khoa học và công nghệ và tiềm lực khoa học và công nghệ:</p><p>a) Tổ chức khảo sát, điều tra đánh giá trình độ, năng lực công nghệ của doanh nghiệp, tổ chức khoa học và công nghệ; năng lực hoạt động của tổ chức trung gian của thị trường khoa học và công nghệ; hướng dẫn việc thành lập, phát triển; chứng nhận và kiểm tra hoạt động của doanh nghiệp khoa học và công nghệ, tổ chức khoa học và công nghệ trên địa bàn địa phương; tổng hợp và báo cáo Bộ Khoa học và Công nghệ theo quy định;</p><p>b) Hướng dẫn và tổ chức thực hiện cơ chế, chính sách khuyến khích, phát triển hoạt động ươm tạo công nghệ, ươm tạo doanh nghiệp khoa học và công nghệ trên địa bàn; xây dựng và tổ chức thực hiện các giải pháp hỗ trợ đổi mới công nghệ; thương mại hóa kết quả nghiên cứu khoa học và phát triển công nghệ, phát triển thị trường khoa học và công nghệ và tổ chức trung gian của thị trường khoa học và công nghệ;</p><p>c) Tổ chức thực hiện việc đăng ký và kiểm tra hoạt động của các tổ chức khoa học và công nghệ, văn phòng đại diện, chi nhánh của tổ chức khoa học và công nghệ;</p><p>d) Hướng dẫn thực hiện cơ chế tự chủ của các tổ chức khoa học và công nghệ công lập theo quy định của pháp luật; quản lý hoạt động của các tổ chức khoa học và công nghệ trong và ngoài công lập thuộc thẩm quyền quản lý;</p><p>đ) Hướng dẫn, quản lý hoạt động chuyển giao công nghệ trên địa bàn, bao gồm: chuyển giao công nghệ, đánh giá, giám định công nghệ, môi giới và tư vấn chuyển giao công nghệ; thẩm định hoặc có ý kiến về cơ sở khoa học và công nghệ của các dự án đầu tư, các quy hoạch, chương trình phát triển kinh tế - xã hội và các chương trình, đề án khác của địa phương theo thẩm quyền;</p><p>e) Đề xuất các dự án đầu tư phát triển tiềm lực khoa học và công nghệ tại địa phương theo thẩm quyền và tổ chức thực hiện sau khi được cơ quan có thẩm quyền phê duyệt;</p><p>g) Tổ chức thực hiện cơ chế, chính sách về sử dụng, trọng dụng cá nhân hoạt động khoa học và công nghệ; đào tạo, bồi dưỡng nhân lực khoa học và công nghệ của địa phương;</p><p>8. Tổ chức nghiên cứu, ứng dụng tiến bộ khoa học - kỹ thuật và công nghệ; khai thác, thương mại hóa, công bố, tuyên truyền kết quả nghiên cứu khoa học, nghiên cứu khoa học và phát triển công nghệ, đổi mới sáng tạo và các hoạt động khoa học và công nghệ khác; phối hợp triển khai thực hiện nhiệm vụ khoa học và công nghệ cấp quốc gia sử dụng ngân sách nhà nước tại địa phương.</p><p>9. Về sở hữu trí tuệ</p><p>a) Tổ chức triển khai thực hiện Chiến lược sở hữu trí tuệ đến năm 2030, các nhiệm vụ, chương trình thuộc lĩnh vực sở hữu trí tuệ trong phạm vi thẩm quyền được giao; thực hiện các biện pháp hỗ trợ phát triển hoạt động sở hữu công nghiệp; hướng dẫn nghiệp vụ sở hữu công nghiệp đối với các tổ chức và cá nhân; quản lý, xây dựng, phát triển nhãn hiệu sử dụng địa danh, dấu hiệu khác chỉ nguồn gốc địa lý của sản phẩm địa phương; quản lý chỉ dẫn địa lý khi được giao quyền;</p><p>b) Hướng dẫn, hỗ trợ tổ chức, cá nhân tiến hành các thủ tục về sở hữu công nghiệp; chủ trì, phối hợp với các cơ quan có liên quan bảo vệ quyền sở hữu công nghiệp và xử lý vi phạm pháp luật về sở hữu công nghiệp;</p><p>c) Chủ trì triển khai các biện pháp để phổ biến, khuyến khích, thúc đẩy hoạt động sáng chế, sáng kiến, sáng tạo tại địa phương; tổ chức xét chấp thuận việc công nhận sáng kiến được tạo ra do Nhà nước đầu tư kinh phí, phương tiện vật chất - kỹ thuật theo quy định của pháp luật;</p><p>d) Cấp, cấp lại, thu hồi Giấy chứng nhận tổ chức giám định sở hữu công nghiệp theo quy định của pháp luật;</p><p>đ) Giúp Ủy ban nhân dân tỉnh thực hiện quản lý nhà nước về sở hữu trí tuệ đối với các lĩnh vực liên quan theo quy định của pháp luật và phân cấp hoặc ủy quyền của Ủy ban nhân dân tỉnh.</p><p>10. Về tiêu chuẩn, đo lường, chất lượng</p><p>a) Tổ chức việc xây dựng và tham gia xây dựng quy chuẩn kỹ thuật địa phương;</p><p>b) Tổ chức phổ biến áp dụng quy chuẩn kỹ thuật quốc gia, quy chuẩn kỹ thuật địa phương, tiêu chuẩn quốc gia, tiêu chuẩn quốc tế, tiêu chuẩn khu vực, tiêu chuẩn nước ngoài, áp dụng phương thức đánh giá sự phù hợp tiêu chuẩn, quy chuẩn kỹ thuật; hướng dẫn xây dựng tiêu chuẩn cơ sở đối với các tổ chức, cá nhân trên địa bàn; thanh tra, kiểm tra việc chấp hành pháp luật về tiêu chuẩn và quy chuẩn kỹ thuật trên địa bàn; tổ chức thực hiện việc khảo sát chất lượng sản phẩm, hàng hóa tại địa phương; cảnh báo về nguy cơ mất an toàn của sản phẩm hàng hóa cho người tiêu dùng và các cơ quan hữu quan tại địa phương;</p><p>c) Tổ chức, quản lý, hướng dẫn các tổ chức, cá nhân sản xuất, kinh doanh thực hiện việc công bố tiêu chuẩn áp dụng đối với các sản phẩm, hàng hóa, dịch vụ, quá trình và môi trường theo phân công, phân cấp của cơ quan nhà nước có thẩm quyền;</p><p>d) Tiếp nhận bản công bố hợp chuẩn của tổ chức, cá nhân đăng ký hoạt động sản xuất, kinh doanh tại địa phương; tiếp nhận bản công bố hợp quy đối với sản phẩm, hàng hóa có khả năng gây mất an toàn (hàng hóa nhóm 2) thuộc phạm vi quản lý; tiếp nhận bản đăng ký kiểm tra nhà nước về chất lượng hàng hóa nhập khẩu trong lĩnh vực được phân công; tư vấn đăng ký mã số mã vạch theo phân công, phân cấp của cơ quan nhà nước có thẩm quyền; thực hiện quản lý nhà nước về truy xuất nguồn gốc sản phẩm, hàng hóa tại địa phương;</p><p>đ) Thực hiện nhiệm vụ thông báo và hỏi đáp về tiêu chuẩn, đo lường, chất lượng và hàng rào kỹ thuật trong thương mại (gọi tắt là TBT) trên địa bàn; phối hợp với Điểm TBT quốc gia trong xử lý thông tin hỏi đáp, rà soát các văn bản, dự thảo biện pháp TBT của địa phương và tuyên truyền phổ biến về TBT cho doanh nghiệp để hỗ trợ xuất khẩu tại địa phương;</p><p>e) Là đầu mối triển khai các nhiệm vụ, chương trình thuộc lĩnh vực tiêu chuẩn, đo lường, chất lượng thuộc phạm vi thẩm quyền tại địa phương; tổ chức mạng lưới kiểm định, hiệu chuẩn, thử nghiệm về đo lường đáp ứng yêu cầu của địa phương; tổ chức thực hiện việc kiểm định, hiệu chuẩn, thử nghiệm về đo lường trong các lĩnh vực và phạm vi đã đăng ký, được chỉ định;</p><p>g) Tiếp nhận bản công bố, bản điều chỉnh nội dung bản công bố sử dụng dấu định lượng; công bố sử dụng dấu định lượng và điều chỉnh nội dung bản công bố sử dụng dấu định lượng trên nhãn hàng đóng gói sẵn theo quy định của pháp luật;</p><p>h) Tổ chức thực hiện việc kiểm tra về đo lường đối với chuẩn đo lường, phương tiện đo, phép đo, hàng đóng gói sẵn, hoạt động kiểm định, hiệu chuẩn, thử nghiệm về đo lường theo quy định của pháp luật; tổ chức thực hiện các biện pháp để người có quyền và nghĩa vụ liên quan giám sát, kiểm tra việc thực hiện phép đo, phương pháp đo, phương tiện đo, chuẩn đo lường, chất lượng hàng hóa; tổ chức thực hiện việc thiết lập, duy trì, bảo quản, sử dụng các chuẩn đo lường của địa phương;</p><p>i) Tổ chức thực hiện việc thử nghiệm phục vụ yêu cầu quản lý nhà nước và nhu cầu của tổ chức, cá nhân về chất lượng sản phẩm, hàng hóa trên địa bàn;</p><p>k) Chủ trì, phối hợp với các cơ quan có liên quan tổ chức thực hiện kiểm tra chất lượng sản phẩm, hàng hóa trong sản xuất, hàng hóa nhập khẩu, hàng hoá lưu thông trên địa bàn và nhãn hàng hóa, mã số, mã vạch theo phân công, phân cấp hoặc ủy quyền của cơ quan nhà nước có thẩm quyền;</p><p>l) Tổ chức thực hiện việc áp dụng Hệ thống quản lý chất lượng theo tiêu chuẩn quốc gia TCVN ISO 9001 vào hoạt động của các cơ quan, tổ chức thuộc hệ thống hành chính nhà nước tại địa phương theo quy định của pháp luật;</p><p>m) Hướng dẫn các tổ chức, doanh nghiệp tham dự giải thưởng chất lượng quốc gia, quốc tế; xem xét, đánh giá các tổ chức, doanh nghiệp tham dự giải thưởng chất lượng quốc gia trên địa bàn tỉnh theo quy định;</p><p>n) Tổ chức thực hiện các nhiệm vụ liên quan đến hoạt động nâng cao năng suất và chất lượng sản phẩm, hàng hóa; là đầu mối triển khai các nhiệm vụ thuộc chương trình quốc gia hỗ trợ doanh nghiệp nâng cao năng suất và chất lượng sản phẩm hàng hóa, đề án về truy xuất nguồn gốc sản phẩm, hàng hóa tại địa phương;</p><p>o) Tuyên truyền, phổ biến, hướng dẫn các văn bản quy phạm pháp luật về tiêu chuẩn đo lường chất lượng đến các tổ chức, cá nhân, doanh nghiệp thuộc phạm vi quản lý.</p><p>11. Về ứng dụng và bảo đảm an toàn bức xạ và hạt nhân</p><p>a) Tổ chức thực hiện các quy hoạch, kế hoạch, chương trình, dự án và các biện pháp để thúc đẩy ứng dụng bức xạ và đồng vị phóng xạ phục vụ phát triển kinh tế - xã hội;</p><p>b) Quản lý các hoạt động quan trắc phóng xạ môi trường trên địa bàn; phối hợp quản lý các hoạt động phát triển, ứng dụng năng lượng nguyên tử theo quy định;</p><p>c) Quản lý các hoạt động dịch vụ sự nghiệp công trong lĩnh vực năng lượng nguyên tử, an toàn bức xạ và hạt nhân trên địa bàn;</p><p>d) Quản lý và thực hiện việc tiếp nhận khai báo, thẩm định an toàn, cấp giấy phép, sửa đổi, bổ sung, gia hạn, cấp lại giấy phép tiến hành công việc bức xạ sử dụng thiết bị X-quang chẩn đoán trong y tế; cấp chứng chỉ nhân viên bức xạ cho người phụ trách an toàn tại cơ sở X-quang chẩn đoán trong y tế hoạt động trên địa bàn tỉnh theo sự phân công, phân cấp, ủy quyền của Ủy ban nhân dân cấp tỉnh;</p><p>đ) Chủ trì và phối hợp với các cơ quan liên quan thực hiện thanh tra, kiểm tra việc tuân thủ các quy định pháp luật về an toàn bức xạ và hạt nhân thuộc địa bàn quản lý và xử lý đối với các vi phạm theo thẩm quyền;</p><p>e) Chủ trì và phối hợp với các cơ quan có liên quan giúp Ủy ban nhân dân tỉnh xây dựng kế hoạch ứng phó sự cố bức xạ và hạt nhân cấp tỉnh trình cơ quan có thẩm quyền phê duyệt và tổ chức triển khai thực hiện sau khi được phê duyệt; xử lý sự cố bức xạ và hạt nhân trên địa bàn theo sự phân công của Ủy ban nhân dân tỉnh; tiếp nhận, thông báo và phối hợp với các cơ quan có liên quan xác minh thông tin và tổ chức tìm kiếm, xử lý đối với nguồn phóng xạ, vật liệu hạt nhân, thiết bị hạt nhân nằm ngoài sự kiểm soát;</p><p>g) Chủ trì và phối hợp với đơn vị chức năng của Bộ Khoa học và Công nghệ thu gồm chất thải phóng xạ, nguồn phóng xạ phát hiện trên địa bàn quản lý mà không xác định được chủ sở hữu; phối hợp với đơn vị chức năng của Bộ Khoa học và Công nghệ trong việc thẩm định cấp phép và quản lý các nguồn phóng xạ tại địa bàn theo quy định của pháp luật;</p><p>h) Hướng dẫn các tổ chức, cá nhân trên địa bàn quản lý các biện pháp quản lý chất thải phóng xạ và nguồn phóng xạ đã qua sử dụng, thực hiện các biện pháp bảo đảm an toàn, an ninh khi phát hiện nguồn phóng xạ, vật liệu hạt nhân, thiết bị hạt nhân nằm ngoài sự kiểm soát;</p><p>i) Xây dựng cơ sở dữ liệu về kiểm soát an toàn, an ninh bức xạ và hạt nhân tại địa phương và tích hợp với cơ sở dữ liệu quốc gia về khoa học và công nghệ.</p><p>12. Về thông tin, thống kê khoa học, công nghệ và đổi mới sáng tạo</p><p>a) Tổ chức và thực hiện xử lý, phân tích, tổng hợp và cung cấp thông tin khoa học và công nghệ, thông tin thống kê khoa học, công nghệ và đổi mới sáng tạo phục vụ lãnh đạo, quản lý, nghiên cứu, đào tạo, sản xuất, kinh doanh và phát triển kinh tế - xã hội tại địa phương;</p><p>b) Tổ chức hướng dẫn và triển khai thực hiện công tác thu thập, đăng ký, lưu giữ và công bố thông tin về nhiệm vụ khoa học và công nghệ thuộc phạm vi quản lý của địa phương theo quy định;</p><p>c) Xây dựng và phát triển hạ tầng thông tin khoa học và công nghệ; tham gia xây dựng, cập nhật và khai thác Cơ sở dữ liệu quốc gia về khoa học và công nghệ; xây dựng, quản lý, kết nối và chia sẻ các cơ sở dữ liệu về khoa học và công nghệ của địa phương bảo đảm việc tích hợp, trao đổi, chia sẻ dữ liệu đồng bộ, thống nhất; tham gia khai thác, duy trì và phát triển Mạng Nghiên cứu và Đào tạo Việt Nam (VinaREN) và các mạng thông tin khoa học và công nghệ khác; ứng dụng công nghệ thông tin và truyền thông, phương tiện kỹ thuật tiên tiến trong hoạt động thông tin, thống kê khoa học và công nghệ;</p><p>d) Đầu mối kết nối triển khai các dự án của Hệ tri thức Việt số hoá tại địa phương. Triển khai xây dựng các dự án dữ liệu của địa phương; phát triển, tích hợp hệ thống dữ liệu và thông tin quản lý của địa phương trong các lĩnh vực như: giáo dục, nông nghiệp, y tế, khoa học và công nghệ, văn hoá... và chia sẻ công khai trên Hệ tri thức Việt số hoá để cộng đồng khai thác, sử dụng;</p><p>đ) Chỉ đạo tổ chức thực hiện chế độ báo cáo thống kê ngành khoa học và công nghệ tại địa phương;</p><p>e) Phối hợp tổ chức thực hiện các cuộc điều tra thống kê khoa học, công nghệ và đổi mới sáng tạo thuộc Chương trình điều tra thống kê quốc gia và ngoài Chương trình điều tra thống kê quốc gia tại địa phương; Chỉ đạo tổ chức triển khai các cuộc điều tra thống kê khoa học, công nghệ và đổi mới sáng tạo của địa phương;</p><p>g) Quản lý, xây dựng và phát triển các nguồn tin khoa học và công nghệ của địa phương; tham gia Liên hợp thư viện Việt Nam về các nguồn tin khoa học và công nghệ;</p><p>h) Tổ chức các chợ công nghệ - thiết bị, các trung tâm, sàn giao dịch thông tin công nghệ trực tiếp và trên mạng Internet, triển lãm, hội chợ khoa học và công nghệ; phổ biến, xuất bản ấn phẩm và cung cấp thông tin khoa học và công nghệ;</p><p>i) Tổ chức hoạt động dịch vụ trong lĩnh vực thông tin, thư viện, thống kê, cơ sở dữ liệu về khoa học và công nghệ; in ấn, số hóa; tổ chức các sự kiện khoa học và công nghệ.</p><p>13. Về dịch vụ sự nghiệp công:</p><p>a) Hướng dẫn các tổ chức sự nghiệp thực hiện dịch vụ sự nghiệp công trong lĩnh vực khoa học và công nghệ trên địa bàn;</p><p>b) Tổ chức thực hiện các quy trình, thủ tục, định mức kinh tế - kỹ thuật đối với các hoạt động cung ứng dịch vụ sự nghiệp công thuộc lĩnh vực khoa học và công nghệ;</p><p>c) Hướng dẫn, tạo điều kiện hỗ trợ cho các tổ chức thực hiện dịch vụ sự nghiệp công về khoa học và công nghệ theo quy định của pháp luật.</p><p>14. Quản lý, khuyến khích, hỗ trợ phát triển doanh nghiệp, hợp tác xã, kinh tế tập thể, kinh tế tư nhân trong lĩnh vực khoa học và công nghệ hoạt động trên địa bàn.</p><p>15. Thực hiện hợp tác quốc tế về khoa học và công nghệ theo quy định của pháp luật và theo phân công, phân cấp hoặc ủy quyền của Ủy ban nhân dân tỉnh và của cơ quan nhà nước cấp trên.</p><p>16. Thực hiện công tác thanh tra, kiểm tra, giải quyết khiếu nại, tố cáo trong lĩnh vực khoa học và công nghệ theo quy định của pháp luật và theo sự phân công, phân cấp hoặc ủy quyền của Ủy ban nhân dân tỉnh; tổ chức việc tiếp công dân và thực hiện các quy định về phòng, chống tham nhũng, tiêu cực, các quy định về thực hành tiết kiệm, chống lãng phí; xử lý theo thẩm quyền hoặc kiến nghị cơ quan có thẩm quyền xử lý các vi phạm pháp luật trong lĩnh vực khoa học và công nghệ theo quy định của pháp luật.</p><p>17. Quy định cụ thể chức năng, nhiệm vụ, quyền hạn của các phòng chuyên môn, nghiệp vụ, văn phòng, thanh tra trực thuộc Sở và các phòng chuyên môn, nghiệp vụ trực thuộc Chi cục, đơn vị sự nghiệp thuộc Sở theo hướng dẫn của Bộ Khoa học và Công nghệ và quy định của Ủy ban nhân dân tỉnh.</p><p>18. Quản lý về tổ chức bộ máy, biên chế công chức, cơ cấu ngạch công chức, vị trí việc làm, cơ cấu viên chức theo chức danh nghề nghiệp và số lượng người làm việc trong các đơn vị sự nghiệp công lập thuộc Sở; thực hiện chế độ tiền lương và chính sách, chế độ đãi ngộ, đào tạo, bồi dưỡng, khen thưởng, kỷ luật đối với công chức, viên chức và người lao động thuộc phạm vi quản lý theo quy định của pháp luật và theo sự phân công hoặc ủy quyền của Ủy ban nhân dân tỉnh.</p><p>19. Quản lý, hướng dẫn, kiểm tra hoạt động của các hội, các tổ chức phi chính phủ hoạt động trong lĩnh vực khoa học và công nghệ thuộc thẩm quyền của địa phương theo quy định của pháp luật.</p><p>20. Quản lý và chịu trách nhiệm về tài chính, tài sản được giao theo quy định của pháp luật và theo phân công hoặc ủy quyền của Ủy ban nhân dân tỉnh.</p><p>21. Thực hiện công tác thông tin, báo cáo định kỳ và đột xuất về tình hình thực hiện nhiệm vụ được giao với Ủy ban nhân dân tỉnh, Bộ Khoa học và Công nghệ.</p><p>22. Thực hiện các nhiệm vụ khác do Ủy ban nhân dân tỉnh, Chủ tịch Ủy ban nhân dân tỉnh giao và theo quy định của pháp luật.</p><p>&nbsp;</p><p><i>Trích Quyết định 23/2021/QĐ-UBND ngày 23/06/2021</i></p>', N'<p><strong>Chức năng và nhiệm vụ</strong></p>', CAST(N'2023-06-05T19:43:32.647' AS DateTime), CAST(N'2023-06-05T19:53:49.027' AS DateTime), NULL, N'CNVNV     ')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (7, N'Ban giám đốc', N'http://khcnhungyen.gov.vn/upload/images/Danh%20muc/icon_ql.jpg', 1, N'<p><strong>GIỚI THIỆU BAN GIÁM ĐỐC</strong></p><p><strong>1. Đồng chí Trần Tùng Chuẩn&nbsp;- &nbsp;Giám Đốc&nbsp; Sở</strong></p><figure class="table"><table><tbody><tr><td><img src="http://khcnhungyen.gov.vn/upload/images/z2367161170735_875b6f1dfba1e53b0df506e26b8e0884.jpg" alt=""> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong>&nbsp;</strong></td><td><p><strong>Năm sinh : 1976</strong></p><p><strong>Chức vụ chính quyền: Giám đốc&nbsp; Sở</strong></p><p><strong>Quê quán: Lương Tài&nbsp;– Văn Lâm&nbsp;- Hưng Yên</strong></p><p><strong>Nơi ở hiện nay: &nbsp;Phường Quang Trung, Thành phố Hưng yên</strong></p><p><strong>Trình độ chuyên môn: Thạc Sĩ</strong></p><p><strong>Chuyên ngành: Tự Động Hóa</strong></p><p><strong>Trình độ lý luận: Cao Cấp</strong></p><p><strong>Ngạch công chức: 01.002</strong></p><p><strong>Email: chuantdchy@gmail.com</strong></p></td></tr><tr><td colspan="2"><p>- Phụ trách, điều hành chung và chịu trách nhiệm trước Tỉnh uỷ, HĐND, UBND tỉnh, Bộ Khoa học và Công nghệ và trước pháp luật toàn bộ hoạt động của Sở theo chức năng, nhiệm vụ, quyền hạn được giao.</p><p>- Trực tiếp chỉ đạo các mặt công tác: công tác tổ chức bộ máy, cán bộ, bảo vệ nội bộ; cải cách hành chính; thi đua khen thưởng; tổng hợp, hành chính, quản trị; kế hoạch và tài chính; phát triển tiềm lực khoa học và công nghệ; hoạt động quản lý nhà nước khoa học và công nghệ; phòng chống tham nhũng; hợp tác quốc tế, hợp tác về khoa học và công nghệ ngoài tỉnh.</p><p>- Trực tiếp chỉ đạo các phòng , đơn vị trực thuộc sở:&nbsp;</p><p>- Chịu trách nhiệm xuất bản Bản tin KH&amp;CN. Là người phát ngôn và cung cấp thông tin cho báo chí;</p><p>- Chủ tài khoản của Sở;</p><p>- Thực hiện nhiệm vụ khác do Tỉnh uỷ, HĐND, UBND tỉnh và Bộ Khoa học và Công nghệ giao</p></td></tr></tbody></table></figure><p><strong>2. Đồng chí Nguyễn Thái Kiều Ngân- Phó Giám Đốc Sở</strong></p><figure class="table"><table><tbody><tr><td><img src="http://khcnhungyen.gov.vn/upload/images/AnhCDV/nguyen%20thai%20kieu.jpg"></td><td><p><strong>Năm&nbsp;sinh:&nbsp;1975</strong></p><p><strong>Chức vụ chính quyền: Phó Giám đốc Sở</strong></p><p><strong>Quê quán:&nbsp; Lệ Xá -Tiên Lữ- Hưng Yên</strong></p><p><strong>Nơi ở hiện nay: Thành Phố Hưng Yên</strong></p><p><strong>Trình độ chuyên môn: Cử Nhân</strong></p><p><strong>Trình độ chính trị: Cao cấp</strong></p><p><strong>Email: ngankhcn@gmail.com</strong></p></td></tr><tr><td colspan="2"><p>-Trực tiếp phụ trách các phòng , đơn vị: Phòng Quản lý Khoa học&nbsp;; Trung tâm Ứng dụng tiến bộ KH&amp;CN; Trung tâm Thông tin và Thống kê KH&amp;CN.</p><p>-Theo dõi hoạt động khoa học và công nghệ các huyện,thị xã, thành phố; các hội ,đoàn thể.</p><p>-Tham gia các Hội đồng, Ban chỉ đạo theo Quyết định của Ban Thường vụ Tỉnh ủy và UBND tỉnh;</p><p>- Thực hiện nhiệm vụ khác&nbsp; do Giám đốc Sở phân công</p></td></tr></tbody></table></figure><p><strong>3. Đồng chí Nguyễn Xuân Hải - Phó Giám Đốc Sở</strong></p><figure class="table"><table><tbody><tr><td><img src="http://khcnhungyen.gov.vn/upload/images/AnhCDV/nguyen%20xuan%20hai.jpg"></td><td><p><strong>Năm sinh: 1983</strong></p><p><strong>Chức vụ chính quyền: Phó Giám đốc Sở</strong></p><p><strong>Quê quán: Phường Phùng Chí Kiên - Thị xã Mỹ Hào - tỉnh Hưng Yên.</strong></p><p><strong>Nơi ở hiện nay: Số 81- Đường Nguyễn Công Hoan - Phường Lê Lợi - Thành phố Hưng Yên- tỉnh Hưng Yên.</strong></p><p><strong>Trình độ chuyên môn: Thạc sỹ&nbsp;quản lý kinh tế</strong></p><p><strong>Trình độ lý luận chính trị: Cao cấp.</strong></p><p><strong>Ngạch công chức: Chuyên viên.</strong></p><p><strong>Email:</strong><a href="mailto:hnforever@gmail.com">hnforever@gmail.com</a></p></td></tr><tr><td colspan="2"><p>-Trực tiếp phụ trách các phòng , đơn vị: Văn phòng Sở và Phòng Quản Lý chuyên ngành</p><p>-Theo dõi hoạt động khoa học và công nghệ của các sở, ban , ngành, Mặt trận Tổ quốc và các tổ chức chính trị - xã hội cấp tỉnh.</p><p>-Tham gia các Hội đồng, Ban chỉ đạo ...của tỉnh theo sự phân công của Giám đốc Sở</p><p>- Thực hiện nhiệm vụ khác&nbsp; do Giám đốc Sở phân công</p></td></tr></tbody></table></figure>', N'<p><strong>Ban giám đốc</strong></p>', CAST(N'2023-06-05T19:56:32.137' AS DateTime), NULL, NULL, N'BGD       ')
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at], [type]) VALUES (8, N'Cơ cấu tổ chức', N'http://khcnhungyen.gov.vn/upload/images/Picture2.png', 1, N'<p><strong>CƠ CẤU TỔ CHỨC CỦA SỞ KHOA HỌC CÔNG NGHỆ VÀ HƯNG YÊN</strong></p><p>&nbsp;</p><p><img src="http://khcnhungyen.gov.vn/upload/images/Picture2.png" alt=""></p>', N'<p><strong>Cơ cấu tổ chức</strong></p>', CAST(N'2023-06-05T19:59:24.187' AS DateTime), CAST(N'2023-06-05T20:15:15.250' AS DateTime), NULL, N'CCTC      ')
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[QuanLyGopY] ON 
GO
INSERT [dbo].[QuanLyGopY] ([id_gop_y], [Ho_ten], [Email], [So_dien_thoai], [Tieu_de], [Noi_dung], [Ngay_hoi]) VALUES (1, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-06-05T15:16:21.500' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[QuanLyGopY] OFF
GO
SET IDENTITY_INSERT [dbo].[SlideImage] ON 
GO
INSERT [dbo].[SlideImage] ([slide_image_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at]) VALUES (2, N'Slide test', N'http://khcnhungyen.gov.vn/upload/images/Slide/hy1_2.jpg', 1, N'<p>mới 1</p>', N'test', CAST(N'2023-06-03T10:07:39.133' AS DateTime), CAST(N'2023-06-03T10:16:06.220' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[SlideImage] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([menu_parent_id])
REFERENCES [dbo].[MenuParent] ([menu_parent_id])
GO
/****** Object:  StoredProcedure [dbo].[sp_TinTuc_Load]    Script Date: 6/5/2023 8:21:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_TinTuc_Load]
as
select * from News tt left join
LoaiTinTuc ltc on ltc.Ma_loai=tt.type
GO
