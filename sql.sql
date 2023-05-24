create schema mydb;
use mydb;

create table users
(
    user_id     int auto_increment
        primary key,
    username    varchar(45)                                     not null,
    password    varchar(45)                                     not null,
    phone       char(10)                                        not null,
    email       varchar(45)                                     not null,
    role        enum ('admin', 'manager', 'seller', 'customer') not null,
    fullName    varchar(100)                                    not null,
    birthdate   date                                            not null,
    avatar_path varchar(255)                                    null,
    created_at  timestamp default CURRENT_TIMESTAMP             null,
    constraint email_UNIQUE
        unique (email),
    constraint phone_UNIQUE
        unique (phone),
    constraint user_id_UNIQUE
        unique (user_id),
    constraint username_UNIQUE
        unique (username)
);

create table categories
(
    category_id   smallint unsigned not null
        primary key,
    category_name varchar(45)       not null,
    constraint category_id_UNIQUE
        unique (category_id)
);


create table products
(
    product_id      int                                 not null,
    product_name    varchar(45)                         not null,
    price           int unsigned                        null,
    description     text                                not null,
    user_id         int                                 not null,
    category_id     smallint unsigned                   not null,
    quantityInStock smallint                            not null,
    created_at      timestamp default CURRENT_TIMESTAMP null,
    primary key (product_id, user_id, category_id),
    constraint product_id_UNIQUE
        unique (product_id),
    constraint fk_Products_Categories1
        foreign key (category_id) references categories (category_id),
    constraint fk_Products_Users
        foreign key (user_id) references users (user_id)
);


create table addresses
(
    address_id int auto_increment
        primary key,
    user_id    int          not null,
    details    varchar(100) not null,
    ward       varchar(20)  not null,
    district   varchar(20)  not null,
    city       varchar(20)  not null,
    constraint fk_Addresses_Users
        foreign key (user_id) references users (user_id)
            on update cascade on delete cascade
);


create table reviews
(
    review_id  int auto_increment,
    rating     tinyint                             null,
    review     text                                null,
    product_id int                                 not null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    primary key (review_id, product_id),
    constraint fk_Reviews_Products1
        foreign key (product_id) references products (product_id)
);

create index fk_Reviews_Products1_idx
    on reviews (product_id);

create index fk_Products_Categories1_idx
    on products (category_id);

create index fk_Products_Users_idx
    on products (user_id);

create table productimages
(
    id         int auto_increment
        primary key,
    product_id int          not null,
    image_path varchar(255) null,
    constraint productimages_ibfk_1
        foreign key (product_id) references products (product_id)
);

create index product_id
    on productimages (product_id);

create table payments
(
    payment_id     tinyint auto_increment
        primary key,
    payment_method varchar(45)                         null,
    order_id       int                                 null,
    amount         int                                 not null,
    payment_date   timestamp default CURRENT_TIMESTAMP null,
    constraint payment_id_UNIQUE
        unique (payment_id)
);

create table orders
(
    order_id     int auto_increment,
    order_date   timestamp    not null,
    shipped_date timestamp    null,
    status       varchar(45)  null,
    comment      varchar(255) null,
    user_id      int          not null,
    payment_id   tinyint      not null,
    primary key (order_id, user_id, payment_id),
    constraint order_id_UNIQUE
        unique (order_id),
    constraint fk_Orders_Payments1
        foreign key (payment_id) references payments (payment_id),
    constraint fk_Orders_Users1
        foreign key (user_id) references users (user_id)
);

create index fk_Orders_Payments1_idx
    on orders (payment_id);

create index fk_Orders_Users1_idx
    on orders (user_id);

create table orderdetails
(
    order_id   int     not null,
    product_id int     not null,
    quantity   tinyint not null,
    primary key (order_id, product_id),
    constraint fk_Orders_has_Products_Orders1
        foreign key (order_id) references orders (order_id),
    constraint fk_Orders_has_Products_Products1
        foreign key (product_id) references products (product_id)
);

create index fk_Orders_has_Products_Orders1_idx
    on orderdetails (order_id);

create index fk_Orders_has_Products_Products1_idx
    on orderdetails (product_id);


create table cart
(
    id         int auto_increment
        primary key,
    user_id    int                                 not null,
    product_id int                                 not null,
    quantity   int                                 not null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    constraint cart_ibfk_1
        foreign key (user_id) references users (user_id),
    constraint cart_ibfk_2
        foreign key (product_id) references products (product_id)
);

create index product_id
    on cart (product_id);

create index user_id
    on cart (user_id);









