USE [master]
GO

/****** Object:  Database [FiredUp]    Script Date: 4/2/2012 2:41:05 PM ******/
CREATE DATABASE [FiredUp] 
GO

-- ALTER DATABASE [FiredUp] SET COMPATIBILITY_LEVEL = 90
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FiredUp].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO

ALTER DATABASE [FiredUp] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [FiredUp] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [FiredUp] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [FiredUp] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [FiredUp] SET ARITHABORT OFF 
GO

ALTER DATABASE [FiredUp] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [FiredUp] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [FiredUp] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [FiredUp] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [FiredUp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [FiredUp] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [FiredUp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [FiredUp] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [FiredUp] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [FiredUp] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [FiredUp] SET  ENABLE_BROKER 
GO

ALTER DATABASE [FiredUp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [FiredUp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [FiredUp] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [FiredUp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [FiredUp] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [FiredUp] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [FiredUp] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [FiredUp] SET RECOVERY FULL 
GO

ALTER DATABASE [FiredUp] SET  MULTI_USER 
GO

ALTER DATABASE [FiredUp] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO

ALTER DATABASE [FiredUp] SET DB_CHAINING OFF 
GO

ALTER DATABASE [FiredUp] SET  READ_WRITE 
GO


USE [FiredUp]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CustomerID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[StreetAddress] [varchar](50) NULL,
	[ApartmentNbr] [varchar](10) NULL,
	[City] [varchar](25) NULL,
	[StateProvince] [varchar](2) NULL,
	[ZipCode] [varchar](10) NULL,
	[Country] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMAIL]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMAIL](
	[SequenceNbr] [numeric](18, 0) NULL,
	[EMailAddress] [varchar](50) NULL,
	[FK_CustomerID] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EMPLOYEE]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLOYEE](
	[EmpID] [numeric](18, 0) NULL,
	[Name] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Initials] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[INV_LINE_ITEM]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INV_LINE_ITEM](
	[LineNbr] [numeric](18, 0) NULL,
	[Quantity] [numeric](18, 0) NULL,
	[FK_InvoiceNbr] [numeric](18, 0) NULL,
	[FK_PartNbr] [numeric](18, 0) NULL,
	[FK_StoveNbr] [numeric](18, 0) NULL,
	[ExtendedPrice] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[INVOICE]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICE](
	[InvoiceNbr] [numeric](18, 0) NULL,
	[InvoiceDt] [datetime] NULL,
	[TotalPrice] [numeric](18, 2) NULL,
	[FK_CustomerID] [numeric](18, 0) NULL,
	[FK_EmpID] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PART]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PART](
	[PartNbr] [numeric](18, 0) NULL,
	[Description] [varchar](50) NULL,
	[Cost] [numeric](18, 2) NULL,
	[SalesPrice] [numeric](18, 2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONE]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONE](
	[Type] [varchar](10) NULL,
	[PhoneNbr] [varchar](12) NULL,
	[FK_CustomerID] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PO_LINE_ITEM]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PO_LINE_ITEM](
	[FK_PONbr] [float] NULL,
	[LineNbr] [float] NULL,
	[ExtendedPrice] [money] NULL,
	[Fk_PartNbr] [smallint] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PURCHASE_ORDER]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PURCHASE_ORDER](
	[PONbr] [numeric](18, 0) NULL,
	[OrderDt] [datetime] NULL,
	[Terms] [varchar](15) NULL,
	[FK_SupplierNbr] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[REPAIR_LINE_ITEM]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPAIR_LINE_ITEM](
	[FK_RepairNbr] [smallint] NULL,
	[LineNbr] [smallint] NULL,
	[FK_PartNbr] [smallint] NULL,
	[Quantity] [smallint] NULL,
	[ExtendedPrice] [money] NULL,
	[Labor Charge] [numeric](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[STOVE]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOVE](
	[SerialNumber] [int] NOT NULL,
	[Type] [char](15) NOT NULL,
	[Version] [char](15) NULL,
	[DateOfManufacture] [smalldatetime] NULL,
	[Color] [varchar](12) NULL,
	[FK_EmpId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOVE_REPAIR]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STOVE_REPAIR](
	[RepairNbr] [int] NOT NULL,
	[FK_StoveNbr] [int] NOT NULL,
	[RepairDt] [smalldatetime] NOT NULL,
	[Description] [varchar](500) NULL,
	[Cost] [numeric](7, 2) NULL,
	[FK_CustomerID] [int] NOT NULL,
	[FK_EmpID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RepairNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[STOVE_TYPE]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STOVE_TYPE](
	[Type] [nvarchar](15) NULL,
	[Version] [nvarchar](15) NULL,
	[Price] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SUPPLIER]    Script Date: 4/2/2012 2:40:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUPPLIER](
	[SupplierNbr] [numeric](18, 0) NULL,
	[Name] [varchar](50) NULL,
	[SalesRep] [varchar](50) NULL,
	[RepPhoneNumber] [varchar](50) NULL,
	[CSPhoneNumber] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (101, N'David Jones', N'7 West Pointe Drive', NULL, N'Reno', N'NV', N'72145', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (102, N'Bruce Leonard', N'145 N. Parkstone Blvd', NULL, N'Palo Alto', N'CA', N'96222', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (103, N'Steve Wicks', N'133 Ponderosa Hwy SE', NULL, N'Salem', N'OR', N'97852', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (104, N'Jenna Tucker', N'892 Tanya Green Way', N'22', N'Hartford', N'CN', N'25123', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (105, N'Elaine Anderson', N'2119 W. Burnside', NULL, N'Portland', N'OR', N'97204', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (106, N'Bob Blessing', N'113 Terwilliger Blvd', NULL, N'Portland', N'OR', N'97205', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (111, N'James White', N'214 W Main St', NULL, N'Beaverton', N'OR', N'97005', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (112, N'Wilbur Sargent', N'321 Sunset Ave', NULL, N'Klamath Falls', N'OR', N'97587', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (113, N'William King', N'78883 Hwy 38', N'2', N'Sacramento', N'CA', N'94887', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (114, N'Elizabeth Smith', N'29002 Belmont Way', NULL, N'Boise', N'ID', N'87777', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (115, N'Mike Green', N'19432 Gunther Drive', NULL, N'Eureka', N'CA', N'94687', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (116, N'Karen Black', N'8930 White Flower Street', NULL, N'Billings', N'MT', N'72145', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (117, N'Kurt Smith', N'1414 Dogwood Drive', N'35', N'Bend', N'OR', N'97568', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (118, N'Kara White', N'789 Blaine St', NULL, N'Pendleton ', N'OR', N'97258', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (119, N'Benjamin Rosewood', N'888 Catherine St', NULL, N'Tukwila', N'WA', N'98214', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (120, N'Max Wickland', N'235 Stanley Dr', NULL, N'Olympia', N'WA', N'98536', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (121, N'Donna Penwhite', N'1245 W Bench Rd', NULL, N'Idaho Falls', N'ID', N'87523', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (122, N'Joyce Waters', N'1654 Greenville St', NULL, N'Norfolk', N'VA', N'21487', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (123, N'Blaine Brown', N'22 West Saphire St', NULL, N'Vancouver', N'BC', N'26487', N'CAN')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (124, N'Heather Burnford', N'3457 Victoria Drive', NULL, N'Richmond ', N'BC', N'26498', N'CAN')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (125, N'Gary Bostwick', N'24650 White Dogwood Rd', N'17', N'Helena', N'MT', N'72169', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (126, N'Kyle Dustbin', N'1717 Terwilliger Ave', NULL, N'Canton', N'OH', N'36974', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (127, N'Becky Williams', N'594 Oatgreenville Rd', NULL, N'Phoenix', N'AZ', N'71456', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (128, N'Terry Burns', N'2265 Broche Way', NULL, N'Raliegh', N'NC', N'31257', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (129, N'John Coombs', N'111 Torchlight Ave', N'11', N'San Francisco', N'CA', N'94258', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (130, N'Orenco Mountain Shop', N'15647 Skyline Road', NULL, N'Boulder', N'CO', N'52147', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (131, N'Mid-Town Hiker Supply', N'123 33rd', NULL, N'New York', N'NY', N'02365', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (132, N'Sierra Outfitters', N'5687 Grayson Blvd', NULL, N'Burbank', N'CA', N'78612', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (133, N'Jerome Bentis', N'666 1 St NW', NULL, N'Calgary', N'AB', N'Y1A4X8', N'CAN')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (134, N'Sarah Covington', N'33 Cape Drive', N'22', N'Beddick', N'NS', N'P3D5N9', N'CAN')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (135, N'Wilderness Outfitters', N'23 Boxwood Crescent', NULL, N'White Horse', N'YT', N'Y1A4X8', N'CAN')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (136, N'Yogi Berra', N'1 Yankee Place', N'2', N'New York', N'NY', N'12345', N'USA')
GO
INSERT [dbo].[CUSTOMER] ([CustomerID], [Name], [StreetAddress], [ApartmentNbr], [City], [StateProvince], [ZipCode], [Country]) VALUES (137, N'Casey Stengal', N'1 Yankee Place', N'3', N'New York', N'NY', N'12345', N'USA')
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(3 AS Numeric(18, 0)), N'kelly@whitehorsewilderness.com', CAST(135 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'jwhite837@aol.com', CAST(111 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(2 AS Numeric(18, 0)), N'sarge@hotmail.com', CAST(112 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(3 AS Numeric(18, 0)), N'billking@myisp.com', CAST(113 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(4 AS Numeric(18, 0)), N'lizzie33@aol.com', CAST(114 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(5 AS Numeric(18, 0)), N'bigmike@hotmail.com', CAST(115 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(6 AS Numeric(18, 0)), N'kblack@myisp.com', CAST(116 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(7 AS Numeric(18, 0)), N'smitty@aol.com', CAST(117 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(8 AS Numeric(18, 0)), N'krwhite@hotmail.com', CAST(118 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(9 AS Numeric(18, 0)), N'rosie@myisp.com', CAST(119 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(10 AS Numeric(18, 0)), N'mrwickland@aol.com', CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(11 AS Numeric(18, 0)), N'djones222@aol.com', CAST(121 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(12 AS Numeric(18, 0)), N'waterwoman@hotmail.com', CAST(122 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(13 AS Numeric(18, 0)), N'brownie@myisp.com', CAST(123 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(14 AS Numeric(18, 0)), N'hkburnford@aol.com', CAST(124 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(15 AS Numeric(18, 0)), N'bostwickgary@hotmail.com', CAST(125 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(16 AS Numeric(18, 0)), N'ktrash@myisp.com', CAST(126 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(17 AS Numeric(18, 0)), N'beckster@aol.com', CAST(127 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(18 AS Numeric(18, 0)), N'terryburns@hotmail.com', CAST(128 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(19 AS Numeric(18, 0)), N'coombs@myisp.com', CAST(129 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(20 AS Numeric(18, 0)), N'blainebrown@ibm.com', CAST(123 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(21 AS Numeric(18, 0)), N'donnajones@compaq.com', CAST(121 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(22 AS Numeric(18, 0)), N'greenmichael@weyerhauser.com', CAST(115 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'BradleyJ@orencomtn.com', CAST(130 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(2 AS Numeric(18, 0)), N'BickerslyW@orencomtn.com', CAST(130 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'mike@midtownhiker.com', CAST(131 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(2 AS Numeric(18, 0)), N'joe@midtownhiker.com', CAST(131 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'sally@sierraoutfitters.com', CAST(132 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(2 AS Numeric(18, 0)), N'betty@sierraoutfitter.com', CAST(132 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'jbent@cowboy.com', CAST(133 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'scovington@aol.com', CAST(134 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(1 AS Numeric(18, 0)), N'peter@whitehorsewilderness.com', CAST(135 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMAIL] ([SequenceNbr], [EMailAddress], [FK_CustomerID]) VALUES (CAST(2 AS Numeric(18, 0)), N'kim@whitehorsewilderness.com', CAST(135 AS Numeric(18, 0)))
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(1 AS Numeric(18, 0)), N'Curt Robards', N'Owner', N'cr')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(2 AS Numeric(18, 0)), N'Julie Robard', N'Owner', N'jr')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(3 AS Numeric(18, 0)), N'Kim Greenley', N'Bookkeeper', N'kg')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(4 AS Numeric(18, 0)), N'Fred Bailey', N'Sales Associate', N'fb')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(5 AS Numeric(18, 0)), N'Tim Brown', N'Sales Associate', N'tb')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(6 AS Numeric(18, 0)), N'Jennifer Mazzelli', N'Sales Associate', N'jm')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(7 AS Numeric(18, 0)), N'Theresa Baker', N'Sales Associate', N'tb')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(8 AS Numeric(18, 0)), N'Mike Wentland', N'Technician', N'mw')
GO
INSERT [dbo].[EMPLOYEE] ([EmpID], [Name], [Title], [Initials]) VALUES (CAST(9 AS Numeric(18, 0)), N'Bill Crowley', N'Technician', N'bc')
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(201 AS Numeric(18, 0)), CAST(577 AS Numeric(18, 0)), NULL, CAST(7.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(201 AS Numeric(18, 0)), CAST(578 AS Numeric(18, 0)), NULL, CAST(8.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(201 AS Numeric(18, 0)), CAST(579 AS Numeric(18, 0)), NULL, CAST(8.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), CAST(202 AS Numeric(18, 0)), CAST(580 AS Numeric(18, 0)), NULL, CAST(3.27 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(202 AS Numeric(18, 0)), NULL, CAST(2 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(33 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(34 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(229 AS Numeric(18, 0)), NULL, CAST(60 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(229 AS Numeric(18, 0)), NULL, CAST(61 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(229 AS Numeric(18, 0)), NULL, CAST(62 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(230 AS Numeric(18, 0)), NULL, CAST(67 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(230 AS Numeric(18, 0)), NULL, CAST(68 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(230 AS Numeric(18, 0)), NULL, CAST(69 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(230 AS Numeric(18, 0)), NULL, CAST(66 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(231 AS Numeric(18, 0)), NULL, CAST(74 AS Numeric(18, 0)), CAST(135.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(232 AS Numeric(18, 0)), NULL, CAST(76 AS Numeric(18, 0)), CAST(135.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(35 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(36 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(37 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(47 AS Numeric(18, 0)), CAST(65.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(48 AS Numeric(18, 0)), CAST(75.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(49 AS Numeric(18, 0)), CAST(75.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(63 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(64 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(78 AS Numeric(18, 0)), CAST(145.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(233 AS Numeric(18, 0)), NULL, CAST(79 AS Numeric(18, 0)), CAST(150.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(234 AS Numeric(18, 0)), NULL, CAST(77 AS Numeric(18, 0)), CAST(145.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(234 AS Numeric(18, 0)), NULL, CAST(57 AS Numeric(18, 0)), CAST(85.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(235 AS Numeric(18, 0)), NULL, CAST(38 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(236 AS Numeric(18, 0)), NULL, CAST(71 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(211 AS Numeric(18, 0)), CAST(588 AS Numeric(18, 0)), NULL, CAST(1.29 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(221 AS Numeric(18, 0)), CAST(589 AS Numeric(18, 0)), NULL, CAST(11.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(236 AS Numeric(18, 0)), CAST(589 AS Numeric(18, 0)), NULL, CAST(23.18 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(203 AS Numeric(18, 0)), NULL, CAST(1 AS Numeric(18, 0)), CAST(110.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(203 AS Numeric(18, 0)), NULL, CAST(8 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(204 AS Numeric(18, 0)), NULL, CAST(17 AS Numeric(18, 0)), CAST(150.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(205 AS Numeric(18, 0)), NULL, CAST(12 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(206 AS Numeric(18, 0)), CAST(579 AS Numeric(18, 0)), NULL, CAST(17.18 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), CAST(206 AS Numeric(18, 0)), CAST(583 AS Numeric(18, 0)), NULL, CAST(1.98 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), CAST(206 AS Numeric(18, 0)), CAST(587 AS Numeric(18, 0)), NULL, CAST(8.95 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(207 AS Numeric(18, 0)), NULL, CAST(3 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(208 AS Numeric(18, 0)), NULL, CAST(4 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(208 AS Numeric(18, 0)), NULL, CAST(5 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(209 AS Numeric(18, 0)), NULL, CAST(6 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(210 AS Numeric(18, 0)), NULL, CAST(7 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(211 AS Numeric(18, 0)), NULL, CAST(9 AS Numeric(18, 0)), CAST(65.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(212 AS Numeric(18, 0)), NULL, CAST(13 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(212 AS Numeric(18, 0)), NULL, CAST(15 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(213 AS Numeric(18, 0)), NULL, CAST(10 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(214 AS Numeric(18, 0)), NULL, CAST(11 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(215 AS Numeric(18, 0)), NULL, CAST(14 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(216 AS Numeric(18, 0)), NULL, CAST(16 AS Numeric(18, 0)), CAST(110.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(217 AS Numeric(18, 0)), NULL, CAST(18 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(218 AS Numeric(18, 0)), NULL, CAST(18 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(219 AS Numeric(18, 0)), NULL, CAST(19 AS Numeric(18, 0)), CAST(110.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(220 AS Numeric(18, 0)), NULL, CAST(20 AS Numeric(18, 0)), CAST(75.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(221 AS Numeric(18, 0)), NULL, CAST(22 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(222 AS Numeric(18, 0)), NULL, CAST(23 AS Numeric(18, 0)), CAST(100.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(222 AS Numeric(18, 0)), NULL, CAST(24 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(222 AS Numeric(18, 0)), NULL, CAST(21 AS Numeric(18, 0)), CAST(90.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(223 AS Numeric(18, 0)), NULL, CAST(25 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(225 AS Numeric(18, 0)), NULL, CAST(26 AS Numeric(18, 0)), CAST(75.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(226 AS Numeric(18, 0)), NULL, CAST(26 AS Numeric(18, 0)), CAST(75.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(227 AS Numeric(18, 0)), NULL, CAST(28 AS Numeric(18, 0)), CAST(85.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(29 AS Numeric(18, 0)), CAST(75.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(42 AS Numeric(18, 0)), CAST(65.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(43 AS Numeric(18, 0)), CAST(65.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(27 AS Numeric(18, 0)), CAST(120.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(30 AS Numeric(18, 0)), CAST(135.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(31 AS Numeric(18, 0)), CAST(125.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INV_LINE_ITEM] ([LineNbr], [Quantity], [FK_InvoiceNbr], [FK_PartNbr], [FK_StoveNbr], [ExtendedPrice]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), CAST(228 AS Numeric(18, 0)), NULL, CAST(32 AS Numeric(18, 0)), CAST(110.00 AS Numeric(18, 2)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(201 AS Numeric(18, 0)), CAST(0x0000909D00000000 AS DateTime), CAST(24.57 AS Numeric(18, 2)), CAST(111 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(207 AS Numeric(18, 0)), CAST(0x000091EB00000000 AS DateTime), CAST(90.00 AS Numeric(18, 2)), CAST(101 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(203 AS Numeric(18, 0)), CAST(0x000091A700000000 AS DateTime), CAST(210.00 AS Numeric(18, 2)), CAST(125 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(233 AS Numeric(18, 0)), CAST(0x000091FD00000000 AS DateTime), CAST(1030.00 AS Numeric(18, 2)), CAST(118 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(202 AS Numeric(18, 0)), CAST(0x000091A700000000 AS DateTime), CAST(123.27 AS Numeric(18, 2)), CAST(111 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(204 AS Numeric(18, 0)), CAST(0x000091A700000000 AS DateTime), CAST(150.00 AS Numeric(18, 2)), CAST(123 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(205 AS Numeric(18, 0)), CAST(0x000091A700000000 AS DateTime), CAST(125.00 AS Numeric(18, 2)), CAST(119 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(206 AS Numeric(18, 0)), CAST(0x000091A800000000 AS DateTime), CAST(28.11 AS Numeric(18, 2)), CAST(125 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(208 AS Numeric(18, 0)), CAST(0x000091EC00000000 AS DateTime), CAST(210.00 AS Numeric(18, 2)), CAST(102 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(209 AS Numeric(18, 0)), CAST(0x000091EC00000000 AS DateTime), CAST(100.00 AS Numeric(18, 2)), CAST(103 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(210 AS Numeric(18, 0)), CAST(0x000091EC00000000 AS DateTime), CAST(125.00 AS Numeric(18, 2)), CAST(104 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(211 AS Numeric(18, 0)), CAST(0x000091EE00000000 AS DateTime), CAST(66.29 AS Numeric(18, 2)), CAST(105 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(212 AS Numeric(18, 0)), CAST(0x000091EE00000000 AS DateTime), CAST(210.00 AS Numeric(18, 2)), CAST(106 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(213 AS Numeric(18, 0)), CAST(0x000091EE00000000 AS DateTime), CAST(120.00 AS Numeric(18, 2)), CAST(112 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(214 AS Numeric(18, 0)), CAST(0x000091EE00000000 AS DateTime), CAST(100.00 AS Numeric(18, 2)), CAST(113 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(215 AS Numeric(18, 0)), CAST(0x000091EF00000000 AS DateTime), CAST(100.00 AS Numeric(18, 2)), CAST(114 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(216 AS Numeric(18, 0)), CAST(0x000091EF00000000 AS DateTime), CAST(110.00 AS Numeric(18, 2)), CAST(114 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(217 AS Numeric(18, 0)), CAST(0x000091EF00000000 AS DateTime), CAST(90.00 AS Numeric(18, 2)), CAST(117 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(218 AS Numeric(18, 0)), CAST(0x000091EF00000000 AS DateTime), CAST(90.00 AS Numeric(18, 2)), CAST(120 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(219 AS Numeric(18, 0)), CAST(0x000091EF00000000 AS DateTime), CAST(110.00 AS Numeric(18, 2)), CAST(118 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(220 AS Numeric(18, 0)), CAST(0x000091EF00000000 AS DateTime), CAST(75.00 AS Numeric(18, 2)), CAST(121 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(221 AS Numeric(18, 0)), CAST(0x000091F000000000 AS DateTime), CAST(131.59 AS Numeric(18, 2)), CAST(122 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(222 AS Numeric(18, 0)), CAST(0x000091F000000000 AS DateTime), CAST(280.00 AS Numeric(18, 2)), CAST(124 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(223 AS Numeric(18, 0)), CAST(0x000091F000000000 AS DateTime), CAST(120.00 AS Numeric(18, 2)), CAST(126 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(225 AS Numeric(18, 0)), CAST(0x000091F000000000 AS DateTime), CAST(75.00 AS Numeric(18, 2)), CAST(127 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(226 AS Numeric(18, 0)), CAST(0x000091F000000000 AS DateTime), CAST(75.00 AS Numeric(18, 2)), CAST(128 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(227 AS Numeric(18, 0)), CAST(0x000091F100000000 AS DateTime), CAST(85.00 AS Numeric(18, 2)), CAST(129 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(228 AS Numeric(18, 0)), CAST(0x000091F300000000 AS DateTime), CAST(875.00 AS Numeric(18, 2)), CAST(130 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(229 AS Numeric(18, 0)), CAST(0x000091F400000000 AS DateTime), CAST(360.00 AS Numeric(18, 2)), CAST(131 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(230 AS Numeric(18, 0)), CAST(0x000091F600000000 AS DateTime), CAST(495.00 AS Numeric(18, 2)), CAST(132 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(231 AS Numeric(18, 0)), CAST(0x000091F800000000 AS DateTime), CAST(135.00 AS Numeric(18, 2)), CAST(133 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(232 AS Numeric(18, 0)), CAST(0x000091F900000000 AS DateTime), CAST(135.00 AS Numeric(18, 2)), CAST(134 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(234 AS Numeric(18, 0)), CAST(0x000091FF00000000 AS DateTime), CAST(230.00 AS Numeric(18, 2)), CAST(117 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(235 AS Numeric(18, 0)), CAST(0x000091FF00000000 AS DateTime), CAST(100.00 AS Numeric(18, 2)), CAST(128 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[INVOICE] ([InvoiceNbr], [InvoiceDt], [TotalPrice], [FK_CustomerID], [FK_EmpID]) VALUES (CAST(236 AS Numeric(18, 0)), CAST(0x0000920100000000 AS DateTime), CAST(148.18 AS Numeric(18, 2)), CAST(125 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(567 AS Numeric(18, 0)), N'Left Flange', CAST(0.59 AS Numeric(18, 2)), CAST(1.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(568 AS Numeric(18, 0)), N'Right Flange', CAST(0.66 AS Numeric(18, 2)), CAST(1.89 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(569 AS Numeric(18, 0)), N'Style A Burner', CAST(5.77 AS Numeric(18, 2)), CAST(10.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(570 AS Numeric(18, 0)), N'Style B Burner', CAST(6.12 AS Numeric(18, 2)), CAST(12.89 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(571 AS Numeric(18, 0)), N'Leg A', CAST(0.88 AS Numeric(18, 2)), CAST(1.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(572 AS Numeric(18, 0)), N'Leg B', CAST(0.94 AS Numeric(18, 2)), CAST(2.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(573 AS Numeric(18, 0)), N'Cover Piece', CAST(0.74 AS Numeric(18, 2)), CAST(1.65 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(574 AS Numeric(18, 0)), N'Regulator', CAST(2.09 AS Numeric(18, 2)), CAST(4.49 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(575 AS Numeric(18, 0)), N'Grill A', CAST(1.87 AS Numeric(18, 2)), CAST(3.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(576 AS Numeric(18, 0)), N'Grill B', CAST(1.96 AS Numeric(18, 2)), CAST(4.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(577 AS Numeric(18, 0)), N'Tank A', CAST(3.55 AS Numeric(18, 2)), CAST(7.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(578 AS Numeric(18, 0)), N'Tank B', CAST(3.65 AS Numeric(18, 2)), CAST(8.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(579 AS Numeric(18, 0)), N'Fuel Valve', CAST(3.58 AS Numeric(18, 2)), CAST(8.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(580 AS Numeric(18, 0)), N'Widget', CAST(0.44 AS Numeric(18, 2)), CAST(1.09 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(581 AS Numeric(18, 0)), N'Hard Case', CAST(3.66 AS Numeric(18, 2)), CAST(9.69 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(582 AS Numeric(18, 0)), N'Cap', CAST(0.22 AS Numeric(18, 2)), CAST(0.49 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(583 AS Numeric(18, 0)), N'Connection Strap', CAST(0.44 AS Numeric(18, 2)), CAST(0.99 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(584 AS Numeric(18, 0)), N'Widget B', CAST(0.57 AS Numeric(18, 2)), CAST(1.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(585 AS Numeric(18, 0)), N'Widget C', CAST(0.58 AS Numeric(18, 2)), CAST(1.25 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(586 AS Numeric(18, 0)), N'Wingnut', CAST(0.11 AS Numeric(18, 2)), CAST(0.19 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(587 AS Numeric(18, 0)), N'Tension Rod', CAST(0.89 AS Numeric(18, 2)), CAST(1.79 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(588 AS Numeric(18, 0)), N'Whatsit', CAST(0.64 AS Numeric(18, 2)), CAST(1.29 AS Numeric(18, 2)))
GO
INSERT [dbo].[PART] ([PartNbr], [Description], [Cost], [SalesPrice]) VALUES (CAST(589 AS Numeric(18, 0)), N'Flexi Case', CAST(4.19 AS Numeric(18, 2)), CAST(11.59 AS Numeric(18, 2)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'111-264-8797', CAST(111 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'324-423-7891', CAST(112 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'456-871-1326', CAST(113 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'912-451-7813', CAST(114 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'215-456-7841', CAST(115 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'641-456-7813', CAST(116 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'548-541-4513', CAST(117 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'941-223-5744', CAST(118 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'457-632-4561', CAST(119 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'506-451-8521', CAST(120 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'557-551-6214', CAST(121 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'224-601-1002', CAST(122 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'102-489-0140', CAST(123 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'145-123-6116', CAST(124 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'587-325-9130', CAST(125 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'231-354-6458', CAST(126 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'411-327-3010', CAST(127 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'714-325-3265', CAST(128 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'551-361-0005', CAST(129 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'223-541-6304', CAST(114 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'224-514-7510', CAST(117 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'365-489-2567', CAST(122 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'C', N'369-364-1025', CAST(126 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'C', N'455-654-8701', CAST(112 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'C', N'229-541-0320', CAST(114 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'487-835-1657', CAST(130 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'487-835-1658', CAST(130 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'158-454-4896', CAST(131 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'158-454-4897', CAST(131 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'652-845-1322', CAST(132 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'652-845-1233', CAST(132 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'552-541-5321', CAST(133 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'721-862-8652', CAST(134 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'P', N'563-561-5612', CAST(135 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'F', N'563-561-5613', CAST(135 AS Numeric(18, 0)))
GO
INSERT [dbo].[PHONE] ([Type], [PhoneNbr], [FK_CustomerID]) VALUES (N'C', N'563-561-5614', CAST(135 AS Numeric(18, 0)))
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (601, 1, 14.7500, 567, 25)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (601, 2, 16.5000, 568, 25)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (601, 3, 57.7000, 569, 10)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (602, 1, 33.0000, 580, 75)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (602, 2, 366.0000, 581, 100)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (603, 1, 15.4000, 582, 70)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (604, 1, 19.9500, 584, 35)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (604, 2, 13.9200, 585, 24)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (604, 3, 16.5000, 586, 150)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (604, 4, 44.5000, 587, 50)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (605, 1, 106.5600, 573, 144)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (605, 2, 343.6800, 579, 96)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (606, 1, 61.2000, 570, 10)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (606, 2, 80.7800, 569, 14)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (607, 1, 42.6000, 577, 12)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (607, 2, 87.6000, 578, 24)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (607, 3, 214.8000, 579, 60)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (607, 4, 37.4000, 575, 20)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (607, 5, 39.2000, 576, 20)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (608, 1, 161.1000, 579, 45)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (609, 1, 63.3600, 583, 144)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (609, 2, 31.6800, 582, 144)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (609, 3, 63.3600, 571, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (610, 1, 47.0000, 572, 50)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (610, 2, 44.4000, 573, 60)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (610, 3, 22.0000, 580, 50)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (610, 4, 55.0000, 586, 500)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (611, 1, 22.2500, 587, 25)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (611, 2, 207.7200, 569, 36)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (611, 3, 220.3200, 570, 36)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (612, 1, 8.8500, 567, 15)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (612, 2, 9.9000, 568, 15)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (612, 3, 26.4000, 571, 30)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (612, 4, 28.2000, 572, 30)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (613, 1, 73.4400, 570, 12)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (613, 2, 42.9600, 579, 12)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (613, 3, 25.0800, 574, 12)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (614, 1, 114.0000, 584, 200)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (614, 2, 55.0000, 586, 500)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (614, 3, 110.0000, 580, 250)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (614, 4, 87.0000, 585, 150)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (615, 1, 32.0000, 588, 50)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (615, 2, 732.0000, 581, 200)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (615, 3, 1047.5000, 589, 250)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (615, 4, 11.0000, 586, 100)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (616, 1, 274.5000, 581, 75)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (616, 2, 515.5200, 579, 144)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (616, 3, 269.2800, 575, 144)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (616, 4, 31.6800, 582, 144)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (617, 1, 7.9200, 586, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (617, 2, 41.0400, 584, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (617, 3, 64.0800, 587, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (617, 4, 42.4800, 567, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (617, 5, 301.6800, 589, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (617, 6, 15.8400, 582, 72)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (618, 1, 88.0000, 571, 100)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (618, 2, 94.0000, 572, 100)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (618, 3, 355.0000, 577, 100)
GO
INSERT [dbo].[PO_LINE_ITEM] ([FK_PONbr], [LineNbr], [ExtendedPrice], [Fk_PartNbr], [Quantity]) VALUES (618, 4, 365.0000, 578, 100)
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(601 AS Numeric(18, 0)), CAST(0x0000906000000000 AS DateTime), N'1-10 Net 30', CAST(801 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(602 AS Numeric(18, 0)), CAST(0x0000906000000000 AS DateTime), N'Net 30', CAST(801 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(603 AS Numeric(18, 0)), CAST(0x0000906300000000 AS DateTime), N'2-10 Net 30', CAST(801 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(604 AS Numeric(18, 0)), CAST(0x0000906800000000 AS DateTime), N'Net 45', CAST(802 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(605 AS Numeric(18, 0)), CAST(0x0000906800000000 AS DateTime), N'1-10 Net 30', CAST(803 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(606 AS Numeric(18, 0)), CAST(0x0000907E00000000 AS DateTime), N'Net 30', CAST(801 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(607 AS Numeric(18, 0)), CAST(0x0000908900000000 AS DateTime), N'Net 30', CAST(804 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(608 AS Numeric(18, 0)), CAST(0x0000908A00000000 AS DateTime), N'1-10 Net 30', CAST(802 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(609 AS Numeric(18, 0)), CAST(0x0000908F00000000 AS DateTime), N'Net 30', CAST(803 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(610 AS Numeric(18, 0)), CAST(0x000090A400000000 AS DateTime), N'Net 30', CAST(801 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(611 AS Numeric(18, 0)), CAST(0x000090A500000000 AS DateTime), N'Net 45', CAST(804 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(612 AS Numeric(18, 0)), CAST(0x000090A600000000 AS DateTime), N'1-10 Net 30', CAST(802 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(613 AS Numeric(18, 0)), CAST(0x000090A700000000 AS DateTime), N'Net 30', CAST(803 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(614 AS Numeric(18, 0)), CAST(0x000090A800000000 AS DateTime), N'Net 30', CAST(802 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(615 AS Numeric(18, 0)), CAST(0x0000915400000000 AS DateTime), N'Net 30', CAST(805 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(616 AS Numeric(18, 0)), CAST(0x0000917300000000 AS DateTime), N'Net 60', CAST(806 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(617 AS Numeric(18, 0)), CAST(0x0000917C00000000 AS DateTime), N'Net 30', CAST(807 AS Numeric(18, 0)))
GO
INSERT [dbo].[PURCHASE_ORDER] ([PONbr], [OrderDt], [Terms], [FK_SupplierNbr]) VALUES (CAST(618 AS Numeric(18, 0)), CAST(0x0000919500000000 AS DateTime), N'Net 45', CAST(808 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1121, 1, 568, 1, 1.8900, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1121, 2, 0, 0, 30.0000, CAST(30 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1122, 1, 570, 1, 12.8900, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1122, 2, 0, 0, 40.0000, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1123, 1, 579, 1, 8.5900, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1123, 2, 0, 0, 25.0000, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1124, 1, 586, 1, 0.1900, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1124, 2, 580, 2, 2.1800, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1124, 3, 575, 1, 11.9700, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1124, 4, 0, 0, 36.0000, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1125, 1, 574, 1, 4.4900, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1126, 1, 574, 1, 4.4900, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1126, 2, 588, 2, 2.5800, CAST(0 AS Numeric(18, 0)))
GO
INSERT [dbo].[REPAIR_LINE_ITEM] ([FK_RepairNbr], [LineNbr], [FK_PartNbr], [Quantity], [ExtendedPrice], [Labor Charge]) VALUES (1126, 3, 0, NULL, NULL, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (1, N'FiredNow       ', N'3              ', CAST(0x909B0000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (2, N'FiredAlways    ', N'1              ', CAST(0x909D0000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (3, N'FiredNow       ', N'1              ', CAST(0x90A00000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (4, N'FiredNow       ', N'1              ', CAST(0x90A00000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (5, N'FiredAlways    ', N'1              ', CAST(0x8F380000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (6, N'FiredNow       ', N'2              ', CAST(0x90C80000 AS SmallDateTime), N'RED', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (7, N'FiredAlways    ', N'2              ', CAST(0x90A00000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (8, N'FiredNow       ', N'2              ', CAST(0x90CD0000 AS SmallDateTime), N'BLUE', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (9, N'FiredAtCamp    ', N'1              ', CAST(0x90CD0000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (10, N'FiredAlways    ', N'1              ', CAST(0x8F650000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (11, N'FiredNow       ', N'2              ', CAST(0x91040000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (12, N'FiredAlways    ', N'2              ', CAST(0x91060000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (13, N'FiredNow       ', N'1              ', CAST(0x91090000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (14, N'FiredNow       ', N'2              ', CAST(0x91090000 AS SmallDateTime), N'BLUE', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (15, N'FiredAlways    ', N'1              ', CAST(0x8FA10000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (16, N'FiredNow       ', N'3              ', CAST(0x914F0000 AS SmallDateTime), N'BLUE', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (17, N'FiredAlways    ', N'5              ', CAST(0x91510000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (18, N'FiredNow       ', N'1              ', CAST(0x91540000 AS SmallDateTime), N'BLUE', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (19, N'FiredNow       ', N'3              ', CAST(0x91540000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (20, N'FiredAtCamp    ', N'2              ', CAST(0x8FEC0000 AS SmallDateTime), N'GRAY', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (21, N'FiredNow       ', N'1              ', CAST(0x919C0000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (22, N'FiredAlways    ', N'1              ', CAST(0x91860000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (23, N'FiredNow       ', N'2              ', CAST(0x91890000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (24, N'FiredNow       ', N'1              ', CAST(0x91890000 AS SmallDateTime), N'GREEN', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (25, N'FiredAlways    ', N'1              ', CAST(0x918E0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (26, N'FiredAtCamp    ', N'2              ', CAST(0x91900000 AS SmallDateTime), N'GRAY', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (27, N'FiredAlways    ', N'1              ', CAST(0x91900000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (28, N'FiredAtCamp    ', N'3              ', CAST(0x91910000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (29, N'FiredAtCamp    ', N'2              ', CAST(0x91910000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (30, N'FiredAlways    ', N'3              ', CAST(0x91920000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (31, N'FiredAlways    ', N'2              ', CAST(0x91930000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (32, N'FiredNow       ', N'3              ', CAST(0x91950000 AS SmallDateTime), N'BLUE', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (33, N'FiredNow       ', N'1              ', CAST(0x91980000 AS SmallDateTime), N'BLUE', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (34, N'FiredNow       ', N'1              ', CAST(0x91980000 AS SmallDateTime), N'BLUE', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (35, N'FiredNow       ', N'1              ', CAST(0x91980000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (36, N'FiredNow       ', N'1              ', CAST(0x91980000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (37, N'FiredNow       ', N'2              ', CAST(0x91980000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (38, N'FiredNow       ', N'2              ', CAST(0x91980000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (39, N'FiredNow       ', N'2              ', CAST(0x91980000 AS SmallDateTime), N'GREEN', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (40, N'FiredNow       ', N'3              ', CAST(0x91980000 AS SmallDateTime), N'RED', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (41, N'FiredNow       ', N'3              ', CAST(0x91980000 AS SmallDateTime), N'BLUE', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (42, N'FiredAtCamp    ', N'1              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (43, N'FiredAtCamp    ', N'1              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (44, N'FiredAtCamp    ', N'1              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (45, N'FiredAtCamp    ', N'1              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (46, N'FiredAtCamp    ', N'1              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (47, N'FiredAtCamp    ', N'1              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (48, N'FiredAtCamp    ', N'2              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (49, N'FiredAtCamp    ', N'2              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (50, N'FiredAtCamp    ', N'2              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (51, N'FiredAtCamp    ', N'2              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (52, N'FiredAtCamp    ', N'2              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (53, N'FiredAtCamp    ', N'2              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (54, N'FiredAtCamp    ', N'3              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (55, N'FiredAtCamp    ', N'3              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (56, N'FiredAtCamp    ', N'3              ', CAST(0x91990000 AS SmallDateTime), N'GRAY', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (57, N'FiredAtCamp    ', N'3              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (58, N'FiredAtCamp    ', N'3              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (59, N'FiredAtCamp    ', N'3              ', CAST(0x91990000 AS SmallDateTime), N'BLACK', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (60, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (61, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (62, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (63, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (64, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (65, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (66, N'FiredAlways    ', N'1              ', CAST(0x919A0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (67, N'FiredAlways    ', N'2              ', CAST(0x919A0000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (68, N'FiredAlways    ', N'2              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (69, N'FiredAlways    ', N'2              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (70, N'FiredAlways    ', N'2              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (71, N'FiredAlways    ', N'2              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (72, N'FiredAlways    ', N'2              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (73, N'FiredAlways    ', N'3              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (74, N'FiredAlways    ', N'3              ', CAST(0x919C0000 AS SmallDateTime), N'SILVER', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (75, N'FiredAlways    ', N'3              ', CAST(0x919C0000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (76, N'FiredAlways    ', N'3              ', CAST(0x919C0000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (77, N'FiredAlways    ', N'4              ', CAST(0x919C0000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (78, N'FiredAlways    ', N'4              ', CAST(0x919C0000 AS SmallDateTime), N'GOLD', 9)
GO
INSERT [dbo].[STOVE] ([SerialNumber], [Type], [Version], [DateOfManufacture], [Color], [FK_EmpId]) VALUES (79, N'FiredAlways    ', N'5              ', CAST(0x919C0000 AS SmallDateTime), N'GOLD', 8)
GO
INSERT [dbo].[STOVE_REPAIR] ([RepairNbr], [FK_StoveNbr], [RepairDt], [Description], [Cost], [FK_CustomerID], [FK_EmpID]) VALUES (1121, 3, CAST(0x92220000 AS SmallDateTime), N'Broken flange', CAST(30.88 AS Numeric(7, 2)), 101, 8)
GO
INSERT [dbo].[STOVE_REPAIR] ([RepairNbr], [FK_StoveNbr], [RepairDt], [Description], [Cost], [FK_CustomerID], [FK_EmpID]) VALUES (1122, 7, CAST(0x92280000 AS SmallDateTime), N'Burner won''t light', CAST(53.99 AS Numeric(7, 2)), 104, 9)
GO
INSERT [dbo].[STOVE_REPAIR] ([RepairNbr], [FK_StoveNbr], [RepairDt], [Description], [Cost], [FK_CustomerID], [FK_EmpID]) VALUES (1123, 12, CAST(0x92030000 AS SmallDateTime), N'Valve broken', CAST(33.55 AS Numeric(7, 2)), 119, 9)
GO
INSERT [dbo].[STOVE_REPAIR] ([RepairNbr], [FK_StoveNbr], [RepairDt], [Description], [Cost], [FK_CustomerID], [FK_EmpID]) VALUES (1124, 11, CAST(0x924B0000 AS SmallDateTime), N'Stripped wingnut', CAST(46.07 AS Numeric(7, 2)), 113, 8)
GO
INSERT [dbo].[STOVE_REPAIR] ([RepairNbr], [FK_StoveNbr], [RepairDt], [Description], [Cost], [FK_CustomerID], [FK_EmpID]) VALUES (1125, 22, CAST(0x924C0000 AS SmallDateTime), N'Fuel clog', CAST(6.59 AS Numeric(7, 2)), 122, 8)
GO
INSERT [dbo].[STOVE_REPAIR] ([RepairNbr], [FK_StoveNbr], [RepairDt], [Description], [Cost], [FK_CustomerID], [FK_EmpID]) VALUES (1126, 32, CAST(0x924C0000 AS SmallDateTime), N'Fuel clog', CAST(6.59 AS Numeric(7, 2)), 130, 9)
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAlways    ', N'1              ', CAST(120 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAlways    ', N'2              ', CAST(125 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAlways    ', N'3              ', CAST(135 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAlways    ', N'5              ', CAST(150 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAtCamp    ', N'1              ', CAST(65 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAtCamp    ', N'2              ', CAST(75 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAtCamp    ', N'3              ', CAST(85 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredNow       ', N'1              ', CAST(90 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredNow       ', N'2              ', CAST(100 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredNow       ', N'3              ', CAST(110 AS Decimal(18, 0)))
GO
INSERT [dbo].[STOVE_TYPE] ([Type], [Version], [Price]) VALUES (N'FiredAlways', N'4', CAST(145 AS Decimal(18, 0)))
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(801 AS Numeric(18, 0)), N'Acme Metal Works', N'Bob Jones', N'456-231-7406', N'456-123-8033', N'112 SW Pfaffle Avenue', N'Los Angeles', N'CA')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(802 AS Numeric(18, 0)), N'Market Packaging', N'Jill Tripp', N'221-235-4301', N'221-645-1358', N'2145 Braxton Blvd', N'Richmond', N'VA')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(803 AS Numeric(18, 0)), N'3N ', N'Jasper Montana', N'365-412-5647', N'321-845-6321', N'394 Northrup Street', N'Portland', N'OR')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(804 AS Numeric(18, 0)), N'Industrial Components', N'Scott Maupin', N'321-743-9812', N'365-741-8610', N'32564 Main Street', N'Tacoma', N'WA')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(805 AS Numeric(18, 0)), N'Albany Forms', N'Garrett Jenkins', N'541-895-9631', N'541-741-8611', N'222 Benton Road', N'Albany', N'OR')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(806 AS Numeric(18, 0)), N'Keller Industries', N'James Keller', N'541-888-4132', N'541-888-4133', N'2289 Lane Street', N'Eugene', N'OR')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(807 AS Numeric(18, 0)), N'Boston Supply', N'Jack Waters', N'325-896-9541', N'325-896-9543', N'856 Jefferson Way', N'Richmond', N'VA')
GO
INSERT [dbo].[SUPPLIER] ([SupplierNbr], [Name], [SalesRep], [RepPhoneNumber], [CSPhoneNumber], [Address], [City], [State]) VALUES (CAST(808 AS Numeric(18, 0)), N'Stevens Fasteners', N'Jane Washburn', N'632-547-8621', N'632-547-8622', N'45655 Lake Drive', N'Twin Falls', N'ID')
GO
