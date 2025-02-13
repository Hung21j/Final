﻿
/****** Object:  Database [OnlineShop]    Script Date: 1/17/2022 9:20:07 PM ******/
CREATE DATABASE [OnlineShop]
 
USE [OnlineShop]
GO
/****** Object:  UserDefinedFunction [dbo].[fuConvertToUnsign1]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000) AS BEGIN IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput DECLARE @RT NVARCHAR(4000) DECLARE @SIGN_CHARS NCHAR(136) DECLARE @UNSIGN_CHARS NCHAR (136) SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' DECLARE @COUNTER int DECLARE @COUNTER1 int SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) BEGIN SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) BEGIN IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) ) BEGIN IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1) ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK END SET @COUNTER1 = @COUNTER1 +1 END SET @COUNTER = @COUNTER +1 END SET @strInput = replace(@strInput,' ','-') RETURN @strInput END
GO
/****** Object:  Table [dbo].[Batches]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batches](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NULL,
)

insert into Batches (Name) values ('thu nhat')
insert into Batches (Name) values ('thu hai')
insert into Batches (Name) values ('thu ba')

/****** Object:  Table [dbo].[ImportForm]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportForm](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Create] [date] NOT NULL,
	[IDbatch] [int] NULL,
	[status] [int] NULL,
)

insert into ImportForm ([Create],IDbatch,status) values ('2002-01-04',2,1)
insert into ImportForm ([Create],IDbatch,status) values ('2022-05-03',1,1)
insert into ImportForm ([Create],IDbatch,status) values ('2021-11-07',3,1)
insert into ImportForm ([Create],IDbatch,status) values ('2020-10-11',2,1)

/****** Object:  Table [dbo].[ImportFormDetail]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportFormDetail](
	[Id] [int] PRIMARY KEY NOT NULL,
	[ProductName] [nvarchar](150) NULL,
	[Date] [date] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Currency] [nvarchar](50) NULL,
	[Total] [float] NULL,
 )
 
insert into ImportFormDetail(Id,ProductName,Date,Price,Quantity,Currency,Total)
values (1,'Rule 1 Protein Isolate 10lbs','2022-01-15',1400000,22,'VNĐ',1400000*22)
insert into ImportFormDetail(Id,ProductName,Date,Price,Quantity,Currency,Total)
values (2,'Rule1 Casein 4lbs','2022-01-15',1300300,22,'VNĐ',1300300*12)
insert into ImportFormDetail(Id,ProductName,Date,Price,Quantity,Currency,Total)
values (3,'PURE WHEY ISOLATE 5.5Lbs','2022-01-15',1388000,22,'VNĐ',1388000*20)
 
/****** Object:  Table [dbo].[Order]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] PRIMARY KEY NOT NULL,
	[UserID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Status] [int] NULL,
	[Create] [datetime] NULL,
)



/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] PRIMARY KEY NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
)
/****** Object:  Table [dbo].[Products]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Image] [nchar](100) NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[ShowOnHomePage] [bit] NULL,
)

insert into Products (ID,Name,Price,Quantity) values(1,'Rule 1 Protein Isolate 10lbs',1400000,22)
insert into Products (ID,Name,Price,Quantity) values(2,'Rule1 Casein 4lbs',1300300,50)
insert into Products (ID,Name,Price,Quantity) values(3,'PURE WHEY ISOLATE 5.5Lbs',1388000,10)
insert into Products (ID,Name,Price,Quantity) values(4,'Hydro Whey Zero BiotechUSA 1.8lbs',1900000,20)

/****** Object:  Table [dbo].[Users]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[IsAdmin] [int] NULL,
)

insert into Users(Name,Email,Password,IsAdmin) values ('long','long@gmail.com','1',0)
insert into Users(Name,Email,Password,IsAdmin) values ('hung','hung@gmail.com','1',1)


ALTER TABLE [dbo].[ImportForm]  WITH CHECK ADD FOREIGN KEY([IDbatch])
REFERENCES [dbo].[Batches] ([ID])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO

/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Login]
@Email nvarchar(150),
@Password nvarchar(150)
as
begin
    select * from dbo.Users where Email = @Email and Password = @Password and IsAdmin = 1
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccount]    Script Date: 1/17/2022 9:20:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

cREATE PROC [dbo].[UpdateAccount]
@email NVARCHAR(100), @name nvarchar(100), @password NVARCHAR(100), @newPassword NVARCHAR(100)
AS
BEGIN
	DECLARE @isRightPass INT = 0
	
	SELECT @isRightPass = COUNT(*) FROM dbo.Users WHERE Email = @email AND Password = @password
	
	IF (@isRightPass = 1)
	BEGIN
		IF (@newPassword = NULL OR @newPassword = '')
		BEGIN
			UPDATE dbo.Users SET Name = @name WHERE Email = @email
		END		
		ELSE 
			UPDATE dbo.Users SET Name = @name, PassWord = @newPassword WHERE Email = @email
	end
END
GO

ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
