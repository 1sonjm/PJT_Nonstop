
DROP TABLE career;
DROP TABLE follow;
DROP TABLE letter;
DROP TABLE statistics;
DROP TABLE techuse;
DROP TABLE proj_comment;
DROP TABLE proj_scrap;
DROP TABLE record_applicant;
DROP TABLE project;
DROP TABLE port_comment;
DROP TABLE port_scrap;
DROP TABLE port_like;
DROP TABLE portfolio;
DROP TABLE users;

/**************************************************************/
/*************************    회원관리      *************************/

CREATE TABLE users (
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


DROP SEQUENCE seq_portfolio_port_no;
DROP SEQUENCE seq_port_like_port_like_no;
DROP SEQUENCE seq_port_scrap_no;
DROP SEQUENCE seq_port_comment_com_no;
CREATE SEQUENCE seq_portfolio_port_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_like_port_like_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_scrap_no INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_port_comment_com_no INCREMENT BY 1 START WITH 1;

/**************************************************************/
/*************************   포트폴리오     *************************/

CREATE TABLE portfolio ( 
	port_no 					NUMBER 						NOT NULL,
	port_user_id  		VARCHAR2(30) 			NOT NULL REFERENCES users(user_id),
	port_division 		NUMBER(2),
	port_title 				VARCHAR2(100),
	port_regdate 			DATE,
	port_update 			DATE,
	port_file 				VARCHAR2(100),
	port_thumbnail 		VARCHAR2(100),
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

/*
INSERT 
INTO portfolio ( port_no, port_user_id, port_division, port_title, port_regdate, port_file, port_detail) 
VALUES ( seq_portfolio_port_no.nextval, 'user01', 11, '포트폴리오 제목', sysdate, '333.jpg', '포트폴리오입니다.'); 
*/


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

/*
insert into project
values (seq_project_proj_no,'user01', 10,'재밌는프로젝트', SYSDATE, to_date('2017/06/29 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/30 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울강서구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈', 0);
insert into project
values (seq_project_proj_no,'user02', 11,'재밌는프로젝트2', SYSDATE, to_date('2017/06/28 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/07/31 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'인천계양구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈2', 0);
insert into project
values (seq_project_proj_no,'user03', 20,'재밌는프로젝트3', SYSDATE, to_date('2017/06/27 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/03 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/01 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울강남구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈3', 0);
insert into project
values (seq_project_proj_no,'user04', 22,'재밌는프로젝트4', SYSDATE, to_date('2017/06/26 13:04:31', 'YYYY/MM/DD HH24:MI:SS'),
	to_date('2017/07/04 11:27:27', 'YYYY/MM/DD HH24:MI:SS'), to_date('2017/08/02 11:27:27', 'YYYY/MM/DD HH24:MI:SS'),
	'서울영등포구', '이러이러한내용이있어서 정말좋앗는데 님들도 좋을꺼임 ㅋㅋㅋㅋㅋ 진짜좋음 한번와보셈4', 0);

insert into proj_scrap
values (seq_proj_scrap_proj_scrap_no, 1, 'user01');
insert into proj_scrap
values (seq_proj_scrap_proj_scrap_no, 2, 'user02');
insert into proj_scrap
values (seq_proj_scrap_proj_scrap_no, 3, 'user03');
insert into proj_scrap
values (seq_proj_scrap_proj_scrap_no, 4, 'user04');

insert into proj_comment
values (seq_proj_comment_com_no, 1, 'user01', SYSDATE, '댓글은 댓글일뿐1');
insert into proj_comment
values (seq_proj_comment_com_no, 2, 'user02', SYSDATE, '댓글은 댓글일뿐2');
insert into proj_comment
values (seq_proj_comment_com_no, 3, 'user03', SYSDATE, '댓글은 댓글일뿐3');
insert into proj_comment
values (seq_proj_comment_com_no, 4, 'user04', SYSDATE, '댓글은 댓글일뿐4');

insert into record_applicant
values (seq_record_applicant_rec_no, 1, 'user04', 0);
insert into record_applicant
values (seq_record_applicant_rec_no, 2, 'user03', 0);
insert into record_applicant
values (seq_record_applicant_rec_no, 3, 'user02', 0);
insert into record_applicant
values (seq_record_applicant_rec_no, 4, 'user01', 0);
*/


/**************************************************************/
/*************************    기술통계      *************************/

DROP SEQUENCE seq_techuse_tu_no;
DROP SEQUENCE seq_statisics_stat_no;
CREATE SEQUENCE seq_techuse_tu_no	INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_statisics_stat_no	INCREMENT BY 1 START WITH 100;

CREATE TABLE techuse(
	tu_no								NUMBER					NOT NULL,	
	tu_post_no					NUMBER					NOT NULL,
	tu_post_div					NUMBER(1)				NOT NULL,
	tu_tech_name				VARCHAR(30)			NOT NULL,
	tu_tech_class				NUMBER(1)				NOT NULL,
	PRIMARY KEY(tu_no)
);
CREATE TABLE statistics(
	stat_no							NUMBER					NOT NULL,	
	stat_tech_name			VARCHAR2(30)		NOT NULL,
	stat_tech_class			NUMBER(1)				NOT NULL,
	stat_demand					NUMBER					DEFAULT 0,
	stat_supply					NUMBER					DEFAULT 0,	
	stat_date						DATE						DEFAULT SYSDATE,
	stat_user_rate			NUMBER					DEFAULT 0,
	PRIMARY KEY(stat_no)
);

INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'java',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'C#',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 15);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'JavaScript',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 35);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'php',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 30);

INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'Spring',2,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'Angular2',2,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);

INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'Oracle',3,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO statistics VALUES (seq_statisics_stat_no.nextval,'MySQL',3,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);

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
	career_tech_name 		VARCHAR2(30) 		NOT NULL,
	career_tech_class 	NUMBER(1) 			NOT NULL,
	career_use_month 		NUMBER	 				NOT NULL,
	PRIMARY KEY(career_no)
);


PURGE recyclebin;
commit;
