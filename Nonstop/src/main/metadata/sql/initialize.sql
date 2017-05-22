

DROP TABLE statisics;
DROP SEQUENCE seq_statisics_stat_no;

PURGE recyclebin;

CREATE SEQUENCE seq_statisics_stat_no	INCREMENT BY 1 START WITH 100;

CREATE TABLE statisics(
	stat_no						NUMBER				NOT NULL,	
	stat_tech_name		VARCHAR2(30)	NOT NULL,
	stat_tech_class		NUMBER(1)			NOT NULL,
	stat_demand				NUMBER				DEFAULT 0,
	stat_supply				NUMBER				DEFAULT 0,	
	stat_date					DATE					NOT NULL,
	stat_user_rate		NUMBER				DEFAULT 0,
	PRIMARY KEY(stat_no)
);


INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'java',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'C#',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 15);
INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'JavaScript',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 35);
INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'php',1,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 30);

INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'Spring',2,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'Angular2',2,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);

INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'Oracle',3,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);
INSERT INTO statisics VALUES (seq_statisics_stat_no.nextval,'MySQL',3,20,30, to_date('2012/12/14 02:00:00', 'YYYY/MM/DD HH24:MI:SS'), 20);


commit;



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

