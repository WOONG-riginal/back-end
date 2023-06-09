/*
	프로젝트명 : Floatleft_Project_BBQ
	작업명 : BBQ 웹자바 구현
	메뉴 테이블명 : bbq_menu
	고객센터 테이블명 : bbq_board
	회원 테이블명 : bbq_member
*/

-- 기존 테이블 있는지 확인 후 존재하면 삭제
drop table bbq_menu;
drop table bbq_board;
drop table bbq_member;

-- 메뉴 테이블명 : bbq_menu 테이블
drop table bbq_menu;

create table bbq_menu(
    menuno number primary key,
    menu varchar2(100) not null,
    img varchar2(200) not null,
    price varchar2(50) not null,
    category varchar2(100) not null,
    info varchar2(2000) not null,
    allergy varchar2(200),
    nutri1 number,
    nutri2 number,
    nutri3 number,
    nutri4 number,
    nutri5 number,
    origin varchar2(100)
);


-- DB에 데이터 추가
insert into bbq_menu values(1,'바삭갈릭(레몬보이500ml 증정)', '바삭갈릭_20230428.jpg', '21,000원', '신메뉴 (갈리시오소)', '(출시기념 레몬보이500ml 증정) 겉은 바삭하고 속은 육즙 가득한 부드러움이 매력인 시그니처 메뉴로 황금올리브치킨에 갈릭의 풍미를 더한 후라이드 치킨', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 310.72, 2.38, 18.29, 3.77, 520.41,'닭고기: 국내산');
insert into bbq_menu values(2,'단짠갈릭(레몬보이500ml 증정)', '단짠갈릭_20230428.jpg', '23,000원', '신메뉴 (갈리시오소)', '(출시기념 레몬보이500ml 증정) 알싸한 마늘향과 소이 소스의 하모니. 풍부한 감칠 맛이 살아 있는 간장에 허니가 사르르 스며들어, 단짠의 극치를 느낄 수 있는 양념 치킨', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 309.41, 5.40, 15.79, 3.52, 596.57, '닭고기: 국내산');
insert into bbq_menu values(3,'착착갈릭(레몬보이500ml 증정)', '착착갈릭_20230428.jpg', '24,000원', '신메뉴 (갈리시오소)', '(출시기념 레몬보이500ml 증정) 갈릭 후레이크가 더해져 폭발하는 풍미를 자랑하는 갈릭의 풍미를 극대화한 리치하고 풍부한 맛의 후레이크 양념치킨', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩, 아황산류', 321.86, 5.12, 16.23, 3.65, 559.12,  '닭고기: 국내산');


insert into bbq_menu values(4,'황금올리브치킨™', '황금올리브치킨.png', '20,000원', '후라이드', '겉은 바삭 육즙 가득한 부드러운 속살이 환상적인 건강한 치킨, 비비큐의 시그니처 메뉴 후라이드의 대명사 황금올리브치킨™', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 253.72, 0.36, 18.77, 2.86, 408.19,  '닭고기: 국내산');
insert into bbq_menu values(5,'황금올리브치킨™(순살)' , '황금올리브치킨 순살.png', '22,000원', '후라이드', '담백하고 고소~한 순살 치킨', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 311.14, 0.78, 21.39, 3.59, 412.93,  '닭고기: 국내산');
insert into bbq_menu values(6,'황금올리브치킨™(닭다리)', '황금올리브치킨 닭다리.png', '21,000원', '후라이드', '육즙 가득~하고 쫄깃한 닭다리', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 243.78, 0.96, 20.78, 2.68, 469.4,  '닭고기: 국내산');
insert into bbq_menu values(7,'황금올리브치킨™속안심', '황금올리브치킨 속안심.png', '19,000원', '후라이드', '닭 한마리에 50g만 나오는 귀한 속안심을 정성스레 조리한 순살치킨 치킨텐더', '우유, 대두, 밀, 닭고기, 쇠고기, 새우, 땅콩',  269.1, 1.74, 23.94, 2.41, 636.9,  '닭고기: 국내산');
insert into bbq_menu values(8,'황금올리브치킨™핫윙', '황금올리브치킨 핫윙.png', '20,000원', '후라이드', '매콤한 소스가 바삭한 겉면과, 촉촉한 날개 속살에 잘 베어든 스파이시 윙', '우유, 대두, 밀, 계란, 새우, 땅콩', 313.01, 5.12, 17.09, 3.84, 541.01,  '닭고기: 국내산(냉동육)');
insert into bbq_menu values(9,'황금올리브치킨™핫윙(냉장)', '황금올리브치킨 핫윙.png', '23,000원', '후라이드', '매콤한 소스가 바삭한 겉면과, 촉촉한 날개 속살에 잘 베어든 스파이시 윙', '우유, 대두, 밀, 계란, 새우, 땅콩', 313.01, 0, 17.09, 3.84, 541.01,  '닭고기: 국내산');
insert into bbq_menu values(10,'핫황금올리브치킨™크리스피', '핫황금올리브치킨 크리스피.png', '21,000원', '후라이드', '핫하고 빠삭한 맛 핫빠! 크리스피', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩', 323.16, 0.49, 19.50, 3.97, 470.49,  '닭고기: 국내산');
insert into bbq_menu values(11,'크런치 순살크래커', '20220422_BBQ_황올크런치너겟(크래커)_자사앱_썸네일(480x480px)_01_20221215.png', '20,000원', '후라이드', '황금올리브 닭다리살에 오레가노 풍미와 감칠맛을 부여하고, 빵가루 크럼을 입혀 바삭하게 튀겨낸 크래커 형태의 순살 치킨', '우유, 대두, 밀, 닭고기, 조개류(굴)', 262.69, 0.40, 18.49, 2.86, 387.84,  '닭고기 : 브라질산(냉동육)');
insert into bbq_menu values(12,'파더s치킨(와사비)', '자사앱 BBQ_파더스치킨_와사비.png', '15,000원', '후라이드', '코끝이 찡해지는 건강에 좋은 와사비 파더`s치킨 한마리!', '우유, 대두, 밀, 계란, 닭고기, 토마토, 쇠고기', 201.22, 0.67, 22.11, 2.85, 583.73,  '닭고기: 국내산(냉동육)');
insert into bbq_menu values(13,'파더s치킨(로스트 갈릭)', '자사앱_BBQ_파더스치킨_갈릭.png', '15,000원', '후라이드', '담백하고 육즙 가득한 로스트 갈릭 한마리!', '우유,대두,밀,닭고기,새우,땅콩', 220.16, 0.70, 22.52, 2.92, 596.30,  '닭고기: 국내산(냉동육)');


insert into bbq_menu values(14,'황올 반+양념 반', '20210413_BBQ_앱_썸네일(480x480)_양념류_황금올리브치킨반반_수정.png', '21,000원', '반반', '겉바속촉 황금올리브치킨™과 블루치즈의 부드러움이 함유된 양념소스 조합', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 253.72, 0.36, 18.77, 2.86, 408.19,  '닭고기: 국내산');
insert into bbq_menu values(15,'황올 반+양념 반(순살)', '20210413_BBQ_앱_썸네일(480x480)_양념류_황금올리브치킨순살반반_수정.png', '23,000원', '반반', '크리스피한 순살 치킨과 블루치즈의 부드러움이 함유된 양념소스 조합', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩', 292.19, 4.09, 19.01, 2.99, 432.34,  '닭고기: 국내산');
insert into bbq_menu values(16,'황올 반+양념 반(닭다리)', '202007017_BBQ_앱_썸네일(반반류)_황올닭다리반반(0).png', '22,000원', '반반', '육즙 가득~하고 쫄깃한 닭다리와 블루치즈의 부드러움이 함유된 양념소스 조합', '우유, 대두, 밀, 조개류(굴), 쇠고기, 새우, 땅콩', 241.25, 6.07, 16.32, 2.43, 502.74,  '닭고기: 국내산');
insert into bbq_menu values(17,'황올 반+매운양념 반', '20230522_BBQ_오리지날콤보_황올반_매운양념반_썸네일_자사앱(480x480)-01_20230522.png', '21,500원', '반반', '겉바속촉 황금올리브치킨™과 핫하고 찐하게 땡기는 매운양념치킨의 조합', '우유, 대두, 밀, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩', 275.14, 2.09, 17.76, 3.02, 469.9,  '닭고기: 국내산');
insert into bbq_menu values(18,'황금올리브치킨™속안심반반', '20220729_BBQ_자사앱_썸네일(480x480)_황금올리브_속안심_반반(0).png', '20,000원', '반반', '닭 한마리에 50g만 나오는 귀한 속안심을 정성스레 조리한 순살치킨 치킨텐더와 블루치즈의 부드러움이 함유된 양념소스 조합', '우유, 대두, 밀, 새우, 땅콩, 토마토, 닭고기, 쇠고기', 263.34, 8.34, 18.81, 1.92, 648.02,  '닭고기: 국내산');
insert into bbq_menu values(19,'크런치 순살크래커 반반', '20220729_BBQ_자사앱_썸네일(480x480)_황올크런치너겟_반반.png', '21,000원', '반반', '황금올리브 닭다리살에 오레가노 풍미와 감칠맛을 부여한 크래커 형태의 순살 치킨과 블루치즈의 부드러움이 함유된 양념소스 조합', '우유, 대두, 밀, 토마토, 땅콩, 조개류(굴), 닭고기, 쇠고기', 255.96, 6.99, 14.87, 2.31, 469.22,  '닭고기 : 브라질산(냉동육)');
insert into bbq_menu values(20,'황올 반+크리스피 반', 'bbq Talk_20220616_113650.png', '21,000원', '반반', '핫하고 빠삭한 맛 핫빠! 크리스피 + BBQ 최애 시그니쳐 메뉴 조합', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩', 288.44, 0.425, 19.135, 3.415, 439.34,  '닭고기: 국내산');
insert into bbq_menu values(21,'황올 반+블랙페퍼 반', 'bbq Talk_20220616_114319.png', '21,000원', '반반', '핫하고 알싸한 맛 핫싸! 블랙페퍼 + BBQ 최애 시그니쳐 메뉴 조합', '우유, 대두, 밀, 조개류(굴), 쇠고기, 새우, 땅콩', 278.88, 0.415, 19.81, 3.35, 411.22,  '닭고기: 국내산');
insert into bbq_menu values(22,'황올 반+레드착착 반', 'bbq Talk_20220616_120106.png', '21,000원', '반반', '핫하게 착 감기는 맛 핫착! 레드 착착 + BBQ 최애 시그니쳐 메뉴 조합', '우유, 대두, 밀, 조개류(굴), 쇠고기, 새우, 땅콩', 280.63, 0.74, 19.84, 3.285, 478.5,  '닭고기: 국내산');
insert into bbq_menu values(23,'크리스피 반+블랙페퍼 반', '20210506_BBQ_앱_썸네일(480x480)_핫황금올리브콤보반반_블래페퍼_크리스피.png', '21,000원', '반반', '핫하게 알싸한 맛과 핫한 빠삭한 맛을 한 번에!', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩', 313.6, 0.48, 20.175, 3.905, 442.37,  '닭고기: 국내산');
insert into bbq_menu values(24,'크리스피 반+레드착착 반', '20210506_BBQ_앱_썸네일(480x480)_핫황금올리브콤보반반_레드착착_크리스피.png', '21,000원', '반반', '핫하게 감기는 맛과 핫한 빠삭한 맛을 한 번에!', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩', 315.35, 0.805, 20.205, 3.84, 509.65,  '닭고기: 국내산');
insert into bbq_menu values(25,'블랙페퍼 반+레드착착 반', '20210506_BBQ_앱_썸네일(480x480)_핫황금올리브콤보반반_레드착착_블랙페퍼.png', '21,000원', '반반', '핫하게 감기는 맛과 핫한 알싸한 맛을 한 번에!', '우유, 대두, 밀, 조개류(굴), 쇠고기, 새우, 땅콩', 305.79, 0.795, 20.88, 3.775, 481.53,  '닭고기: 국내산');
insert into bbq_menu values(26,'황금올리브치킨™블랙페퍼', '핫황금올리브치킨 블랙페퍼.png', '21,000원', '시즈닝', '핫하고 알싸한 맛 핫싸! 블랙페퍼', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 304.04, 0.47, 20.85, 3.84, 414.25,  '닭고기: 국내산');
insert into bbq_menu values(27,'황금올리브치킨™레드착착', '핫황금올리브치킨 레드착착.png', '21,000원', '시즈닝', '핫하게 착 감기는 맛 핫착! 레드착착', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩', 307.54, 1.12, 20.91, 3.71, 548.81,  '닭고기: 국내산');
insert into bbq_menu values(28,'황금올리브치킨™크런치 버터', '크런치 버터치킨.png', '24,000원', '시즈닝', '바삭한 황금올리브치킨에 달콤 짭잘한 버터향의 풍미와 핫하게 착 감기는 레드착착 시즈닝의 중독성 강한 메뉴!!', '닭고기, 우유, 대두, 밀, 계란, 조개류(굴), 쇠고기, 새우, 땅콩', 300.74, 2.92, 19.78, 3.66, 478.92,  '닭고기: 국내산');


insert into bbq_menu values(29,'자메이카 소떡만나치킨', '자메이카 소떡만나치킨.png', '24,000원', '양념', 'BBQ 자메이카 저크소스와 신선육, 소떡소떡을 조합하여 풍미를 올린 전국민이 최애하는 치킨', '우유, 대두, 밀, 난류, 닭고기, 돼지고기, 쇠고기, 토마토, 조개류(굴)', 286.57, 4.81, 17.43, 3, 415.63,  '닭고기 : 국내산, 소시지(닭고기,돼지고기) : 국내산');
insert into bbq_menu values(30,'자메이카 소떡만나치킨(콤보)', '자메이카 소떡만나 콤보치킨.png', '25,500원', '양념', 'BBQ 자메이카 저크소스와 콤보치킨, 소떡소떡을 조합하여 풍미를 올린 전국민이 최애하는 치킨', '우유, 대두, 밀, 난류, 닭고기, 돼지고기, 쇠고기, 토마토, 조개류(굴)', 272.48, 5.08, 16.23, 2.98, 346.19,  '닭고기 : 국내산, 소시지(닭고기,돼지고기) : 국내산');
insert into bbq_menu values(31,'자메이카 소떡만나치킨(순살)', '자메이카 소떡만나 순살치킨.png', '26,000원', '양념', 'BBQ 자메이카 저크소스와 순살치킨, 소떡소떡을 조합하여 풍미를 올린 전국민이 최애하는 치킨', '우유, 대두, 밀, 난류, 닭고기, 돼지고기, 쇠고기, 토마토, 조개류(굴)',  275.30, 5.89, 19.01, 2.90, 473.22,  '닭고기 : 국내산, 소시지(닭고기,돼지고기) : 국내산');
insert into bbq_menu values(32,'오리지날 양념치킨', '20200702_BBQ_앱_섬네일_시크릿양념.png', '21,500원', '양념', '블루치즈의 부드러움과 과실의 산뜻한 만남', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩', 270, 6.82, 16.34, 3.01, 528.4,  '닭고기: 국내산');
insert into bbq_menu values(33,'오리지날 양념치킨(순살)', '20200717_BBQ_앱_썸네일(양념류)_황올순살.png', '23,500원', '양념', '달콤새콤 양념을 입은 황금올리브치킨™순살', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩', 273.24, 7.39, 16.63, 2.38, 451.74,  '닭고기: 국내산');
insert into bbq_menu values(34,'매운양념치킨', '3. 매운양념치킨_20230405.png', '22,000원', '양념', '황금올리브치킨에 고추장 베이스의 감칠맛과 칼칼함이 어우러져, 핫하고 찐하게 땡기는 매운양념치킨', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩', 296.56, 3.82, 16.75, 3.17, 531.59,  '닭고기: 국내산');
insert into bbq_menu values(35,'황올한 깐풍치킨', '20210315_BBQ_앱_썸네일(480x480)_황올한깐풍치킨-01.jpg', '22,000원', '양념', 'BBQ 특제깐풍소스에 향긋한 대파와 고추를 곁들인 치맥의 절대 지존!', '계란, 대두, 밀, 닭고기', 256.62, 3.47, 15.71, 2.87, 526.49,  '닭고기: 국내산');
insert into bbq_menu values(36,'황올한 깐풍치킨(순살)', '20210315_BBQ_앱_썸네일(480x480)_황올한깐풍순살-01.jpg', '23,000원', '양념', 'BBQ 특제깐풍소스에 향긋한 대파와 고추를 곁들인 치맥의 절대 지존!', '계란, 대두, 밀, 닭고기', 228.25, 3.27, 22.20, 2.05, 424.49,  '닭고기: 국내산');
insert into bbq_menu values(37,'극한왕갈비치킨', '20200717_BBQ_앱_썸네일(양념류)_극한왕갈비.png', '23,000원', '양념', '단짠단짠 왕갈비 소스와 바삭한 치킨의 만남', '대두, 밀, 조개류(굴), 아황산류', 322.1, 10.5, 15.8, 3.9, 407.3,  '닭고기: 국내산');
insert into bbq_menu values(38,'소이갈릭스', '7. 소이갈릭스_20230405.png', '21,000원', '양념', '간장의 감칠맛과 알싸한 마늘의 절묘한 조합', '대두, 밀, 쇠고기', 308.86, 2.32, 21.44, 3.57, 529.23,  '닭고기: 국내산');
insert into bbq_menu values(39,'소이갈릭스(윙and봉)', '7. 소이갈릭스_20230405.png', '21,000원', '양념', '간장의 감칠맛과 알싸한 마늘의 절묘한 조합 (윙and봉)', '대두, 밀, 쇠고기',  355.88, 2.84, 23.19, 4.58, 555.59,  '닭고기: 국내산');


insert into bbq_menu values(40,'자메이카 통다리구이', '20210318_BBQ_앱_썸네일_구이류(480x480px)-자메이카통다리구이.jpg', '21,500원', '구이', '자메이카 저크소스를 발라 더욱 맛있는 통다리구이', '대두, 밀, 닭고기, 토마토, 쇠고기',  201.48, 0.73, 20.6, 3.21, 423.3,  '닭고기: 국내산');
insert into bbq_menu values(41,'스모크치킨', '20210318_BBQ_앱_썸네일_구이류(480x480px)-스모크치킨.jpg', '18,000원', '구이', '물참나무 향 솔솔~ 담백한 엉치살 구이', '대두, 밀, 계란, 닭고기',  271.30, 0.01, 22.13, 6.15, 501.80,  '닭고기: 국내산');
insert into bbq_menu values(42,'매달구', '20211126 BBQ 앱 썸네일 구이류 매달구 이미지교체(480x480).png', '21,500원', '구이', '매콤달콤 구운 닭날개', '우유, 대두, 밀, 닭고기, 토마토, 쇠고기, 돼지고기, 땅콩', 249.64, 2.08, 23.92, 4.07, 644.15,  '닭고기: 국내산');

--================= 43번 부터 영양정보 없음 =================

insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(43,'황금올리브치킨™(콤보)', '20220317_BBQ_3월_신제품_자사앱_황금올리브치킨_콤보_썸네일(480x480px).png', '24,000원', '황올 콤보시리즈', '입안 가득히 퍼지는 고소하고 쫄깃한 식감과 치킨의 최고 맛있는 닭다리와 윙,봉을 함께 즐길 수 있는 메뉴', '우유, 대두, 밀, 계란, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(44,'황금올리브치킨™<br>크런치 버터(콤보)', '20220318_BBQ_황금올리브치킨_콤보_자사앱_썸네일(480x480px)_크런치버터치킨.png', '25,000원', '황올 콤보시리즈', '달콤 짭짤한 버터향의 풍미와 핫하게 착 감기는 레드착착 시즈닝의 중독성 강한 크런치 버터치킨을 닭다리와 윙, 봉으로 즐길 수 있는 콤보 메뉴', '닭고기, 우유, 대구, 밀, 계란, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(45,'황올 반+양념 반(콤보)', '20220318_BBQ_황금올리브치킨_콤보_자사앱_썸네일(480x480px)_반반.png', '25,000원', '황올 콤보시리즈', 'BBQ 시크릿 양념소스와 바삭한 황금올리브치킨™ 2가지의 맛을 닭다리와 윙, 봉으로 한번에 느낄 수 있는 BBQ만의 반반 콤보 메뉴', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(46,'오리지날 양념치킨(콤보)', '20220318_BBQ_황금올리브치킨_콤보_자사앱_썸네일(480x480px)_오리지날양념치킨.png', '25,500원', '황올 콤보시리즈', '고추장, 양파, 마늘 등을 넣은 K-Food 특제 양념 소스와 블루치즈로 후레쉬한 풍미를 더해 고급스럽게 구현한 BBQ만의 양념치킨을 닭다리와 윙, 봉으로 즐길 수 있는 콤보 메뉴', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(47,'황금올리브치킨™<br>핫크리스피(콤보)', '20220318_BBQ_황금올리브치킨_콤보_자사앱_썸네일(480x480px)_크리스피.png', '25,000원', '황올 콤보시리즈', '`하바네로 고추`의 매콤한 맛과 `가람마살라` 향신료를 가미하여 이국적인 맛을 느끼도록 한 바삭한 핫크리스피 치킨을 닭다리와 윙, 봉으로 즐길 수 있는 콤보 메뉴', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(48,'황금올리브치킨™<br>블랙페퍼(콤보)', '20220318_BBQ_황금올리브치킨_콤보_자사앱_썸네일(480x480px)_블랙페퍼.png', '25,000원', '황올 콤보시리즈', '알싸한 후추 베이스의 시즈닝을 첨가해 은은한 후추의 향과 씹을 때마다 톡톡 터지는 식감이 특징인 블랙페퍼 치킨을 닭다리와 윙, 봉으로 즐길 수 있는 콤보 메뉴', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(49,'황금올리브치킨™<br>레드착착(콤보)', '20220318_BBQ_황금올리브치킨_콤보_자사앱_썸네일(480x480px)_레드착착.png', '25,000원', '황올 콤보시리즈', '매콤한 칠리 시즈닝과 베트남 고춧가루, 이국적인 향신료를 첨가한 시즈닝을 뿌려 착착 감기는 맛이 특징인 레드착착 치킨을 닭다리와 윙, 봉으로 즐길 수 있는 콤보 메뉴', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩');


insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(50,'TOP3세트메뉴 Set1', 'TOP3_세트메뉴_세트_1.png', '26,000원', '세트메뉴', '황금올리브치킨™+닭다리 2개+케이준감자', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(51,'TOP3세트메뉴 Set2', 'TOP3_세트메뉴_세트_2.png', '27,000원', '세트메뉴', '핫황금올리브치킨™크리스피+닭다리 2개+케이준감자', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(52,'TOP3세트메뉴 Set3', 'TOP3_세트메뉴_세트_3.png', '27,000원', '세트메뉴', '자메이카 통다리구이+닭다리 2개+케이준감자', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(53,'황올 반마리세트', '황올 반마리세트_20230502.jpg', '16,500원', '세트메뉴', '황금올리브치킨™반마리+랜덤치즈볼 3개+콜라 1.25L', '');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(54,'양념 반마리세트', '양념 반마리세트_20230502.jpg', '17,500원', '세트메뉴', '오리지날 양념치킨 반마리+랜덤치즈볼 3개+콜라 1.25L', '');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(55,'자메이카 반마리세트', '자메이카 반마리세트_20230502.jpg', '17,500원', '세트메뉴', '자메이카 통다리구이 반마리+랜덤치즈볼 3개+콜라 1.25L', '');

insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(56,'황금올리브치킨™ 반마리', 'BBQ_반마리메뉴_자사앱_썸네일(480x480)_황금올리브치킨™.png', '11,000원', '1인분 메뉴', '후라이드는 황금올리브! 이젠 반마리로!', '우유, 대두, 밀, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(57,'황금올리브치킨™(닭다리)<br>반마리', '자사앱 닭다리 반마리.png', '11,500원', '1인분 메뉴', '육즙 가득~하고 쫄깃한 닭다리! 이젠 반마리로!', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(58,'핫황금올리브치킨™<br>크리스피 반마리', 'BBQ_반마리메뉴_자사앱_썸네일(480x480)_핫황금올리브치킨™_크리스피.png', '11,500원', '1인분 메뉴', '핫하고 빠삭한 맛 핫빠! 크리스피 8조각!', '우유, 대두, 밀, 닭고기, 조개류(굴), 토마토, 쇠고기, 돼지고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(59,'황금올리브치킨™<br>블랙페퍼 반마리', 'BBQ_반마리메뉴_자사앱_썸네일(480x480)_핫황금올리브치킨™_블랙페퍼.png', '11,500원', '1인분 메뉴', '핫하고 알싸한 맛 핫싸! 블랙페퍼 8조각!', '우유, 대두, 밀, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(60,'황금올리브치킨™<br>레드착착 반마리', '4. 황금올리브치킨™레드착착 반마리_20230405.png', '11,500원', '1인분 메뉴', '핫하게 착 감기는 맛 핫착! 레드착착 8조각!', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(61,'오리지날 양념치킨 반마리', '20220729_BBQ_자사앱_썸네일(480x480)_오리지날양념치킨_반마리.png', '12,000원', '1인분 메뉴', '블루치즈의 부드러움과 과실의 산뜻한 만남의 오리지날 양념치킨! 이젠 반마리로!', '우유, 대두, 밀, 계란, 닭고기, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(62,'매운양념치킨 반마리', '20230522_BBQ_매운양념치킨_썸네일_자사앱(480x480)_20230522.png', '12,000원', '1인분 메뉴', '황금올리브치킨에 고추장 베이스의 감칠맛과 칼칼함이 어우러져, 핫하고 찐하게 땡기는 매운양념치킨 반마리', '우유, 대두, 밀, 조개류(굴), 토마토, 쇠고기, 새우, 땅콩');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(63,'황올한 깐풍치킨 반마리', 'BBQ_반마리메뉴_자사앱_썸네일(480x480)_황올한_깐풍치킨.png', '12,000원', '1인분 메뉴', 'BBQ 특제깐풍소스에 향긋한 대파와 고추를 곁들인 치맥의 절대 지존!', '계란, 대두, 밀, 닭고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(64,'황올한 깐풍치킨(순살) 반마리', 'BBQ_반마리메뉴_자사앱_썸네일(480x480)_황올한_깐풍순살.png', '13,000원', '1인분 메뉴', 'BBQ 특제깐풍소스에 향긋한 대파와 고추를 곁들인 치맥의 절대 지존!', '계란, 대두, 밀, 닭고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(65,'자메이카 통다리구이<br>반마리', 'BBQ_반마리메뉴_자사앱_썸네일(480x480)_자메이카통다리구이.png', '12,000원', '1인분 메뉴', '매콤달콤한 중남미풍의 저크소스를 발라 깊고 신비한 맛의 풍미', '대두, 밀, 닭고기, 토마토, 쇠고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(66,'스모크치킨 반마리', '8. 스모크치킨 반마리_20230405.png', '10,000원', '1인분 메뉴', '엉치살을 물참나무에 12시간 이상 숙성 및 훈연시켜, 스모키한 풍미가 일품인 스모크치킨 반마리', '대두, 밀, 계란, 닭고기');

insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(67,'BBQ 치킨버거(마일드)', '20211014_BBQ_10월_신메뉴_자사앱_썸네일(480x480px)_BBQ_치킨버거_마일드.png', '5,000원', '피자/버거', '버터 풍미가 가득한 브리오슈 번스와 머쉬룸 득셀특제소스를 곁들인 BBQ 프리미엄 치킨버거', '계란, 대두, 밀, 닭고기, 새우, 토마토, 쇠고기, 돼지고기, 우유');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(68,'BBQ 치킨버거(스파이시)', '20211014_BBQ_10월_신메뉴_자사앱_썸네일(480x480px)_BBQ_치킨버거_스파이시.png', '5,000원', '피자/버거', '버터 풍미가 가득한 브리오슈 번스와 머쉬룸 득셀특제소스를 곁들인 매콤한 BBQ 프리미엄 치킨버거', '계란, 대두, 밀, 닭고기, 토마토, 돼지고기, 조개(굴), 우유');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(69,'페퍼로니 시카고피자 R', '20210813_BBQ_페퍼로니시카고피자_썸네일(0).jpg', '11,000원', '피자/버거', '겉은 바삭하고 속은 촉촉한 부드러운 시카고 도우에 짭조름한 페퍼로니와 풍미 가득한 토마토소스, 고급스러운 모짜렐라가 잘 어울리는 BBQ만의 특별한 시카고피자 레귤러 사이즈!', '밀, 대두, 우유, 계란, 토마토, 돼지고기, 쇠고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(70,'페퍼로니 시카고피자 L', '20210813_BBQ_페퍼로니시카고피자_썸네일.jpg', '16,000원', '피자/버거', '겉은 바삭하고 속은 촉촉한 부드러운 시카고 도우에 짭조름한 페퍼로니와 풍미 가득한 토마토소스, 고급스러운 모짜렐라가 잘 어울리는 BBQ만의 특별한 시카고 피자', '밀, 대두, 우유, 계란, 토마토, 돼지고기, 쇠고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(71,'허니리코타 시카고피자 R', 'BBQ_허니리코타시카고피자(0).png', '11,000원', '피자/버거', '겉은 바삭하고 속은 촉촉한 부드러운 시카고 도우에 달콤한 꿀과 풍미를 살린 리코타 치즈의 환상적인 맛을 자아내는 특별한 BBQ 시카고 피자 레귤러 사이즈!', '밀, 대두, 우유, 계란, 토마토, 쇠고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(72,'허니리코타 시카고피자 L', 'BBQ_허니리코타시카고피자(0).png', '16,000원', '피자/버거', '겉은 바삭하고 속은 촉촉한 부드러운 시카고 도우에 달콤한 꿀과 풍미를 살린 리코타 치즈의 환상적인 맛을 자아내는 특별한 BBQ 시카고 피자', '밀, 대두, 우유, 계란, 토마토, 쇠고기');

insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(73,'황올한팝콘 카라멜맛', '황올한팝콘_카라멜맛_썸네일_자사앱(480x480)_20230105.jpg', '1,800원', '사이드메뉴', 'BBQ 올리브오일로 튀긴 카라멜맛 팝콘', '대두');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(74,'크런치 올치팝', '20220729_BBQ_자사앱_썸네일(480x480)_크런치올치팝.png', '8,000원', '사이드메뉴', '올치팝, 양품떡 2종에 크런치버터 시즈닝과 레드착착 시즈닝이 첨가되어 중독성 강한 단짠의 맛 구성으로 한입 크기로 먹기 좋으며, 남녀노소 누구나 선호할 수 있는 사이드 제품', '우유, 대두, 밀, 땅콩, 난류, 닭고기, 쇠고기');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(75,'롱치즈스틱(1개)', '20220324_BBQ_롱치즈스틱_썸네일_자사앱(480x480)_out.png', '3,500원', '사이드메뉴', '버팔로 모짜렐라 치즈로 풍미가 강하며, 쫀득한 스트링치즈와 바삭한 도우가 잘 어우러진 21cm 길이의 BBQ만의 롱치즈스틱', '우유, 대두, 밀, 달걀');

insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(76,'자메이카 소떡만나 소스(25g)', '자메이카 소떡만나 소스.png', '700원', '소스류', '입에 촤악~감기는 자메이카 맵단 소스', '대두, 밀, 토마토, 쇠고기, 닭고기, 조개류(굴)');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(77,'케소 딥핑소스(75g)', '20221128_BBQ_케소딥핑소스_자사앱_썸네일(480x480)_01_20221226.png', '2,000원', '소스류', '고다, 체다치즈 베이스에 할라피뇨와 청, 홍피망을 넣어 치즈의 느끼함을 매운맛으로 잡아주는 깔끔한 치즈', '대두, 우유, 밀, 계란');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(78,'블랙페퍼 시즈닝', '20201103_BBQ_시즈닝3종썸네일(480x480px)-01.png', '1,000원', '소스류', '알싸한 블랙페퍼 시즈닝을 간편하게!', '');

insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(79,'스파클링 레몬보이 245ml', '스파클링레몬보이_245ml.png', '1,000원', '음료/주류', '천년보이차로 만든 BBQ의 스파클링 음료', '');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(80,'병맥주', '20220624_BBQ_주류_카스병맥주_자사앱_썸네일(480x480)-01.png', '4,000원', '음료/주류', '병맥주', '');
insert into bbq_menu(menuno, menu, img, price, category, info, allergy) values(81,'소주', '참이슬20201021_BBQ_주류3종_썸네일(480x480)_1차수정-02.png', '4,000원', '음료/주류', '소주', '');

commit;

select * from bbq_menu order by menuno;

--=========================== 고객센터 테이블 ===========================
-- 고객센터 테이블
drop table bbq_board;
create table bbq_board(
    num number primary key,
    store varchar2(50) not null,
    title varchar2(100) not null,
    reg_date varchar2(30) not null,
    type varchar2(100) not null,
    writer varchar2(50) not null,
    contact varchar2(50) not null,
    content varchar2(100) not null,
    ref number,
    re_step number,
    re_level number,
    readcount number,
    writerid varchar2(50) not null
);


select * from bbq_board;

-- 시퀀스 만들기
create sequence bbq_board_seq
minvalue 1
maxvalue 9999
increment by 1;
commit;

--고객의 소리 쓰기
insert into bbq_board values(bbq_board_seq.nextval,'BBQ노원구','글제목',sysdate,'주문거부','송승현','010-1111-1111','글내용',1,0,0,0);
commit;

select max(ref) from bbq_board;

--계층형 게시판 쿼리문
select * from bbq_board order by ref desc, re_step asc;

--글가져오기 로직
select * from bbq_board where num=1;

--글상세보기
select  * from bbq_board where num=1 ;

--비밀번호 비지니스 로직
select password from bbq_board where num=1;

--글수정 로직??
UPDATE bbq_board SET content='점심시간아와라' WHERE num=1;

--글 삭제 로직
DELETE FROM bbq_board WHERE num=1;

-- 관리자페이지 문의내역 조회 로직
select * from bbq_board order by ref desc, re_level asc, re_step asc;

-- 관리자페이지 답변 등록 로직
update bbq_board set re_level=re_level+1 where ref=? and re_level>?;
insert into bbq_board values(bbq_board_seq.nextval,?,'[답변] '||?,sysdate,?,?,?,?,?,?,?,0);

-- 관리자페이지 답변여부 확인 로직
select count(*) from bbq_board where ref=?;

-- 답변글 조회 로직
select * from bbq_board where ref=? and re_step>1;


--=========================== 회원 테이블 ===========================
drop table bbq_member;
create table bbq_member (
    id  varchar2(20) primary key,
    password varchar2(50) not null,
    name varchar2(50) not null,
    tel varchar2(50) not null,
    email varchar2(100) not null,
    point number default 1000,
    coupon number default 1,
    card number default 1,
    role varchar2(10) default 'B',
    address varchar2(200),
    mstore varchar2(200),
    gender varchar2(20),
    birth varchar2(20)
);
insert into bbq_member(id,password,name,tel,email,role) 
values ('ezen','1111','김이젠','01023456789','ezen@ezen.com','A');

commit;
update bbq_member set point=(point+19000) where id='ezen';

select * from bbq_member;

-- 로그인 확인 쿼리문
select count(*) from bbq_member where id='ezen' and password=1111;

-- id 중복 확인 쿼리문
select count(*) from bbq_member where id='ezen';

-- 비밀번호 확인 쿼리문
select password from bbq_member where id='ezen';

-- 마이페이지 쿼리문
select * from bbq_member where id='ezen';

-- 비밀번호 변경 쿼리문
update bbq_member set password='2222' where id='ezen';

-- 회원정보 변경 쿼리문
update bbq_member set birth='19920528', tel='01012341234', email='ez@eez.com', address='다른주소' where id='ezen';

-- 회원탈퇴 쿼리문
delete from bbq_member where id='ezen';


commit;

------------------------------------------------------------------------------

drop table bbq_order;
create table bbq_order (
    ordernum  number primary key,
    ordername varchar2(50) not null,
    ordercontact varchar2(50) not null,
    orderstore varchar2(200) not null,
    orderdate date not null,
    ordermenu varchar2(200) not null,
    orderprice number not null,
    qty number not null,
    delivery number not null,
    orderaddress varchar2(200) not null,
    orderid varchar2(50) not null
);
select * from bbq_order;

select *
from bbq_member mem, bbq_board brd
where mem.name=brd.writer
and mem.id='asdf12' and brd.writer='김이름';

select * from bbq_member mem, bbq_order ord where mem.id=ord.orderid and ord.orderid='asdf1234';