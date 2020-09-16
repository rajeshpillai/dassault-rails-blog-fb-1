# README

SQL

- all posts
select * from posts;

- post (id = 1)
select * from posts where id = 1;

- post with id in 1, 2
select * from posts where id in [1,2];

- All post with title "Post 1"
select * from posts where title = 'Post 1';

- All post where title starts with Post......
select * from posts where title like 'Post%';

- All post that contain title with the text "Post"
select * from posts where title like '%Post%';

- inner join (matching record in both tables)
select posts.* from posts
    INNER join category
    on posts.category_id = category.id 

RESULT 
-----------
id    title    category_id(fk)
1     Post 1   1
2     Post 2   1
3     Post 3   2



- left outer  join (matching record in both tables)
select posts.* from posts
    LEFT outer join category
    on posts.category_id = category.id 

RESULT
----------
id    title    category_id(fk)
1     Post 1   1
2     Post 2   1
3     Post 3   2
4     Post 4   nil 


- right outer  join (matching record in both tables)
select posts.* from posts
    RIGHT outer join category
    on posts.category_id = category.id 

RESULT
----------
id    title    category_id(fk)
1     Post 1   1
2     Post 2   1
3     Post 3   2
nil   nil      3



- right outer  join (matching record in both tables)
select posts.* from posts
    FULL outer join category
    on posts.category_id = category.id 

RESULT
----------
id    title    category_id(fk)
1     Post 1   1
2     Post 2   1
3     Post 3   2
4     Post 4   nil 
nil   nil      3


posts
---------
id    title    category_id(fk)
1     Post 1   1
2     Post 2   1
3     Post 3   2
4     Post 4   nil 

categories
------------
id    name
1     Programming
2     React
3     JavaScript












