USE [master]
GO
/****** Object:  Database [19ip126]    Script Date: 06.05.2022 9:46:20 ******/
CREATE DATABASE [19ip126]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'19ip126', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\19ip126.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'19ip126_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\19ip126_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [19ip126] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [19ip126].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [19ip126] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [19ip126] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [19ip126] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [19ip126] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [19ip126] SET ARITHABORT OFF 
GO
ALTER DATABASE [19ip126] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [19ip126] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [19ip126] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [19ip126] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [19ip126] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [19ip126] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [19ip126] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [19ip126] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [19ip126] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [19ip126] SET  ENABLE_BROKER 
GO
ALTER DATABASE [19ip126] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [19ip126] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [19ip126] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [19ip126] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [19ip126] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [19ip126] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [19ip126] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [19ip126] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [19ip126] SET  MULTI_USER 
GO
ALTER DATABASE [19ip126] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [19ip126] SET DB_CHAINING OFF 
GO
ALTER DATABASE [19ip126] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [19ip126] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [19ip126] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [19ip126] SET QUERY_STORE = OFF
GO
USE [19ip126]
GO
/****** Object:  User [YXMT\Преподаватели ЯПЭК]    Script Date: 06.05.2022 9:46:20 ******/
CREATE USER [YXMT\Преподаватели ЯПЭК] FOR LOGIN [YXMT\Преподаватели ЯПЭК]
GO
ALTER ROLE [db_datareader] ADD MEMBER [YXMT\Преподаватели ЯПЭК]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [YXMT\Преподаватели ЯПЭК]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aircrafts](
	[aircraft_code] [int] NOT NULL,
	[model] [nvarchar](50) NOT NULL,
	[range] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Aircrafts] PRIMARY KEY CLUSTERED 
(
	[aircraft_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airports]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airports](
	[airport_code] [int] NOT NULL,
	[airport_name] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[coordinates] [nvarchar](50) NOT NULL,
	[timezone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Airports] PRIMARY KEY CLUSTERED 
(
	[airport_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boardiang_passes]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Boardiang_passes](
	[ticket_no] [int] NOT NULL,
	[flight_id] [int] IDENTITY(1,1) NOT NULL,
	[boarding_no] [int] NOT NULL,
	[seat_no] [int] NOT NULL,
 CONSTRAINT [PK_Boardiang_passes] PRIMARY KEY CLUSTERED 
(
	[boarding_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[book_ref] [int] NOT NULL,
	[book_date] [date] NOT NULL,
	[total_amount] [int] NOT NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[book_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flights]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flights](
	[flight_id] [int] NOT NULL,
	[flight_no] [int] NOT NULL,
	[scheduled_departure] [nvarchar](50) NOT NULL,
	[scheduled_arrival] [nvarchar](50) NOT NULL,
	[departure_airport] [nvarchar](50) NOT NULL,
	[arrival_airport] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[aircraft_code] [int] NOT NULL,
	[actual_departure] [nvarchar](50) NOT NULL,
	[actual_arrival] [nvarchar](50) NOT NULL,
	[airport_code] [int] NOT NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[passenger_id] [int] IDENTITY(1,1) NOT NULL,
	[passenger_name] [nvarchar](50) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[passport] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[passenger_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[aircraft_code] [int] NOT NULL,
	[seat_no] [int] NOT NULL,
	[fare_conditions] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Seats] PRIMARY KEY CLUSTERED 
(
	[seat_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket_flights]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_flights](
	[ticket_no] [int] NOT NULL,
	[flight_id] [int] IDENTITY(1,1) NOT NULL,
	[fare_conditions] [nvarchar](50) NOT NULL,
	[amount] [int] NOT NULL,
 CONSTRAINT [PK_Ticket_flights] PRIMARY KEY CLUSTERED 
(
	[ticket_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 06.05.2022 9:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[ticket_no] [int] IDENTITY(1,1) NOT NULL,
	[book_ref] [int] NOT NULL,
	[passenger_id] [int] NOT NULL,
	[contact_data] [date] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[ticket_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Boardiang_passes]    Script Date: 06.05.2022 9:46:20 ******/
CREATE NONCLUSTERED INDEX [IX_Boardiang_passes] ON [dbo].[Boardiang_passes]
(
	[flight_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Flights]    Script Date: 06.05.2022 9:46:20 ******/
CREATE NONCLUSTERED INDEX [IX_Flights] ON [dbo].[Flights]
(
	[aircraft_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boardiang_passes]  WITH CHECK ADD  CONSTRAINT [FK_Boardiang_passes_Seats] FOREIGN KEY([ticket_no])
REFERENCES [dbo].[Seats] ([seat_no])
GO
ALTER TABLE [dbo].[Boardiang_passes] CHECK CONSTRAINT [FK_Boardiang_passes_Seats]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flights_Aircrafts] FOREIGN KEY([aircraft_code])
REFERENCES [dbo].[Aircrafts] ([aircraft_code])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flights_Aircrafts]
GO
ALTER TABLE [dbo].[Flights]  WITH CHECK ADD  CONSTRAINT [FK_Flights_Airports] FOREIGN KEY([airport_code])
REFERENCES [dbo].[Airports] ([airport_code])
GO
ALTER TABLE [dbo].[Flights] CHECK CONSTRAINT [FK_Flights_Airports]
GO
ALTER TABLE [dbo].[Seats]  WITH CHECK ADD  CONSTRAINT [FK_Seats_Aircrafts] FOREIGN KEY([aircraft_code])
REFERENCES [dbo].[Aircrafts] ([aircraft_code])
GO
ALTER TABLE [dbo].[Seats] CHECK CONSTRAINT [FK_Seats_Aircrafts]
GO
ALTER TABLE [dbo].[Ticket_flights]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_flights_Flights] FOREIGN KEY([flight_id])
REFERENCES [dbo].[Flights] ([flight_id])
GO
ALTER TABLE [dbo].[Ticket_flights] CHECK CONSTRAINT [FK_Ticket_flights_Flights]
GO
ALTER TABLE [dbo].[Ticket_flights]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_flights_Tickets] FOREIGN KEY([ticket_no])
REFERENCES [dbo].[Tickets] ([ticket_no])
GO
ALTER TABLE [dbo].[Ticket_flights] CHECK CONSTRAINT [FK_Ticket_flights_Tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Bookings] FOREIGN KEY([book_ref])
REFERENCES [dbo].[Bookings] ([book_ref])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Bookings]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Passenger] FOREIGN KEY([passenger_id])
REFERENCES [dbo].[Passenger] ([passenger_id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Passenger]
GO
EXEC [19ip126].sys.sp_addextendedproperty @name=N'dbo.Поставщики', @value=N'Cyrillic_General_CI_AS' 
GO
USE [master]
GO
ALTER DATABASE [19ip126] SET  READ_WRITE 
GO
