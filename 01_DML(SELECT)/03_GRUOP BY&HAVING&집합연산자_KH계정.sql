-- ���� ����
/*
    < GROUP BY �� >
    �׷������ ������ �� �ִ� ���� ( �ش� �׷���غ��� ���� �׷��� ���� �� ����)
    �������� ������ �ϳ��� �׷����� ��� ó���� ������ ���
*/

SELECT SUM(SALARY)
FROM EMPLOYEE; --> ��ü ����� �ϳ��� �׷����� ��� ������ ���� ���

-- �� �μ��� �� �޿� ��
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �� �μ��� ��� �� 
SELECT DEPT_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �������
SELECT DEPT_CODE, SUM(SALARY)  --3
FROM EMPLOYEE  --1
GROUP BY DEPT_CODE --2
ORDER BY DEPT_CODE;  --4  --������ ���� ������!! ���� ��Ī��밡��

SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

SELECT JOB_CODE, SUM(SALARY), COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- �� ���޺� �� �����, ���ʽ��� �޴� �����, �޿���, ��ձ޿�, �����޿�, �ִ�޿�
SELECT JOB_CODE AS "����", COUNT(*) AS "�� �����", COUNT(BONUS) AS "���ʽ��� �޴� �����",
        SUM(SALARY) AS "�޿���", ROUND(AVG(SALARY)) AS "��ձ޿�", MIN(SALARY)AS "�����޿�", MAX(SALARY)AS "�ִ�޿�"
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

-- �μ��� ����
SELECT DEPT_CODE AS "�μ�", COUNT(*) AS "�� �����", COUNT(BONUS) AS "���ʽ��� �޴� �����",
        SUM(SALARY) AS "�޿���", ROUND(AVG(SALARY)) AS "��ձ޿�", MIN(SALARY)AS "�����޿�", MAX(SALARY)AS "�ִ�޿�"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- GROUP BY���� �Լ��� ��� ����!!
SELECT DECODE(SUBSTR(EMP_NO,8,1), '1', '��', '2', '��') AS "����", COUNT(*)
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- GROUP BY ���� ���� �÷� ��� ����!!
SELECT DEPT_CODE, JOB_CODE, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY 1;
--------------------------------------------------------------------------------
/*
    < HAVING �� >
    �׷쿡 ���� ������ ������ �� ���Ǵ� ����(�ַ� �׷��Լ����� ������ ������ ������ �� ���)
*/

-- �� �μ��� ��� �޿� ��ȸ (�μ��ڵ�, ��ձ޿�)
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- �μ��� ��� �޿��� 300���� �̻��� �μ��鸸 ��ȸ
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
--WHERE ROUND(AVG(SALARY)) >= 3000000 -- �����߻�!! (�׷��Լ� ������ ���� ���ý� WHERE�� ������ �ȵ�!!)
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000; -- �ڵ����� ROUND �������� ����

-- ���޺� �� �޿��� (��, ���޺� �޿� ���� 1000���� �̻��� ���޸��� ��ȸ) => �����ڵ�, �޿��� ��ȸ
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING SUM(SALARY) >= 10000000;

-- �μ��� ���ʽ��� �޴� ����� ���� �μ����� ��ȸ �μ��ڵ常 ������ �غ���
SELECT DEPT_CODE --COUNT(BONUS)  --COUNT(BONUS) ���ʽ��� NULL�� �ƴѰ����� ī��Ʈ��.
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0;

--------------------------------------------------------------------------------
/*
     < SELECT  �� ������� >
    5.  SELECT * | ��ȸ�ϰ��� �ϴ� �÷� ��Ī | ����� "��Ī" | �Լ��� AS "��Ī"
    1.  FROM ��ȸ�ϰ��� �ϴ� ���̺�
    2.  WHERE ���ǽ� (�����ڸ� ������ ���)
    3.  GROUP BY �׷�������� ������ �÷� | �Լ���
    4.  HAVING ���ǽ� (�׷��Լ��� ������ ���)
    6.  ORDER BY �÷��� | ��Ī | Į������[ASC|DESC] [NULLS FIRST | NULLS LAST]

*/
--------------------------------------------------------------------------------

/*
    < �����Լ� >
    �׷캰 ����� ������� �߰����踦 ������ִ� �Լ�
    
    ROLL UP
    
    => GROUP BY ���� ����ϴ� �Լ�
*/
-- �� ���޺� �޿���
-- ������ ������ ��ü �� �޿� �ձ��� ���� ��ȸ �ϰ� ���� ��
SELECT JOB_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP (JOB_CODE)
ORDER BY 1;
-- ROLLUP : GROUP BY�� ���� ���� �׷��� �߰� ���踦 ������ִ� �Լ�
--------------------------------------------------------------------------------
/*
    < ���� ������ == SET OPERATION >
    
    �������� �������� ������ �ϳ��� ���������� ����� ������
    
    - UNION     : OR | ������ (�� ������ ������ ������� ���� �� �ߺ��Ǵ� ���� �ѹ��� ����������)
    - INTERSECT : AND | ������ (�� ������ ������ ������� �ߺ��� �����)
    - UNION ALL : ������ + ������ (�ߺ��Ǵ� �κ��� �ι� ǥ���� �� ����)
    - MINUS     : ������ (���� ��������� ���� ������� �� ������)
    
*/

-- 1. UNION (������)
-- �μ��ڵ尡 D5�� ��� �Ǵ� �޿��� 300���� �ʰ��� ����� ��ȸ (���, �̸�, �μ��ڵ�, �޿�)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' -- 6���� (�ڳ���, ������, ���ؼ�, �ɺ���, ������, ���ȥ)
UNION -- �ߺ��� �ɺ���, ���ȥ�� �ѹ��� ��µȴ�.
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; -- 8���� (������, ������, ���ö, �����, ������, *�ɺ���, *���ȥ, ������)

-- ���� ������ ��� �Ʒ�ó�� WHERE���� OR�� ����ص� �ذ� ����!!
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' OR SALARY > 3000000;

-- 2. INTERSECT(������)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
INTERSECT -- �ߺ��� ���� ��� ( �ɺ��� ���ȥ )
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000;
-- �Ʒ�ó���� �ذ� ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D5' AND SALARY > 3000000;

--------------------------------------------------------------------------------
-- ���� ������ ���ǻ���
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- �����߻�
-- �� �������� SELECT���� �ۼ��Ǿ��ִ� �÷� ���� �����ؾߵ�!

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY --HIRE_DATE
FROM EMPLOYEE
WHERE SALARY > 3000000;
-- �÷� ���� �Ӹ� �ƴ϶� �÷��ڸ����� ������ Ÿ������ ����ؾߵ�!!

-- ORDER BY ���� ���̰��� �Ѵٸ� �������� ����ؾߵ�!!
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
-- ORDER BY EMP_NAME
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;
-- ORDER BY ���� ���̰��� �Ѵٸ� �������� ����ؾߵ�!!
--------------------------------------------------------------------------------
-- 3. UNION ALL : �������� ���� ����� ������ �� ���ϴ� ������ (������ ����)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000
ORDER BY EMP_NAME;

--------------------------------------------------------------------------------
-- 4. MINUS : ���� SELECT ������� ���� SELECT ����� �� ������ (������)
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5'
MINUS
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000 -- 300���� �̻��� ������� ����
ORDER BY EMP_NAME;

-- �Ʒ�ó���� �����ϱ� ��!
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND SALARY <= 3000000;













