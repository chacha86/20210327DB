SELECT * FROM t_user WHERE id = 1;
SELECT * FROM t_product WHERE id = 2;



SELECT * 
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id;


# MySql DB를 효율적으로 사용하기 위함
# 함수의 형태로 유용한 기능들을 제공.

# 1. 손흥민의 주문 개수는?
SELECT COUNT(*) 
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
WHERE u.userName = '손흥민';

# 2. 손흥민이 산 상품은?

SELECT DISTINCT p.* 
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE u.userName = '손흥민';

# 3. 스커트를 산 사람은?
# 중복데이터(행) - 중복 제거 키워드

SELECT DISTINCT u.* 
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE p.pname = '스커트';


# 4. 가장 많이 주문한 사람의 아이디와 이름, 주문개수는?

SELECT * 
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id;

# distinct -> 오직 중복데이터를 없애기 위한 용도
# 각 그룹이 합쳐지기 전의 데이터를 싹 무시함.
SELECT DISTINCT COUNT(u.userId)
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
ORDER BY userId;

# group by -> 그룹별 데이터 집계 가능
# 각 그룹이 합쳐지기 전의 데이터를 기억함.
SELECT u.userId, u.userName, COUNT(u.userId) cnt
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
GROUP BY u.userId
ORDER BY cnt DESC, u.userId ASC;



# sum() - 집계함수
# 5. 소지섭이 사용한 총 금액은? 130000
SELECT SUM(price) s
FROM t_order o
INNER JOIN t_user u
ON o.userNo = u.id
INNER JOIN t_product p
ON o.productNo = p.id
WHERE u.userName = '소지섭';

# 집계함수 : count, sum, min, max, avg


SHOW DATABASES;

USE s1;

SHOW TABLES;

SELECT * FROM t_order;



