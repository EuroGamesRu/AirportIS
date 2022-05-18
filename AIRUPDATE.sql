USE [19ip126]
GO
/****** Object:  Table [dbo].[Aircrafts]    Script Date: 16.05.2022 14:58:10 ******/
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
/****** Object:  Table [dbo].[Airports]    Script Date: 16.05.2022 14:58:10 ******/
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
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Airports] PRIMARY KEY CLUSTERED 
(
	[airport_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Boardiang_passes]    Script Date: 16.05.2022 14:58:10 ******/
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
/****** Object:  Table [dbo].[Bookings]    Script Date: 16.05.2022 14:58:10 ******/
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
/****** Object:  Table [dbo].[Flights]    Script Date: 16.05.2022 14:58:10 ******/
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
/****** Object:  Table [dbo].[Passenger]    Script Date: 16.05.2022 14:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger](
	[passenger_id] [int] IDENTITY(1,1) NOT NULL,
	[passenger_name] [nvarchar](50) NOT NULL,
	[passport] [nvarchar](50) NOT NULL,
	[dob] [date] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Passenger] PRIMARY KEY CLUSTERED 
(
	[passenger_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 16.05.2022 14:58:10 ******/
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
/****** Object:  Table [dbo].[Ticket_flights]    Script Date: 16.05.2022 14:58:11 ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 16.05.2022 14:58:11 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 16.05.2022 14:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Boardiang_passes]  WITH CHECK ADD  CONSTRAINT [FK_Boardiang_passes_Seats] FOREIGN KEY([seat_no])
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
ALTER TABLE [dbo].[Passenger]  WITH CHECK ADD  CONSTRAINT [FK_Passenger_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Passenger] CHECK CONSTRAINT [FK_Passenger_Users]
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
