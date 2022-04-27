create table Product(product_id BIGINT auto_increment primary key,
member_id BIGINT,
trade_status ENUM('buy', 'sell'),
title VARCHAR(300),
category ENUM('errand', 'walk', 'install', 'study', 'clean'),
trading_status ENUM('basic', 'reservation', 'completion'),
trading_place VARCHAR(50),
start_date DATE,
end_date DATE,
price BIGINT,
description VARCHAR(5000),
CONSTRAINT Product_FK_member_id FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

create table Product_Image(member_image_id BIGINT auto_increment primary key,
product_id BIGINT,
store_img_name VARCHAR(50),
CONSTRAINT Product_Image_FK_product_id FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE Cascade,
CONSTRAINT Product_Image_UK_store_img_name UNIQUE (store_img_name)
);

create table Trading_Info(trading_info_id BIGINT auto_increment primary key,
member_id BIGINT,
product_id BIGINT,
grade TINYINT,
CONSTRAINT Trading_Info_FK_member_id FOREIGN KEY (member_id) REFERENCES Member(member_id),
CONSTRAINT Trading_Info_FK_product_id FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

create table Member(member_id BIGINT auto_increment primary key,
id VARCHAR(25),
nickname VARCHAR(25),
password VARCHAR(25),
self_introduction VARCHAR(2000),
address VARCHAR(50),
email VARCHAR(40),
phone_number VARCHAR(20),
constraint Member_UK_id UNIQUE (id),
constraint Member_UK_nickname UNIQUE (nickname)
);

create table Member_Image(member_image_id BIGINT auto_increment primary key,
member_id BIGINT,
store_img_name VARCHAR(50),
constraint Member_Image_FK_member_id FOREIGN KEY(member_id)REFERENCES Member(member_id) ON DELETE CASCADE,
constraint Member_Image_UK_store_img_name UNIQUE (store_img_name)
);
