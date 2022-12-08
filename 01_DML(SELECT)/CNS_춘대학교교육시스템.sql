-- 1.
SELECT DEPARTMENT_NAME AS "학과명" , CATEGORY AS "계열"
FROM TB_DEPARTMENT;

-- 2.
SELECT DEPARTMENT_NAME ||'의 정원은' AS "학과별", CAPACITY||' 명 입니다.' AS "정원"
FROM TB_DEPARTMENT;

-- 3.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO='001' AND ABSENCE_YN = 'Y' 
AND SUBSTR(STUDENT_SSN,8,1) IN ('2','4');

-- 4.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090','A513091', 'A513110','A513119')
ORDER BY STUDENT_NAME DESC;

-- 5.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

-- 6.
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- 7.
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-- 8.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- 9.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT;

-- 10.
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N' AND SUBSTR(STUDENT_NO, 1,2) = 'A2'
AND SUBSTR(STUDENT_ADDRESS,1,2) = '전주';

-- Additional SELECT 
-- 1.
SELECT STUDENT_NO, STUDENT_NAME ,ENTRANCE_DATE
FROM TB_STUDENT
WHERE DEPARTMENT_NO = '002'
ORDER BY ENTRANCE_DATE;

-- 2.
SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE PROFESSOR_NAME NOT LIKE '___%' OR PROFESSOR_NAME LIKE '%____';

-- 3.
SELECT PROFESSOR_NAME AS "교수이름", EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER('19' || SUBSTR(PROFESSOR_SSN, 1, 2)) AS "나이"
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1) = '1'
ORDER BY 2;

-- 4.
SELECT SUBSTR(PROFESSOR_NAME,2,2) AS "이름"
FROM TB_PROFESSOR;

-- 5.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) - TO_NUMBER('19' || SUBSTR(STUDENT_SSN, 1, 2)) > 19;

-- 6.
SELECT TO_CHAR(TO_DATE('20/12/25'), 'DAY')
FROM DUAL;

-- 7.
SELECT TO_CHAR(TO_DATE('99/10/11'), 'YYYY"년" MM"월" DD"일"')
FROM DUAL;
SELECT TO_CHAR(TO_DATE('99/10/11'),'RRRR"년" MM"월" DD"일"')
FROM DUAL;
SELECT TO_CHAR(TO_DATE('49/10/11'),'RRRR"년" MM"월" DD"일"')
FROM DUAL;

-- 8.
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE SUBSTR(ENTRANCE_DATE,1,2) BETWEEN '95' AND '99';

-- 9.
SELECT ROUND(AVG(POINT),1) AS "평점"
FROM TB_GRADE
JOIN TB_STUDENT USING (STUDENT_NO)
WHERE SUBSTR(ENTRANCE_DATE,1,2) = '05'
AND STUDENT_NAME = '한아름';

-- 10.
SELECT DEPARTMENT_NO, COUNT(*)
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

-- 11. 
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;

-- 12.
SELECT TERM_NO AS "년도" , POINT AS "년도 별 평점"
FROM TB_GRADE
JOIN TB_STUDENT USING (STUDENT_NO)
WHERE STUDENT_NO = 'A112113';

SELECT * FROM TB_GRADE
WHERE STUDENT_NO = 'A112113';


SELECT TERM_NO AS "년도" , POINT AS "년도 별 평점"
FROM TB_GRADE
JOIN TB_STUDENT USING (STUDENT_NO);
--TO_DATE(TERM_NO,'YYYYMM');


-- 13.
SELECT DEPARTMENT_NO, COUNT(*)
FROM TB_STUDENT
WHERE ABSENCE_YN = 'N';










-- 1.
SELECT STUDENT_NAME AS "학생 이름", STUDENT_ADDRESS AS "주소지"
FROM TB_STUDENT
ORDER BY STUDENT_NAME;

-- 2.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-- 3.
SELECT STUDENT_NAME, STUDENT_NO, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_ADDRESS,1,3) IN ('강원도', '경기도')
AND SUBSTR(STUDENT_NO,1,2) BETWEEN '90' AND '99'
ORDER BY STUDENT_NAME;

-- 4.
SELECT PROFESSOR_NAME , PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = '005'
ORDER BY EXTRACT(YEAR FROM SYSDATE) - TO_NUMBER('19' || SUBSTR(PROFESSOR_SSN, 1, 2)) DESC;

-- 5.
SELECT STUDENT_NO, TO_CHAR(POINT, '9.99') AS "POINT" 
FROM TB_GRADE 
WHERE TERM_NO = '200402'
AND CLASS_NO = 'C3118100' 
ORDER BY POINT DESC, 1;

-- 6.
SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
ORDER BY 2;

-- 7.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);

-- 8.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
JOIN TB_PROFESSOR USING (DEPARTMENT_NO);

-- 9.
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS
JOIN TB_PROFESSOR USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NO BETWEEN 016 AND 021; 


-- 10.
SELECT STUDENT_NO, STUDENT_NAME, ROUND(AVG(POINT),1)
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '음악학과'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY 1;


-- 11.
SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
JOIN TB_PROFESSOR ON (PROFESSOR_NO = COACH_PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

-- 12.
SELECT DISTINCT STUDENT_NAME , TERM_NO
FROM TB_STUDENT
JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_CLASS USING (CLASS_NO) 
WHERE SUBSTR(TERM_NO,1,4) = '2007'
AND CLASS_NAME = '인간관계론';

-- 13.
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
LEFT JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
WHERE CATEGORY = '예체능'
AND PROFESSOR_NO IS NULL;

-- 14.
SELECT STUDENT_NAME AS "학생이름", NVL(PROFESSOR_NAME, '지도교수 미지정') AS "지도교수"
FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO) 
LEFT JOIN TB_PROFESSOR ON (COACH_PROFESSOR_NO = PROFESSOR_NO) 
WHERE DEPARTMENT_NAME = '서반아어학과'
ORDER BY STUDENT_NO;

-- 15.
SELECT STUDENT_NO AS "학번", STUDENT_NAME AS "이름", DEPARTMENT_NAME AS "학과이름", ROUND(AVG(POINT),8) AS "평점"
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN TB_GRADE USING (STUDENT_NO)
WHERE ABSENCE_YN = 'N'
GROUP BY STUDENT_NO,STUDENT_NAME, DEPARTMENT_NAME
HAVING ROUND(AVG(POINT),8)>= 4.0
ORDER BY 1;

-- 16.
SELECT CLASS_NO, CLASS_NAME , ROUND(AVG(POINT),8)
FROM TB_CLASS
JOIN TB_GRADE USING (CLASS_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '환경조경학과'
AND CLASS_TYPE != '논문지도'
GROUP BY CLASS_NO, CLASS_NAME
ORDER BY 1;

-- 17.
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT 
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                       FROM TB_STUDENT 
                       WHERE STUDENT_NAME = '최경희');
                       
-- 18. 

-- 19.
SELECT DEPARTMENT_NAME AS "계열학과명"
FROM TB_DEPARTMENT
WHERE CATEGORY = ( SELECT CATEGORY
                    FROM TB_DEPARTMENT
                    WHERE DEPARTMENT_NAME = '환경조경학과');

SELECT * FROM TB_STUDENT
WHERE STUDENT_NAME = '최경희';
SELECT * FROM TB_CLASS;
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_GRADE;


-- DDL
-- 1. 계열 정보를 저장할 카테고리 테이블을 만들려고 핚다. 다음과 같은 테이블을 작성하시오.
CREATE TABLE TB_CATEGORY(
    NAME VARCHAR2(10),
    USE_YN CHAR(1) DEFAULT 'Y' CHECK(USE_YN IN ('Y','N'))
);

-- 2. 과목 구분을 저장할 테이블을 만들려고 한다. 다음과 같은 테이블을 작성하시오.
CREATE TABLE TB_CLASS_TYPE(
    NO VARCHAR2(5) PRIMARY KEY,
    NAME VARCHAR2(10)
);

-- 3. TB_CATAGORY 테이블의 NAME 컬럼에 PRIMARY KEY를 생성하시오.
-- (KEY 이름을 생성하지 않아도 무방함. 만일 KEY 이를 지정하고자 한다면 이름은 본인이 알아서 적당한 이름을 사용한다.)
ALTER TABLE TB_CATEGORY
    ADD CONSTRAINT TCG_PK PRIMARY KEY(NAME);

-- 4. TB_CLASS_TYPE 테이블의 NAME 컬럼에 NULL 값이 들어가지 않도록 속성을 변경하시오.
ALTER TABLE TB_CLASS_TYPE
    MODIFY NAME CONSTRAINT TB_CTYPE NOT NULL;
    
-- 5. 두 테이블에서 컬럼 명이 NO 인 것은 기존 타입을 유지하면서 크기는 10 으로, 컬럼명이
--    NAME 인 것은 마찬가지로 기존 타입을 유지하면서 크기 20 으로 변경하시오.
ALTER TABLE TB_CLASS_TYPE MODIFY NO VARCHAR2(10);
ALTER TABLE TB_CLASS_TYPE MODIFY NAME VARCHAR2(20);
ALTER TABLE TB_CATEGORY MODIFY NAME VARCHAR2(20);
    
-- 6.  두 테이블의 NO 컬럼과 NAME 컬럼의 이름을 각각 TB_ 를 제외한 테이블 이름이 앞에 붙은 형태로 변경한다.
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NAME TO CLASS_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME COLUMN NO TO CLASS_NO;
ALTER TABLE TB_CATEGORY RENAME COLUMN NAME TO CATEGORY_NAME;
ALTER TABLE TB_CATEGORY RENAME COLUMN USE_YN TO CATEGORY_USE_YN;

-- 7. TB_CATAGORY 테이블과 TB_CLASS_TYPE 테이블의 PRIMARY KEY 이름을 다음과 같이 변경하시오.
--    Primary Key 의 이름은 ?PK_ + 컬럼이름?으로 지정하시오. (ex. PK_CATEGORY_NAME )
ALTER TABLE TB_CATEGORY RENAME CONSTRAINT TCG_PK TO PK_CATEGORY_NAME;
ALTER TABLE TB_CLASS_TYPE RENAME CONSTRAINT SYS_C007207 TO PK_CLASS_NO;

-- 8. 다음과 같은 INSERT 문을 수행한다.
INSERT INTO TB_CATEGORY VALUES ('공학','Y');
INSERT INTO TB_CATEGORY VALUES ('자연과학','Y');
INSERT INTO TB_CATEGORY VALUES ('의학','Y');
INSERT INTO TB_CATEGORY VALUES ('예체능','Y');
INSERT INTO TB_CATEGORY VALUES ('인문사회','Y');
COMMIT;

-- 9. TB_DEPARTMENT 의 CATEGORY 컬럼이 TB_CATEGORY 테이블의 CATEGORY_NAME 컬럼을 부모값으로 참조하도록
--    FOREIGN KEY를 지정하시오. 이때 KEY 이름은 FK_테이블이름_컬럼이름으로 지정한다.
--    (ex. FK_DEPARTMENT_CATEGORY)
ALTER TABLE TB_DEPARTMENT
    ADD CONSTRAINT FK_DEPARTMENT_CATEGORY FOREIGN KEY (CATEGORY) REFERENCES TB_CATEGORY(CATEGORY_NAME);

-- 10. 춘 기술대학교 학생들의 정보만이 포함되어 있는 학생일반정보 VIEW 를 만들고자 핚다. 
--      아래 내용을 참고하여 적절한 SQL 문을 작성하시오.

-- 11. 춘 기술대학교는 1 년에 두 번씩 학과별로 학생과 지도교수가 지도 면담을 진행한다. 
--      이를 위해 사용한 학생이름, 학과이름, 담당교수이름 으로 구성되어 있는 VIEW 를 만드시오.
--      이때 지도 교수가 없는 학생이 있을 수 있음을 고려하시오 (단, 이 VIEW 는 단순 SELECT 
--      먼을 할 경우 학과별로 정렬되어 화면에 보여지게 만드시오.

-- 12. 모든학과의 학과별 학생 수를 확인할 수 있도록 적절한 VIEW 를 작성해보자.


-- 15. 춘 기술대학교는 매년 수강신청 기간만 되면 특정 인기 과목들에 수강신청이 몰려 문제가 되고있다.
--     2005~ 2009년을 기준으로 수강인원이 가장 많았던 3 과목을 찾는 구문을 작성해보시오.
SELECT CLASS_NAME, CLASS_NO, ROWNUM
FROM TB_GRADE
JOIN TB_CLASS USING (CLASS_NO)
ORDER BY 2;

SELECT * FROM TB_STUDENT;
SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_TYPE;
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_GRADE;

-- [DML]
-- 1. 과목유형 테이블(TB_CLASS_TYPE)에 아래와 같은 데이터를 입력하시오.
INSERT INTO TB_CLASS_TYPE
VALUES('01', '전공필수');
INSERT INTO TB_CLASS_TYPE
VALUES('02', '전공선택');
INSERT INTO TB_CLASS_TYPE
VALUES('03', '교양필수');
INSERT INTO TB_CLASS_TYPE
VALUES('04', '교양선택');
INSERT INTO TB_CLASS_TYPE
VALUES('05', '논문지도');

-- 2. 춘 기술대학교 학생들의 정보가 포함되어 있는 학생일반정보 테이블을 만들고자한다.
--    아래 내용을 참고하여 적절한 SQL문을 작성하시오. (서브쿼리 이용)
CREATE TABLE TB_학생일반정보
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
    FROM TB_STUDENT;

-- 3.국어국문학과 학생들의 정보만이 포함되어 있는 학과정보 테이블을 만들고자 한다. 
--  아래 내용을 참고하여 적절한 SQL 문을 작성하시오. (힌트 : 방법은 다양함, 소신껏 작성하시오)
CREATE TABLE TB_국어국문학과
AS SELECT STUDENT_NO, STUDENT_NAME, TO_NUMBER('19'|| SUBSTR(STUDENT_SSN,1,2)) AS "출생년도", PROFESSOR_NAME
    FROM TB_STUDENT
    JOIN TB_PROFESSOR ON (PROFESSOR_NO = COACH_PROFESSOR_NO)
    JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
    WHERE DEPARTMENT_NAME = '국어국문학과';




SELECT * FROM TB_STUDENT;
SELECT * FROM TB_CLASS_TYPE;
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_CLASS_TYPE;
SELECT * FROM TB_CATEGORY;






























