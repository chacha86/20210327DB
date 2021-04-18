# 회원 테이블 생성, loginId, loginPw, `name`
## 조건 : loginId 칼럼에 UNIQUE INDEX 없이

CREATE TABLE t_member(
loginId CHAR(30) NOT NULL,
loginPw CHAR(30) NOT NULL,
`name` CHAR(30) NOT NULL
);

# 회원 2명 생성
## 조건 : (loginId = 'user1', loginPw = 'user1', `name` = '홍길동')
## 조건 : (loginId = 'user2', loginPw = 'user2', `name` = '홍길순')

INSERT INTO t_member SET loginId= 'user1', loginPw='pass1', `name`='홍길동';
INSERT INTO t_member SET loginId= 'user2', loginPw='pass2', `name`='홍길순';

SELECT *
FROM t_member;

# 회원 2배 증가 쿼리만들고 회원이 만명 넘을 때 까지 반복 실행
## 힌트1 : INSERT INTO `tableName` (col1, col2, col3, col4)
## 힌트2 : SELECT NOW(), UUID(), 'pw', '아무개'

INSERT INTO t_member SELECT UUID(), 'pass', '아무개' FROM t_member;


SELECT COUNT(*) FROM t_member;
# 회원수 확인

# 검색속도 확인
## 힌트 : SQL_NO_CACHE

SELECT SQL_NO_CACHE * FROM t_member WHERE loginId = 'user1';


# 유니크 인덱스를 loginID 칼럼에 걸기
## 설명 : mysql이 loginId의 고속검색을 위한 부가데이터를 자동으로 관리(생성/수정/삭제) 한다.
## 설명 : 이게 있고 없고가, 특정 상황에서 어마어마한 성능차이를 가져온다.
## 설명 : 생성된 인덱스의 이름은 기본적으로 칼럼명과 같다.
CREATE INDEX mem_idx ON t_member(loginId);

# 검색속도 확인, loginId 가 'user1' 인 회원 검색
SELECT SQL_NO_CACHE * FROM t_member WHERE loginId = 'user1';

# loginPw로 검색하는 속도와 비교
SELECT SQL_NO_CACHE * FROM t_member WHERE loginPw = 'pass1';










