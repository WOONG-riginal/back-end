drop table b_users;
drop table b_board;

CREATE TABLE b_users (
    id          VARCHAR2(20) PRIMARY KEY,
    password VARCHAR2(20) NOT NULL,
    name VARCHAR2(20) NOT NULL,
    nickname VARCHAR2(20) NOT NULL,
    role VARCHAR2(20) DEFAULT 'User'
);    
DESC b_users;
--b_users 출력
SELECT * FROM b_users;
-- 테스트
INSERT INTO b_users (id, password, name, nickname, role) VALUES ('FL', '3333', '시험', '플롯레프트','Admin');
--(로그인 쿼리문)b_users 아이디, 비밀번호 출력
SELECT * from b_users where id='FL' and password= '3333';

delete from b_users where id='gg';

CREATE TABLE b_board(
    seq         NUMBER(5)   PRIMARY KEY,
    regdate     date        DEFAULT sysdate,
    cnt         NUMBER(5)    DEFAULT 0,
    title       VARCHAR2(200) NOT NULL,
    nickname    VARCHAR2(30) NOT NULL,
    content     VARCHAR2(2000) NOT NULL,
    userid       VARCHAR2(8)
);
--b_board 출력
SELECT *  FROM b_board;

DESC b_board;

--새글등록
insert into b_board(seq,title,nickname,content) values((select nvl(max(seq),0)+1 from b_board),'제목','작성자','글내용' );
--글목록
SELECT * FROM b_board ORDER BY seq desc;
--글 상세보기
SELECT * FROM b_board WHERE seq=1;
--조회수 업데이트
UPDATE b_board SET cnt=(select cnt +1 FROM b_board where seq = 1) where seq = 1;
--글수정
update b_board set title = '새제목', content ='새내용' where seq = 1;
--글삭제
delete from b_board where seq=1;
--커밋
commit;