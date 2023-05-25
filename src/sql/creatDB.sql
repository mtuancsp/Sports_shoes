drop schema case_study;

create schema case_study;
use case_study;

create table users
(
    user_id     int auto_increment
        primary key,
    username    varchar(45)         unique                            not null,
    password    varchar(45)                                     not null,
    phone       char(10)          unique                              not null,
    email       varchar(45)   unique                                  not null,
    role        enum ('admin', 'manager', 'seller', 'customer') not null default 'customer',
    full_name   varchar(100),
    birthday    date,
    avatar_path varchar(255),
    created_at  timestamp                                                default CURRENT_TIMESTAMP,
    status      enum ('active', 'block', 'limit')               not null default 'active'
);

create table categories
(
    category_id   smallint unsigned not null
        primary key auto_increment,
    category_name varchar(45)       not null
);


create table products
(
    product_id        int primary key auto_increment,
    product_name      varchar(45)       not null,
    price             int unsigned      not null,
    description       text              not null,
    user_id           int               not null,
    category_id       smallint unsigned not null,
    quantity_in_stock smallint          not null,
    created_at        timestamp default CURRENT_TIMESTAMP,
    constraint fk_Products_Categories1
        foreign key (category_id) references categories (category_id),
    constraint fk_Products_Users
        foreign key (user_id) references users (user_id)
);

create table orders
(
    order_id     int auto_increment,
    order_date   timestamp    not null,
    shipped_date timestamp    null,
    status       varchar(45)  null,
    comment      varchar(255) null,
    user_id      int          not null,
    primary key (order_id),
    constraint fk_Orders_Users1
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
    product_id int                                 not null,
    order_id   int                                 not null,
    rating     tinyint                             null,
    review     text                                null,
    created_at timestamp default CURRENT_TIMESTAMP null,
    primary key (review_id),
    constraint fk_Reviews_Products1
        foreign key (product_id) references products (product_id),
    constraint reviews_orders_order_id_fk
        foreign key (order_id) references orders (order_id)
);


create table product_images
(
    image_id   int auto_increment
        primary key,
    product_id int          not null,
    image_path varchar(255) null,
    constraint productimages_ibfk_1
        foreign key (product_id) references products (product_id)
);


create table payments
(
    payment_id     tinyint auto_increment
        primary key,
    payment_method varchar(45)                         null,
    order_id       int                                 null,
    amount         int                                 not null,
    payment_date   timestamp default CURRENT_TIMESTAMP null,
    constraint payment_id_UNIQUE
        unique (payment_id),
    constraint payments___fk
        foreign key (order_id) references orders (order_id)
);



create table order_details
(
    order_id   int     not null auto_increment,
    product_id int     not null,
    quantity   tinyint not null,
    primary key (order_id, product_id),
    constraint fk_Orders_has_Products_Orders1
        foreign key (order_id) references orders (order_id),
    constraint fk_Orders_has_Products_Products1
        foreign key (product_id) references products (product_id)
);

create table cart
(
    cart_id    int auto_increment
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

