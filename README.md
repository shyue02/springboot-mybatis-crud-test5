#MyBatis

### 5단계
1.유저
- 구매 취소

2.관리자페이지
- 유저 목록 (유저 강제 삭제)
- 구매 목록 (누가 구매했는지 확인)

### 테이블 생성
```sql
create table product(
    product_id int primary KEY auto_increment,
    product_name varchar(20) NOT null,
    product_price INT NOT null,
    product_qty INT NOT null,
    created_at TIMESTAMP NOT null
);

create table user(
	user_id INT PRIMARY KEY auto_increment,
	user_name VARCHAR(20) NOT null,
	user_password VARCHAR(20) NOT null,
	user_email VARCHAR(20) NOT null,
	role VARCHAR(20) NOT null,
	created_at TIMESTAMP NOT null
);

create table orders(
    orders_id int primary KEY auto_increment,
    orders_name varchar(20) NOT null,
    orders_price int NOT null,
    orders_qty int NOT null,
    product_id int NOT null,
    user_id int NOT null,
    created_at TIMESTAMP
);
```

### 더미데이터
```sql
INSERT INTO product(product_name, product_price, product_qty, created_at) VALUES('바나나', 3000, 98, NOW());
INSERT INTO product(product_name, product_price, product_qty, created_at) VALUES('딸기', 2000, 100, NOW());

INSERT INTO user(user_name, user_password, user_email, role, created_at) VALUES ('ssar', '1234', 'ssar@nate.com', 'user', NOW());
INSERT INTO user(user_name, user_password, user_email, role, created_at) VALUES ('kaka', '1234', 'kaka@nate.com', 'user', NOW());
INSERT INTO user(user_name, user_password, user_email, role, created_at) VALUES ('admin', '1234', 'admin@nate.com', 'admin', NOW());

INSERT INTO orders(orders_name, orders_price, orders_qty, product_id, user_id, created_at) VALUES ('바나나', 3000, 2, 1, 1, NOW());
INSERT INTO orders(orders_name, orders_price, orders_qty, product_id, user_id, created_at)  VALUES ('딸기', 2000, 5, 2, 2, NOW());
```
