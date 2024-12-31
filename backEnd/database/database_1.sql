create database chat_app_v5
go

use chat_app_v5


CREATE TABLE [authentication_] (
  [id_] varchar(60) PRIMARY KEY,
  [email_] nvarchar(255),
  [password_] varchar(255),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [user_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_authentication_] varchar(60),
  [name_] nvarchar(255),
  [age_] int,
  link_img_ text,
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [link_user_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_user_friend_] varchar(60),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [blog_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [title_] nvarchar(max),
  [content_] nvarchar(max),
  [status_] int,
  day_blog_ datetime,
  link_img_ text,
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [coment_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_blog_] varchar(60),
  [id_user_] varchar(60),
  [content_] nvarchar(max),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [heart_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_blog_] varchar(60),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [like_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_blog_] varchar(60),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [chat_] (
  [id_] varchar(60) PRIMARY KEY,
  id_user_receive_ varchar(60),
  [content_] nvarchar(max),
  [day_send_] datetime,
  id_user_send_ varchar(60),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [friend_request_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_user_friend_] varchar(60),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

ALTER TABLE [user_] ADD FOREIGN KEY ([id_authentication_]) REFERENCES [authentication_] ([id_])
GO

ALTER TABLE [link_user_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [link_user_] ADD FOREIGN KEY ([id_user_friend_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [blog_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [coment_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [coment_] ADD FOREIGN KEY ([id_blog_]) REFERENCES [blog_] ([id_])
GO

ALTER TABLE [heart_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [heart_] ADD FOREIGN KEY ([id_blog_]) REFERENCES [blog_] ([id_])
GO

ALTER TABLE [like_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [like_] ADD FOREIGN KEY ([id_blog_]) REFERENCES [blog_] ([id_])
GO

ALTER TABLE [chat_] ADD FOREIGN KEY (id_user_receive_) REFERENCES user_ ([id_])
GO

ALTER TABLE [chat_] ADD FOREIGN KEY (id_user_send_) REFERENCES user_ ([id_])
go

ALTER TABLE [friend_request_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [friend_request_] ADD FOREIGN KEY ([id_user_friend_]) REFERENCES [user_] ([id_])
GO

go
insert into authentication_ (id_,email_,password_,status_delete_) values 
('au_1','testemail1@gmail.com','testpassword1',1),
('au_2','testemail2@gmail.com','testpassword2',1),
('au_3','testemail3@gmail.com','testpassword3',1),
('au_4','testemail4@gmail.com','testpassword4',1),
('au_5','testemail5@gmail.com','testpassword5',1)

go
insert into user_ (id_,name_,age_,id_authentication_,status_delete_,link_img_) values 
('user_1','test name 1',19,'au_1',1,'1'),
('user_2','test name 2',20,'au_2',1,'1'),
('user_3','test name 3',21,'au_3',1,'1'),
('user_4','test name 4',22,'au_4',1,'1'),
('user_5','test name 5',23,'au_5',1,'1')

go
insert into link_user_ (id_,id_user_,id_user_friend_,status_delete_) values
('link_user_1','user_1','user_2',1),
('link_user_2','user_2','user_1',1),
('link_user_3','user_3','user_4',1),
('link_user_4','user_4','user_3',1)


go
insert into chat_(id_,id_user_receive_,content_,day_send_,status_delete_,id_user_send_) values
('chat_1','user_2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:09 AM',1,'user_1'),
('chat_2','user_2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:10 AM',1,'user_1'),
('chat_3','user_2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:11 AM',1,'user_1'),
('chat_4','user_1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:12 AM',1,'user_2'),
('chat_5','user_1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:13 AM',1,'user_2')

go
insert into friend_request_ (id_,id_user_,id_user_friend_,status_delete_) values 
('friend_request_1','user_1','user_2',1),
('friend_request_2','user_2','user_3',1),
('friend_request_3','user_3','user_4',1),
('friend_request_4','user_4','user_5',1),
('friend_request_5','user_5','user_1',1)