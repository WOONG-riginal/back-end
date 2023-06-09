-- 1. 로그인 exam_users 테이블

-- exam_users 테이블 만들기
-- 컬럼명 = id, password, name, role
-- 타입 = 모든 문자타입
-- pk = id
-- nn = password, name
-- default = role | User
drop TABLE exam_users;

CREATE TABLE exam_users (
    id          VARCHAR2(20) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    nickname VARCHAR2(20) NOT NULL,
    role VARCHAR2(20) DEFAULT 'User'
);    
select * from exam_users;
DESC exam_users;

-- 테스트
INSERT INTO exam_users (id, password, name, nickname, role) VALUES ('FL', '3333', '이름','별명', 'Admin');
-- 로그인 쿼리문
select * from exam_users where id = 'FL' and password = '3333';


-- 2. 게시판 exam_board 테이블
-- 게시판 exam_board 테이블
-- 컬럼명 = seq, title, nickname, content, regdate, cnt, userid
-- 타입 = 별도 지정 이외에는 문자타입
-- seq = 숫자, regdate = date 디폴트 값 sysdate, cnt 숫자 디폴트 0
-- pk = seq
-- nn = title, nickname, content


CREATE TABLE exam_board(
    seq         NUMBER(5)   PRIMARY KEY,
    regdate     date        DEFAULT sysdate,
    cnt         NUMBER(5)    DEFAULT 0,
    title       VARCHAR2(200) NOT NULL,
    nickname    VARCHAR2(30) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    userid       VARCHAR2(8)
);
SELECT * FROM exam_board;
DESC exam_board;

-- 테스트
INSERT INTO exam_board (seq, title, nickname, content, regdate, userid)
VALUES (
    1, '첫번째 게시물', '김시험', '첫번째 게시물 내용', '2023-04-27', 'gim'
);

-- 레코드 셋 정렬하여 조회
select * from exam_board order by seq desc
-- 최종 적용
COMMIT;
-- 조회수 증가 쿼리
-- 글번호 2번에 ctn1이 되도록 쿼리문 작성
update exam_board set cnt = (select cnt +1 from exam_board where seq=2) where seq = 2; 
-- 해당 글 번호 2번 레코드 셋 조회
select * from exam_board where seq = 2;
update exam_board set title = '첫글', content='안녕하세요' where seq = 2;
DELETE FROM exam_board WHERE seq = 25;
    