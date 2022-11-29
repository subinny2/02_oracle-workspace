-- 먼저 저장
/*
    < GROUP BY 절 >
    그룹기준을 제시할 수 있는 구문 ( 해당 그룹기준별로 여러 그룹을 묶을 수 있음)
    여러개의 값들을 하나의 그룹으로 묶어서 처리할 목적을 사용
*/

SELECT SUM(SALARY)
FROM EMPLOYEE; --> 전체 사원을 하나의 그룹으로 묶어서 총합을 구한 결과

-- 각 부서별 총 급여 합
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 사원 수 
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 실행순서
SELECT DEPT_CODE, SUM(SALARY)  --3
FROM EMPLOYEE  --1
GROUP BY DEPT_CODE --2
ORDER BY DEPT_CODE;  --4  --정렬이 가장 마지막!! 따라서 별칭사용가능

SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

SELECT JOB_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 각 직급별 총 사원수, 보너스를 받는 사원수, 급여합, 평균급여, 최저급여, 최대급여
SELECT JOB_CODE AS "직급", COUNT(*) AS "총 사원수", COUNT(BONUS) AS "보너스를 받는 사원수",
        SUM(SALARY) AS "급여합", ROUND(AVG(SALARY)) AS "평균급여", MIN(SALARY)AS "최저급여", MAX(SALARY)AS "최대급여"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

-- 부서별 정리
SELECT DEPT_CODE AS "부서", COUNT(*) AS "총 사원수", COUNT(BONUS) AS "보너스를 받는 사원수",
        SUM(SALARY) AS "급여합", ROUND(AVG(SALARY)) AS "평균급여", MIN(SALARY)AS "최저급여", MAX(SALARY)AS "최대급여"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- GROUP BY절에 함수식 기술 가능!!
SELECT DECODE(SUBSTR(EMP_NO,8,1), '1', '남', '2', '여') AS "성별", COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- GROUP BY 절에 여러 컬럼 기술 가능!!
SELECT DEPT_CODE, JOB_CODE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY 1;
--------------------------------------------------------------------------------
/*
    < HAVING 절 >
    그룹에 대한 조건을 제시할 때 사용되는 구문(주로 그룹함수식을 가지고 조건을 제시할 때 사용)
*/

-- 각 부서별 평균 급여 조회 (부서코드, 평균급여)
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- 부서별 평균 급여가 300만원 이상인 부서들만 조회
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
--WHERE ROUND(AVG(SALARY)) >= 3000000 -- 오류발생!! (그룹함수 가지고 조건 제시시 WHERE절 에서는 안됨!!)
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000; -- 자동으로 ROUND 씌워져서 나옴

-- 직급별 총 급여합 (단, 직급별 급여 합이 1000만원 이상인 직급만을 조회) => 직급코드, 급여합 조회
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY) >= 10000000;

-- 부서별 보너스를 받는 사원이 없는 부서만을 조회 부서코드만 나오게 해보셈
SELECT DEPT_CODE --COUNT(BONUS)  --COUNT(BONUS) 보너스가 NULL이 아닌값들을 카운트함.
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0;

--------------------------------------------------------------------------------
/*
     < SELECT  문 실행순서 >
    5.  SELECT * | 조회하고자 하는 컬럼 별칭 | 산술식 "별칭" | 함수식 AS "별칭"
    1.  FROM 조회하고자 하는 테이블
    2.  WHERE 조건식 (연산자를 가지고 기술)
    3.  GROUP BY 그룹기준으로 정렬할 컬럼 | 함수식
    4.  HAVING 조건식 (그룹함수를 가지고 기술)
    6.  ORDER BY 컬럼명 | 별칭 | 칼럼순번[ASC|DESC] [NULLS FIRST | NULLS LAST]

*/
--------------------------------------------------------------------------------

/*
    < 집계함수 >
    그룹별 산출된 결과값에 중간집계를 계산해주는 함수
    
    ROLL UP
    
    => GROUP BY 절에 기술하는 함수
*/
-- 각 직급별 급여합
-- 마지막 행으로 전체 총 급여 합까지 같이 조회 하고 싶을 때
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP (JOB_CODE)
ORDER BY 1;
-- ROLLUP : GROUP BY를 통해 묶은 그룹의 중간 집계를 계산해주는 함수
--------------------------------------------------------------------------------
/*
    < 집합 연산자 == SET OPERATION >
    
    여러개의 쿼리문을 가지고 하나의 쿼리문으로 만드는 연산자
    
    - UNION     : OR | 합집합 (두 쿼리문 수행한 결과값을 더한 후 중복되는 값은 한번만 더해지도록)
    - INTERSECT : AND | 교집합 (두 쿼리문 수행한 결과값에 중복된 결과값)
    - UNION ALL : 합집합 + 교집합 (중복되는 부분이 두번 표현될 수 있음)
    - MINUS     : 차집합 (선행 결과값에서 후행 결과값을 뺀 나머지)
    
*/

-- 1. UNION (합집합)
-- 부서코드가 D5인 사원 또는 급여가 300만원 초과인 사원들 조회 (사번, 이름, 부서코드, 급여)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6개행 (박나라, 하이유, 김해술, 심봉선, 윤은해, 대북혼)
UNION -- 중복된 심봉선, 대북혼은 한번만 출력된다.
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; -- 8개행 (선동일, 송종기, 노옹철, 유재식, 정중하, *심봉선, *대북혼, 전지연)

-- 위의 쿼리문 대신 아래처럼 WHERE절에 OR을 사용해도 해결 가능!!
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' OR SALARY > 3000000;

-- 2. INTERSECT(교집합)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT -- 중복된 값만 출력 ( 심봉선 대북혼 )
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;
-- 아래처럼도 해결 가능
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY > 3000000;

--------------------------------------------------------------------------------
-- 집합 연산자 유의사항
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 오류발생
-- 각 쿼리문의 SELECT절에 작성되어있는 컬럼 개수 동일해야됨!

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY --HIRE_DATE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- 컬럼 갯수 뿐만 아니라 컬럼자리마다 동일한 타입으로 기술해야됨!!

-- ORDER BY 절을 붙이고자 한다면 마지막에 기술해야됨!!
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
-- ORDER BY EMP_NAME
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;
-- ORDER BY 절을 붙이고자 한다면 마지막에 기술해야됨!!
--------------------------------------------------------------------------------
-- 3. UNION ALL : 여러개의 쿼리 결과를 무조건 다 더하는 연산자 (증복값 나옴)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;

--------------------------------------------------------------------------------
-- 4. MINUS : 선행 SELECT 결과에서 후행 SELECT 결과를 뺀 나머지 (차집합)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000 -- 300만원 이상인 사원들을 제외
ORDER BY EMP_NAME;

-- 아래처럼도 가능하긴 함!
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY <= 3000000;













