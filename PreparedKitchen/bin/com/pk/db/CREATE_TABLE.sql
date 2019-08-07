DROP TABLE MEMBER;

CREATE TABLE MEMBER(

	ID 			VARCHAR2(500) 	PRIMARY KEY,
	PW 			VARCHAR2(500) 	NOT NULL,
	NAME 		VARCHAR2(1000) 	NOT NULL,
	EMAIL 		VARCHAR2(1000) 	NOT NULL,
	PHONE 		VARCHAR2(1000) 	NOT NULL,
	ADDR 		VARCHAR2(2000) 	NOT NULL,
	ENABLED 	VARCHAR2(1000) 	NOT NULL,
	BIRTH 		VARCHAR2(1000) 	NOT NULL,
	REGDATE 	DATE 			NOT NULL,
	ROLE		VARCHAR2(2000)	NOT NULL,
	
	CONSTRAINT CHECK_ENABLED CHECK(ENABLED IN('Y','N'))
);

INSERT INTO MEMBER VALUES('user','0000','홍길동','a@g.com','010-0000-0000','서울시','Y','921119',SYSDATE,'USER');
INSERT INTO MEMBER VALUES('홍길동','0000','홍길동','a@g.com','010-0000-0000','서울시','Y','921119',SYSDATE,'USER');
INSERT INTO MEMBER VALUES('admin','0000','홍길동','a@g.com','010-0000-0000','서울시','Y','921119',SYSDATE,'ADMIN');
SELECT * FROM MEMBER;

---------------------------------------------------------------

DROP SEQUENCE RECIPESEQ;
DROP TABLE RECIPE;

CREATE SEQUENCE RECIPESEQ;
CREATE TABLE RECIPE(

	RECIPE_NO 			NUMBER 			PRIMARY KEY,
	RECIPE_NAME 		VARCHAR2(1000) 	NOT NULL,
	RECIPE_CONTENT 		VARCHAR2(4000) 	NOT NULL,
	RECIPE_NUTRIENT 	VARCHAR2(300) 	NOT NULL,
	RECIPE_CATEGORY 	VARCHAR2(300) 	NOT NULL
);

DELETE FROM RECIPE;

SELECT * FROM RECIPE;

---------------------------------------------------------------

DROP SEQUENCE RECIPEBOARDSEQ;
DROP TABLE RECIPEBOARD;

CREATE SEQUENCE RECIPEBOARDSEQ;
CREATE TABLE RECIPEBOARD(

	RECIPEBOARD_NO 			NUMBER 			 PRIMARY KEY,
	ID 						VARCHAR2(500) 	 NOT NULL,
	RECIPEBOARD_TITLE 		VARCHAR2(2000)	 NOT NULL,
	RECIPEBOARD_CONTENT	 	VARCHAR2(4000)	 NOT NULL,
	RECIPEBOARD_REGDATE		DATE	 		 NOT NULL,
	RECIPEBOARD_READCOUNT	NUMBER			 NOT NULL,
	RECIPEBOARD_LIKE		NUMBER			 NOT NULL,
	
	CONSTRAINT FK_RECIPEBOARD_ID FOREIGN KEY(ID) 
	REFERENCES MEMBER(ID)
);

SELECT * FROM RECIPEBOARD;


INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','토마토파스타','맛있습니다.',SYSDATE,0,0);

INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);
INSERT INTO RECIPEBOARD VALUES(RECIPEBOARDSEQ.NEXTVAL,'홍길동','로제토파스타','맛있습니다.',SYSDATE,0,0);

---------------------------------------------------------------

DROP SEQUENCE LIKESEQ;
DROP TABLE LIKETABLE;

CREATE SEQUENCE LIKESEQ;
CREATE TABLE LIKETABLE(
	LIKETABLE_NO    NUMBER			PRIMARY KEY,
	ID			    VARCHAR2(500) 	NOT NULL,
	RECIPEBOARD_NO  NUMBER 		 	NOT NULL,
	
	CONSTRAINT FK_LIKETABLE_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_LIKETABLE_RECIPEBOARD_NO FOREIGN KEY(RECIPEBOARD_NO)
	REFERENCES RECIPEBOARD(RECIPEBOARD_NO)
);

SELECT * FROM LIKETABLE;



---------------------------------------------------------------

DROP SEQUENCE RECIPECOMMENTSEQ;
DROP SEQUENCE RECIPECOMMENTGROUPSEQ;
DROP TABLE RECIPECOMMENT;

CREATE SEQUENCE RECIPECOMMENTSEQ;
CREATE SEQUENCE RECIPECOMMENTGROUPSEQ;
CREATE TABLE RECIPECOMMENT(

	COMMENT_NO 			NUMBER 			PRIMARY KEY,
	RECIPEBOARD_NO		NUMBER 			NOT NULL,
	ID					VARCHAR2(500) 	NOT NULL,
	COMMENT_CONTENT 	VARCHAR2(4000) 	NOT NULL,
	COMMENT_REGDATE 	DATE		 	NOT NULL,
	COMMENT_GROUPNO 	NUMBER 			NOT NULL,
	COMMENT_ORDER 		NUMBER 			NOT NULL,
	COMMENT_TAB 		NUMBER 			NOT NULL,
	
	CONSTRAINT FK_COMMENT_RECIPEBOARD_NO FOREIGN KEY(RECIPEBOARD_NO) 
	REFERENCES RECIPEBOARD(RECIPEBOARD_NO)
);

SELECT * FROM RECIPECOMMENT;
---------------------------------------------------------------

DROP SEQUENCE MATERIALSEQ;
DROP TABLE MATERIAL;

CREATE SEQUENCE MATERIALSEQ;
CREATE TABLE MATERIAL(

	MATERIAL_NO 		NUMBER,
	RECIPE_NO 			NUMBER,
	MATERIAL_NAME 		VARCHAR2(500) 	NOT NULL,
	MATERIAL_CAPACITY 	VARCHAR2(500) 	NOT NULL,
	MATERIAL_TYPECODE 	NUMBER 			NOT NULL,
	MATERIAL_TYPENAME 	VARCHAR2(200) 	NOT NULL,
	
	CONSTRAINT PK_MATERIAL PRIMARY KEY(MATERIAL_NO, RECIPE_NO),
	CONSTRAINT FK_MATERIAL_RECIPE_NO FOREIGN KEY(RECIPE_NO)
	REFERENCES RECIPE(RECIPE_NO)
);

---------------------------------------------------------------

DROP SEQUENCE PRODUCTLISTSEQ;
DROP TABLE PRODUCTLIST;

CREATE SEQUENCE PRODUCTLISTSEQ;
CREATE TABLE PRODUCTLIST(

	PRODUCTLIST_NO 	NUMBER 			PRIMARY KEY,
	RECIPE_NO 		NUMBER 			NOT NULL,
	RECIPE_NAME 	VARCHAR2(1000) 	NOT NULL,
	RECIPE_IMG 		VARCHAR2(1000) 	NOT NULL,
	SALES_COUNT 	NUMBER 			NOT NULL,
	VIEW_NO 		NUMBER 			NOT NULL,
	
	CONSTRAINT FK_PRODUCTLIST_RECIPE_NO FOREIGN KEY(RECIPE_NO)
	REFERENCES RECIPE(RECIPE_NO)
);

SELECT * FROM PRODUCTLIST;

INSERT INTO PRODUCTLIST
VALUES(PRODUCTLISTSEQ.NEXTVAL, 1, '나물비빔밥','준비중입니다.',0,10);
INSERT INTO PRODUCTLIST
VALUES(PRODUCTLISTSEQ.NEXTVAL, 2, '오곡밥','준비중입니다.',5,15);
INSERT INTO PRODUCTLIST
VALUES(PRODUCTLISTSEQ.NEXTVAL, 3, '잡채밥','준비중입니다.',10,30);
INSERT INTO PRODUCTLIST
VALUES(PRODUCTLISTSEQ.NEXTVAL, 4, '콩나물밥','준비중입니다.',1,25);
INSERT INTO PRODUCTLIST
VALUES(PRODUCTLISTSEQ.NEXTVAL, 5, '약식','준비중입니다.',6,46);

---------------------------------------------------------------

DROP SEQUENCE PAYMENTSEQ;
DROP TABLE PAYMENT;

CREATE SEQUENCE PAYMENTSEQ;
CREATE TABLE PAYMENT(

	PAYMENT_NO 			NUMBER 			PRIMARY KEY,
	PAYMENT_GROUP 	VARCHAR2(500)	NOT NULL,
	ID 					VARCHAR2(500) 	NOT NULL,
	ITEM_NAME			VARCHAR2(500)	NOT NULL,
	ITEM_CODE			VARCHAR2(500)	NOT NULL,
	PAYMENT_PRICE 		VARCHAR2(500) 	NOT NULL,
	RECIPE_NO 			NUMBER 			NOT NULL,
	MATERIAL_NO 		NUMBER 			NOT NULL,
	PAYMENT_DATE 		VARCHAR2(500) 	NOT NULL,
	SHIPPING_ADDR 		VARCHAR2(2000) 	NOT NULL,
	
	CONSTRAINT FK_PAYMENT_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_PAYMENT_MATERIAL_NO FOREIGN KEY(MATERIAL_NO, RECIPE_NO)
	REFERENCES MATERIAL(MATERIAL_NO, RECIPE_NO)
);

INSERT INTO RECIPE 
VALUES(RECIPESEQ.NEXTVAL, '고기볶음', '조리방법', '영양소', '한식');
INSERT INTO MATERIAL
VALUES(MATERIALSEQ.NEXTVAL, 1, '돼지목살', '400g', '100', '돼지고기');
INSERT INTO MATERIAL
VALUES(MATERIALSEQ.NEXTVAL, 1, '상추', '200g', '200', '야채');
INSERT INTO MATERIAL
VALUES(MATERIALSEQ.NEXTVAL, 1, '마늘', '100g', '200', '야채');
INSERT INTO PAYMENT
VALUES(0, 111, 'user', '레시피', '1393, 1211', '3000', 2, 2, '2199-8-12', '배송');

UPDATE PAYMENT SET PAYMENT_DATE = '2019-08-14' WHERE ID = 'user'

SELECT * FROM RECIPE;
SELECT * FROM MATERIAL;
SELECT * FROM PAYMENT;


---------------------------------------------------------------

DROP SEQUENCE INTERESTLISTSEQ;
DROP TABLE INTERESTLIST;

CREATE SEQUENCE INTERESTLISTSEQ;
CREATE TABLE INTERESTLIST(

	INTERESTLIST_NO 	NUMBER 			PRIMARY KEY,
	ID 					VARCHAR2(500) 	NOT NULL,
	RECIPE_NO 			NUMBER 			NOT NULL,
	
	CONSTRAINT FK_INTEREST_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_INTEREST_RECIPE_NO FOREIGN KEY(RECIPE_NO)
	REFERENCES RECIPE(RECIPE_NO)
);
SELECT 
---------------------------------------------------------------

DROP SEQUENCE CARTSEQ;
DROP TABLE CART;

CREATE SEQUENCE CARTSEQ;
CREATE TABLE CART(

	CART_NO 		NUMBER 			PRIMARY KEY,
	ID 				VARCHAR2(500) 	NOT NULL,
	RECIPE_NO		NUMBER 			NOT NULL,
	MATERIAL_NO 	NUMBER 			NOT NULL,
	
	CONSTRAINT FK_CART_ID FOREIGN KEY(ID)
	REFERENCES MEMBER(ID),
	CONSTRAINT FK_CART_MATERIAL_NO FOREIGN KEY(MATERIAL_NO, RECIPE_NO)
	REFERENCES MATERIAL(MATERIAL_NO, RECIPE_NO)
);



SELECT R.RECIPE_NAME, P.PAYMENT_DATE, M.MATERIAL_NAME, P.ID FROM RECIPE R, PAYMENT P, MATERIAL M WHERE P.ID = 'user'

