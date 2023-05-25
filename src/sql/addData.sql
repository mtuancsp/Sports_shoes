use case_study;
INSERT INTO users (username, password, phone, email, role, full_name, birthday, avatar_path, status) VALUES 
('admin', 'admin123', '0123456789', 'admin@example.com', 'admin', 'Admin', '1990-01-01', 'avatar/admin.png', 'active'),
('manager1', 'manager123', '0123456788', 'manager1@example.com', 'manager', 'Manager 1', '1992-05-10', 'avatar/manager1.png', 'active'),
('manager2', 'manager123', '0123456787', 'manager2@example.com', 'manager', 'Manager 2', '1994-08-15', 'avatar/manager2.png', 'active'),
('customer1', 'customer123', '0123456786', 'seller1@example.com', 'customer', 'Seller 1', '1996-03-20', 'avatar/seller1.png', 'active'),
('customer2', 'customer123', '0123456785', 'seller2@example.com', 'customer', 'Seller 2', '1998-06-25', 'avatar/seller2.png', 'active'),
('customer3', 'customer123', '0123456784', 'customer1@example.com', 'customer', 'Customer 1', '2000-09-30', 'avatar/customer1.png', 'active'),
('customer4', 'customer123', '0123456783', 'customer2@example.com', 'customer', 'Customer 2', '2002-12-05', 'avatar/customer2.png', 'active');

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home and Kitchen'),
(4, 'Beauty and Personal Care'),
(5, 'Sports and Outdoors');

INSERT INTO suppliers (supplier_name, phone, email)
VALUES
    ('Supplier A', '0111111111', 'supplierA@example.com'),
    ('Supplier B', '0222222222', 'supplierB@example.com'),
    ('Supplier C', '0333333333', 'supplierC@example.com'),
    ('Supplier D', '0444444444', 'supplierD@example.com'),
    ('Supplier E', '0555555555', 'supplierE@example.com');

INSERT INTO products (product_id, product_name, price, description, supplier_id, category_id, quantity_in_stock) VALUES
(1, 'iPhone 12 Pro Max', 3299, 'A phone with the most advanced pro camera system ever on an iPhone.', 4, 1, 100),
(2, 'Samsung Galaxy S21 Ultra', 2999, 'The ultimate smartphone with an incredible 108MP camera.', 5, 1, 150),
(3, 'Nike Air Force 1', 899, 'A classic sneaker that never goes out of style.', 4, 2, 200),
(4, 'Adidas Ultraboost', 1299, 'A popular running shoe with Boost technology for ultimate comfort.', 5, 2, 300),
(5, 'Instant Pot Duo', 1099, 'A multi-cooker that can replace up to 7 kitchen appliances.', 4, 3, 50),
(6, 'Paris Revitalift Derm Intensives Eye Cream', 299, 'An anti-aging eye cream that reduces wrinkles and puffiness.', 5, 4, 80),
(7, 'Yoga Mat', 299, 'A durable and non-slip mat for yoga and other exercises.', 5, 5, 100);

INSERT INTO orders (order_date, shipped_date, status, comment, user_id) VALUES
('2022-01-01 10:00:00', '2022-01-03 10:00:00', 'shipped', 'Fast delivery, great service!', 6),
('2022-02-02 12:00:00', null, 'processing', 'Can you please include a gift message?', 7),
('2022-03-03 14:00:00', '2022-03-05 14:00:00', 'shipped', 'Thank you for the prompt delivery!', 6),
('2022-04-04 16:00:00', null, 'processing', 'I need this item urgently, please expedite!', 7);

INSERT INTO addresses (user_id, details, ward, district, city) VALUES
(6, '123 Nguyen Hue', 'Ben Nghe', 'Quan 1', 'TP.HCM'),
(7, '456 Le Thanh Ton', 'Ben Nghe', 'Quan 1', 'TP.HCM');

INSERT INTO reviews (product_id, order_id, rating, review) VALUES
(1, 1, 5, 'The camera on this phone is amazing!'),
(2, 1, 4, 'Great phone overall, but a bit heavy.'),
(3, 2, 5, 'Love these sneakers, they are so comfortable!'),
(5, 3, 4, 'The Instant Pot is a game changer for busy weeknights.'),
(6, 4, 3, 'I haven''t seen a huge difference in my wrinkles yet.'),
(7, 4, 5, 'This yoga mat is perfect for my home workouts.');

INSERT INTO product_images (product_id,image_path) VALUES
(1, 'images/iphone12.png'),
(2, 'images/samsungs21.png'),
(3, 'images/nikeairforce1.png'),
(4, 'images/adidasultraboost.png'),
(5, 'images/instantpot.png'),
(6, 'images/lorealrevitalift.png'),
(7, 'images/yogamat.png');

INSERT INTO payments (payment_method, order_id, amount) VALUES
('credit card', 1, 3299),
('cash on delivery', 2, 2999),
('credit card', 3, 1099),
('paypal', 4, 299);

INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(3, 5, 1),
(4, 6, 1),
(4, 7, 1);

INSERT INTO cart (user_id, product_id, quantity) VALUES
(6, 1, 1),
(6, 3, 2),
(7, 2, 1),
(7, 5, 3);