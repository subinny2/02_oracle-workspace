
--DROP

DROP TABLE "TB_WATCHED";
DROP TABLE "TB_REVIEW_LIKE";
DROP TABLE "TB_NOT_INTERESTED";
DROP TABLE "TB_SEARCH" CASCADE CONSTRAINTS;
DROP TABLE "TB_REPORT" CASCADE CONSTRAINTS;
DROP TABLE "TB_FAVORITE";
DROP TABLE "TB_ACTOR" CASCADE CONSTRAINTS;
DROP TABLE "TB_DIRECTOR" CASCADE CONSTRAINTS;
DROP TABLE "TB_LIKE";
DROP TABLE "TB_COMMENT" CASCADE CONSTRAINTS;
DROP TABLE "TB_COMM" CASCADE CONSTRAINTS;
DROP TABLE "TB_NOTICE_COMMENT" CASCADE CONSTRAINTS;
DROP TABLE "TB_NOTICE" CASCADE CONSTRAINTS;
DROP TABLE "TB_REVIEW" CASCADE CONSTRAINTS;
DROP TABLE "TB_MYPAGE";
DROP TABLE "TB_WATCHING";
DROP TABLE "TB_WISH";
DROP TABLE "TB_TITLE_HT"CASCADE CONSTRAINTS;
DROP TABLE "TB_NORMAL_HT"CASCADE CONSTRAINTS;
DROP TABLE "TB_MEMBER" CASCADE CONSTRAINTS;
DROP TABLE "TB_CONTENT"CASCADE CONSTRAINTS;
DROP TABLE "TB_ATTACH_COM";
DROP TABLE "TB_ATTACH_NOTI";
DROP TABLE "TB_ATTACH_CONTENT";

DROP SEQUENCE SEQ_AT_CONT_NO;
DROP SEQUENCE SEQ_AT_PRF_NO;
DROP SEQUENCE SEQ_AT_COMM_NO;
DROP SEQUENCE SEQ_COM_NO;
DROP SEQUENCE SEQ_POST_NO;
DROP SEQUENCE SEQ_NTC_NO;
DROP SEQUENCE SEQ_NOT_NO;
DROP SEQUENCE SEQ_REV_NO;
DROP SEQUENCE SEQ_THT_NO;
DROP SEQUENCE SEQ_NHT_NO;
DROP SEQUENCE SEQ_ACT_NO;
DROP SEQUENCE SEQ_DIR_NO;
DROP SEQUENCE SEQ_SER_NO;
DROP SEQUENCE SEQ_CONT_NO;
DROP SEQUENCE SEQ_MEM_NO;


-- SEQUENCE

CREATE SEQUENCE SEQ_MEM_NO -- MEM_NO
START WITH 100000
NOCACHE;

CREATE SEQUENCE SEQ_CONT_NO -- CONTENT_NO
START WITH 200000
NOCACHE;

CREATE SEQUENCE SEQ_SER_NO -- SEARCH_NO
START WITH 300000
NOCACHE;

CREATE SEQUENCE SEQ_DIR_NO -- DIR_NO
START WITH 400000
NOCACHE;

CREATE SEQUENCE SEQ_ACT_NO -- ACTOR_NO
START WITH 500000
NOCACHE;

CREATE SEQUENCE SEQ_NHT_NO -- NORMAL_HT_NO
START WITH 600000
NOCACHE;

CREATE SEQUENCE SEQ_THT_NO -- TITLE_HT_NO
START WITH 700000
NOCACHE;

CREATE SEQUENCE SEQ_REV_NO -- REVIEW_NO
START WITH 800000
NOCACHE;

CREATE SEQUENCE SEQ_NOT_NO -- NOTICE_NO
START WITH 900000
NOCACHE;

CREATE SEQUENCE SEQ_NTC_NO -- NOTICE_COM_NO
START WITH 90000
NOCACHE;

CREATE SEQUENCE SEQ_POST_NO -- POST_NO 
START WITH 80000
NOCACHE;

CREATE SEQUENCE SEQ_COM_NO -- COM_NO
START WITH 70000
NOCACHE;

CREATE SEQUENCE SEQ_AT_COMM_NO -- COMM_FILE_NO
START WITH 60000
NOCACHE;

CREATE SEQUENCE SEQ_AT_PRF_NO -- NOTI_FILE_NO
START WITH 50000
NOCACHE;

CREATE SEQUENCE SEQ_AT_CONT_NO -- CONTENT_FILE_NO
START WITH 40000
NOCACHE;




CREATE TABLE TB_CONTENT(
    CONTENT_NO VARCHAR2(10) PRIMARY KEY,
    CONTENT_NAME VARCHAR2(200) NOT NULL,
    CON_DESCRIPTION VARCHAR2(1000) NOT NULL,
    GENRE VARCHAR2(20) NOT NULL,
    RELEASE_YEAR DATE NOT NULL,
    COUNTRY VARCHAR2(10) NOT NULL,
    GRADE VARCHAR2(30) NOT NULL,
    RATING NUMBER NOT NULL,
    END_DATE DATE DEFAULT NULL,
    REVIEW_COUNT NUMBER NOT NULL,
    OTT_URL VARCHAR2(500) NOT NULL,
    TRAILER_VID VARCHAR2(500),
    OTT_PLATFORM VARCHAR2(100),
    CONTENT_IMG VARCHAR2(100) DEFAULT NULL,
    ACTOR_NO VARCHAR2(10),
    DIR_NO VARCHAR2(10),
    TITLE_HT_NO VARCHAR2(10)
);

CREATE TABLE TB_MEMBER(
    MEM_NO VARCHAR2(10) PRIMARY KEY,
    MEM_ID VARCHAR2(100) UNIQUE NOT NULL,
    MEM_PWD VARCHAR2(60) NOT NULL,
    MEM_NAME VARCHAR2(14) NOT NULL,
    NICKNAME VARCHAR2(20) UNIQUE,
    GENDER CHAR(1) CHECK(GENDER IN('M','F')),
    ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
    MEM_STATUS CHAR(1) CHECK(MEM_STATUS IN('U','A','B')),
    SUB_OTT VARCHAR2(100),
    CONSENT_AGREE CHAR(1) CHECK(CONSENT_AGREE IN('Y','N'))
);

CREATE TABLE TB_NORMAL_HT(
    NORMAL_HT_NO VARCHAR2(10) PRIMARY KEY,
    NORMAL_HT_NAME VARCHAR2(30) NOT NULL UNIQUE
);

CREATE TABLE TB_TITLE_HT(
    TITLE_HT_NO VARCHAR2(10) PRIMARY KEY,
    TITLE_HT_NAME VARCHAR2(200)
);

CREATE TABLE TB_WISH(
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT
);

CREATE TABLE TB_WATCHING(
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT
);



CREATE TABLE TB_MYPAGE(
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    NICKNAME VARCHAR2(20) REFERENCES TB_MEMBER(NICKNAME),
    WISH NUMBER NOT NULL,
    WATCHING NUMBER NOT NULL,
    WATCHED NUMBER NOT NULL,
    WRITTEN NUMBER NOT NULL
);

CREATE TABLE TB_REVIEW(
    REVIEW_NO VARCHAR2(10) PRIMARY KEY,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT,
    REVIEW_WRITTER VARCHAR2(20) REFERENCES TB_MEMBER(NICKNAME),
    RIVEW_RATING NUMBER NOT NULL,
    REVIEW_OPEN CHAR(1) CHECK(REVIEW_OPEN IN('Y','N')),
    REVIEW_SPOILER CHAR(1) CHECK(REVIEW_SPOILER IN('Y','N')),
    DATE_WATCHED DATE DEFAULT SYSDATE NOT NULL,
    REVIEW_DATE DATE DEFAULT SYSDATE NOT NULL,
    REVIEW_CONTENT VARCHAR2(400) NOT NULL,
    TITLE_HT_NO VARCHAR2(10) NOT NULL REFERENCES TB_TITLE_HT,
    NORMAL_HT_NO VARCHAR2(10) REFERENCES TB_NORMAL_HT
);


CREATE TABLE TB_NOTICE(
    NOTICE_NO VARCHAR2(10) PRIMARY KEY,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    TITLE_HT_NO VARCHAR2(10) REFERENCES TB_TITLE_HT,
    NORMAL_HT_NO VARCHAR2(10) REFERENCES TB_NORMAL_HT,
    NOTICE_DATE DATE DEFAULT SYSDATE NOT NULL,
    VIEW_COUNT NUMBER NOT NULL,
    ATTACH_FILE VARCHAR2(100) DEFAULT NULL,
    NOTICE_TITLE VARCHAR2(100) NOT NULL,
    NOTICE_CONTENT VARCHAR2(3000) NOT NULL
);

CREATE TABLE TB_NOTICE_COMMENT(
    NOTICE_COM_NO VARCHAR2(10) PRIMARY KEY,
    NOTICE_NO VARCHAR2(10), --REFERENCES TB_NOTICE,
    MEM_NO VARCHAR2(10),-- REFERENCES TB_MEMBER,
    NICKNAME VARCHAR2(20),-- REFERENCES TB_MEMBER(NICKNAME),
    COM_CONTENT VARCHAR2(200) NOT NULL
    --PRIMARY KEY(NOTICE_COM_NO, NOTICE_NO)
);





CREATE TABLE TB_COMM(
    POST_NO VARCHAR2(10) PRIMARY KEY,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    MEM_ID VARCHAR2(100) REFERENCES TB_MEMBER(MEM_ID) NOT NULL,
    NICKNAME VARCHAR2(20) REFERENCES TB_MEMBER(NICKNAME) NOT NULL,
    POST_DATE DATE DEFAULT SYSDATE NOT NULL,
    POST_VIEW_COUNT NUMBER NOT NULL,
    POST_COMMENT_COUNT NUMBER NOT NULL,
    POST_LIKE_COUNT NUMBER NOT NULL,
    POST_UPLOAD_FILE CHAR(1) DEFAULT 'N' CHECK(POST_UPLOAD_FILE IN ('Y','N')) NOT NULL,
    TITLE_HT_NO VARCHAR2(10) REFERENCES TB_TITLE_HT,
    NORMAL_HT_NO VARCHAR2(10) REFERENCES TB_NORMAL_HT,
    POST_TITLE VARCHAR2(100) NOT NULL,
    POST_CONTENT VARCHAR2(3000) NOT NULL
);


CREATE TABLE TB_COMMENT(
    COM_NO VARCHAR2(10),
    POST_NO VARCHAR2(10) REFERENCES TB_COMM,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    NICKNAME VARCHAR2(20) REFERENCES TB_MEMBER(NICKNAME),
    COM_CONTENT VARCHAR2(200) NOT NULL,
    PRIMARY KEY(COM_NO,POST_NO)    
);


CREATE TABLE TB_LIKE(
    POST_NO VARCHAR2(10) REFERENCES TB_COMM,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER
);

CREATE TABLE TB_DIRECTOR(
    DIR_NO VARCHAR2(10) PRIMARY KEY,
    DIR_NAME VARCHAR2(100) NOT NULL
);

CREATE TABLE TB_ACTOR(
    ACTOR_NO VARCHAR2(10) PRIMARY KEY,
    ACTOR_NAME VARCHAR2(100) NOT NULL
);

CREATE TABLE TB_FAVORITE(
    CONTENT_NO VARCHAR2(10), --REFERENCES TB_CONTENT
    MEM_NO VARCHAR2(10) --REFERENCES TB_WATCHED
);

CREATE TABLE TB_REPORT(
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    POST_NO VARCHAR2(10) REFERENCES TB_COMM,
    MEM_ID VARCHAR2(100) REFERENCES TB_MEMBER(MEM_ID),
    SUSPEND_STARTDATE DATE DEFAULT SYSDATE NOT NULL,
    SUSPEND_ENDATE DATE NOT NULL,
    REPORT_COUNT NUMBER NOT NULL,
    SUSPEND_COUNT NUMBER NOT NULL
);



CREATE TABLE TB_SEARCH(
    SEARCH_NO VARCHAR2(10) PRIMARY KEY,
    CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT,
    SEARCH_DATE DATE DEFAULT SYSDATE NOT NULL,
    OTT_PLATFORM VARCHAR2(100) --REFERENCES TB_CONTENT(OTT_PLATFORM)
);

CREATE TABLE TB_NOT_INTERESTED(
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT
);

CREATE TABLE TB_REVIEW_LIKE(
    REVIEW_NO VARCHAR2(10) REFERENCES TB_REVIEW,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER
);

CREATE TABLE TB_WATCHED(
    CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT,
    MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
    REVIEW_NO VARCHAR2(10) REFERENCES TB_REVIEW
);

CREATE TABLE TB_ATTACH_COM(
  COM_FILE_NO VARCHAR2(10) PRIMARY KEY,
  POST_NO VARCHAR2(10) REFERENCES TB_REVIEW,
  NOTICE_NO VARCHAR2(10) REFERENCES TB_NOTICE,
  COM_ORIGIN_NAME VARCHAR2(255) NOT NULL,
  COM_CHANGE_NAME VARCHAR2(255) NOT NULL,
  COM_FILE_PATH VARCHAR2(1000),
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  FILE_LEVEL NUMBER,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

CREATE TABLE TB_ATTACH_MYPAGE(
  PROFILE_FILE_NO VARCHAR2(10) PRIMARY KEY,
  MEM_NO VARCHAR2(10) REFERENCES TB_MEMBER,
  PROFILE_ORIGIN_NAME VARCHAR2(255) NOT NULL,
  PROFILE_CHANGE_NAME VARCHAR2(255) NOT NULL,
  PROFILE_FILE_PATH VARCHAR2(1000),
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  FILE_LEVEL NUMBER,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

CREATE TABLE TB_ATTACH_CONTENT(
  CONTENT_FILE_NO VARCHAR2(10) PRIMARY KEY,
  CONTENT_NO VARCHAR2(10) REFERENCES TB_CONTENT,
  CONTENT_ORIGIN_NAME VARCHAR2(255) NOT NULL,
  CONTENT_CHANGE_NAME VARCHAR2(255) NOT NULL,
  CONTENT_FILE_PATH VARCHAR2(1000),
  UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
  FILE_LEVEL NUMBER,
  STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);


--ALTER TABLE TB_SEARCH
--ADD FOREIGN KEY(OTT_PLATFORM) REFERENCES TB_CONTENT(OTT_PLATFORM); 

ALTER TABLE TB_FAVORITE
ADD FOREIGN KEY(CONTENT_NO) REFERENCES TB_CONTENT(CONTENT_NO);

ALTER TABLE TB_FAVORITE
ADD FOREIGN KEY(MEM_NO) REFERENCES TB_MEMBER;
/*
ALTER TABLE TB_DIRECTOR
ADD FOREIGN KEY(CONTENT_NO) REFERENCES TB_CONTENT(CONTENT_NO);

ALTER TABLE TB_ACTOR
ADD FOREIGN KEY(CONTENT_NO) REFERENCES TB_CONTENT(CONTENT_NO);
*/

ALTER TABLE TB_NOTICE_COMMENT
ADD FOREIGN KEY(NOTICE_NO) REFERENCES TB_NOTICE;


ALTER TABLE TB_CONTENT
ADD FOREIGN KEY(ACTOR_NO) REFERENCES TB_ACTOR;

ALTER TABLE TB_CONTENT
ADD FOREIGN KEY(DIR_NO) REFERENCES TB_DIRECTOR;
   


COMMIT;

