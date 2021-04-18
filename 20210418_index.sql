# ȸ�� ���̺� ����, loginId, loginPw, `name`
## ���� : loginId Į���� UNIQUE INDEX ����

CREATE TABLE t_member(
loginId CHAR(30) NOT NULL,
loginPw CHAR(30) NOT NULL,
`name` CHAR(30) NOT NULL
);

# ȸ�� 2�� ����
## ���� : (loginId = 'user1', loginPw = 'user1', `name` = 'ȫ�浿')
## ���� : (loginId = 'user2', loginPw = 'user2', `name` = 'ȫ���')

INSERT INTO t_member SET loginId= 'user1', loginPw='pass1', `name`='ȫ�浿';
INSERT INTO t_member SET loginId= 'user2', loginPw='pass2', `name`='ȫ���';

SELECT *
FROM t_member;

# ȸ�� 2�� ���� ��������� ȸ���� ���� ���� �� ���� �ݺ� ����
## ��Ʈ1 : INSERT INTO `tableName` (col1, col2, col3, col4)
## ��Ʈ2 : SELECT NOW(), UUID(), 'pw', '�ƹ���'

INSERT INTO t_member SELECT UUID(), 'pass', '�ƹ���' FROM t_member;


SELECT COUNT(*) FROM t_member;
# ȸ���� Ȯ��

# �˻��ӵ� Ȯ��
## ��Ʈ : SQL_NO_CACHE

SELECT SQL_NO_CACHE * FROM t_member WHERE loginId = 'user1';


# ����ũ �ε����� loginID Į���� �ɱ�
## ���� : mysql�� loginId�� ��Ӱ˻��� ���� �ΰ������͸� �ڵ����� ����(����/����/����) �Ѵ�.
## ���� : �̰� �ְ� ����, Ư�� ��Ȳ���� ���� �������̸� �����´�.
## ���� : ������ �ε����� �̸��� �⺻������ Į����� ����.
CREATE INDEX mem_idx ON t_member(loginId);

# �˻��ӵ� Ȯ��, loginId �� 'user1' �� ȸ�� �˻�
SELECT SQL_NO_CACHE * FROM t_member WHERE loginId = 'user1';

# loginPw�� �˻��ϴ� �ӵ��� ��
SELECT SQL_NO_CACHE * FROM t_member WHERE loginPw = 'pass1';










