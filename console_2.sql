USE case_study_3;
INSERT INTO users (username, password, phone, email, role, full_name, birthday, avatar_path)
VALUES ('john_doe', 'password123', '1234567890', 'john.doe@example.com', 'customer', 'John Doe', '1990-01-01', NULL);

INSERT INTO users (username, password, phone, email, role, full_name, birthday, avatar_path)
VALUES ('jane_doe', 'password123', '0987654321', 'jane.doe@example.com', 'seller', 'Jane Doe', '1995-01-01', NULL);

INSERT INTO categories (category_id, category_name)
VALUES (1, 'Electronics');

INSERT INTO categories (category_id, category_name)
VALUES (2, 'Clothing');

INSERT INTO categories (category_id, category_name)
VALUES (3, 'Home and Garden');


INSERT INTO products (product_id, product_name, price, description, user_id, category_id, quantity_in_stock)
VALUES (1, 'iPhone 12', 999, 'A high-end smartphone from Apple', 2, 1, 10);

INSERT INTO products (product_id, product_name, price, description, user_id, category_id, quantity_in_stock)
VALUES (2, 'Samsung Galaxy S21', 899, 'A high-end smartphone from Samsung', 2, 1, 15);

INSERT INTO products (product_id, product_name, price, description, user_id, category_id, quantity_in_stock)
VALUES (3, 'Men\'s T-shirt', 25, 'A comfortable and stylish T-shirt for men', 2, 2, 20);

INSERT INTO products (product_id, product_name, price, description, user_id, category_id, quantity_in_stock)
VALUES (4, 'Women\'s Dress', 50, 'A beautiful and elegant dress for women', 2, 2, 5);

INSERT INTO products (product_id, product_name, price, description, user_id, category_id, quantity_in_stock)
VALUES (5, 'Kitchen Knife Set', 99, 'A high-quality set of kitchen knives', 2, 3, 8);

INSERT INTO addresses (user_id, details, ward, district, city)
VALUES (1, '123 Main St', 'Ward 1', 'District A', 'City X');

INSERT INTO addresses (user_id, details, ward, district, city)
VALUES (2, '456 Park Ave', 'Ward 2', 'District B', 'City Y');

INSERT INTO reviews (rating, review, product_id)
VALUES (4, 'Great phone!', 1);

INSERT INTO reviews (rating, review, product_id)
VALUES (5, 'Love this dress!', 4);

INSERT INTO product_images (product_id, image_path)
VALUES (1, 'images/iphone12.jpg');

INSERT INTO product_images (product_id, image_path)
VALUES (2, 'images/samsungs21.jpg');

INSERT INTO product_images (product_id, image_path)
VALUES (4, 'images/womensdress.jpg');

INSERT INTO payments (payment_method, order_id, amount)
VALUES ('Credit Card', 1, 999);

INSERT INTO payments (payment_method, order_id, amount)
VALUES ('PayPal', 2, 50);


INSERT INTO orders (order_date, shipped_date, status, comment, user_id, payment_id)
VALUES ('2022-01-01 10:00:00', '2022-01-02 10:00:00', 'Shipped', 'Thanks for your order!', 1, 1);

INSERT INTO orders (order_date, status, comment, user_id, payment_id)
VALUES ('2022-01-03 10:00:00', 'Pending', 'Processing your order', 2, 2);


INSERT INTO order_details (order_id, product_id, quantity)
VALUES (1, 1, 1);

INSERT INTO order_details (order_id, product_id, quantity)
VALUES (1, 2, 1);

INSERT INTO order_details (order_id, product_id, quantity)
VALUES (2, 4, 1);


INSERT INTO cart (user_id, product_id, quantity)
VALUES (1, 1, 2);

INSERT INTO cart (user_id, product_id, quantity)
VALUES (2, 3, 1);

