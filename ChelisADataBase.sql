USE [master]
GO
/****** Object:  Database [ChelisA]    Script Date: 06-Nov-20 9:05:00 PM ******/
CREATE DATABASE [ChelisA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChelisA', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ChelisA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ChelisA_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ChelisA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ChelisA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChelisA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChelisA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChelisA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChelisA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChelisA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChelisA] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChelisA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChelisA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ChelisA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChelisA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChelisA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChelisA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChelisA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChelisA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChelisA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChelisA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChelisA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChelisA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChelisA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChelisA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChelisA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChelisA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChelisA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChelisA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChelisA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ChelisA] SET  MULTI_USER 
GO
ALTER DATABASE [ChelisA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChelisA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChelisA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChelisA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ChelisA]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[TransactionType] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[TransactionType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerType] [nvarchar](50) NULL,
	[RegistrationType] [nvarchar](50) NULL,
	[RegistrationNumber] [nvarchar](50) NULL,
	[ContactName] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[State] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[OtherPhone] [nvarchar](20) NULL,
	[Marketer] [nvarchar](50) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Inward]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inward](
	[InwardId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[QuantityReturned] [int] NULL,
	[OutwardId] [decimal](18, 0) NOT NULL,
	[GRNNumber] [nvarchar](50) NULL,
	[LocationName] [nvarchar](100) NOT NULL,
	[ReturnInReference] [nvarchar](50) NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Inward] PRIMARY KEY CLUSTERED 
(
	[InwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Location]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationName] [nvarchar](100) NOT NULL,
	[Area] [nvarchar](100) NULL,
	[Branch] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outward]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outward](
	[OutwardId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[Quantity] [int] NULL,
	[SRONumber] [nvarchar](50) NULL,
	[LocationName] [nvarchar](100) NOT NULL,
	[Marketer] [nvarchar](50) NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Outward] PRIMARY KEY CLUSTERED 
(
	[OutwardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[ProductQuantity] [int] NULL,
	[ProductEdition] [nvarchar](20) NULL,
	[CopyrightDate] [nvarchar](20) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[OtherPhone] [nvarchar](20) NULL,
	[ContactName] [nvarchar](100) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[SellingPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[SaleInvNumber] [nvarchar](50) NULL,
	[TransactionType] [nvarchar](50) NOT NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalePayment]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePayment](
	[SalePaymentId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[SaleInvNumber] [nvarchar](50) NOT NULL,
	[SaleTotalAmount] [decimal](18, 2) NULL,
	[AmountPaid] [decimal](18, 2) NULL,
	[PaymentDetails] [nvarchar](100) NULL,
	[PaymentConfirmedBy] [nvarchar](50) NULL,
	[PaymentReference] [nvarchar](50) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_SalePayment] PRIMARY KEY CLUSTERED 
(
	[SalePaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleTotal]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleTotal](
	[SaleInvNumber] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[AmountDue] [decimal](18, 2) NULL,
	[InvoiceTreatedBy] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_SaleTotal] PRIMARY KEY CLUSTERED 
(
	[SaleInvNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockId] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[ProductISBN] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[PublisherName] [nvarchar](100) NOT NULL,
	[StockQuantity] [int] NULL,
	[SRONumber] [nvarchar](50) NULL,
	[SaleReturnNumber] [nvarchar](50) NULL,
	[LocationName] [nvarchar](100) NOT NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[Comment] [nvarchar](100) NULL,
	[Date] [date] NOT NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 06-Nov-20 9:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[AdminCode] [nvarchar](100) NULL,
	[RowCheck] [timestamp] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_LocationName] FOREIGN KEY([LocationName])
REFERENCES [dbo].[Location] ([LocationName])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_LocationName]
GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_OutwardId] FOREIGN KEY([OutwardId])
REFERENCES [dbo].[Outward] ([OutwardId])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_OutwardId]
GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_ProductISBN]
GO
ALTER TABLE [dbo].[Inward]  WITH CHECK ADD  CONSTRAINT [FK_Inward_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Inward] CHECK CONSTRAINT [FK_Inward_PublisherName]
GO
ALTER TABLE [dbo].[Outward]  WITH CHECK ADD  CONSTRAINT [FK_Outward_LocationName] FOREIGN KEY([LocationName])
REFERENCES [dbo].[Location] ([LocationName])
GO
ALTER TABLE [dbo].[Outward] CHECK CONSTRAINT [FK_Outward_LocationName]
GO
ALTER TABLE [dbo].[Outward]  WITH CHECK ADD  CONSTRAINT [FK_Outward_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Outward] CHECK CONSTRAINT [FK_Outward_ProductISBN]
GO
ALTER TABLE [dbo].[Outward]  WITH CHECK ADD  CONSTRAINT [FK_Outward_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Outward] CHECK CONSTRAINT [FK_Outward_PublisherName]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_PublisherName]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_CustomerName] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_CustomerName]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_ProductISBN]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_PublisherName]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_TransactionType] FOREIGN KEY([TransactionType])
REFERENCES [dbo].[Activity] ([TransactionType])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_TransactionType]
GO
ALTER TABLE [dbo].[SalePayment]  WITH CHECK ADD  CONSTRAINT [FK_SalePayment_CustomerName] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[SalePayment] CHECK CONSTRAINT [FK_SalePayment_CustomerName]
GO
ALTER TABLE [dbo].[SalePayment]  WITH CHECK ADD  CONSTRAINT [FK_SalePayment_SaleInvNumber] FOREIGN KEY([SaleInvNumber])
REFERENCES [dbo].[SaleTotal] ([SaleInvNumber])
GO
ALTER TABLE [dbo].[SalePayment] CHECK CONSTRAINT [FK_SalePayment_SaleInvNumber]
GO
ALTER TABLE [dbo].[SaleTotal]  WITH CHECK ADD  CONSTRAINT [FK_SaleTotal_CustomerName] FOREIGN KEY([CustomerName])
REFERENCES [dbo].[Customer] ([CustomerName])
GO
ALTER TABLE [dbo].[SaleTotal] CHECK CONSTRAINT [FK_SaleTotal_CustomerName]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_LocationName] FOREIGN KEY([LocationName])
REFERENCES [dbo].[Location] ([LocationName])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_LocationName]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ProductISBN] FOREIGN KEY([ProductISBN])
REFERENCES [dbo].[Product] ([ProductISBN])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_ProductISBN]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_PublisherName] FOREIGN KEY([PublisherName])
REFERENCES [dbo].[Publisher] ([PublisherName])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_PublisherName]
GO
USE [master]
GO
ALTER DATABASE [ChelisA] SET  READ_WRITE 
GO
