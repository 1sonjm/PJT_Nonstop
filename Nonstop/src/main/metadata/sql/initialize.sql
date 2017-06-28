
DROP TABLE letter;
DROP TABLE follow;
DROP TABLE career;
DROP TABLE scrap;
DROP TABLE statistics;
DROP TABLE techuse;
DROP TABLE proj_comment;
DROP TABLE record_applicant;
DROP TABLE project;
DROP TABLE port_images;
DROP TABLE port_comment;
DROP TABLE port_like;
DROP TABLE portfolio CASCADE CONSTRAINTS;
DROP TABLE tech;
DROP TABLE users;

PURGE RECYCLEBIN;

/***************************************************************/
/************************* 회원관리 & 기술   *************************/

DROP SEQUENCE seq_tech_tech_no1;
DROP SEQUENCE seq_tech_tech_no2;
DROP SEQUENCE seq_tech_tech_no3;
CREATE SEQUENCE seq_tech_tech_no1 INCREMENT BY 1 START WITH 1000 MAXVALUE 1999;
CREATE SEQUENCE seq_tech_tech_no2 INCREMENT BY 1 START WITH 2000 MAXVALUE 2999;
CREATE SEQUENCE seq_tech_tech_no3 INCREMENT BY 1 START WITH 3000 MAXVALUE 3999;

CREATE TABLE users (
 user_id       VARCHAR2(30)    NOT NULL,
 user_name     VARCHAR2(10)    NOT NULL,
 user_pwd      VARCHAR2(50)    NOT NULL,
 user_email    VARCHAR2(30),
 user_img      VARCHAR2(20), 
 user_role     NUMBER(1)       NOT NULL,
 user_tel      NUMBER(30),
 user_emp      NUMBER,
 user_est      DATE,
 user_ceo      VARCHAR2(10),
 user_addr     VARCHAR2(50),
 PRIMARY KEY(user_id),
 UNIQUE(user_img)
);
CREATE TABLE tech (
 tech_no       NUMBER          NOT NULL,
 tech_name     VARCHAR2(30)    NOT NULL,
 tech_class    NUMBER(1)       NOT NULL,
 PRIMARY KEY(tech_no),
 UNIQUE(tech_name)
);

INSERT INTO users(user_id,user_name,user_pwd,user_email,user_role,user_tel)
VALUES ('admin','관리자','1234','zxc@naver,com',1,010-1234-5678);
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('dpaak','엠마','123456','dpaak@naver,com','dpaak.jpg',2,010-7539-1248,'경기 고양시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('duwk','김초롱','1234','zxc2@naver,com','duwk.jpg',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('ilin','아이린','123456','ilin@naver,com','ilin.jpg',2,010-7842-7906,'서울 중구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('tyler','타일러','123456','tyler@naver,com','tyler.jpg',2,010-1234-5678,'경기 이천시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('emrrb','이득규','123456','emrrb810@naver,com','emrrb.jpg',2,010-5898-3307,'경기 고양시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('wnsdud','김준영','123456','wnsdud@naver,com','wnsdud.jpg',2,010-5061-7915,'인천 계양구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('guswjd','김현정','123456','guswjd@naver,com','guswjd.jpg',2,010-7138-3331,'서울 용산구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('wjdaks','손정만','123456','wjdaks@naver,com','wjdaks.jpg',2,010-5446-3855,'서울 노원구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('ehdgus','홍동현','123456','dbdbdbdlqslek@naver,com','ehdgus.jpg',2,010-1531-0050,'경기 안양시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('tjrwls','하석진','123456','tjrwls@naver,com','tjrwls.jpg',2,010-0012-1389,'서울 용산구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('wltjr','김지석','123456','wltjr@naver,com','wltjr.jpg',2,010-7787-0938,'서울 마포구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('qkrrud','박경','123456','qkrrud@naver,com','qkrrud.jpg',2,010-1302-0078,'서울 서대문구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('wldus','임지연','123456','wldus@naver,com','wldus.jpg',2,010-9131-3007,'경기 수원시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('gusdk','김현아','123456','gusdk@naver,com','gusdk.jpg',2,010-9111-0907,'경기 고양시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('tjfgus','설현','123456','tjfgus@naver,com','tjfgus.jpg',2,010-7754-0012,'경기 성남시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('dbwjd','김유정','123456','dbwjd@naver,com','dbwjd.jpg',2,010-9003-1385,'서울 광진구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('gusan','전현무','123456','gusan@naver,com','gusan.jpg',2,010-0052-0728,'서울 마포구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('xodus','김태연','123456','xodus@naver,com','xodus.jpg',2,010-7515-1989,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('xkqmffh','타블로','123456','xkqmffh@naver,com','xkqmffh.jpg',2,010-7813-3458,'서울 강동구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('dhcnlfl','오취리','123456','dhcnlfl@naver,com','dhcnlfl.jpg',2,010-5725-5725,'');

INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('samsung','삼성','123456','samsung@naver,com','samsung.jpg',3,010-1234-5678,
    20,to_date('1914/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'이건희','서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('dpfwl','엘지','123456','dpfwl@naver,com','dpfwl.jpg',3,010-1234-5678,
    20,to_date('2000/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'구본무','서울 종로구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('naver','네이버','123456','naver@naver,com','naver.jpg',3,010-1234-5678,
    20,to_date('1998/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'한성숙','서울 용산구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('kakao','카카오','123456','kakao@naver,com','kakao.jpg',3,010-1234-5678,
    20,to_date('2012/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'김범수','서울 마포구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('google','구글','123456','google@naver,com','google.jpg',3,010-1234-5678,
    20,to_date('2017/09/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'에릭','미국 유타');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('shdtla','농심','123456','shdtla@naver,com','shdtla.jpg',3,010-1234-5678,
    20,to_date('1955/10/22 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'김범수','서울 마포구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('sprtms','넥슨','123456','sprtms@naver,com','sprtms.jpg',3,010-1234-5678,
    20,to_date('1994/12/11 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'김정주','서울 용산구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('plaync','엔씨','123456','NC@naver,com','nc.jpg',3,010-1234-5678,
    20,to_date('1991/02/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'김택진','서울 종로구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('dparpdla','엠게임','123456','dparpdla@naver,com','dparpdla.jpg',3,010-1234-5678,
    20,to_date('2000/2/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'손승철','서울 서대문구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('sptakqmf','넷마블','123456','sptakqmf@naver,com','sptakqmf.jpg',3,010-1234-5678,
    20,to_date('1995/04/28 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'방준혁','서울 은평구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('sktel','sk','123456','sk@naver,com','sk.jpg',3,010-1234-5678,
    20,to_date('1987/03/17 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'최태원','경기 고양시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('rnrals','국민','123456','kb@naver,com','kb.jpg',3,010-1234-5678,
    20,to_date('1945/02/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'윤종규','서울 종로구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('rldjq','IBK','123456','IBK@naver,com','ibk.jpg',3,010-1234-5678,
    20,to_date('1991/08/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'김도진','서울 마포구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('gksk','하나','123456','gksk@naver,com','gksk.jpg',3,010-1234-5678,
    20,to_date('1992/03/29 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'함영주','서울 종로구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('facebook','facebook','123456','djfrnfcor@naver,com','facebook.jpg',3,010-1234-5678,
    20,to_date('2000/01/08 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'마크','미국 인디애나');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('twitter','트위터','123456','xmdnlxj@naver,com','xmdnlxj.jpg',3,010-1234-5678,
    20,to_date('1991/02/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'잭 도시','미국 미시시피');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('ekdlth','다이소','123456','ekdlth@naver,com','ekdlth.jpg',3,010-1234-5678,
    20,to_date('2002/12/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'박정부','서울 은평구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('entks','두산','123456','entks@naver,com','entks.jpg',3,010-1234-5678,
    20,to_date('1992/02/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'박정원','서울 마포구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('fhtep','롯데','123456','fhtep@naver,com','fhtep.jpg',3,010-1234-5678,
    20,to_date('1900/03/18 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'이창원','경기 고양시');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('dlakxm','이마트','123456','dlakxm@naver,com','dlakxm.jpg',3,010-1234-5678,
    20,to_date('1991/05/22 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'이갑수','경기 의정부시');

INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Java',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Python',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Php',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'JavaScript',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Swift',1);
INSERT INTO tech VALUES (seq_tech_tech_no2.nextval,'Spring',2);
INSERT INTO tech VALUES (seq_tech_tech_no2.nextval,'Django',2);
INSERT INTO tech VALUES (seq_tech_tech_no2.nextval,'Symfony',2);
INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'Oracle',3);
INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'MSsql',3);
INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'Mysql',3);
INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'SQLite',3);

/**************************************************************/
/*************************   포트폴리오     *************************/

DROP SEQUENCE seq_portfolio_port_no;
DROP SEQUENCE seq_port_like_port_like_no;
DROP SEQUENCE seq_port_comment_com_no;
DROP SEQUENCE seq_port_images_img_no;
CREATE SEQUENCE seq_portfolio_port_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_like_port_like_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_comment_com_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_images_img_no INCREMENT BY 1 START WITH 1;

CREATE TABLE portfolio ( 
  port_no           NUMBER             NOT NULL PRIMARY KEY,
  port_user_id      VARCHAR2(30)       NOT NULL,
  port_division     NUMBER(2),
  port_title        VARCHAR2(100),
  port_regdate      DATE,
  port_update       DATE,
  port_file         VARCHAR2(100)      UNIQUE,
  port_detail       VARCHAR2(4000),
  port_viewcount    NUMBER(20),
  port_like_count    NUMBER(20),
  port_com_count    NUMBER(20),
  CONSTRAINT portfolio_fk
  FOREIGN KEY (port_user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE port_like ( 
  port_like_no      NUMBER               NOT NULL,
  port_no           NUMBER              NOT NULL REFERENCES portfolio(port_no),
  user_id            VARCHAR2(30)        NOT NULL REFERENCES users(user_id),
  PRIMARY KEY(port_like_no)
);
CREATE TABLE port_comment ( 
  com_no              NUMBER             NOT NULL,
  com_port_no        NUMBER             NOT NULL REFERENCES portfolio(port_no),
  com_user_id         VARCHAR2(30)      NOT NULL REFERENCES users(user_id),
  com_port_regdate  DATE,
  com_port_content  VARCHAR2(200),
  PRIMARY KEY(com_no)
);
CREATE TABLE port_images(
img_no    NUMBER                        NOT NULL,
img_port_no   NUMBER                    NOT NULL REFERENCES portfolio(port_no),
img_name   VARCHAR2(50)                 NOT NULL,
img_order   NUMBER(30),
PRIMARY KEY(img_no)
);

INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'xkqmffh', 20, '텐바이텐 이벤트 프로모션', sysdate, 'designWebApp(1).jpg', '텐바이텐 10X10 왜 그렇게 짜증이 나있어요? 웹 이벤트 프로모션 입니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'dhcnlfl', 20, 'Verso Digital Magazine Design', sysdate, 'designWebApp(2).jpg', 'Digital Magazine. Design Inspiration'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'ilin', 20, '2017 네이버 모바일 검색개편', sysdate, 'designWebApp(3).jpg', '2015년에서 ~ 2017년까지의 작업을 담은 포트폴리오입니다.
UX/UI, (앱)브랜딩, 편집 작업으로 구성했습니다.
가장 하고 싶은 작업은 모바일 앱 UI 및 GUI입니다. 봐주셔서 감사합니다!'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'tyler', 20, '오셜록 web ui 컨셉디자인 포트폴리오', sysdate, 'designWebApp(4).jpg', '디자인 나스 (designnas) 학생 웹디자인 (bx web micro site) 포트폴리오입니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'emrrb', 20, 'OK Cashbag Mobile Web App Design', sysdate, 'designWebApp(5).jpg', '오케이 캐쉬백 모바일 웹 앱 디자인 포트폴리오입니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'guswjd', 20, 'Travel + Leisure - Concept Re-Design', sysdate, 'designWebApp(6).jpg', 'Travel + Leisure - Concept Re-Design on Behance'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'wjdaks', 20, 'Acadoa Squarespace Kit', sysdate, 'designWebApp(7).jpg', ' Introducing our latest web app design for squarspace.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'ehdgus', 20, '해법스터디 학부모 웹 앱', sysdate, 'designWebApp(8).jpg', '해법스터디 온라인 플랫폼입니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'tjrwls', 20, '쇼핑몰 웹+어플리케이션 컨셉디자인', sysdate, 'designWebApp(9).jpg'
,'까다로운 소비자들의 선택을 받은 제품은 포장을 마치고 마침내 주문자에게 배송됩니다. 배송 포장에는 항상 정보가 담긴 Shipping label이 부착되어 있습니다. 제품을 열어보기 전 꼭 Shipping label을 확인해주세요! 오배송이라면 조금 슬플지도 모르니까요. 신입사원이라는 제품의 상세한 사항을 기입한 세 종류의 Shipping label입니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'wltjr', 20, 'Freebie-Kauf UI Web App Kit', sysdate, 'designWebApp(10).jpg', ' 2016
맞춤형 공연정보 지원 서비스 PERCKET(:퍼켓)
Perfect Ticket Application : PERCKET'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'qkrrud', 20, '모던한 스타일의 UI 디자인', sysdate, 'designWebApp(11).jpg', 'The Web Aesthetic — Showcasing The Best in Web Design'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'gusdk', 20, 'American Airline Web Mobile', sysdate, 'designWebApp(12).jpg', 'American Airlines Web Mobile Kiosk by Steven Fisher, via Behance.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'dbwjd', 20, 'PELICAN Desktop Mobile', sysdate, 'designWebApp(13).jpg', 'Showcase and discover creative work on the world leading online platform for creative industries'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'gusan', 20, '나이키 온라인스토어 컨셉디자인', sysdate, 'designWebApp(14).jpg', '단조로운 색과 아이콘으로 심플하지만 세련된 느낌을 주고자 했습니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'duwk', 20, '뷰티 모바일웹 컨셉 디자인', sysdate, 'designWebApp(15).jpg', 'Free UI PSD Mobile App Fashion & Ecommerce on Behance'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'dpaak', 20, '9가지 디바이스 타입을 지원하는 프로젝트', sysdate, 'designWebApp(16).jpg', '태블릿, 모바일, 스마트 워치 등 다양한 디바이스에 적용 가능한 UI 디자인입니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'xkqmffh', 21, '어퓨 홈페이지 리디자인', sysdate, 'designWeb(1).jpg', '데일리호텔 앱 홈화면 개편에 따른 마케팅 영역 확대로 인해 인앱 콘텐츠의 디자인을 개선하고 새로운 톤앤매너 가이드를 제작하는 프로젝트를 진행했습니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'dhcnlfl', 21, '포트폴리오 웹사이트 디자인', sysdate, 'designWeb(2).jpg', '가상의 항공사 Airline의 컨셉 디자인을 진행했습니다.'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'ilin', 21, '졸업전시 웹 디자인 포트폴리오', sysdate, 'designWeb(3).jpg', '2015년에서 ~ 2017년까지의 작업을 담은 포트폴리오입니다.
UX/UI, (앱)브랜딩, 편집 작업으로 구성했습니다.
가장 하고 싶은 작업은 모바일 앱 UI 및 GUI입니다. 봐주셔서 감사합니다!'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'tyler', 21, 'calli-Lovers 캘리그래퍼 웹사이트', sysdate, 'designWeb(4).jpg', ' 2015년에서 ~ 2017년까지의 작업을 담은 포트폴리오입니다.
UX/UI, (앱)브랜딩, 편집 작업으로 구성했습니다.
가장 하고 싶은 작업은 모바일 앱 UI 및 GUI입니다. 봐주셔서 감사합니다!'); 
INSERT INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'emrrb', 21, '쇼파르 뮤직 레이블 콘서트 웹 디자인', sysdate, 'designWeb(5).jpg', '데일리호텔 앱 홈화면 개편에 따른 마케팅 영역 확대로 인해 인앱 콘텐츠의 디자인을 개선하고 새로운 톤앤매너 가이드를 제작하는 프로젝트를 진행했습니다 '); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'guswjd', 21, '상상마당 웹 메인페이지', sysdate, 'designWeb(6).jpg', '숲속을 거닐다라는 컨셉 아래에 숲이 가지는 따듯함을 표현하고자 하였다. 하늘과 바다를 연상시키는 컬러를 선정해 산 속 아래에 따듯한 햇빛이 비추어지며 자연의 이미지를 전하려 하였다. 따듯한 여름 숲 속의 산뜻함을 가진 스킨케어 패키지를 제안한다. 전체적인 형상은 등고선을 활용한 큰 산의 모습을 하고있지만 그 모습 자체는 하나의 나무로 보이도록 디자인하였다. 이를통해 나무 하나 하나가 모여 큰 산을 만든다는 메시지를 전하려 하였다. 
위 제품의 수임금 일부는 나무 심기 캠페인의 지원금으로 보내진다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'wjdaks', 21, '심플한 형태의 웹사이트 UI', sysdate, 'designWeb(7).jpg', ' bembo font 의 Type specimen 편집디자인 작업입니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'ehdgus', 21, '3D illust를 활용한 디자인', sysdate, 'designWeb(8).jpg', '개인적으로 노트폴리오를 자주 들리는 이용자로써 Pinterest나 Behance처럼 노트폴리오도 따로 어플이 생겼으면 좋겠다 싶어 모바일 버전을 앱 자체로 간단히 디자인 해보았습니다!'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'tjrwls', 21, '여행 어플 컨셉디자인', sysdate, 'designWeb(9).jpg', 'artwork by Ham Ham'
); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'wltjr', 21, '컨퍼런스 beLAUNCH', sysdate, 'designWeb(10).jpg', ' 2016
맞춤형 공연정보 지원 서비스 PERCKET(:퍼켓)
Perfect Ticket Application : PERCKET'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'qkrrud', 21, '모던한 스타일의 웹사이트 디자인', sysdate, 'designWeb(11).jpg', '국경일, 국가 기념일 혹은 개인적으로 기억하고 싶은, 의미있는 Event를 기억하며, 역사적 국가적 사건과 '); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'gusdk', 21, 'Gold bar 컨셉 디자인', sysdate, 'designWeb(12).jpg', '총 40개의 아이콘과 월페이퍼로 구성되어 있습니다. 데코 앱에서 다운로드 받을 수 있습니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'dbwjd', 21, 'iCare Web', sysdate, 'designWeb(13).jpg', '건강 관리 어플 iCare 컨셉디자인 입니다. 메인 페이지 하단의 책갈피 모양 그래픽을 선택하면 가장 가까운 일정의 정보를 보여줍니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'gusan', 21, '쇼핑몰 웹 디자인', sysdate, 'designWeb(14).jpg', '쇼핑몰 앱 디자인 포트폴리오입니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'xodus', 21, '뷰티 웹 컨셉 디자인', sysdate, 'designWeb(15).jpg', '까다로운 소비자들의 선택을 받은 제품은 포장을 마치고 마침내 주문자에게 배송됩니다. 배송 포장에는 항상 정보가 담긴 Shipping label이 부착되어 있습니다. 제품을 열어보기 전 꼭 Shipping label을 확인해주세요! 오배송이라면 조금 슬플지도 모르니까요. 신입사원이라는 제품의 상세한 사항을 기입한 세 종류의 Shipping label입니다. '); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'xkqmffh', 21, '네이버 컨셉디자인 제안', sysdate, 'designWeb(16).jpg', '최신 인기 게임들의 기본 정보와 게임별 공략법, 이벤트 소식 등을 한 눈에 파악할 수 있습니다.'); 
INSERT 
INTO portfolio (port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail)
VALUES (seq_portfolio_port_no.nextval,'dpaak',22,'패턴을 이용한 어플리케이션 디자인', sysdate,'designApp(1).jpg','데일리호텔 앱 홈화면 개편에 따른 마케팅 영역 확대로 인해 인앱 콘텐츠의 디자인을 개선하고 새로운 톤앤매너 가이드를 제작하는 프로젝트를 진행했습니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'duwk', 22, '항공사 어플리케이션 컨셉 디자인', sysdate, 'designApp(2).jpg', '가상의 항공사 Airline의 컨셉 디자인을 진행했습니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'ilin', 22, '일러스트를 이용한 플랫 스타일 어플', sysdate, 'designApp(3).jpg', '2015년에서 ~ 2017년까지의 작업을 담은 포트폴리오입니다.
UX/UI, (앱)브랜딩, 편집 작업으로 구성했습니다.
가장 하고 싶은 작업은 모바일 앱 UI 및 GUI입니다. 봐주셔서 감사합니다!'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'tyler', 22, 'Weather Application', sysdate, 'designApp(4).jpg', ' 2015년에서 ~ 2017년까지의 작업을 담은 포트폴리오입니다.
UX/UI, (앱)브랜딩, 편집 작업으로 구성했습니다.
가장 하고 싶은 작업은 모바일 앱 UI 및 GUI입니다. 봐주셔서 감사합니다!'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'emrrb', 22, '일러스트를 활용한 운동 어플', sysdate, 'designApp(5).jpg', '데일리호텔 앱 홈화면 개편에 따른 마케팅 영역 확대로 인해 인앱 콘텐츠의 디자인을 개선하고 새로운 톤앤매너 가이드를 제작하는 프로젝트를 진행했습니다 '); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'guswjd', 22, '앱 메인페이지 디자인', sysdate, 'designApp(6).jpg', '숲속을 거닐다라는 컨셉 아래에 숲이 가지는 따듯함을 표현하고자 하였다. 하늘과 바다를 연상시키는 컬러를 선정해 산 속 아래에 따듯한 햇빛이 비추어지며 자연의 이미지를 전하려 하였다. 따듯한 여름 숲 속의 산뜻함을 가진 스킨케어 패키지를 제안한다. 전체적인 형상은 등고선을 활용한 큰 산의 모습을 하고있지만 그 모습 자체는 하나의 나무로 보이도록 디자인하였다. 이를통해 나무 하나 하나가 모여 큰 산을 만든다는 메시지를 전하려 하였다. 
위 제품의 수임금 일부는 나무 심기 캠페인의 지원금으로 보내진다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'wjdaks', 22, '심플한 형태의 어플 UI', sysdate, 'designApp(7).jpg', ' bembo font 의 Type specimen 편집디자인 작업입니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'ehdgus', 22, '3D illust application', sysdate, 'designApp(8).jpg', '개인적으로 노트폴리오를 자주 들리는 이용자로써 Pinterest나 Behance처럼 노트폴리오도 따로 어플이 생겼으면 좋겠다 싶어 모바일 버전을 앱 자체로 간단히 디자인 해보았습니다!'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'tjrwls', 22, '여행 어플 컨셉디자인', sysdate, 'designApp(9).jpg', 'artwork by Ham Ham'
); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'wltjr', 22, 'Unique porfile UI Style', sysdate, 'designApp(10).jpg', ' 2016
맞춤형 공연정보 지원 서비스 PERCKET(:퍼켓)
Perfect Ticket Application : PERCKET'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'qkrrud', 22, '모던한 스타일의 어플리케이션 디자인', sysdate, 'designApp(11).jpg', '국경일, 국가 기념일 혹은 개인적으로 기억하고 싶은, 의미있는 Event를 기억하며, 역사적 국가적 사건과 개인 기록을 확인할 수 있습니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'gusdk', 22, 'Gold Band Taxis 컨셉 디자인', sysdate, 'designApp(12).jpg', '총 40개의 아이콘과 월페이퍼로 구성되어 있습니다. 데코 앱에서 다운로드 받을 수 있습니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'dbwjd', 22, 'iCare App', sysdate, 'designApp(13).jpg', '건강 관리 어플 iCare 컨셉디자인 입니다. 메인 페이지 하단의 책갈피 모양 그래픽을 선택하면 가장 가까운 일정의 정보를 보여줍니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'gusan', 22, '쇼핑몰 앱 디자인', sysdate, 'designApp(14).jpg', '쇼핑몰 앱 디자인 포트폴리오입니다.'); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'xodus', 22, '뷰티 어플리케이션 컨셉 디자인', sysdate, 'designApp(15).jpg', '까다로운 소비자들의 선택을 받은 제품은 포장을 마치고 마침내 주문자에게 배송됩니다. 배송 포장에는 항상 정보가 담긴 Shipping label이 부착되어 있습니다. 제품을 열어보기 전 꼭 Shipping label을 확인해주세요! 오배송이라면 조금 슬플지도 모르니까요. 신입사원이라는 제품의 상세한 사항을 기입한 세 종류의 Shipping label입니다. '); 
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'xkqmffh', 22, 'Smart CSS Viewer tailored for Designers', sysdate, 'designApp(16).jpg', '최신 인기 게임들의 기본 정보와 게임별 공략법, 이벤트 소식 등을 한 눈에 파악할 수 있습니다.'); 
) 

INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 1, 'wnsdud', SYSDATE, '댓글은 댓글일뿐1');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 1, 'guswjd', SYSDATE, '댓글은 댓글일뿐2');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 1, 'wjdaks', SYSDATE, '댓글은 댓글일뿐3');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 2, 'ehdgus', SYSDATE, '댓글은 댓글일뿐4');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 2, 'emrrb', SYSDATE, '댓글은 댓글일뿐4');

/**************************************************************/
/*************************    프로젝트      *************************/

DROP SEQUENCE seq_project_proj_no;
DROP SEQUENCE seq_record_applicant_rec_no;
DROP SEQUENCE seq_proj_comment_com_no;
CREATE SEQUENCE seq_project_proj_no       INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_record_applicant_rec_no    INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_proj_comment_com_no   INCREMENT BY 1 START WITH 1;

CREATE TABLE project( 
  proj_no           NUMBER            NOT NULL PRIMARY KEY,
  proj_user_id      VARCHAR2(30)      NOT NULL,
  proj_division     NUMBER(2),
  proj_title        VARCHAR2(100),
  proj_annostart    DATE,
  proj_annoend      DATE,
  proj_startdate    DATE,
  proj_enddate      DATE,
  proj_location     VARCHAR2(20),
  proj_detail       VARCHAR2(4000),
  proj_viewcount    NUMBER,
  CONSTRAINT project_fk
  FOREIGN KEY (proj_user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE record_applicant ( 
  rec_no            NUMBER            NOT NULL PRIMARY KEY,
  rec_proj_no       NUMBER            NOT NULL,
  rec_user_id       VARCHAR2(30)      NOT NULL,
  rec_status        NUMBER(1),
  CONSTRAINT record_applicant_fk
  FOREIGN KEY (rec_proj_no) REFERENCES project(proj_no) ON DELETE CASCADE,
  FOREIGN KEY (rec_user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE proj_comment ( 
  com_no            NUMBER            NOT NULL PRIMARY KEY,
  com_proj_no       NUMBER            NOT NULL,
  com_user_id       VARCHAR2(30)      NOT NULL,
  com_proj_regdate  DATE,
  com_proj_content  VARCHAR2(200),
  CONSTRAINT proj_comment_fk
  FOREIGN KEY (com_proj_no) REFERENCES project(proj_no) ON DELETE CASCADE,
  FOREIGN KEY (com_user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO project
VALUES (seq_project_proj_no.nextval,'samsung', 11,'스토어팜 자동등록 Python 프로그램', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 강서구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'dpfwl', 11,'회사 홈페이지(pc web)제작', SYSDATE, to_date('2017/06/30 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/05 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/25 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '경기 성남시', '※프로젝트 진행 방식 - 초기 온/오프 미팅 1회 - 재택근무', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'naver', 11,'예비승무원 교육/큐레이션 웹개발', SYSDATE, to_date('2017/07/05 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/06 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/29 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '경기 수원시', ' ※프로젝트의 현재 상황 - 사업계획서, 간략한 기능 정의/문서 작성 완료', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'kakao', 11,'의류 티셔츠 커스터마이징 웹개발', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 구로구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 주 1 회 이상 정기 미팅', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'google', 12,'단순 전구제어 Android 앱개발', SYSDATE, to_date('2017/07/25 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 노원구', '※ 프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 진행간 필요시 미팅(1~2주 1회)', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'shdtla', 12,'회의실예약/센서연동 Android 앱', SYSDATE, to_date('2017/07/04 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/10 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 영등포구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 진행 간 주 1 회이상 계약', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'sprtms', 12,'자전거 관련Hybrid App Client', SYSDATE, to_date('2017/06/30 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/05 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/24 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 구로구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 앱 기획단계에서는 핵심 인력 1인 상주희망', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'plaync', 12,'아두이노 HW+제어 Android 개발', SYSDATE, to_date('2017/07/09 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/10 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/11 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 광진구', ' ※프로젝트의 현재 상황 - 현재 기획 완료', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'dparpdla', 21,'이벤트용 랜딩페이지 디자인(1P)', SYSDATE, to_date('2017/07/20 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/21 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 송파구', '※ 프로젝트 진행 방식 - 초기 오프라인미팅 - 진행 후 전화/메일 피드백 컨펌', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'sptakqmf', 21,'반응형 웹 디자인/퍼블리싱(3p)', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/10 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '경북 경주시', '※프로젝트 진행 방식 - 초기 온/오프라인 미팅 - 필요시 미팅 / 그외 유무선', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'sktel', 21,'일반기업 홈페이지 디자인변경 마감', SYSDATE, to_date('2017/06/30 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/07 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '충남 당진시', '※프로젝트 진행 방식 - 초기 온/오프라인 미팅 ( 유선 가능 )', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'rnrals', 21,'아동복 상세페이지 디자인 마감', SYSDATE, to_date('2017/07/05 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/06 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/20 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 종로구', '※프로젝트 진행 방식 - 초기 온라인 미팅 1회 - 재택근무 ', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'rldjq', 22,'Mobile웹 디자인+퍼블리싱', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 송파구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 재택근무', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'gksk', 22,'주식 자동매매앱 튜토리얼 디자인', SYSDATE, to_date('2017/07/04 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/05 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/21 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '경기 성남시', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 진행 간 주 1~2 회 정기미팅 - 재택근무 ', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'twitter', 22,'안드로이드 화면 UI 작업 마감', SYSDATE, to_date('2017/07/15 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/20 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '인천 부평구', ' ※프로젝트의 현재 상황 - 필요한 기획서 작성 완료 - 하단 첨부 파일 확인', 0);

INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 1, 'wnsdud', SYSDATE, '댓글은 댓글일뿐1');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 1, 'guswjd', SYSDATE, '댓글은 댓글일뿐2');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 1, 'wjdaks', SYSDATE, '댓글은 댓글일뿐3');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 2, 'ehdgus', SYSDATE, '댓글은 댓글일뿐4');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 2, 'emrrb', SYSDATE, '댓글은 댓글일뿐4');

INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 1, 'wnsdud', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 1, 'guswjd', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 1, 'wjdaks', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 2, 'ehdgus', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 2, 'emrrb', 0);


/**************************************************************/
/*************************    기술통계      *************************/

DROP SEQUENCE seq_techuse_tu_no;
DROP SEQUENCE seq_statisics_stat_no;
CREATE SEQUENCE seq_techuse_tu_no  INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_statisics_stat_no  INCREMENT BY 1 START WITH 100;

CREATE TABLE techuse(
  tu_no               NUMBER          NOT NULL PRIMARY KEY,  
  tu_port_no          NUMBER,
  tu_proj_no          NUMBER,
  tu_tech_no          NUMBER          NOT NULL,
  CONSTRAINT techuse_fk
  FOREIGN KEY (tu_port_no) REFERENCES portfolio(port_no) ON DELETE CASCADE,
  FOREIGN KEY (tu_proj_no) REFERENCES project(proj_no) ON DELETE CASCADE,
  FOREIGN KEY (tu_tech_no) REFERENCES tech(tech_no) ON DELETE CASCADE
 );

CREATE TABLE statistics(
  stat_no             NUMBER          NOT NULL,  
  stat_tech_no        NUMBER          NOT NULL REFERENCES tech(tech_no),
  stat_demand         NUMBER          DEFAULT 0,
  stat_supply         NUMBER          DEFAULT 0,  
  stat_user_rate      NUMBER          DEFAULT 0,
  stat_date           DATE            DEFAULT SYSDATE,
  PRIMARY KEY(stat_no)
);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,1001);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,2000);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,2001);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,3001);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,1000);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,2000);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,3000);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,3,1002);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,3,2002);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,3,3002);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,4,1002);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,4,2002);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,4,2000);
INSERT INTO techuse (tu_no,tu_port_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,4,3002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,1001);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,2000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,1,3001);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,1000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,1002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,2000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,2,3000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,3,1002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,3,2002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,3,3002);

INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,5,3,6,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,4,3,32,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,10,2,9,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,4,3,30,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,5,0,15,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,10,3,27,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,2,2,8,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,4,4,22,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,2,1,27,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,3,1,33,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,10,1,5,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,6,4,13,'2017/06/21');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,9,3,28,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,2,4,6,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,2,2,26,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,9,0,23,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,6,1,8,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,2,2,22,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,4,3,30,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,4,4,10,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,7,3,18,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,10,1,18,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,5,4,23,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,9,0,24,'2017/06/14');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,3,1,14,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,9,2,9,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,1,0,13,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,3,4,34,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,8,2,13,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,9,0,6,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,3,4,29,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,7,0,27,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,6,4,26,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,4,3,12,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,2,0,9,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,3,4,29,'2017/06/07');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,1,2,34,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,5,0,29,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,10,1,14,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,8,2,31,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,2,0,6,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,8,2,31,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,1,1,5,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,4,1,12,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,10,4,8,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,7,2,29,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,6,1,27,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,1,2,29,'2017/05/31');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,1,3,22,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,1,1,10,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,10,4,11,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,5,4,29,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,8,3,12,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,10,2,19,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,8,2,24,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,4,3,33,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,4,4,34,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,10,3,5,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,5,0,16,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,10,2,26,'2017/05/24');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,5,3,23,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,3,4,26,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,9,4,8,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,1,3,32,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,5,2,16,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,5,3,16,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,5,3,30,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,9,2,20,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,4,2,22,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,8,0,12,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,6,4,21,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,9,1,10,'2017/05/17');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,1,2,18,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,1,2,32,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,5,0,27,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,9,4,15,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,9,3,23,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,3,2,17,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,10,3,10,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,9,3,33,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,2,0,7,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,10,1,25,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,6,1,6,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,9,1,33,'2017/05/10');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,5,1,13,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,6,2,30,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,10,2,16,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,5,0,32,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,4,1,10,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,1,4,7,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,10,4,21,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,7,1,5,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,6,3,14,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,9,4,28,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,3,0,28,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,7,0,18,'2017/05/03');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,10,2,34,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,10,1,24,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,5,3,21,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,2,3,23,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,9,3,27,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,8,3,16,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,2,1,10,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,7,0,22,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,5,0,26,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,5,2,24,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,6,1,25,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,4,0,10,'2017/04/26');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,1,4,14,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,8,0,17,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,5,4,24,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,10,1,9,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,3,0,25,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,7,2,9,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,9,4,26,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,4,3,9,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,7,0,24,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,3,2,30,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,5,3,5,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,6,0,22,'2017/04/19');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,7,0,9,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,6,4,30,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,1,4,32,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,1,1,7,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,2,1,19,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,10,1,30,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,8,2,33,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,8,4,22,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,3,1,7,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,10,1,34,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,1,1,5,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,4,0,6,'2017/04/12');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,3,3,34,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,2,1,21,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,10,4,29,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,4,1,18,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,3,0,23,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,9,2,8,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,7,0,23,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,1,3,17,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,4,3,5,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,3,0,11,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,1,3,6,'2017/04/05');
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,10,2,33,'2017/04/05');

/**************************************************************/
/**************************    프로필      *************************/

DROP SEQUENCE seq_career_no;
DROP SEQUENCE seq_let_no;
DROP SEQUENCE seq_follow_no;
DROP SEQUENCE seq_scrap_no;
CREATE SEQUENCE seq_career_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_let_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_follow_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_scrap_no INCREMENT BY 1 START WITH 1;

CREATE TABLE letter(
	let_no	 		NUMBER		NOT NULL,
	let_send_id 		VARCHAR2(30) 	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	let_receive_id 		VARCHAR2(30)	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
 	let_title 			VARCHAR2(100)	NOT NULL,
 	let_detail  		VARCHAR2(500),
 	let_regdate  		DATE,
 	let_readdate  		DATE,
 	let_save	 		NUMBER(1),
 	let_rec_view 		NUMBER(1),
 	let_send_view 		NUMBER(1),
	PRIMARY KEY(let_no)
);
CREATE TABLE follow (
	follow_no 		NUMBER	 	NOT NULL,
	request_id 		VARCHAR2(30)  	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	recive_id 		VARCHAR2(30) 	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	PRIMARY KEY(follow_no)
);
CREATE TABLE career (
	career_no 	  	NUMBER  	NOT NULL,
	career_user_id  		VARCHAR2(30)  	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	career_tech_no  		NUMBER	 	NOT NULL REFERENCES tech(tech_no) ON DELETE CASCADE,
	career_use_month  	NUMBER	  	NOT NULL,
	PRIMARY KEY(career_no) 
);
CREATE TABLE scrap (
	scrap_no 		NUMBER 	NOT NULL,
	user_id	 		VARCHAR2(30) 	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	port_no	 		NUMBER    	REFERENCES portfolio(port_no) ON DELETE CASCADE,
	proj_no	 		NUMBER	 	REFERENCES project(proj_no) ON DELETE CASCADE,
	scrap_div 		NUMBER(1) 	NOT NULL,
PRIMARY KEY(scrap_no)
);

INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','dpaak','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','ilin','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','duwk','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','tyler','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','wnsdud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','guswjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','wjdaks','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','ehdgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','tjrwls','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','wltjr','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','qkrrud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','wldus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','gusdk','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','tjfgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','dbwjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','gusan','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','xodus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','xkqmffh','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','dhcnlfl','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','duwk','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','ilin','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','tyler','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','emrrb','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','wnsdud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','guswjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','wjdaks','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','ehdgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','tjrwls','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','wltjr','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','qkrrud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','wldus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','gusdk','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','tjfgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','dbwjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','gusan','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','xodus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','xkqmffh','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'dpaak','dhcnlfl','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','dpaak','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','ilin','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','tyler','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','emrrb','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','wnsdud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','guswjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','wjdaks','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','ehdgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','tjrwls','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','wltjr','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','qkrrud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','wldus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','gusdk','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','tjfgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','dbwjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','gusan','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','xodus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','xkqmffh','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'duwk','dhcnlfl','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','emrrb','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','guswjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','wjdaks','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','ehdgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','tjfgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','qkrrud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'guswjd','emrrb','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'guswjd','wnsdud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'guswjd','wjdaks','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'guswjd','ehdgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wjdaks','emrrb','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wjdaks','wnsdud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wjdaks','guswjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wjdaks','ehdgus','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'ehdgus','emrrb','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'ehdgus','wnsdud','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'ehdgus','wjdaks','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'ehdgus','guswjd','안녕하세요','반갑습니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'samsung','emrrb','면접제의 드립니다.','안녕하세요 면접제의 드립니다. 아래번호로 연락주시기 바랍니다.02-222-1234',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'samsung','wnsdud','면접제의 드립니다.','안녕하세요 면접제의 드립니다. 아래번호로 연락주시기 바랍니다.02-222-1234',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'samsung','guswjd','면접제의 드립니다.','안녕하세요 면접제의 드립니다. 아래번호로 연락주시기 바랍니다.02-222-1234',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'samsung','wjdaks','면접제의 드립니다.','안녕하세요 면접제의 드립니다. 아래번호로 연락주시기 바랍니다.02-222-1234',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'samsung','ehdgus','면접제의 드립니다.','안녕하세요 면접제의 드립니다. 아래번호로 연락주시기 바랍니다.02-222-1234',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'kakao','emrrb','면접결과입니다.','이번에는 저희랑 일하기 힘드실 것 같습니다. 다음에 좋은인연 맺기 바랍니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'kakao','wnsdud','면접결과입니다.','이번에는 저희랑 일하기 힘드실 것 같습니다. 다음에 좋은인연 맺기 바랍니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'kakao','guswjd','면접결과입니다.','이번에는 저희랑 일하기 힘드실 것 같습니다. 다음에 좋은인연 맺기 바랍니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'kakao','ehdgus','면접결과입니다.','이번에는 저희랑 일하기 힘드실 것 같습니다. 다음에 좋은인연 맺기 바랍니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'kakao','wjdaks','면접결과입니다.','이번에는 저희랑 일하기 힘드실 것 같습니다. 다음에 좋은인연 맺기 바랍니다.',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'emrrb','kakao','안녕하세요,프로젝트 관련 문의드립니다.','프로젝트 진행시 재택근무 가능할까요?',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wnsdud','samsung','안녕하세요,프로젝트 관련 문의드립니다.','프로젝트 진행시 재택근무 가능할까요?',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'wjdaks','dpfwl','안녕하세요,프로젝트 관련 문의드립니다.','프로젝트 진행시 재택근무 가능할까요?',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'ehdgus','naver','안녕하세요,프로젝트 관련 문의드립니다.','프로젝트 진행시 재택근무 가능할까요?',sysdate,'','','','');
INSERT INTO letter VALUES (seq_let_no.nextval,'guswjd','google','안녕하세요,프로젝트 관련 문의드립니다.','프로젝트 진행시 재택근무 가능할까요?',sysdate,'','','','');

INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','wjdaks');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','ehdgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','wldus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','gusdk');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','tjrwls');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','qkrrud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','wjdaks');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','ehdgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','tjfgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','wldus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','dbwjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','dhcnlfl');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','wjdaks');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','ehdgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','tjrwls');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','wltjr');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','qkrrud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','ilin');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','tyler');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','ehdgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','dpaak');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','duwk');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','tjfgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','qkrrud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','xkqmffh');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','dpaak');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','duwk');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','wldus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','gusdk');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','gusan');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','xodus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','dhcnlfl');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','kakao');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','samsung');
INSERT INTO follow VALUES (seq_follow_no.nextval,'emrrb','sktel');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','dpfwl');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','dlakxm');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','google');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wnsdud','fhtep');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','kakao');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','sptakqmf');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','google');
INSERT INTO follow VALUES (seq_follow_no.nextval,'guswjd','samsung');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','samsung');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','kakao');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','naver');
INSERT INTO follow VALUES (seq_follow_no.nextval,'wjdaks','facebook');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','kakao');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','samsung');
INSERT INTO follow VALUES (seq_follow_no.nextval,'ehdgus','dpfwl');
INSERT INTO follow VALUES (seq_follow_no.nextval,'kakao','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'kakao','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'kakao','ehdgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'kakao','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'kakao','wjdaks');
INSERT INTO follow VALUES (seq_follow_no.nextval,'samsung','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'samsung','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'samsung','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'samsung','wjdaks');
INSERT INTO follow VALUES (seq_follow_no.nextval,'samsung','ehdgus');
INSERT INTO follow VALUES (seq_follow_no.nextval,'google','emrrb');
INSERT INTO follow VALUES (seq_follow_no.nextval,'google','guswjd');
INSERT INTO follow VALUES (seq_follow_no.nextval,'google','wjdaks');
INSERT INTO follow VALUES (seq_follow_no.nextval,'google','wnsdud');
INSERT INTO follow VALUES (seq_follow_no.nextval,'google','ehdgus');

INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',1000,'43');
INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',1001,'17');
INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',1003,'40');
INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',2000,'40');
INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',2001,'15');
INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',3000,'12');
INSERT INTO career VALUES (seq_career_no.nextval,'dpaak',2001,'28');
INSERT INTO career VALUES (seq_career_no.nextval,'duwk',1002,'23');
INSERT INTO career VALUES (seq_career_no.nextval,'duwk',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'duwk',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'duwk',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'duwk',2002,'20');
INSERT INTO career VALUES (seq_career_no.nextval,'duwk',3002,'22');
INSERT INTO career VALUES (seq_career_no.nextval,'ilin',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'ilin',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'ilin',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'ilin',3000,'5');
INSERT INTO career VALUES (seq_career_no.nextval,'wldus',1002,'23');
INSERT INTO career VALUES (seq_career_no.nextval,'wldus',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'wldus',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'wldus',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'wldus',2002,'20');
INSERT INTO career VALUES (seq_career_no.nextval,'wldus',3002,'22');
INSERT INTO career VALUES (seq_career_no.nextval,'tyler',1000,'57');
INSERT INTO career VALUES (seq_career_no.nextval,'tyler',1002,'21');
INSERT INTO career VALUES (seq_career_no.nextval,'tyler',1003,'55');
INSERT INTO career VALUES (seq_career_no.nextval,'tyler',2000,'52');
INSERT INTO career VALUES (seq_career_no.nextval,'tyler',2002,'17');
INSERT INTO career VALUES (seq_career_no.nextval,'tyler',3000,'48');
INSERT INTO career VALUES (seq_career_no.nextval,'emrrb',1001,'8');
INSERT INTO career VALUES (seq_career_no.nextval,'emrrb',1003,'15');
INSERT INTO career VALUES (seq_career_no.nextval,'emrrb',2001,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'emrrb',3002,'5');
INSERT INTO career VALUES (seq_career_no.nextval,'dbwjd',1001,'8');
INSERT INTO career VALUES (seq_career_no.nextval,'dbwjd',1003,'15');
INSERT INTO career VALUES (seq_career_no.nextval,'dbwjd',2001,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'dbwjd',3002,'5');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',1000,'8');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',1003,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',1001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',1002,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',2000,'8');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',2001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'wnsdud',3003,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',1000,'8');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',1003,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',1001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',1002,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',2000,'8');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',2001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'xkqmffh',3003,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'wjdaks',1002,'23');
INSERT INTO career VALUES (seq_career_no.nextval,'wjdaks',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'wjdaks',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'wjdaks',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'wjdaks',2002,'20');
INSERT INTO career VALUES (seq_career_no.nextval,'wjdaks',3002,'22');
INSERT INTO career VALUES (seq_career_no.nextval,'gusan',1002,'23');
INSERT INTO career VALUES (seq_career_no.nextval,'gusan',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'gusan',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'gusan',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'gusan',2002,'20');
INSERT INTO career VALUES (seq_career_no.nextval,'gusan',3002,'22');
INSERT INTO career VALUES (seq_career_no.nextval,'ehdgus',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'ehdgus',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'ehdgus',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'ehdgus',3000,'5');
INSERT INTO career VALUES (seq_career_no.nextval,'xodus',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'xodus',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'xodus',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'xodus',3000,'5');
INSERT INTO career VALUES (seq_career_no.nextval,'tjrwls',1000,'57');
INSERT INTO career VALUES (seq_career_no.nextval,'tjrwls',1002,'21');
INSERT INTO career VALUES (seq_career_no.nextval,'tjrwls',1003,'55');
INSERT INTO career VALUES (seq_career_no.nextval,'tjrwls',2000,'52');
INSERT INTO career VALUES (seq_career_no.nextval,'tjrwls',2002,'17');
INSERT INTO career VALUES (seq_career_no.nextval,'tjrwls',3000,'48');
INSERT INTO career VALUES (seq_career_no.nextval,'wltjr',1002,'58');
INSERT INTO career VALUES (seq_career_no.nextval,'wltjr',2002,'58');
INSERT INTO career VALUES (seq_career_no.nextval,'wltjr',3000,'24');
INSERT INTO career VALUES (seq_career_no.nextval,'wltjr',3003,'38');
INSERT INTO career VALUES (seq_career_no.nextval,'qkrrud',1001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'qkrrud',2001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'qkrrud',3001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'dhcnlfl',1001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'dhcnlfl',2001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'dhcnlfl',3001,'18');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',1000,'43');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',1001,'17');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',1003,'40');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',2000,'40');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',2001,'15');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',3000,'12');
INSERT INTO career VALUES (seq_career_no.nextval,'guswjd',3001,'28');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',1000,'43');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',1001,'17');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',1003,'40');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',2000,'40');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',2001,'15');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',3000,'12');
INSERT INTO career VALUES (seq_career_no.nextval,'tjfgus',3001,'28');
INSERT INTO career VALUES (seq_career_no.nextval,'gusdk',1002,'23');
INSERT INTO career VALUES (seq_career_no.nextval,'gusdk',1000,'6');
INSERT INTO career VALUES (seq_career_no.nextval,'gusdk',1003,'3');
INSERT INTO career VALUES (seq_career_no.nextval,'gusdk',2000,'4');
INSERT INTO career VALUES (seq_career_no.nextval,'gusdk',2002,'20');
INSERT INTO career VALUES (seq_career_no.nextval,'gusdk',3002,'22');

INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dpaak',30,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dpaak',29,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'duwk',29,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'duwk',28,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'duwk',27,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ilin',27,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ilin',26,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tyler',26,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tyler',25,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'emrrb',25,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'emrrb',24,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wnsdud',24,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wnsdud',23,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'guswjd',23,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'guswjd',22,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wjdaks',22,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wjdaks',21,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ehdgus',21,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ehdgus',20,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tjrwls',20,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tjrwls',19,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wltjr',19,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wldus',16,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'gusdk',16,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'gusdk',15,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tjfgus',15,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tjfgus',14,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dbwjd',14,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dbwjd',13,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dbwjd',12,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'gusan',12,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'gusan',11,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'xodus',11,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'xodus',10,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'xkqmffh',5,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'xkqmffh',4,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dhcnlfl',2,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dhcnlfl',1,'',1);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dpaak','',1,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dpaak','',2,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'duwk','',2,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'duwk','',3,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ilin','',3,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ilin','',4,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tyler','',4,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tyler','',5,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'emrrb','',5,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'emrrb','',6,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wnsdud','',6,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wnsdud','',7,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'guswjd','',7,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'guswjd','',8,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wjdaks','',8,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wjdaks','',9,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ehdgus','',10,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'ehdgus','',11,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tjrwls','',11,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'tjrwls','',12,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wltjr','',12,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wltjr','',13,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'qkrrud','',13,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'qkrrud','',14,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'wldus','',14,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'xkqmffh','',1,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'dhcnlfl','',2,2);
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'xkqmffh','',3,2);

/**************************************************************/
commit;
