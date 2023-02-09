#MyBatis

### 5단계
1.관리자
- 유저목록 페이지 (유저 강제 삭제)
- 구매목록 페이지(모든 구매자의 구매목록 확인)
- 회원정보 페이지(회원정보 수정)

2.구매자
- 구매 취소
- 회원정보 페이지 (회원정보 수정,회원탈퇴)

3.Ajax 유효성 검사
- 아이디중복체크
- 아이디 변경 감지
- 회원가입 시 아이디/비밀번호 공백 막기
- 회원가입 시 아이디/이메일 형식 체크
- 상품 등록 시 상품명 공백 막기
- 상품등록 시 상품가격/상품수량 형식 체크


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
