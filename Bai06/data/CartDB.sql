CREATE DATABASE [CartDB]
GO
USE [CartDB]
GO
CREATE TABLE [dbo].[Customer](
[id] [int] NOT NULL,
[name] [varchar](150) NOT NULL,
[amount] [money] NULL,
[username] [varchar](50) NULL,
[password] [varchar](50) NULL,
CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Order](
[id] [int] IDENTITY(1,1) NOT NULL,
[date] [date] NOT NULL,
[cid] [int] NOT NULL,
[totalmoney] [money] NULL,
CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[OrderLine](
[oid] [int] NOT NULL,
[pid] [int] NOT NULL,
[quantity] [float] NOT NULL,
[price] [float] NOT NULL,
CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED
(
[oid] ASC,
[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Product](
[id] [int] NOT NULL,
[name] [varchar](150) NOT NULL,
[price] [float] NOT NULL,
[quantity] [int] NULL,
CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED
(
[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF,
ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customer] ([id], [name], [amount], [username], [password]) VALUES (1,
N'Mr A', 20000.0000, N'a', N'123')
INSERT [dbo].[Customer] ([id], [name], [amount], [username], [password]) VALUES (2,
N'Mr B', 1000000.0000, N'b', N'123')
INSERT [dbo].[Customer] ([id], [name], [amount], [username], [password]) VALUES (3,
N'Ms C', 800000.0000, N'c', N'123')
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (1, N'Cocacola', 10,
100)
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (2, N'Fanta', 8, 40)
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (3, N'7up', 13, 200)
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (4, N'Pepsi', 9, 210)
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (5, N'Number one',
15, 200)
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (6, N'Dr thanh', 18,
120)
INSERT [dbo].[Product] ([id], [name], [price], [quantity]) VALUES (7, N'lavie', 6, 300)
ALTER TABLE [dbo].[Order] WITH CHECK ADD CONSTRAINT [FK_Order_Customer] FOREIGN
KEY([cid])
REFERENCES [dbo].[Customer] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_Order] FOREIGN
KEY([oid])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Order]
GO
ALTER TABLE [dbo].[OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_Product]
FOREIGN KEY([pid])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Product]
GO