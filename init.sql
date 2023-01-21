create table public.book(
    id char(36) not null primary key,
    title varchar(100) null,
    description varchar(100) null
);

create table public.user(
    id char(36) not null primary key,
    first_name varchar(100) null,
    last_name varchar(100) null
)