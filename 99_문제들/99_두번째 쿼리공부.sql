-- 먼저 저장
------------------------------------ QUIZ 1 ------------------------------------
-- ROWNUM을 활용해서 급여가 가장 높은 5명을 조회하고싶었으나, 제대로 조회가 안됐음!!!
-- 이때 작성된 SQL문이 아래와 같음.
SELECT ROWNUM, EMP_NAME, SALARY --3
FROM EMPLOYEE --1
WHERE ROWNUM <= 5 --2
ORDER BY SALARY DESC; --4

-- 어떤 문제점이 있는지 , 해결된 SQL문 작성!!!
-- 문제점 : 정렬이 되기도 전에 ROWNUM이 부여됨. 데이터가 이상하게 현출됨
-- 해결방안
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT *
        FROM EMPLOYEE
        ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

------------------------------------ QUIZ 2 ------------------------------------
-- 부서별 평균급여가 270만원을 초과하는 부서들에 대해 (부서코드, 부서별 총급여합, 부서별 평균급여, 부서별 사원수)
-- 이때 작성된 SQL문이 아래와 같음
SELECT DEPT_CODE, SUM(SALARY) 총합, FLOOR(AVG(SALARY)) 평균, COUNT(*) 인원수
FROM EMPLOYEE
WHERE SALARY > 2700000
GROUP BY DEPT_CODE
ORDER BY 1;

-- 어떤 문제점이 있는지, 해결된 SQL문 작성!!!
-- GROUP BY 는 조건을 줄때 WHERE절이 아닌 HAVING 절로 준다.
SELECT DEPT_CODE, SUM(SALARY) 총합, FLOOR(AVG(SALARY)) 평균, COUNT(*) 인원수
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 2700000
ORDER BY 1;

--------------------------------------------------------------------------------

SELECT DEPT_CODE, 총합 , 평균, 인원수
FROM (SELECT DEPT_CODE, SUM(SALARY) AS "총합", FLOOR(AVG(SALARY)) AS "평균", COUNT(*) AS "인원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 평균 DESC)
WHERE 평균 > 2700000;
--------------------------------------------------------------------------------
-- 서술형 대비
-- JOIN 종류 (내부조인, 외부조인, 등등 ...) 별 특징, 역할
-- 함수 종류 (TRIM, ...) 별 각각의 역할

-- 직원의 급여 조회시 각 직급별로 인상해서 조회
-- J7인 사원은 급여를 10% 인상 (SALARY *1.1)
-- J6인 사원을 급여를 15% 인상 (SALARY *1.15)
-- J5인 사원을 급여를 20% 인상 (SALARY *1.2)
-- 그 외의 사원은 급여를 5% 인상 (SALARY *1.05)
SELECT EMP_NAME, JOB_CODE, SALARY || '원',
        DECODE(JOB_CODE,'J7', SALARY *1.1,
                        'J6', SALARY *1.15,
                        'J5', SALARY *1.2,
                        SALARY *1.05) ||'원' AS "인상된 급여"
FROM EMPLOYEE;

-- '21/09/28' 와 같은 문자열을 가지고 '2021-09-28'로 표현해보기
-- TO_DATE('문자열', [포맷]) : DATE
-- TO_CHAR(날짜, [포맷]) : CHARACTER
SELECT TO_CHAR(TO_DATE('21/09/08'), 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_DATE('21/09/08')
FROM DUAL;

-- '210908'와 같은 문자열을 가지고 2021년 9월 8일 표현
-- 날짜표현시 0을 지우고싶을때 FM사용 -> 한번만 사용해도 뒤에날짜에 있는 0도 지워진다.
SELECT TO_CHAR(TO_DATE('21/09/08'), 'YYYY"년 "FMMM"월 "DD"일"') AS "날짜"
FROM DUAL;
-- FM!!


