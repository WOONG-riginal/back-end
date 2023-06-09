
-- 회원 멤버 테이블 생성
create table fl_member(
    id varchar2(20) primary key,
    password varchar2(20) not null,
    name varchar2(30) not null,
    role varchar2(20) default 'User',
    email varchar2(30) not null,
    tel varchar2(11) not null,
    hobby varchar2(100) not null,
    job varchar2(30) check(job in('훈련교사','훈련생','웹개발자','웹디자이너')),
    age varchar2(30) check(age in('10대','20대','30대','40대')),
    info varchar2(3000)
);
select * from fl_member;
select * from b_board;

drop table fl_member;

-- 회원 유저 데이터 삽입
insert into fl_member values(
    'w','1111','신현웅','Admin','w@ezen.com','01023456789','음악','훈련생','30대','내용 무'
);
commit;