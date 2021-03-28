# 제약 조건 -> 데이터를 올바르게 정확하게 저장하기 위해서 (무결성)
# 키 

# 기존에 t1 데이터베이스가 존재 한다면 삭제
DROP DATABASE IF EXISTS t1;

# 새 데이터베이스(`t1`) 생성
CREATE DATABASE t1;

USE t1;

# article 테이블 생성(칼럼은 id, title, body)
CREATE TABLE article(
    id INT(5),
    title CHAR(50),
    `body` TEXT
);

SELECT * 
FROM article;

# id 없는 테스트 데이터 등록
INSERT INTO article
SET title = '제목1',
`body` = '내용1';

# 데이터 조회
SELECT *
FROM article;

# id가 NULL인 데이터 생성이 가능하네?
# id 데이터는 꼭 필수 이기 때문에 NULL을 허용하지 않게 바꾼다.
# 테이블 생성시 컬럼 구조 정의 할 때 정할 수 있다.
# 테이블 수정을 통해서 제약을 추가및 삭제 할 수 있다.
# NULL 허용 X

# 테이블 데이터말고 구조만 보고 싶을 때.
DESC article; # 테이블 구조 확인

ALTER TABLE article MODIFY id INT(5) NOT NULL;

# 기존의 NULL값 때문에 경고가 뜬다.
# 기존의 NULL값이 0으로 바뀐다.

# id 없는 테스트 데이터 등록
DELETE FROM article;


# 키 등록
# 생각해 보니 모든 행(row)의 id 값은 유니크 해야한다.
# alter를 이용해 id 칼럼의 옵션에 null 허용하지 않음과 유니크 옵션 붙이기.
ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE;

# id 중복 제거
# 오류가 난다. 왜냐하면 기존의 데이터 중에서 중복되는 값이 있다.
UPDATE article
SET id = 1
LIMIT 1;

UPDATE article
SET id = 2
WHERE id = 0;

SELECT *
FROM article;

# 테이블 생성시 주키 등록 (primary key) => NULL 허용하지 않으면서 중복 허용 X

# id 없는 테스트 데이터 2개 등록
INSERT INTO article
SET title = '제목5',
`body` = '내용5';

# 자동 증가 제약 (AUTO_INCREMENT)
ALTER TABLE article MODIFY id INT(5) NOT NULL UNIQUE AUTO_INCREMENT;


# 테이블 생성 시 제약 조건 

DROP DATABASE IF EXISTS t1;

# 새 데이터베이스(`t1`) 생성
CREATE DATABASE t1;

USE t1;

# article 테이블 생성(칼럼은 id, title, body)
CREATE TABLE article(
    id INT(5) PRIMARY KEY AUTO_INCREMENT,
    title CHAR(50) NOT NULL,
    `body` TEXT NOT NULL
);

DESC article;
