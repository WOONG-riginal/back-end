/*
	프로젝트명 : Chap10_DbConnection
	작업명 : JSP 기초 DB접속 CRUD + 회원가입 => 커넥션풀 사용
	테이블명 : b_member
 */
-- 기존 게시판 지우고 시작 = 혹시 있으면 테이블 삭제 => 테이블이 없으면 오류 발생
drop table b_member;
-- 회원가입 테이블
create table b_member(
    id  varchar2(20)  primary key,
    pwd  varchar2(20)  NOT NULL,
    name  varchar2(20)  NOT NULL,
    email  varchar2(40)  default 'indopop@naver.com'
);
select * from b_member;
desc b_member;

-- 테스트용 데이터 삽입
insert into b_member values(
    'mc','1111','김명철','indopop@naver.com'
);
-- 외부 작업 시 반드시 커밋을 적용시켜줘야 함
commit;

-- 추가 기본 SQL문
select * from b_member;
-- id가 mc인 회원 조회
select * from b_member where id='mc';
-- id가 mc인 회원의 비밀번호 조회
select pwd from b_member where id='mc';

-- 업데이트
update b_member set name='김엠씨',email='mc@naver.com' where id='mc';
-- 삭제
delete from b_member where id='mc';

