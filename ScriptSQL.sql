USE [ScienceHY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Account]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[AlbumImage]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlbumImage]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Blog]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comment]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Menu]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[MenuParent]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MenuParent]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Policy]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Proceduree]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proceduree]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Recruitment]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Role]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[SlideImage]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SlideImage]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[UrlLink]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UrlLink]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[Video]    Script Date: 6/3/2023 10:18:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Video]') AND type in (N'U'))
BEGIN
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
END
GO
SET IDENTITY_INSERT [dbo].[Account] ON 
GO
INSERT [dbo].[Account] ([account_id], [active], [address], [admin], [avatar], [full_name], [password], [phone], [role_code], [user_name], [email], [created_at], [updated_at], [deleted_at], [id_town], [id_district], [id_city]) VALUES (1, NULL, NULL, 1, NULL, NULL, N'123', NULL, NULL, N'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[SlideImage] ON 
GO
INSERT [dbo].[SlideImage] ([slide_image_id], [title], [image], [status], [descrip], [note], [created_at], [updated_at], [deleted_at]) VALUES (2, N'Slide test', N'https://t3.ftcdn.net/jpg/05/24/30/02/360_F_524300228_egMskw0zvvdwNUFPeJLlplclKzFamXBk.jpg', 1, N'<p>mới 1</p>', N'test', CAST(N'2023-06-03T10:07:39.133' AS DateTime), CAST(N'2023-06-03T10:16:06.220' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[SlideImage] OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Comment__account__4E88ABD4]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comment]'))
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Menu__menu_paren__4F7CD00D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Menu]'))
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([menu_parent_id])
REFERENCES [dbo].[MenuParent] ([menu_parent_id])
GO
