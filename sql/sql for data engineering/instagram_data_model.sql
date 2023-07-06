create table users(
	user_id serial primary key,
	name varchar(20) not null,
	email varchar(20) unique not null,
	phone_nbr varchar(20) unique
);

create table post(
	post_id serial primary key,
	user_id integer not null,
	captions varchar(20),
	image_url varchar(255),
	created_at timestamp,
	foreign key(user_id)references users(user_id)
);

create table comments(
	comment_id serial primary key,
	post_id int not null ,
	user_id int not null,
	comment_text text,
	created_at timestamp,
	foreign key( post_id) references post(post_id),
	foreign key ( user_id) references users(user_id)
);

create table followers(
	followers_id serial primary key,
	user_id int not null,
	follower_user_id int not null,
	created_at timestamp,
	foreign key (user_id) references users (user_id),
	foreign key (follower_user_id) references users (user_id)
);

create table likes(
	like_id serial primary key,
	post_id int not null,
	user_id int not null,
	created_at timestamp,
	foreign key (post_id) references post (post_id),
	foreign key( user_id) references users (user_id)
);

--alter table followers  drop created_at
--alter table followers add column created_at timestamp default current_timestamp
--alter table followers alter column followers_id set serial 
--alter table followers alter column followers_id set  DATA TYPE SERIAL
--drop table followers



INSERT INTO users (name, email, phone_nbr)
VALUES
    ('John Smith', 'johnsmith@gmail.com', '1234567890'),
    ('Jane Doe', 'janedoe@yahoo.com', '0987654321'),
    ('Bob Johnson', 'bjohnson@gmail.com', '1112223333'),
    ('Alice Brown', 'abrown@yahoo.com', NULL),
    ('Mike Davis', 'mdavis@gmail.com', '5556667777');
	INSERT INTO users (user_id,name, email, phone_nbr)
VALUES
    (6,'aka_rony', 'ronymain.com', '12345437890')

delete from users where name='aka_rony'

INSERT INTO post (user_id, captions, image_url)
VALUES
    (1, 'Beautiful sunset', '<https://www.example.com/sunset.jpg>'),
    (2, 'My new puppy', '<https://www.example.com/puppy.jpg>'),
    (3, 'Delicious pizza', '<https://www.example.com/pizza.jpg>'),
    (4, 'Throwback vacation', '<https://www.example.com/vacation.jpg>'),
    (5, 'Amazing concert', '<https://www.example.com/concert.jpg>');


INSERT INTO comments (post_id, user_id, comment_text)
VALUES
    (1, 2, 'Wow! Stunning.'),
    (1, 3, 'Beautiful colors.'),
    (2, 1, 'What a cutie!'),
    (2, 4, 'Aww, I want one.'),
    (3, 5, 'Yum!'),
    (4, 1, 'Looks like an awesome trip.'),
    (5, 3, 'Wish I was there!');



INSERT INTO Followers (user_id, follower_user_id)
VALUES
    (1, 2),
    (2, 1),
    (1, 3),
    (3, 1),
    (1, 4),
    (4, 1),
    (1, 5),
    (5, 1);
	


INSERT INTO Likes (post_id, user_id)
VALUES
    (1, 2),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 5),
    (4, 1),
    (4, 2),
    (4, 3),
    (5, 4),
    (5, 5);
	
select* from users where user_id=6
select * from post order by post_id;
--update caption for post_id 3
update post set captions = 'kal ana'  where post_id=3
--selecting all the post where user_id is 1
select* from post where user_id=1 
select * from users join post on users.user_id=post.user_id where users.user_id=1
--  select all the post and order them in descending order based on date
INSERT INTO post (post_id,user_id, captions, image_url)
VALUES
    (6,6, 'Beautiful sunset', '<https://www.example.com/sunset.jpg>')
select * from post order by created_at desc
--delete  from post where post_id=8

select * from likes
select * from post
--counting the number of likes for each post and showing only the post with more than 2 likes
select image_url, likes.post_id,count(likes.post_id) as nbr_of_likes from 
likes join post on likes.post_id=post.post_id  group by image_url,likes.post_id having count(likes.post_id)>2

--find total number of likes for each post
select sum(num_of_likes)as total_likes from
(select post_id,count(post_id) as num_of_likes from likes group by post_id) as post_like

--finding all the users who have commented on post_id 1
select * from comments;
select* from users;
select* from post
select name,comments.user_id,post_id from comments join users on users.user_id=comments.user_id  where post_id=1

select name from users where user_id in(
select user_id from comments where post_id=1
)

--Ranking the post based on the number of likes
select post_id,count(*) as likes_count ,dense_rank () over( order by count(*) desc )from likes group by post_id 
select* from likes;

with cte as(
select image_url, likes.post_id,count(likes.post_id) as nbr_of_likes ,dense_rank () 
over( order by count(likes.post_id) desc )from 
likes join post on likes.post_id=post.post_id group by image_url,likes.post_id
	)
select * from cte

-- find all the post and their comments using the CTE statements
select * from post;
select * from comments	

with cts as(
select post.user_id,post.captions,post.post_id,comments.comment_text,comments.user_id as commented_by_user_id from post join comments 
on post.post_id=comments.post_id)
select * from cts
  
  
-- categorising post based on number of likess


