create database chat_app_v2
go

use chat_app_v2


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
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [link_user_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_one_] varchar(60),
  [id_user_two_] varchar(60),
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [blog_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [title_] text,
  [content_] text,
  [status_] int,
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [coment_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_blog_] varchar(60),
  [id_user_] varchar(60),
  [content_] text,
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

CREATE TABLE [heart_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_blog_] varchar(60)
)
GO

CREATE TABLE [like_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_blog_] varchar(60)
)
GO

CREATE TABLE [chat_] (
  [id_] varchar(60) PRIMARY KEY,
  [id_user_] varchar(60),
  [id_link_user_] varchar(60),
  [content_] text,
  [day_send_] datetime,
  [status_delete_] tinyint,
  [day_delete_] datetime
)
GO

ALTER TABLE [user_] ADD FOREIGN KEY ([id_authentication_]) REFERENCES [authentication_] ([id_])
GO

ALTER TABLE [link_user_] ADD FOREIGN KEY ([id_user_one_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [link_user_] ADD FOREIGN KEY ([id_user_two_]) REFERENCES [user_] ([id_])
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

ALTER TABLE [chat_] ADD FOREIGN KEY ([id_user_]) REFERENCES [user_] ([id_])
GO

ALTER TABLE [chat_] ADD FOREIGN KEY ([id_link_user_]) REFERENCES [link_user_] ([id_])
GO


insert into authentication_ (id_,email_,password_) values 
('au_1','testemail1@gmail.com','testpassword1'),
('au_2','testemail2@gmail.com','testpassword2'),
('au_3','testemail3@gmail.com','testpassword3'),
('au_4','testemail4@gmail.com','testpassword4'),
('au_5','testemail5@gmail.com','testpassword5')

insert into user_ (id_,name_,age_,id_authentication_) values 
('user_1','test name 1',19,'au_1'),
('user_2','test name 2',20,'au_2'),
('user_3','test name 3',21,'au_3'),
('user_4','test name 4',22,'au_4'),
('user_5','test name 5',23,'au_5')

insert into link_user_ (id_,id_user_one_,id_user_two_) values
('link_user_1','user_1','user_2'),
('link_user_2','user_2','user_3'),
('link_user_3','user_3','user_4'),
('link_user_4','user_4','user_5'),
('link_user_5','user_5','user_1')

insert into blog_ (id_,id_user_,title_,content_,status_) values
('blog_1','user_1','test title 1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.',1),
('blog_2','user_2','test title 1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.',1),
('blog_3','user_3','test title 1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.',1),
('blog_4','user_4','test title 1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.',1),
('blog_5','user_5','test title 1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.',1)

insert into heart_(id_,id_user_,id_blog_) values 
('heart_1','user_1','blog_1'),
('heart_2','user_2','blog_2'),
('heart_3','user_3','blog_3'),
('heart_4','user_4','blog_4'),
('heart_5','user_5','blog_5')

insert into like_(id_,id_user_,id_blog_) values 
('like_1','user_1','blog_1'),
('like_2','user_2','blog_2'),
('like_3','user_3','blog_3'),
('like_4','user_4','blog_4'),
('like_5','user_5','blog_5')

insert into coment_(id_,id_user_,id_blog_,content_) values 
('coment_1','user_1','blog_1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.'),
('coment_2','user_2','blog_2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.'),
('coment_3','user_3','blog_3','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.'),
('coment_4','user_4','blog_4','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.'),
('coment_5','user_5','blog_5','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.')

insert into chat_(id_,id_user_,id_link_user_,content_,day_send_) values
('chat_1','user_1','link_user_1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:09 AM'),
('chat_2','user_1','link_user_1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:10 AM'),
('chat_3','user_1','link_user_1','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:11 AM'),
('chat_4','user_2','link_user_2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:12 AM'),
('chat_5','user_2','link_user_2','Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet blanditiis non dolor placeat ducimus nulla adipisci iusto eum repellendus. Quod, nesciunt enim. Reprehenderit vero minima commodi, voluptatum nobis similique perspiciatis.','2024-11-11 10:34:13 AM')
