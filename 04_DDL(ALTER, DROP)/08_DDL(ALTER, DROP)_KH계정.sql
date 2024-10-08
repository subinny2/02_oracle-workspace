-- 먼저 저장
/*
    DDL (DATA DEFINITION LANGUAGE) : 데이터 정의언어
    
    객체들을 생성(CREATE), 변경(ALTER), 삭제(DROP) 하는 구문
    
    < ALTER >
    객체를 변경하는 구문
    
    [ 표현식 ]
    ALTER TABLE 테이블명 변경할내용;
    
    * 변경할내용
    1) 컬럼 추가 / 수정 / 삭제
    2) 제약조건 추가 / 삭제 --> 단 수정은 불가!!! (수정하고자 한다면 삭제한 후 새로이 추가)
    3) 컬럼명 / 제약조건명 / 테이블명 변경
    */

-- 1) 컬럼 추가 / 수정 / 삭제    
-- 1_1) 컬럼 추가 (ADD) : ADD 컬럼명 자료형 [DEFAULT 기본값] [CONSTRAINT 제약조건명] 제약조건
-- DEPT_COPY테이블에 CNAME 컬럼 추가
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);
-- 새로운 컬럼이 만들어지고 기본적으로 NULL로 채워짐

-- LNAME 컬럼 추가 : VARCHAR2(20) 기본값 : 한국
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(20) DEFAULT '한국';

-- 1_2) 컬럼 수정(MODIFY)
--> 자료형 수정          : MODIFY 컬럼명 바꾸고자하는자료형
--> DEFAULT값 수정      : MODIFY 컬럼명 DEFAULT 바꾸고자하는 기본 값 

ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;
-- ORA-01439: column to be modified must be empty to change datatype
-- 이건 오류남!!! 이미 데이터가 숫자가 아닌 것도 들어있음!
-- 존재하는 데이터가 없어야만 이렇게 바꿀수가 있음!!

ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(10);
-- ORA-01441: cannot decrease column length because some value is too big
-- 이것도 오류!! 
-- 이미 담겨있는 데이터가 10 바이트 보다 큼!!

-- DEPT_TITLE 컬럼을 VARCHAR2(50)로 변경
ALTER TABLE DEPT_COPY MODIFY DEPT_TITLE VARCHAR2(50);

-- LOCATION_ID 컬럼을 VARCHAR2(4)로 변경
ALTER TABLE DEPT_COPY MODIFY LOCATION_ID VARCHAR2(4);

-- LNAME 컬럼의 기본값을 '영국'으로 변경
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT '영국';
-- 디폴트값을 바꾼다고 해서 이전에 추가된 데이터가 바뀌는것은 아니다!!!

-- 다중 변경 가능
ALTER TABLE DEPT_COPY
    MODIFY DEPT_TITLE VARCHAR2(40)
    MODIFY LOCATION_ID VARCHAR2(2)
    MODIFY LNAME DEFAULT '미국';
-- 디폴트값을 바꾼다고 해서 이전에 추가된 데이터가 바뀌는것은 아니다!!!

-- 1_3) 컬럼 삭제(DROP COLUMN) : DROP COLUMN 삭제하고자 하는 컬럼명
-- 삭제를 위한 복사본 테이블 생성
CREATE TABLE DEPT_COPY2
AS SELECT * FROM DEPT_COPY;

SELECT * FROM DEPT_COPY2;
-- DEPT_COPY2로부터 DEPT_ID 컬럼지우기
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_ID;
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_TITLE;

-- 다중 삭제는 안됨
ALTER TABLE DEPT_COPY2
    DROP COLUMN DEPT_ID
    DROP COLUMN DEPT_TITLE;
-- ORA-00933: SQL command not properly ended
-- 다중삭제안됨

ALTER TABLE DEPT_COPY2 DROP COLUMN CNAME;
ALTER TABLE DEPT_COPY2 DROP COLUMN LNAME;
ALTER TABLE DEPT_COPY2 DROP COLUMN LOCATION_ID;
-- ORA-12983: cannot drop all columns in a table
-- 오류남!! 최소 한개의 컬럼은 있어야함.
--------------------------------------------------------------------------------
-- 2) 제약조건 추가 / 삭제
/*
    2_1) 제약조건 추가
    PRIMARY KEY : ADD PRIMARY KEY(컬럼명)
    FOREIGN KEY : ADD FOREIGN KEY(컬럼명) REFERENCES 참조할테이블명[(컬럼명)]
    UNIQUE      : ADD UNIQUE(컬럼명)
    CHECK       : ADD CHECK(컬럼에 대한 조건)
    NOT NULL    : MODIFY 컬럼명 NOT NULL | NULL => 이거쓰면 NULL 허용
    
    제약조건명을 지정하고자 한다면 [CONSTRAINT 제약조건명] 제약조건
*/

-- DEPT_ID에 PRIMARY KEY 제약 조건 추가 ADD
-- DEPT_TITLE에 UNIQUE 제약 조건 추가 ADD
-- LNAME에 NOT NULL 제약 조건 추가 MODIFY
ALTER TABLE DEPT_COPY
    ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)
    ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_TITLE)
    MODIFY LNAME CONSTRAINT DCOPY_NN NOT NULL;

-- 2_2) 제약조건 삭제 : DROP CONSTRAINT 제약조건명
-- NOT NULL은 삭제가 안되고 MODITY NULL 이걸로 수정해줘야한다.

ALTER TABLE DEPT_COPY DROP CONSTRAINT DCOPY_PK;

ALTER TABLE DEPT_COPY
    DROP CONSTRAINT DCOPY_UQ
    MODIFY LNAME NULL;
--------------------------------------------------------------------------------
-- 3) 컬럼명 / 제약조건명 / 테이블명 변경 (RENAME)
--3_1) 컬럼명 변경 : RENAME COLUMN 기존컬럼명 TO 바꿀컬럼명

-- DEPT_TITLE => DEPT_NAME
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

-- 3_2) 제약조건명 변경 : RENAME CONSTRAINT 제약조건명 TO 바꿀제약조건명
-- SYS_C007186 => DCOPY_DID_NN
ALTER TABLE DEPT_COPY RENAME CONSTRAINT SYS_C007186 TO DCOPY_DID_NN;

-- 3_3) 테이블명 변경 : RENAME [기존테이블명] TO 바꿀테이블명
-- DEPT_COPY => DEPT_TEST
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST;
--------------------------------------------------------------------------------
-- 테이블 삭제
DROP TABLE DEPT_TEST;

-- 단, 어딘가에서 참조되고 있는 부모테이블은 함부로 삭제하면 안됨!!
-- 만약에 삭제하고자 한다면
-- 방법1. 자식테이블 먼저 삭제 한 후 부모테이블 삭제하는 방법
-- 방법2. 그냥 부모테이블만 삭제 하는데 제약조건까지 같이 삭제하는 방법
-- DROP TABLE 테이블명 CASCADE CONSTRAINT;
































