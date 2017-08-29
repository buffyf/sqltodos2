brew services start
postgresql

createdb todolist

psql todolist
create table todos
(
    id serial primary key,
    title varchar(255) Not Null,
    details text null,
    priority integer not null default '1',
    created_at timestamp (0) not null,
    completed_at timestamp (0) null
);
--to view the columns in the table
select *
from todos;
insert into todos
    (title, details, priority, created_at, completed_at)
values
    ('walk the dog', 'go around the lake', 3, '2017-08-12 05:57:12', null ),
    ('babysit', '5:30pm at Sarahs house', 1, '2017-08-12 05:57:12', null),
    ('wash car', 'clean windows and mirrors', 4, '2017-08-12 05:57:12', null),
    ('cook dinner', 'chicken and rice', 2, '2017-08-12 05:57:12', null),
    ('cook breakfast', 'eggs and bacon', 5, '2017-08-12 05:57:12', '2017-08-14 05:57:12');
select *
from todos
where completed_at is null;
select *
from todos
where priority > 1;
update todos set completed_at = '2017-08-15 05:57:12' where id = 4;
delete from todos where completed_at is not null;
insert into todos
    (title, details, priority, created_at, completed_at)
values
    ('shop', 'need pants and socks', 3, '2017-08-12 05:57:12', '2017-09-15 06:12:12'),
    ('sleep', 'go to bed early', 1, '2017-08-20 19:57:12', null),
    ('clean house', 'clean windows and mirrors', 4, '2017-05-16 05:57:12', '2017-05-19 05:57:12'),
    ('call friend', 'Beth ask to visit in October', 2, '2017-08-25 05:57:12', null),
    ('exercise', 'weights', 5, '2017-08-14 05:57:12', '2017-08-24 05:57:12'),
    ('eat', 'fruit', 3, '2017-08-06 05:57:12', '2017-08-07 06:12:12'),
    ('study javascript', 'learn functions', 1, '2017-08-27 19:57:12', null),
    ('study sql', 'practice joining tables', 4, '2017-07-16 05:57:12', '2017-08-19 05:57:12'),
    ('call sister', 'Ask about dinner', 2, '2017-08-21 05:57:12', null),
    ('read', 'a book', 5, '2017-08-13 05:57:12', '2017-08-20 05:57:12'),
    ('drink', '64 ounces of water', 3, '2017-08-12 05:57:12', '2017-08-15 06:12:12'),
    ('go to concert', 'Pearl Jam', 1, '2017-08-20 19:57:12', null),
    ('buy tickets to show', 'AMC movie theater', 4, '2017-04-16 05:57:12', '2017-04-19 05:57:12'),
    ('write a book', 'get details from Beth', 2, '2017-08-28 05:57:12', null),
    ('read email', 'respond to aunt', 5, '2017-03-14 05:57:12', '2017-03-24 05:57:12'),
    ('golf', 'bring golf clubs', 3, '2017-05-12 05:57:12', '2017-05-15 06:12:12'),
    ('jump rope', 'get ropes from school', 1, '2017-06-20 19:57:12', null),
    ('take pictures of family', 'near the lake', 4, '2017-07-23 05:57:12', '2017-07-24 05:57:12'),
    ('watch tv', 'HGTV', 2, '2017-08-26 07:57:12', null),
    ('sell furniture', 'post on craigslist', 5, '2017-08-01 05:57:12', '2017-08-05 05:57:12');
select *
from todos
where priority = 3 and completed_at is null;
select count(completed_at is null)
from todos
GROUP BY priority;
select priority, count(priority), created_at
from todos
where created_at >= '2017-07-30 00:00:00'
group by priority, created_at
order by priority asc;
select *
from todos
where priority=1 and created_at = (select min(created_at)
    from todos
    where priority = 1);
