brew services start postgresql

createdb todolist

psql todolist

create table todos (
    id serial primary key,
    title varchar(255) Not Null,
    details text null,
    priority integer not null default '1',
    created_at timestamp (0) not null,
    completed_at timestamp (0) null

);

--to view the columns in the table
select * from todos;

insert into todos (title, details, priority, created_at, completed_at) 
values ('walk the dog','go around the lake',3, '2017-08-12 05:57:12', null ),
('babysit', '5:30pm at Sarahs house', 1, '2017-08-12 05:57:12', null),
('wash car', 'clean windows and mirrors', 4, '2017-08-12 05:57:12', null),
('cook dinner', 'chicken and rice', 2, '2017-08-12 05:57:12', null),
('cook breakfast', 'eggs and bacon', 5, '2017-08-12 05:57:12', '2017-08-14 05:57:12');

select * from todos where completed_at is null;

select * from todos where priority > 1;

update todos set completed_at = '2017-08-15 05:57:12' where id = 4;

delete from todos where completed_at is not null;