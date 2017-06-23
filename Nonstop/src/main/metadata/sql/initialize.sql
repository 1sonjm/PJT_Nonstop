
DROP TABLE scrap;
DROP TABLE career;
DROP TABLE follow;
DROP TABLE letter;
DROP TABLE statistics;
DROP TABLE techuse;
DROP TABLE proj_comment;
DROP TABLE record_applicant;
DROP TABLE project;
DROP TABLE port_comment;
DROP TABLE port_like;
DROP TABLE port_images;
DROP TABLE portfolio CASCADE CONSTRAINTS;
DROP TABLE tech;
DROP TABLE users;

/**************************************************************/
/*************************    회원관리      *************************/

DROP SEQUENCE seq_tech_tech_no1;
DROP SEQUENCE seq_tech_tech_no2;
DROP SEQUENCE seq_tech_tech_no3;
CREATE SEQUENCE seq_tech_tech_no1 INCREMENT BY 1 START WITH 1000 MAXVALUE 1999;
CREATE SEQUENCE seq_tech_tech_no2 INCREMENT BY 1 START WITH 2000 MAXVALUE 2999;
CREATE SEQUENCE seq_tech_tech_no3 INCREMENT BY 1 START WITH 3000 MAXVALUE 3999;

CREATE TABLE users(
  user_id           VARCHAR2(30)       NOT NULL,
  user_name         VARCHAR2(10)       NOT NULL,
  user_pwd          VARCHAR2(50)       NOT NULL,
  user_email        VARCHAR2(30),
  user_img          VARCHAR2(20),  
  user_role         NUMBER(1)          NOT NULL,
  user_tel          NUMBER(30),
  user_emp          NUMBER,
  user_est          DATE,
  user_ceo          VARCHAR2(10),
  user_addr         VARCHAR2(50),
  PRIMARY KEY(user_id),
  UNIQUE(user_img)
);

CREATE TABLE tech(
  tech_no           NUMBER             NOT NULL,
  tech_name         VARCHAR2(30)       NOT NULL,
  tech_class        NUMBER(1)          NOT NULL,
  PRIMARY KEY(tech_no),
  UNIQUE(tech_name)
);

INSERT INTO users(user_id,user_name,user_pwd,user_email,user_role,user_tel)
VALUES ('admin','관리자','1234','zxc@naver,com',1,010-1234-5678);

INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user01','개인1','1234','zxc1@naver,com','user01img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user02','개인2','1234','zxc2@naver,com','user02img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user03','개인3','1234','zxc3@naver,com','user03img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user04','개인4','1234','zxc4@naver,com','user04img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user05','개인5','1234','zxc5@naver,com','user01img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user06','개인6','1234','zxc6@naver,com','user02img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user07','개인7','1234','zxc7@naver,com','user03img',2,010-1234-5678,'서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_addr)
VALUES ('user08','개인8','1234','zxc8@naver,com','user04img',2,010-1234-5678,'서울 강남구');



INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('com01','기업1','1234','qwe1@naver,com','com01img',3,010-1234-5678,
        20,to_date('2010/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'ceo1','서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('com02','기업2','1234','qwe2@naver,com','com02img',3,010-1234-5678,
        20,to_date('2000/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'ceo2','서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('com03','기업3','1234','qwe3@naver,com','com03img',3,010-1234-5678,
        20,to_date('1998/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'ceo3','서울 강남구');
INSERT INTO users(user_id,user_name,user_pwd,user_email,user_img,user_role,user_tel,user_emp,user_est,user_ceo,user_addr)
VALUES ('com04','기업4','1234','qwe4@naver,com','com04img',3,010-1234-5678,
        20,to_date('2012/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),'ceo4','서울 강남구');


INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Java',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Python',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'PHP',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'JavaScript',1);
INSERT INTO tech VALUES (seq_tech_tech_no1.nextval,'Swift',1);

INSERT INTO tech VALUES (seq_tech_tech_no2.nextval,'Spring',2);
INSERT INTO tech VALUES (seq_tech_tech_no2.nextval,'Django',2);
INSERT INTO tech VALUES (seq_tech_tech_no2.nextval,'Symfony',2);

INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'Oracle',3);
INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'MsSQL',3);
INSERT INTO tech VALUES (seq_tech_tech_no3.nextval,'MySQL',3);
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
  port_like_no      NUMBER             NOT NULL PRIMARY KEY,
  port_no           NUMBER             NOT NULL,
  user_id           VARCHAR2(30)       NOT NULL,
  CONSTRAINT port_like_fk
  FOREIGN KEY (port_no) REFERENCES portfolio(port_no) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE port_comment ( 
  com_no            NUMBER             NOT NULL PRIMARY KEY,
  com_port_no       NUMBER             NOT NULL, 
  com_user_id       VARCHAR2(30)       NOT NULL,
  com_port_regdate  DATE,
  com_port_content  VARCHAR2(200),
  CONSTRAINT port_comment_fk
  FOREIGN KEY (com_port_no) REFERENCES portfolio(port_no) ON DELETE CASCADE,
  FOREIGN KEY (com_user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
CREATE TABLE port_images(
  img_no 			NUMBER				NOT NULL PRIMARY KEY, 
  img_port_no 		NUMBER				NOT NULL,
  img_name 			VARCHAR2(50)		NOT NULL,
  img_order 		NUMBER(30),
  CONSTRAINT port_images_fk
  FOREIGN KEY (img_port_no) REFERENCES portfolio(port_no) ON DELETE CASCADE
);

INSERT INTO portfolio (port_no,port_user_id,port_division,port_title,port_regdate,port_file,port_detail) 
VALUES (seq_portfolio_port_no.nextval,'user01',11,'포트폴리오 제목1',
        to_date('2017/05/01 11:27:27','YYYY/MM/DD HH24:MI:SS'),'111.jpg','1포트폴리오입니다.');
INSERT INTO portfolio (port_no,port_user_id,port_division,port_title,port_regdate,port_file,port_detail) 
VALUES (seq_portfolio_port_no.nextval,'user02',11,'포트폴리오 제목2',
        to_date('2016/02/01 11:27:27','YYYY/MM/DD HH24:MI:SS'),'222.jpg','2포트폴리오입니다.');
INSERT INTO portfolio (port_no,port_user_id,port_division,port_title,port_regdate,port_file,port_detail) 
VALUES (seq_portfolio_port_no.nextval,'user03',11,'포트폴리오 제목3',
        to_date('2015/01/01 11:27:27','YYYY/MM/DD HH24:MI:SS'),'333.jpg','3포트폴리오입니다.');
INSERT INTO portfolio (port_no,port_user_id,port_division,port_title,port_regdate,port_file,port_detail) 
VALUES (seq_portfolio_port_no.nextval,'user04',11,'포트폴리오 제목4',
        to_date('2017/05/20 11:27:27','YYYY/MM/DD HH24:MI:SS'),'444.jpg','4포트폴리오입니다.');
INSERT INTO portfolio (port_no,port_user_id,port_division,port_title,port_regdate,port_update,port_file,port_detail) 
VALUES (seq_portfolio_port_no.nextval,'user04',11,'포트폴리오 제목5',
        to_date('2016/04/17 11:27:27','YYYY/MM/DD HH24:MI:SS')
        ,to_date('2017/05/22 11:27:27','YYYY/MM/DD HH24:MI:SS'),'555.jpg','5포트폴리오입니다.');

INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 1, 'user01', SYSDATE, '댓글은 댓글일뿐1');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 1, 'user02', SYSDATE, '댓글은 댓글일뿐2');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 1, 'user03', SYSDATE, '댓글은 댓글일뿐3');
INSERT INTO port_comment VALUES (seq_port_comment_com_no.nextval, 2, 'user04', SYSDATE, '댓글은 댓글일뿐4');

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
VALUES (seq_project_proj_no.nextval,'com02', 11,'스토어팜 자동등록 Python 프로그램', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울강서구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 -\n 진행 간 작업 상황 체크/확인 - 재택근무 ※프로젝트의 현재 상황 - 원하는 기능이 명확하게 기획이 되어있음 - 유사한 프로그램 개발 경험 있는 분 ※상세한 업무 내용 [ 스토어팜 자동등록 Python 프로그램 ] - 개인 프리랜서 개발자 무관 + 개발 내용 - 해외 특정 쇼핑몰의 특정 판매자의 모든 상품 크롤링 후 엑셀 출력/저장 - 정보 크롤링시 상품소개글 영문 text google 번역 api 로 한국어로 번역 후 엑셀 저장 - 상품 이미지는 별도 다운로드 업로드 (링크 불가) - 가공된 엑셀 데이터 및 이미지를 프로그램 업로드 / 스토어팜 자동 등록 - Scrapy 사용 권장 (https://scrapy.org/) # 킥오프일정 : 적합한 작업자 선정 이후 ( 개발 경험자 서칭 )', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com02', 21,'영어업체 메인페이지 디자인', SYSDATE, to_date('2017/06/28 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/31 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 강서구', '※프로젝트 진행 방식 - 최초 전화 또는 카카오톡 미팅 - 작업진행 시 최초 1회만 미팅(분당 서현역) ※프로젝트의 현재 상황 - 워드프레스 레퍼런스 참고한 디자인 콘셉트 있음 - 디자인 소스 있음(일러스트 원본 소스 및 카피 등) ※상세한 업무 내용 [ 영어업체 웹 메인페이지 디자인 ] - 개발 분류 : 메인페이지 디자인(web) - 작업 내용 : 메인페이지 시안 2종 및 메인페이지 디자인 - 이미지 슬라이스, 원본 필요 - 대문 페이지 디자인만 교체하며, 일러스트와 카피 위주의 심플하고 세련된 형태로 디자인을 요청드립니다. 기존의 긴 형태가 아니라 좌우로 넘기는 형태로 예상하고 있습니다. #킥오프 : 온라인미팅 후 1주 이내 ※참고 사이트 및 자료 - 기존 사이트 http://hearsayenglish.com/main/main.php?source= - 일러스트 참조 윤재성 원장님 저서 내지 일러스트 활용 계획입니다. 아래 링크 책속에서 부분에서 참고 바랍니다. http://www.aladin.co.kr/shop/wproduct.aspx?ItemId=100036971', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com02', 11,'자동차 관련 케미컬 쇼핑몰 마감', SYSDATE, to_date('2017/06/27 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
  to_date('2017/07/03 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
  '서울 강서구', '※프로젝트 진행 방식 - 초기 오프라인 미팅1회 - 주 단위 2회 정기 미팅 - 재택근무 ※프로젝트의 현재 상황 - 독일회사와의 독점 계약으로 국내 전용 쇼핑몰 개발 예정 - 온라인 쇼핑몰관련 본사에서 지원 예정이나, 어떤 방식으로 어떻게 지원을 할 것인지는 5월 31일 전에 결정이 될 예정으로 정확한 작업 공수는 미팅시 협의 진행 - 쇼핑몰 뿐아니라, 필요한 상품 상세페이지 디자인도 협의 후 같이 진행 하고자 함 ( 기간/ 금액 협의 ) ※상세한 업무 내용 [ 자동차 관련 케이컬 쇼핑몰 ] - 개발 분류 : 서버 및 웹관리자, 클라이언트 ( pc web ) ,디자인 - 쇼핑몰은 자동차 소모품으로 미션오일/첨과제등의 제품 입니다. # UI 및 기능은 독일 본사 쇼핑몰과 유사하게 진행 예정 ( 현재 확정되지 않은 보안이 필요한 상태로 미팅시 참고사이트 제공 ) + 개발 분류 - 회원가입 , 로그인 - 도매/소매가 별도 측정되어야 함 ( UI 분리 ) - 상품 검색 / 필터 - 리스터 및 상세 페이지 - 주문 / 상담 하기 - 장바구니, 결제 (PG) # Wordpress 우커머스 개발이 가능하신 팀 ( 필수 아님 / 협의 후 진행 ) # 본사와 기능 및 내용 확정 후 합당한 선에서 기간 및 견적 재협의 # 킥오프일정 : 6월 1째주', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com04', 21,'쇼핑몰 메인이미지 변경&상품등록', SYSDATE, to_date('2017/06/26 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/04 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울 강서구', '※프로젝트 진행 방식 - 초기 온/오프라인 미팅 - 커뮤니케이션이 원활하고 실력있는 분 희망 - 재택근무 ※프로젝트의 현재 상황 - 운영중인 홈페이지에 메인 배너 이미지 변경 - 쇼핑몰은 카페24기반 제작되었으며 웹을 관리하던 개발자가 있었으나, 현재 없음 - 개발자 부재후 관리 방법을 몰라, 상품등록 지원 및 가이드 설명 필요 - 운영 웹사이트 : http://www.tyche.tv ※상세한 업무 내용 [ 쇼핑몰 메인배너 이미지 디자인 및 상품등록 ] - 산출물 : PSD , 이미지 파일 , 상품 등록 리스트 - 현재 운영중 웹사이트 메인 배너디지인 교체 # 배너수 : 7개 디자인 - 현재 상품등록이 되어야 하는 DB가 약 200여건이 있으며, 웹관리자를 통해 등록대행을 해주셨으면 합니다. (상황에 따라 교육 필요 ) - 미팅시에 자세한 내용 공유. ※참고 사이트 및 자료/ 유의 사항 http://www.tyche.tv', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com01', 12,'토이플러스 모바일 웹 퍼블리싱', SYSDATE, to_date('2017/06/26 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/04 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'인천 부평구', '※프로젝트 진행 방식 - 초기 오프라인 미팅 1회 - 진행간 주 2회 정도 사무실 상근 가능한 분 우대 ( 협의 가능 ) - 나머지 재택 - 사무실 : 서울 강남구 ※프로젝트의 현재 상황 - 웹서비스 디자인 개편작업중 - 개편된 디자인 파일 제공 ( psd ) ※상세한 업무 내용 [ 토이플러스 모바일 웹 퍼블리싱 ] - 개발분류 : 클라이언트 ( 반응형 퍼블리싱 ) + 개편 진행 중 웹사이트 - http://www.toyplus.co.kr - http://m.toyplus.co.kr - 기존에 있는 웹페이지 디자인 변경에 따른 퍼블리싱 - 전체 화면 수 : 20p ~ 30p - 개인 프리랜서 우대 # 킥오프일정 : 6월 2째주 ※참고 사이트 및 자료/ 유의 사항 http://www.toyplus.co.kr http://m.toyplus.co.kr', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com03', 22,'커뮤니티 Android 앱 디자인(10p)', SYSDATE, to_date('2017/06/26 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/04 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'인천 부평구', '※프로젝트 진행 방식 - 초기 온/오프라인 미팅 - 마무리 단계 미팅 - 재택근무 ※프로젝트의 현재 상황 - 화면 기획/초안 문서 작성 완료 - 전체 톤앤매너, 컨셉 잡혀있음 - 하단 첨부 파일 참고 ※상세한 업무 내용 [ 커뮤니티 Android 앱 디자인(10p) ] - 산출물 : PSD 디자인 원본 파일 + 서비스 간략 소개 - 사회,경제,국제,정치등의 여러분야 국내/외 이슈에 대한 유저들의 설문/댓글등으로 의견교류를 하는 커뮤니티성 안드로이드 서비스 - 대략적인 컨셉/디자인 구상되어있음 - 전체 화면 수 : 10P - 페이지 / 아이콘 디자인 필요 # 킥오프일정 : 5월4째주', 0);

INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 1, 'user01', SYSDATE, '댓글은 댓글일뿐1');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 2, 'user02', SYSDATE, '댓글은 댓글일뿐2');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 3, 'user03', SYSDATE, '댓글은 댓글일뿐3');
INSERT INTO proj_comment VALUES (seq_proj_comment_com_no.nextval, 4, 'user04', SYSDATE, '댓글은 댓글일뿐4');

INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 1, 'user04', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 2, 'user03', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 3, 'user02', 0);
INSERT INTO record_applicant VALUES (seq_record_applicant_rec_no.nextval, 4, 'user01', 0);


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

INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,27,1001);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,27,2000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,27,3001);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,28,1000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,28,1002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,28,2000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,28,3000);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,29,1002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,29,2002);
INSERT INTO techuse (tu_no,tu_proj_no,tu_tech_no) VALUES (seq_techuse_tu_no.nextval,29,3002);


INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1000,10,27,20,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1001,9,15,15,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1002,2,10,35,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1003,22,18,35,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,1004,11,10,35,SYSDATE);

INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2000,7,30,30,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2001,21,12,20,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,2002,16,17,32,SYSDATE);

INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3000,12,16,5,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3001,18,13,8,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3002,21,9,12,SYSDATE);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,3003,26,16,12,SYSDATE);

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
  let_no            NUMBER              NOT NULL,
  let_send_id       VARCHAR2(30)        NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  let_receive_id    VARCHAR2(30)        NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  let_detail        VARCHAR2(500),
  let_regdate       DATE,
  let_readdate      DATE,
  PRIMARY KEY(let_no)
);
CREATE TABLE follow (
  follow_no         NUMBER              NOT NULL,
  request_id        VARCHAR2(30)        NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  recive_id         VARCHAR2(30)        NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  PRIMARY KEY(follow_no)
);
CREATE TABLE career (
  career_no             NUMBER            NOT NULL,
  career_user_id        VARCHAR2(30)      NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  career_tech_no        NUMBER            NOT NULL REFERENCES tech(tech_no) ON DELETE CASCADE,
  career_use_month      NUMBER            NOT NULL,
  PRIMARY KEY(career_no) 
);
CREATE TABLE scrap (
  scrap_no      NUMBER         NOT NULL,
  user_id       VARCHAR2(30)   NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  port_no       NUMBER         REFERENCES portfolio(port_no) ON DELETE CASCADE,
  proj_no       NUMBER         REFERENCES project(proj_no) ON DELETE CASCADE,
  scrap_div     NUMBER(1)      NOT NULL,
  PRIMARY KEY(scrap_no)
);

INSERT INTO scrap VALUES (seq_scrap_no.nextval,'user01',1,'',1 );
INSERT INTO scrap VALUES (seq_scrap_no.nextval,'user01','',1,2);

INSERT INTO career VALUES (seq_career_no.nextval,'user01',1000,10);
INSERT INTO career VALUES (seq_career_no.nextval,'user01',2000,10);
INSERT INTO career VALUES (seq_career_no.nextval,'user01',3000,10);
INSERT INTO career VALUES (seq_career_no.nextval,'user02',1000,10);
INSERT INTO career VALUES (seq_career_no.nextval,'user02',2000,10);
INSERT INTO career VALUES (seq_career_no.nextval,'user03',2000,10);
INSERT INTO career VALUES (seq_career_no.nextval,'user03',3000,10);

/**************************************************************/
PURGE recyclebin;
commit;
