/*
	프로젝트명 : Project02_Board_Basic_Model02
	작업명 : 방식2 Model2 게시판 만들기
	로그인 테이블명 : b_users
	게시판 테이블명 : b_board
 */

-- 기존 테이블 있는지 확인 후 존재하면 삭제
drop table b_users;
drop table b_board;

-- #1. 로그인 b_users 테이블

-- b_users 테이블 만들기
-- 컬럼명 = id, password, name, role
-- 타입 모두 문자타입
-- pk = id
-- nn = password, name
-- default = role | User
drop table b_users;
create table b_users(
    id  varchar2(20)  primary key,
    password  varchar2(20)  NOT NULL,
    name  varchar2(20)  NOT NULL,
    role  varchar2(20)  default 'User'
);
select * from b_users;
insert into b_users values(
    'w','1111','신현웅','Admin'
);
-- 로그인 쿼리문
select * from b_users where id='w' and password='1111';

-- #2. 게시판 b_board 테이블

-- b_board 테이블 만들기
-- 컬럼명 = seq, title, nickname, content, regdate, cnt, userid
-- 타입 별도 지정 이외에는 문자타입
-- seq = 숫자, regdate = date 디폴트 sysdate, cnt = 숫자 디폴트 0
-- pk = seq
-- nn = title, nickname, content

drop table b_board;
create table b_board(
    seq  number(5)  primary key,
    title  varchar2(200)  NOT NULL,
    nickname  varchar2(30)  NOT NULL,
    content  varchar2(2000)  NOT NULL,
    regdate  date  default sysdate,
    cnt  number(5)  default 0,
    userid  varchar2(8)
);
select * from b_board;
insert into b_board(seq,title,nickname,content,regdate,userid) values(
    1,'첫번째 게시물','웅','첫번째 게시물 내용','2023-04-20','woong'
);

-- 글 번호 nvl처리 + 1씩 증가하도록
insert into b_board(seq,title,nickname,content) values(
    (select nvl(max(seq),0)+1 from b_board),'글제목','글쓴이','글내용'
);

-- 정렬하여 조회
select * from b_board order by seq desc;

-- 조회수 증가 쿼리문
-- 글번호 2번에 cnt 1이 되도록 쿼리문 작성
update b_board set cnt=(select cnt+1 from b_board where seq=2) where seq=2;
-- 해당 글번호 레코드 셋 조회
select * from b_board where seq=2;
-- 해당 글 수정하기
update b_board set title='변경제목',content='변경내용' where seq=3;
-- 해당 글 삭제하기
delete from b_board where seq=3;


-- 최종 적용
commit;