-- # 1.  Создание таблицы CUSTOMERS
create table CUSTOMERS
(
    id           int          not null auto_increment primary key,
    name         varchar(255) not null,
    surname      varchar(255) not null,
    age          int check ( 0 < age < 100 ),
    phone_number varchar(13) check ( 10 < phone_number)
);


-- # 1.1. Наполнение таблицы CUSTOMERS
insert into CUSTOMERS (name, surname, age, phone_number)
values ('Алексей', 'Сидоров', 22, '+79123456789');

insert into CUSTOMERS (name, surname, age, phone_number)
values ('Владимир', 'Петров', 24, '+79123456789');

insert into CUSTOMERS (name, surname, age, phone_number)
values ('Петер', 'Васечкин', 25, '+79123456789');

insert into CUSTOMERS (name, surname, age, phone_number)
values ('Алексей', 'Жданов', 42, '+79123456789');


-- #1.2 Создание индексов для ускорения выборки по имени
create index index_name on customers (name);


-- # 2. Создание таблицы ORDERS
create table ORDERS
(
    id           int            not null auto_increment primary key,
    date         TIMESTAMP default current_timestamp,
    customer_id  int            not null,
    product_name varchar(255)   not null,
    amount       decimal(19, 4) not null,
    foreign key (customer_id) references CUSTOMERS (id)
);


-- # 2.1. Наполнение таблицы ORDERS
insert into orders (customer_id, product_name, amount)
values ('1', 'Батон', 100.00);

insert into orders (customer_id, product_name, amount)
values ('2', 'Кефир', 200.00);

insert into orders (customer_id, product_name, amount)
values ('1', 'Рыба', 300.00);

insert into orders (customer_id, product_name, amount)
values ('1', 'Мясо', 1000.00);

insert into orders (customer_id, product_name, amount)
values ('2', 'Шампанское', 1500.00);

insert into orders (customer_id, product_name, amount)
values ('4', 'Овощи', 300.00);


-- # 3. Выборка полей product_name для пользователей с именем алексей
select c.name name_customers,
       c.surname surname_customers,
       o.product_name product_name_orders
from orders o
         left join customers c on c.id = o.customer_id
having name_customers like '%алЕксей%'
order by surname_customers, product_name_orders
;