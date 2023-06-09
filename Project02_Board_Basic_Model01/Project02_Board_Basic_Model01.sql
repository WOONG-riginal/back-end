/*
	프로젝트명 : Project02_Board_Basic_Model01
	작업명 : 방식2 Model1 게시판 만들기
	로그인 테이블명 : bb_member
	게시판 테이블명 : bb_board
 */

-- 테이블 있으면 삭제
drop table bb_member;
drop table bb_board;

-- #1. 로그인 bb_member 테이블

-- bb_member 테이블 만들기
-- 컬럼명 = id(20), pass1(20), email(50), tel(20), hobby(100), job(30), age(20), info(500)
-- 타입 모두 문자타입
-- pk = id
create table bb_member(
    id  varchar2(20)  primary key,
    pass1  varchar2(20),
    email  varchar2(50),
    tel  varchar2(20),
    hobby  varchar2(100),
    job  varchar2(30),
    age  varchar2(20),
    info  varchar2(500)
);

-- 테스트 데이터 삽입
insert into bb_member VALUES (
	'w','1111','w@ezen.com','01023456789','취미','직업','20','정보'
);
select * from bb_member;
commit;

------------------------------------------------------------------------------------------------


-- #2. 게시판 bb_board 테이블

-- bb_board 테이블 만들기
-- 컬럼명 = num, writer(30), email(30), subject(100), password(20), reg_date(30), ref, re_step, re_level, readcount, content(1000)
-- 타입 별도 지정 이외에는 문자타입
-- num, ref,re_step,re_level,readcount = 숫자
-- pk = num

create table bb_board(
    num  number  primary key,
    writer  varchar2(30),
    email  varchar2(30),
    subject  varchar2(100),
    password  varchar2(20),
    reg_date  varchar2(30),
    ref  number,
    re_step  number,
    re_level  number,
    readcount  number,
    content  varchar2(1000)
);
select * from bb_board;

-- 시퀀스 만들기
create SEQUENCE bb_board_seq INCREMENT by 1 START with 1;

-- 테스트 값 입력
insert into bb_board
values(
bb_board_seq.nextval,'글쓴이','w@ezen.com','글제목','1111',sysdate,1,0,0,0,'콘텐츠내용'
);

-- ref 최대값 조회
select max(ref) from bb_board;

-- 계층형 게시판 쿼리문
select * from bb_board order by ref desc, re_level asc, re_step asc;

-- 조회수 증가 쿼리문 (이전보다 간략하게 작성 가능)
update bb_board set readcount=readcount+1 where num=1;

-- 답글 추가 쿼리문 (제목은 ||를 이용해서 조합)
insert into bb_board values(
bb_board_seq.nextval,'글쓴이','w@ezen.com','RE'||'글제목','1111',sysdate,ref,re_step,re_level,0,'콘텐츠내용'
);


-- 최종 적용
commit;