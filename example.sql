
CREATE TABLE users(
  id    SERIAL PRIMARY KEY,
  email VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE posts(
  id      SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id),
  title   VARCHAR(100) NOT NULL UNIQUE
);

insert into users(id, email) values(1, 'thang@gmail.com');

insert into posts(id, user_id, title) values(1, 1, 'ánh sáng');
insert into posts(id, user_id, title) values(2, 1, 'ánh chiều tà');
insert into posts(id, user_id, title) values(3, 1, 'cô chánh');
insert into posts(id, user_id, title) values(4, 1, 'vi hành');
