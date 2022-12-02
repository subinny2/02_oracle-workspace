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



SELECT DEPT_CODE, 총합 , 평균, 인원수
FROM (SELECT DEPT_CODE, SUM(SALARY) AS "총합", FLOOR(AVG(SALARY)) AS "평균", COUNT(*) AS "인원수"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 평균 DESC)
WHERE 평균 > 2700000;




