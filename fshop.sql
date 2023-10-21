SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


create database fshop;
use fshop;


create table f_admin (
	admin_id  int auto_increment not null,
    admin_name varchar(200) not null,
    admin_password varchar(200) not null ,
    primary key(admin_id)
)engine=InnoDB default charset=utf8;

insert into f_admin values (1,'phongfi','phong2752003.');

create table f_cart(
	cart_id int auto_increment primary key ,
    sanpham_id varchar(200) not null,
    sanpham_tieude varchar(200) not null,
    sampham_chitiet varchar(200) not null,
    sanpham_gia varchar(200) not null,
    sanpham_anh varchar(200) not null,
	quantity varchar(200) not null,
    color_img varchar(200) not null,
    sizesp varchar(200) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE f_color (
  color_id int(11) auto_increment NOT NULL,
  color_name varchar(255) NOT NULL,
  color_img varchar(255) NOT NULL,
  primary key(color_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into f_color values
(1,'White','/image/white.jpg'),
(2,'Black','/image/black.jpg'),
(3,'Brown','/image/brown.jpg'),
(4,'Green','....');

create table role(
	id int auto_increment primary key,
    name varchar(200) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table category(
	id int auto_increment primary key,
    name varchar(200) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into category values
(1,'Home'),
(2,'Sneakers'),
(3,'Clothing'),
(4,'Skateboard'),
(5,'Sales');


CREATE TABLE f_diachi (
  tinh_tp varchar(22)  DEFAULT NULL,
  ma_tinh varchar(2) DEFAULT NULL,
  quan_huyen varchar(29) DEFAULT NULL,
  ma_qh varchar(3) DEFAULT NULL,
  phuong_xa varchar(29) DEFAULT NULL,
  ma_px varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into f_diachi
select tinh_tp, ma_tinh, quan_huyen, ma_qh, phuong_xa, ma_px
from fishop.f_diachi;



create table f_loaisanpham(
	loaisanpham_id int auto_increment primary key,
	category_id int(11) NOT NULL,
	loaisanpham_name varchar(200) NOT NULL,
    foreign key (category_id) references category(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into f_loaisanpham values 
(1,2,'Nike'),
(2,2,'Adidas'),
(3,2,'Converse'),
(4,2,'Puma'),
(5,3,'Polo'),
(6,3,'Shirst'),
(7,3,'T-Shirst'),
(8,3,'Jean'),
(9,3,'Short'),
(10,4,'Vans');

create table f_order(
	order_id int(11) auto_increment primary key not null,
    ordre_date timestamp default current_timestamp,
    
    note varchar(200),
    customer_name varchar(200) not null,
    customer_phone varchar(200) not null,
    customer_tinh varchar(200) not null,
    customer_huyen varchar(200) not null,
    customer_xa varchar(200) not null,
    customer_diachi varchar(200) not null,
    note varchar(200),
    user_id int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table fshop.f_order
add  user_id int;
create table f_order_detail(
	order_id int auto_increment primary key  not null,
    sanpham_id int not null,
    sanpham_tieude varchar(200) not null,
    sanpham_anh varchar(200) not null,
    sanpham_chitiet text NOT NULL,
    quantity int,
    size varchar(50),
	user_id int ,
    oId int
)engine=InnoDB default charset=utf8;
alter table fshop.f_order_detail
change status_ship  user_id int ;






CREATE TABLE f_payment (
  payment_id int auto_increment NOT NULL,
  ship_id int NOT NULL,
  thanhtoan_id int NOT NULL,
  order_date datetime default current_timestamp,
  status int(11) NOT NULL,
  primary key(payment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE f_sanpham (
  sanpham_id int auto_increment primary key,
  sanpham_tieude varchar(200) NOT NULL,
  sanpham_ma varchar(255) collate utf8_vietnamese_ci NOT NULL,
  category_id int NOT NULL,
  loaisanpham_id int(11) NOT NULL,
  discount int,
  quantity int,
  color_id int(11) NOT NULL,
  sanpham_gia varchar(200) NOT NULL,
  sanpham_chitiet text NOT NULL,
  sanpham_anh longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table fshop.f_sanpham
modify column sanpham_anh longtext;
create table f_sp_anh(
	spanh_id int auto_increment primary key,
    sanpham_id int not null,
    sanpham_anh longtext not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table fshop.f_sp_anh
modify column sanpham_anh longtext;

create table f_sizesp(
	sizesp_id int auto_increment primary key,
    category_id int not null,
    sizesp varchar(10) not null
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table fshop.f_sizesp
change loaisanpham_id  category_id int not null;
create table user(
	user_id int auto_increment primary key,
    fullname varchar(50) not null,
    username varchar(50) not null,
    password varchar(200) not null,
    email varchar(200) not null,
    phonenumber varchar(20) not null,
    address varchar(200) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table fshop.user
drop column role_id;

create table f_status(
	status_id int auto_increment primary key,
    status_name varchar(50) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into f_status values
(1,'Trong Kho'),
(2,'Đang đóng gói hàng'),
(3,'Đã bàn giao đơn vị vận chuyển'),
(4,'Đơn hàng đã giao cho shipper'),
(5,'Shipper đang giao hàng cho bạn'),
(6,'Giao thanh cong'),
(7,'Hàng trogn kho đã hết');  

create table f_store(
	store_id int auto_increment primary key not null,
    store_name varchar(200) not null,
    store_address varchar(200) not null,
    store_phone varchar(200) not null,
    store_mail varchar(200) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table f_social(
	social_id int(11) auto_increment primary key not null,
    social_name varchar(50) not null,
    social_link varchar(200) not null,
    social_img varchar(200) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

 create table f_ship(
	ship_id int auto_increment primary key,
    ship_name varchar(100) not null
 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
 insert into f_ship values 
 (1,'GHN'),
 (2,'VN POST'),
 (3,'GHTK'),
 (4,'J&T Express');
 
 create table f_thanhtoan(
	thanhtoan_id int auto_increment primary key,
    thanhtaon_name varchar(100) not null
 )ENGINE=InnoDB DEFAULT CHARSET=utf8;
 insert into f_thanhtoan values 
 (1,'Money'),
 (2,'Paypal'),
 (3,'MasterCard'),
 (4,'Mobile Banking');

create table fshop.f_userinform(
	uId int auto_increment primary key,
    user_id int,
    tinh varchar(200),
    huyen varchar(200),
    xa varchar(200),
    sonha varchar(200)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table fshop.f_cartuser(
	ucart int auto_increment primary key,
    user_id int,
    sanpham_id int,
    sanpham_anh longtext,
    sanpham_price varchar(200),
    sanpham_tieude varchar(200),
    discount int,
    quantity_incart int
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table fshop.f_cartuser
add category_id int;

alter table fshop.f_order
change ordre_date order_date  timestamp default current_timestamp;
alter table fshop.f_order
add status varchar(200);
alter table fshop.f_order_detail
change sanpham_chitiet  sanpham_anh longtext ;
ALTER TABLE fshop.f_order
MODIFY order_date timestamp;

SHOW CREATE TABLE fshop.f_order_detail;
ALTER TABLE fshop.f_order_detail DROP FOREIGN KEY f_order_detail_ibfk_1;

create table f_spout(
	order_id int auto_increment primary key  not null,
    sanpham_id int not null,
    sanpham_tieude varchar(200) not null,
    sanpham_anh varchar(200) not null,
    sanpham_chitiet text NOT NULL,
    quantity int,
    size varchar(50),
	user_id int ,
    oId int
)engine=InnoDB default charset=utf8;
	