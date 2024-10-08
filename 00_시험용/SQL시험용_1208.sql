-- 시험용
CREATE USER SAMPLE IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO SAMPLE;

-- 검색조건
--DEPT_CODE가 D9이거나 D6이고 SALARY이 300만원 이상이고 BONUS가 있고
--남자이고 이메일주소가 _ 앞에 3글자 있는
--사원의 EMP_NAME, EMP_NO, DEPT_CODE, SALARY를 조회
--작성된 쿼리구문
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D9' OR DEPT_CODE='D6' AND SALARY > 3000000
AND EMAIL LIKE '____%' AND BONUS IS NULL;

-- 1. ESCAPE 와일드 카드를 사용하지 않아서 이메일주소출력 조건값이 잘못되었다.
-- 2. OR와 AND 연산자는 AND연산자가 우선연산자이기때문에 ()로 묶어주지 않으면 출력값이 잘못된다.
-- 3. SALARY이 300만원 이상이기때문에 >이 아닌, >= 연산자로 변경한다.
-- 4. BONUS가 있고 라는 조건이기 때문에 IS NULL -> IS NOT NULL로 변경
-- 5. 남자인 조건식이 없기때문에 남자인 조건을 걸어줘야한다.?

SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='D9' OR DEPT_CODE='D6') AND SALARY >= 3000000
AND EMAIL LIKE '___*_%' ESCAPE '*' AND BONUS IS NOT NULL
AND SUBSTR(EMP_NO, 8, 1) IN ('1','3');

SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___*_%' ESCAPE '*';

SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1','3');

SELECT * FROM EMPLOYEE WHERE BONUS IS NULL AND MANAGER_ID IS NOT NULL;

SELECT TO_CHAR((TO_DATE('210505')), 'YYYY"년" FMMM"월" DD"일"')
FROM DUAL;

CREATE TABLE EMP(
EMAIL VARCHAR2(30) CONSTRAINT  EMP_EMAIL_NN NOT NULL
);

SELECT * FROM EMP;
DROP TABLE EMP;



















