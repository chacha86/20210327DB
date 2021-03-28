# article 테이블 만들기 (칼럼은 제목, 내용만)
CREATE TABLE article(
    title CHAR(50),
    `body` TEXT
);

# 제목1, 내용1 데이터 추가
INSERT INTO article 
SET title = '제목1',
`body` = '내용1';

# 제목1, 내용1 데이터 또 하나 추가
INSERT INTO article 
SET title = '제목1',
`body` = '내용1';

# key
# 데이터 조회(게시물 구분 안됨)
SELECT *
FROM article;


# 테이블 구조 수정 - 컬럼 추가, 삭제, 수정, 테이블 명 변경 

# id 컬럼 추가
ALTER TABLE article ADD COLUMN id INT(5);

# id 컬럼 삭제
ALTER TABLE article DROP COLUMN id;

# 데이터 조회(새로 생긴 id 칼럼의 값은 NULL)
SELECT *
FROM article;

# 기존 데이터에 id값 수정 (기존의 컬럼값 변경)
# 데이터 조회(둘다 수정되어 버림..)
UPDATE article 
SET id = 1;

SELECT *
FROM article;

# 기존 데이터 중 1개만 id를 2로 변경
# 한개의 행만 선택 가능.
SELECT * 
FROM article
LIMIT 1;

UPDATE article 
SET id = 2
LIMIT 1;

# 데이터 조회
SELECT * 
FROM article;

# 데이터 조회
# 2번 게시물만 조회
SELECT *
FROM article
WHERE id = 2;

# 2번 게시물, 데이터 삭제 => DELETE

DELETE FROM article WHERE id = 2;

# 데이터 조회
SELECT *
FROM article;

# 1번 게시물 제목을 제목2로 변경 => UPDATE
UPDATE article
SET title = '제목2'
WHERE id = 1;

SELECT *
FROM article;

# 모든 데이터 삭제
DELETE FROM article;
