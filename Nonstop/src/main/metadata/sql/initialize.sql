
DROP TABLE career;
DROP TABLE follow;
DROP TABLE letter;
DROP TABLE statistics;
DROP TABLE techuse;
DROP TABLE proj_scrap;
DROP TABLE proj_comment;
DROP TABLE record_applicant;
DROP TABLE project;
DROP TABLE port_comment;
DROP TABLE port_scrap;
DROP TABLE port_like;
DROP TABLE portfolio;
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
	user_id 					VARCHAR2(30)  		NOT NULL,
	user_name 				VARCHAR2(10)  		NOT NULL,
	user_pwd 					VARCHAR2(50)  		NOT NULL,
	user_email 				VARCHAR2(30),
	user_img 					VARCHAR2(20),	
	user_role 				NUMBER(1) 	 			NOT NULL,
	user_tel 					NUMBER(30),
	user_emp 					NUMBER,
	user_est 					DATE,
	user_ceo 					VARCHAR2(10),
	user_addr 				VARCHAR2(50),
	PRIMARY KEY(user_id),
	UNIQUE(user_img)
);

CREATE TABLE tech(
	tech_no 					NUMBER 				 		NOT NULL,
	tech_name 				VARCHAR2(30)  		NOT NULL,
	tech_class				NUMBER(1)					NOT NULL,
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
DROP SEQUENCE seq_port_scrap_no;
DROP SEQUENCE seq_port_comment_com_no;
CREATE SEQUENCE seq_portfolio_port_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_like_port_like_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_scrap_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_comment_com_no INCREMENT BY 1 START WITH 1;

CREATE TABLE portfolio ( 
	port_no 					NUMBER 						NOT NULL,
	port_user_id  		VARCHAR2(30) 			NOT NULL REFERENCES users(user_id),
	port_division 		NUMBER(2),
	port_title 				VARCHAR2(100),
	port_regdate 			DATE,
	port_update 			DATE,
	port_file 				VARCHAR2(100)			UNIQUE,
	port_thumbnail 		VARCHAR2(100)			UNIQUE,
	port_detail 			VARCHAR2(4000),
	port_viewcount 		NUMBER(20),
	PRIMARY KEY(port_no)
);
CREATE TABLE port_like ( 
	port_like_no 			NUMBER 						NOT NULL,
	port_no  					NUMBER 						NOT NULL REFERENCES portfolio(port_no),
	user_id 					VARCHAR2(30) 			NOT NULL REFERENCES users(user_id),
	PRIMARY KEY(port_like_no)
);
CREATE TABLE port_scrap (
	port_scrap_no			NUMBER						NOT NULL,
	port_no						NUMBER						NOT NULL REFERENCES portfolio(port_no) ON DELETE CASCADE,
	user_id						VARCHAR2(30)			NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	PRIMARY KEY(port_scrap_no)
);
CREATE TABLE port_comment ( 
	com_no 						NUMBER 						NOT NULL,
	com_port_no  			NUMBER 						NOT NULL REFERENCES portfolio(port_no),
	com_user_id 			VARCHAR2(30) 			NOT NULL REFERENCES users(user_id),
	com_port_regdate 	DATE,
	com_port_content 	VARCHAR2(200),
	PRIMARY KEY(com_no)
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
DROP SEQUENCE seq_proj_scrap_proj_scrap_no;
DROP SEQUENCE seq_proj_comment_com_no;
CREATE SEQUENCE seq_project_proj_no		 	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_record_applicant_rec_no  	INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_proj_scrap_proj_scrap_no	 INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_proj_comment_com_no 	INCREMENT BY 1 START WITH 1;

CREATE TABLE project( 
	proj_no  					NUMBER  					NOT NULL,
	proj_user_id   		VARCHAR2(30)  		NOT NULL  REFERENCES users(user_id),
	proj_division   	NUMBER(2),
	proj_title  			VARCHAR2(100),
	proj_annostart  	DATE,
	proj_annoend  		DATE,
	proj_startdate  	DATE,
	proj_enddate  		DATE,
	proj_location  		VARCHAR2(20),
	proj_detail  			VARCHAR2(4000),
	proj_viewcount  	NUMBER,
	PRIMARY KEY(proj_no)
);
CREATE TABLE record_applicant ( 
	rec_no  					NUMBER  					NOT NULL,
	rec_proj_no  			NUMBER  					NOT NULL REFERENCES project(proj_no),
	rec_user_id  			VARCHAR2(30)  		NOT NULL REFERENCES users(user_id),
	rec_status 				NUMBER(1),
	PRIMARY KEY(rec_no)
);
CREATE TABLE proj_scrap ( 
	proj_scrap_no  		NUMBER  					NOT NULL,
	proj_no  					NUMBER  					NOT NULL REFERENCES project(proj_no),
	user_id  					VARCHAR2(30)  		NOT NULL REFERENCES users(user_id),
	PRIMARY KEY(proj_scrap_no)
);
CREATE TABLE proj_comment ( 
	com_no  					NUMBER  					NOT NULL,
	com_proj_no  			NUMBER  					NOT NULL REFERENCES project(proj_no),
	com_user_id  			VARCHAR2(30)  		NOT NULL REFERENCES users(user_id),
	com_proj_regdate 	DATE,
	com_proj_content 	VARCHAR2(200),
	PRIMARY KEY(com_no)
);

INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com01', 10,'재밌는프로젝트', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울강서구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com02', 11,'재밌는프로젝트2', SYSDATE, to_date('2017/06/28 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/31 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'인천계양구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈2', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com03', 20,'재밌는프로젝트3', SYSDATE, to_date('2017/06/27 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/03 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울강남구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈3', 0);
INSERT INTO project
VALUES (seq_project_proj_no.nextval,'com04', 22,'재밌는프로젝트4', SYSDATE, to_date('2017/06/26 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/04 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울영등포구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈4', 0);

INSERT INTO proj_scrap VALUES (seq_proj_scrap_proj_scrap_no.nextval, 1, 'user01');
INSERT INTO proj_scrap VALUES (seq_proj_scrap_proj_scrap_no.nextval, 2, 'user02');
INSERT INTO proj_scrap VALUES (seq_proj_scrap_proj_scrap_no.nextval, 3, 'user03');
INSERT INTO proj_scrap VALUES (seq_proj_scrap_proj_scrap_no.nextval, 4, 'user04');

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
CREATE SEQUENCE seq_techuse_tu_no	INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_statisics_stat_no	INCREMENT BY 1 START WITH 100;

CREATE TABLE techuse(
	tu_no								NUMBER					NOT NULL ,	
	tu_port_no					NUMBER					REFERENCES portfolio(port_no),
	tu_proj_no					NUMBER					REFERENCES project(proj_no),
	tu_tech_no					NUMBER 					NOT NULL REFERENCES tech(tech_no),
	PRIMARY KEY(tu_no)
);
CREATE TABLE statistics(
	stat_no							NUMBER					NOT NULL,	
	stat_tech_no				NUMBER					NOT NULL REFERENCES tech(tech_no),
	stat_demand					NUMBER					DEFAULT 0,
	stat_supply					NUMBER					DEFAULT 0,	
	stat_user_rate			NUMBER					DEFAULT 0,
	stat_date						DATE						DEFAULT SYSDATE,
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
CREATE SEQUENCE seq_career_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_let_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_follow_no INCREMENT BY 1 START WITH 1;

CREATE TABLE letter(
	let_no	 					NUMBER 						NOT NULL,
	let_send_id 			VARCHAR2(30) 			NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	let_receive_id 		VARCHAR2(30)			NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	let_detail 				VARCHAR2(500),
	let_regdate 			DATE,
	let_readdate 			DATE,
	PRIMARY KEY(let_no)
);
CREATE TABLE follow (
	follow_no 					NUMBER	 				NOT NULL,
	request_id 					VARCHAR2(30)  	NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	recive_id 					VARCHAR2(30) 		NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	PRIMARY KEY(follow_no)
);
CREATE TABLE career (
	career_no 	 				NUMBER 					NOT NULL,
	career_user_id 			VARCHAR2(30) 		NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
	career_tech_no 			NUMBER			 		NOT NULL,
	career_use_month 		NUMBER	 				NOT NULL,
	PRIMARY KEY(career_no)
);

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
