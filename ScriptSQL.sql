USE [ScienceHY]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
ALTER TABLE [dbo].[Menu] DROP CONSTRAINT IF EXISTS [FK__Menu__menu_paren__4F7CD00D]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
ALTER TABLE [dbo].[Comment] DROP CONSTRAINT IF EXISTS [FK__Comment__account__4E88ABD4]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Video]
GO
/****** Object:  Table [dbo].[UrlLink]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[UrlLink]
GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[SlideImage]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Role]
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Recruitment]
GO
/****** Object:  Table [dbo].[Proceduree]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Proceduree]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Policy]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[News]
GO
/****** Object:  Table [dbo].[MenuParent]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[MenuParent]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Menu]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Comment]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Blog]
GO
/****** Object:  Table [dbo].[AlbumImage]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[AlbumImage]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/3/2023 5:43:10 PM ******/
DROP TABLE IF EXISTS [dbo].[Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumImage]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuParent]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/3/2023 5:43:10 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proceduree]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 6/3/2023 5:43:10 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[recruiment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrlLink]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/3/2023 5:43:10 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([account_id], [active], [address], [admin], [avatar], [full_name], [password], [phone], [role_code], [user_name], [email], [created_at], [updated_at], [deleted_at], [id_town], [id_district], [id_city]) VALUES (1, NULL, NULL, 1, NULL, NULL, N'123', NULL, NULL, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (1, N'GTC', N'Lịch Sử và phát triển', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (2, N'/future', N'Chức năng và nhiệm vụ', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (3, N'/director', N'Ban giám đốc', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Menu] ([menu_id], [menu_code], [menu_name], [title], [menu_parent_id], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (4, N'/director', N'Cơ cấu tổ chức', NULL, 2, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuParent] ON 
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (1, N'trang-chu', N'Trang Chủ', N'HomePage', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (2, N'/user', N'Giới thiệu', N'Intro', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (3, N'/user', N'Hành chính công', N'HCC', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (4, N'/user', N'Tin tức', N'New', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (5, N'/user', N'Sở hữu trí tuệ', N'SHTT', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (6, N'/user', N'Văn bản', N'VB', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (7, N'/user', N'Hỏi đáp', N'HĐ', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[MenuParent] ([menu_parent_id], [menu_parent_code], [menu_parent_name], [title], [status], [image], [created_at], [updated_at], [deleted_at]) VALUES (8, N'/user', N'Liên hệ', N'Contact', NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[MenuParent] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([news_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at]) VALUES (1, N'TẬP ĐOÀN COT (SINGAPORE) CHỌN HƯNG YÊN LÀ ĐỊA ĐIỂM MỞ RỘNG ĐẦU TƯ', N'https://baohungyen.vn/file//4028eaa4679b32c401679c0c74382a7e/052023/o_nam_20230531140042.jpg', 1, N'Toàn cảnh buổi làm việc Tại buổi làm việc, đại diện Tập đoàn COT cho biết, sau một thời gian khảo sát, Tập đoàn đã chọn Hưng Yên...', N'', CAST(N'2023-06-03T16:21:08.360' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[SlideImage] ON 
GO
INSERT [dbo].[SlideImage] ([slide_image_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at]) VALUES (2, N'Slide test', N'https://t3.ftcdn.net/jpg/05/24/30/02/360_F_524300228_egMskw0zvvdwNUFPeJLlplclKzFamXBk.jpg', 1, N'<p>mới 1</p>', N'test', CAST(N'2023-06-03T10:07:39.133' AS DateTime), CAST(N'2023-06-03T10:16:06.220' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[SlideImage] OFF
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([menu_parent_id])
REFERENCES [dbo].[MenuParent] ([menu_parent_id])
GO
