create table Member(
member_id BIGINT auto_increment primary key,
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

create table Member_Image(
member_image_id BIGINT auto_increment primary key,
member_id BIGINT,
store_img_name VARCHAR(50),
constraint Member_Image_FK_member_id FOREIGN KEY(member_id) REFERENCES Member(member_id) ON DELETE CASCADE,
constraint Member_Image_UK_store_img_name UNIQUE (store_img_name)
);

create table Service(
service_id BIGINT auto_increment primary key,
member_id BIGINT,
types ENUM('ant', 'grasshopper'),
title VARCHAR(300),
category ENUM('errand', 'walk', 'install', 'study', 'clean'),
status ENUM('basic', 'reservation', 'completion'),
place VARCHAR(50),
start_date DATE,
end_date DATE,
price BIGINT,
description VARCHAR(5000),
CONSTRAINT Service_FK_member_id FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

create table Service_Image(
service_image_id BIGINT auto_increment primary key,
service_id BIGINT,
store_img_name VARCHAR(50),
CONSTRAINT Service_Image_FK_service_id FOREIGN KEY (service_id) REFERENCES Service(service_id) ON DELETE Cascade,
CONSTRAINT Service_Image_UK_store_img_name UNIQUE (store_img_name)
);

create table Trading_Info(
trading_info_id BIGINT auto_increment primary key,
member_id BIGINT,
service_id BIGINT,
grade TINYINT,
CONSTRAINT Trading_Info_FK_member_id FOREIGN KEY (member_id) REFERENCES Member(member_id),
CONSTRAINT Trading_Info_FK_service_id FOREIGN KEY (service_id) REFERENCES Service(service_id)
);

create table Comment (
comment_id BIGINT auto_increment primary key,
member_id BIGINT,
service_id BIGINT,
text VARCHAR(2000),
CONSTRAINT Comment_FK_member_id FOREIGN KEY (member_id) REFERENCES Member(member_id),
CONSTRAINT Comment_FK_service_id FOREIGN KEY (service_id) REFERENCES Service(service_id));
