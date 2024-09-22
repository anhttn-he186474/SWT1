create database SWP
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[full_name] [nvarchar](100) NOT NULL ,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[role_id] [int] NOT NULL,
	[status] [int] NOT NULL,
	[phone] [nvarchar](11) NOT NULL,
	[address] [nvarchar](200) NOT NULL,	
	[image] [nvarchar](50) NULL
)

INSERT INTO [dbo].[Users] ([full_name], [username], [password], [email],[role_id], [status], [phone], [address], [image])
VALUES 
    (N'Trần Thị Ngọc Ánh', 'anhttn', '123456', 'tranthingocanh04hk@gmail.com', 1, 1, '0989078233', N'TP Hà Nội', 'images/users/user.png')
select* from [Users]