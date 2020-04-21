CREATE TABLE `product` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `adress_id` int,
  `producteur_id` int,
  `name` varchar(255) NOT NULL,
  `promoted` boolean NOT NULL,
  `price_euro` int NOT NULL,
  `price_cents` int NOT NULL,
  `quantity` int,
  `description` varchar(255),
  `mesure_unit` varchar(1),
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `productor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `adress_id` int,
  `article_id` int,
  `picture` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `article` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `picture` varchar(255),
  `content` varchar(255) NOT NULL
);

CREATE TABLE `product_article` (
  `product_id` int,
  `article_id` int
);

CREATE TABLE `adress` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `adress` varchar(255),
  `city_id` int
);

CREATE TABLE `city` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `region_id` int
);

CREATE TABLE `region` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `country_id` int,
  `region_code` int,
  `name` varchar(255)
);

CREATE TABLE `country` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `country_code` int,
  `name` varchar(255)
);

CREATE TABLE `type` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL,
  `icon` varchar(255) NOT NULL,
  `product_id` int
);

CREATE TABLE `workfield` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) UNIQUE NOT NULL,
  `icon` varchar(255) NOT NULL,
  `producteur_id` int
);

CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `username` varchar(255) UNIQUE NOT NULL,
  `email` varchar(255) UNIQUE NOT NULL,
  `date_of_birth` datetime,
  `password` varchar(255) NOT NULL,
  `adress_id` int
);

CREATE TABLE `stock` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int,
  `quantity` int
);

ALTER TABLE `product` ADD FOREIGN KEY (`adress_id`) REFERENCES `adress` (`id`);

ALTER TABLE `productor` ADD FOREIGN KEY (`id`) REFERENCES `product` (`producteur_id`);

ALTER TABLE `adress` ADD FOREIGN KEY (`id`) REFERENCES `productor` (`adress_id`);

ALTER TABLE `article` ADD FOREIGN KEY (`id`) REFERENCES `productor` (`article_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`id`) REFERENCES `product_article` (`product_id`);

ALTER TABLE `article` ADD FOREIGN KEY (`id`) REFERENCES `product_article` (`article_id`);

ALTER TABLE `city` ADD FOREIGN KEY (`id`) REFERENCES `adress` (`city_id`);

ALTER TABLE `region` ADD FOREIGN KEY (`id`) REFERENCES `city` (`region_id`);

ALTER TABLE `country` ADD FOREIGN KEY (`id`) REFERENCES `region` (`country_id`);

ALTER TABLE `product` ADD FOREIGN KEY (`id`) REFERENCES `type` (`product_id`);

ALTER TABLE `workfield` ADD FOREIGN KEY (`producteur_id`) REFERENCES `productor` (`id`);

ALTER TABLE `adress` ADD FOREIGN KEY (`id`) REFERENCES `user` (`adress_id`);

ALTER TABLE `stock` ADD FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
