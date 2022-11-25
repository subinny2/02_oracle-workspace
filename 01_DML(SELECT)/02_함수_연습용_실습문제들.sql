-- 한번 더 실습

SELECT SYSDATE
FROM DUAL; -- 가상테이블

SELECT LENGTH('오라클'), LENGTHB('오라클')
FROM DUAL;

SELECT LENGTH('oracle'), LENGTHB('oracle')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
        EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE; -- 매행마다 실행 => 단일행

-- INSTR는 중요!
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; => B가 몇번째에있는지 출력해줌
SELECT INSTR('AABAACAABBAA', 'B', '1') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', '1', '2') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1,1) AS "_위치", INSTR(EMAIL, '@') AS "@위치"
FROM EMPLOYEE;

SELECT SUBSTR('TODAY''S OOTD', 7) FROM DUAL; -- 7번째 글자부터 출력하겠다.
SELECT SUBSTR('TODAY''S OOTD', 5, 2) FROM DUAL;
SELECT SUBSTR('TODAY''S OOTD', -6, 6) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8,1) AS "성별"
FROM EMPLOYEE;

-- 여자사원들만 조회
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8,1) AS "성별"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN ('2' , '4')
ORDER BY EMP_NAME; -- 오름차순으로 정렬 <기본값이 오름차순>

-- 함수 중첩사용
SELECT EMP_NAME, EMAIL, EMP_NO, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) --이메일에서 ID만을 추출
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN ('2' ,'4') -- 여자사원들만을 추출하는 조건
ORDER BY EMP_NAME; -- 이름 오름차순 

-- 문자열을 조회할때 동일감있게 조회하고자 LPAD / RPAD
-- LPAD 왼쪽공백 // RPAD 오른쪽 공백

-- 남자사원의 사번과 이름 주민번호 아이디를 추출하고, 주민번호는 성별까지만 나타내고 *로 표시 (별칭달기) , 또한 이름을 오름차순 정렬하시오.
SELECT EMP_ID AS "사번", EMP_NAME AS "이름", RPAD(SUBSTR(EMP_NO,1,8) , 14 , '*') AS "주민번호(정보보호)", SUBSTR(EMAIL,1, INSTR(EMAIL, '@')-1) AS "아이디"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) IN ('1','3')
ORDER BY EMP_NAME;





