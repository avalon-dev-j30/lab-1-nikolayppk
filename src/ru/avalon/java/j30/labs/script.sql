/*
 * TODO(Студент): Опишите процесс создания базы данных
 * 1. Создайте все таблицы, согласно предложенной диаграмме.
 * 2. Опишите все необходимые отношения между таблицами.
 * 3. Добавьте в каждую таблицу минимум три записи.
 */
  create table Supplier
(
    id smallint not null unique
        generated always as identity (start with 1, increment by 1),
    name varchar(255) primary key,
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null
);

create table Userinfo
(
    id smallint not null primary key,
    name varchar(255) not null,
    surname varchar(255) not null
);

create table Roles
(
    id smallint not null unique
        generated always as identity (start with 1, increment by 1),
    name varchar(255) not null primary key
);

create table Users
(
    id smallint not null unique
        generated always as identity (start with 1, increment by 1),
    email varchar(255) not null primary key,
    password varchar(255),
    info smallint not null unique references userinfo(id),
    role smallint not null references roles (id)
);

create table Orders
(
    id smallint not null primary key,
    users smallint not null references users(id),
    created timestamp
);

create table Product
(
    id smallint not null unique
        generated always as identity(start with 1, increment by 1),
    code varchar(255) not null primary key,
    title varchar(255),
    supplier smallint not null references supplier(id),
    initial_price double,
    retail_value double
);

create table Order2Product
(
    orders smallint not null references orders(id),
    product smallint not null references product(id),
    constraint pk_ord2prod primary key (orders, product)                       
);


/*
    заполняем таблицы
*/

insert into supplier 
(code, title, supplier, initial_price, retail_value)
values 
    ('1', 'Петрович', 'Санкт-Петербург', '812-777-66-55', 'something about company'),
    ('2', 'Северсталь', 'Москва', '499-903-23-12', 'something about company'),
    ('3', 'Лесоповал', 'Нижний Новгород', '345-93-56-2', 'something about company');

insert into product 
(code, title, supplier, initial_price, retail_value)
values 
    ('0001', 'fitting', 1, 10.23, 14.32),
    ('0002', 'steel', 2, 102.56, 134.10),
    ('0003', 'wood', 3, 45.10, 98.25);

insert into userinfo
(id, name, surname)
values
    (01, 'Nike', 'Antonov'),
    (02, 'Tom', 'Sawyer'),
    (03, 'Ed', 'Sheeran');

insert into roles
    (name)
values
    ('Manager'),
    ('Driver');

insert into users
(email, password, info, role)
values
    ('niki@mail.ru', 'qwerty', 1, 1),
    ('finn@gmail.com', 'book', 2, 1),
    ('voise2000@yandex.ru', 'song', 3, 2);

insert into orders
(id, users, created)
values
    (1, 1, '2009-12-13 12:34:00'),
    (2, 2, '2010-03-03 15:21:15'),
    (3, 3, '2010-06-21 23:50:45');
 
