CREATE DATABASE `d_kosmetik`;
USE `d_kosmetik`;

-- Create table `customers`
CREATE TABLE `customers` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(255) DEFAULT NULL,
  `email` VARCHAR(255) DEFAULT NULL,
  `phone_number` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- Create table `products`
CREATE TABLE `products` (
  `product_id` INT(11) NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) DEFAULT NULL,
  `brand` VARCHAR(255) DEFAULT NULL,
  `category` VARCHAR(50) DEFAULT NULL,
  `price` DECIMAL(10,2) DEFAULT NULL,
  `stock` INT(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- Create table `orders`
CREATE TABLE `orders` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) DEFAULT NULL,
  `order_date` DATE DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- Create table `order_items`
CREATE TABLE `order_items` (
  `order_item_id` INT(11) NOT NULL AUTO_INCREMENT,
  `order_id` INT(11) DEFAULT NULL,
  `product_id` INT(11) DEFAULT NULL,
  `quantity` INT(11) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4;

-- Insert data into `customers` table
INSERT INTO `customers` (`customer_name`, `email`, `phone_number`) VALUES
('John Doe', 'john.doe@example.com', '081234567890'),
('Jane Smith', 'jane.smith@example.com', '082345678901'),
('Alice Johnson', 'alice.johnson@example.com', '083456789012');

-- Insert data into `products` table
INSERT INTO `products` (`product_name`, `brand`, `category`, `price`, `stock`) VALUES
('Lipstick', 'BrandA', 'Makeup', 150000.00, 100),
('Moisturizer', 'BrandB', 'Skincare', 250000.00, 50),
('Shampoo', 'BrandC', 'Haircare', 100000.00, 200);

-- Insert data into `orders` table
INSERT INTO `orders` (`customer_id`, `order_date`) VALUES
(1, '2024-05-20'),
(2, '2024-05-21'),
(3, '2024-05-22');

-- Insert data into `order_items` table
INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 5),
(3, 1, 3),
(3, 2, 2),
(3, 3, 1);
