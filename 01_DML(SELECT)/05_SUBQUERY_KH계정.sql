-- ����
/*
    * �������� (SUBQUERY)
    - �ϳ��� SQL�� �ȿ� ���Ե� �Ǵٸ� SELECT��
    - ���� SQL���� ���� ���� ������ �ϴ� ������
*/

-- ���� �������� ����1
-- ���ö ����� ���� �μ��� ���� ����� ��ȸ �ϰ� ����!!

-- 1) ���� ���ö ����� �μ��ڵ� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '���ö'; -- D9�ΰ� �˾Ƴ�!!

-- 2) �μ��ڵ尡 D9�� ����� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--> ���� 2�ܰ踦 �ϳ��� ���������� !!!
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '���ö');
                    
-- ���� �������� ����2
-- �� ������ ��� �޿����� �� ���� �޿��� �޴� ������� ���, �̸�, �����ڵ�, �޿� ��ȸ

-- 1) �� ������ ��� �޿� ��ȸ
SELECT AVG(SALARY)
FROM EMPLOYEE;

-- 2) �޿��� 3047663�� �̻��� ����� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3047663;

-- ���� 2�ܰ踦 �ϳ��� ����������!!
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY)
                FROM EMPLOYEE);

--------------------------------------------------------------------------------
/*
    * ���������� ����
    ���������� ������ ������� �� �� �� ���̳Ŀ� ���� �з���
    
    - ������ �������� : ���������� ��ȸ ������� ������ ������ 1���� �� (�� �� �ѿ�)
    - ������ �������� : ���������� ��ȸ ������� ���� ���϶� (���� �� �ѿ�) => �������� ���ö 2���� ��
    - ���߿� �������� : ���������� ��ȸ ������� �� �������� �÷��� �������� �� (�� �� ������)
    - ������ ���߿� �������� : ���������� ��ȸ ������� ������ �����÷��� �� (������ ������)
    
    >> ���������� ������ ���Ŀ� ���� �������� �տ� �ٴ� �����ڰ� �޶���!!!!
*/

/*
    1. ������ �������� (SINGLE ROW SUBQUERY)
    ���������� ��ȸ ������� ������ ������ 1���� �� (���� �ѿ�)
    �Ϲ� �� ������ ��� ����
    =   !=   ^=  >   <   >=    , ....
*/
-- 1) �� ������ ��ձ޿����� �޿��� �� ���� �޴� ������� �����, �����ڵ�, �޿� ��ȸ
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEE);
                
-- 2) ���� �޿��� �޴� ����� ���, �̸�, �޿�, �Ի���
SELECT EMP_ID, EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                    FROM EMPLOYEE);
                    
-- 3) ���ö ����� �޿����� �� ���� �޴� ������� ���, �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT  SALARY
                FROM EMPLOYEE
                WHERE EMP_NAME = '���ö');
     
-->> ����Ŭ ���� ����           
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID
AND SALARY > (SELECT  SALARY
                FROM EMPLOYEE
                WHERE EMP_NAME = '���ö');

-->> ANSI ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
WHERE SALARY > (SELECT SALARY
                FROM EMPLOYEE
                WHERE EMP_NAME = '���ö');
                
-- 4) �μ��� �޿����� ���� ū �μ��� �μ��ڵ�, �޿� �� ��ȸ
-- 4_1) ���� �μ��� �޿��� �߿����� ���� ū �� �ϳ��� ��ȸ
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE; -- 17700000 ��

--4_2) �μ��� �޿� ���� 17700000�� �� �μ� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = 17700000;

-- ���� �� �ܰ踦 �ϳ��� ���������� !!
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                      FROM EMPLOYEE
                      GROUP BY DEPT_CODE);
                      
-- ������ ����� ���� �μ������� ���, �����, ��ȭ��ȣ, �Ի���, �μ���
-- ��, �������� ����
-->> ����Ŭ ���뱸��
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_ID = DEPT_CODE
AND DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '������')
AND EMP_NAME != '������';

-->> ANSI ����
SELECT EMP_ID, EMP_NAME, PHONE, HIRE_DATE, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                   FROM EMPLOYEE
                   WHERE EMP_NAME = '������')
AND EMP_NAME != '������';

--------------------------------------------------------------------------------
/*
    2. ������ �������� (MULTI ROW SUBQUERY)
    ���������� ������ ������� ���� �� �϶� (�÷��� �Ѱ�!)
    
    - IN �������� : �������� ����� �߿��� �Ѱ��� ��ġ�ϴ� ���� �ִٸ�

    - > ANY �������� : �������� ����� �߿��� "�Ѱ���" Ŭ ���
    - < ANY �������� : �������� ����� �߿��� "�Ѱ���" ���� ���
    
        �񱳴�� > ANY (��1, ��2, ��3)
        �񱳴�� > ��1 OR �񱳴�� > ��2 OR �񱳴�� > ��3
        
    - > ALL �������� : �������� "���" ������� ���� Ŭ ���
    - < ALL �������� : �������� "���" ������� ���� ���� ���
    
        �񱳴�� > ALL (��1, ��2, ��3)
        �񱳴�� > ��1 AND �񱳴�� > ��2 AND �񱳴�� > ��3
*/

-- 1) ����� �Ǵ� ������ ����� ���� ������ ������� ���, �����, �����ڵ�, �޿�
-- 1_1) ����� �Ǵ� ������ ����� � �������� ��ȸ
SELECT JOB_CODE
FROM EMPLOYEE
WHERE EMP_NAME IN ('�����', '������'); -- J3, J7

-- 1_2) J3, J7�� ������ ����� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ('J3', 'J7');

-- ���� �� �ܰ踦 �ϳ��� ������
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN (SELECT JOB_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME IN ('�����', '������')); -- = �̶�� ���� ��������!! �������� ��ȸ�Ǿ��� ����!
                    -- ���࿡ ������� ������ ���� �� ������ �׳� ���������� IN���� ����!
                    
-- ��� => �븮 => ���� => ���� => ���� ...
-- 2) �븮 �����ӿ��� �ұ��ϰ� ���� ���� �޿��� �� �ּ� �޿����� ���� �޴� ���� ��ȸ (���, �̸�, ����, �޿�)
-- 2-1) ���� ���� ������ ������� �޿� ��ȸ
SELECT SALARY
FROM EMPLOYEE E ,JOB J 
WHERE E.JOB_CODE = J.JOB_CODE
AND JOB_NAME = '����';

-- 2-2) ������ �븮�̸鼭 �޿����� ���� ��� �� �߿� �ϳ��� ū ���
SELECT EMP_ID, EMP_NO, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '�븮'
AND SALARY  > ANY ('2200000', '2500000', '3760000');

-- ���� �� �ܰ踦 �ϳ��� ���������� �ۼ�
SELECT EMP_ID, EMP_NO, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '�븮'
AND SALARY  > ANY (SELECT SALARY
                    FROM EMPLOYEE E ,JOB J 
                    WHERE E.JOB_CODE = J.JOB_CODE
                    AND JOB_NAME = '����');
                    

SELECT EMP_ID, EMP_NO, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME = '�븮'
AND SALARY  > (SELECT MIN(SALARY)
                FROM EMPLOYEE E ,JOB J 
                WHERE E.JOB_CODE = J.JOB_CODE
                AND JOB_NAME = '����');
                
-- 3) ���� �����ӿ��� �ұ��ϰ� ���������� ������� ��� �޿����ٵ� �� ���� �޴� ������� ���, �����, ���޸�, �޿�
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING (JOB_CODE)
WHERE JOB_NAME = '����'
--AND SALARY > (���������� �ֵ��� �޿���);
AND SALARY > ALL (SELECT SALARY
                  FROM EMPLOYEE
                  JOIN JOB USING(JOB_CODE)
                  WHERE JOB_NAME = '����');

--------------------------------------------------------------------------------
/*
    3. ���߿� ��������
    ������� �� �������� ������ �÷����� �������� ���
*/

-- 1) ������ ����� ���� �μ��ڵ�, ���� �����ڵ忡 �ش��ϴ� ����� ��ȸ (�����, �μ��ڵ�, �����ڵ�, �Ի���)
-- >> ������ ���������ε� �����ϱ���.
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '������') -- D5
AND JOB_CODE = (SELECT JOB_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '������'); -- J5
                    
-- >> ���߿� ��������
SELECT EMP_NAME, DEPT_CODE, JOB_CODE, HIRE_DATE
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE  -- ������ �÷������� �� ������Ѵ�.
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '������');-- D5	J5 => �����߿���! ���� �������!!!

-- �ڳ��� ����� ���� �����ڵ�, ���� ����� ������ �ִ� ������� ���, �����, �����ڵ�, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) = (SELECT JOB_CODE, MANAGER_ID
                                FROM EMPLOYEE
                                WHERE EMP_NAME = '�ڳ���');
--------------------------------------------------------------------------------
/*
    4. ������ ���߿� ��������
    �������� ��ȸ ������� ������ �������� ���
*/

-- 1) �� ���޺� �ּұ޿��� �޴� ��� (���, �����, �����ڵ�, �޿�)
-->> �� ���޺� �ּұ޿� ��ȸ
SELECT JOB_CODE, MIN(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;

SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE = 'J2' AND SALARY = 3700000
   OR JOB_CODE = 'J7' AND SALARY = 1380000;
    --....;

-- ���������� �����ؼ� �غ���!!!
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE, MIN(SALARY)
                                FROM EMPLOYEE
                                GROUP BY JOB_CODE);
                                
-- 2) �� �μ��� �ְ�޿��� �޴� ������� ���, �����, �μ��ڵ�, �޿�
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE, SALARY) IN (SELECT DEPT_CODE, MAX(SALARY)
                                FROM EMPLOYEE
                                GROUP BY DEPT_CODE);
                                
--------------------------------------------------------------------------------
/*
    5. �ζ��κ� (INLINE - VIEW)
    ���������� ������ ����� ��ġ ���̺�ó�� ���!!
*/

-- ������� ���, �̸�, ���ʽ� ���� ���� (��Ī�ο� : ����), �μ��ڵ� ��ȸ
-- ��, ���ʽ� ���� ������ 3000���� �̻��� ����鸸 ��ȸ ! ���ʽ� ���� ������ ���� NULL�� ������ �ʵ���
SELECT EMP_ID, EMP_NAME, (SALARY + SALARY * NVL(BONUS,0))*12 AS "����" , DEPT_CODE
FROM EMPLOYEE
WHERE (SALARY + SALARY * NVL(BONUS,0)*12) > 30000000; -- WHERE ���� �ٷ� ��Ī ��� ����!!!

SELECT EMP_ID, EMP_NAME, (SALARY + SALARY * NVL(BONUS,0))*12 AS "����" , DEPT_CODE
FROM EMPLOYEE;
-- �̰� ��ġ �����ϴ� ���̺��ΰ� ���� ����� �� ����!! �װ� �ζ��� ��!!

SELECT *
FROM (SELECT EMP_ID, EMP_NAME, (SALARY + SALARY * NVL(BONUS,0))*12 AS "����" , DEPT_CODE
FROM EMPLOYEE)
WHERE ���� >= 30000000;

SELECT EMP_NAME, DEPT_CODE, ���� -- , MANAGER_ID �̰� ������
FROM (SELECT EMP_ID, EMP_NAME, (SALARY + SALARY * NVL(BONUS,0))*12 AS "����" , DEPT_CODE
FROM EMPLOYEE)
WHERE ���� >= 30000000;

-- >> �ζ��� �並 �ַ� ����ϴ� �� => TOP-N �м� (���� ��� �����ְ� ������ => BEST ��ǰ!!)
-- �� ���� �� �޿��� ���� ���� ���� 5�� ��ȸ
-- * ROWNUM : ����Ŭ���� �������ִ� �÷�, ��ȸ�� ������� 1���� ������ �ο����ִ� �÷�
SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;
-- FROM --> SELECT ROWNUM (�̶� ������ �ο���!! ���ĵ� �ϱ����� �̹� ���� �ο�)
-- ���� �� �̻��� ,,,,

SELECT ROWNUM, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE ROWNUM <=5
ORDER BY SALARY DESC;
-- �������� ����� ��ȸ���� ����!! (������ �Ǳ⵵ ���� 5���� �߷����� ���� ����)

-- ORDER BY���� �� ����� ����� ������ ROWNUM �ο� �� 5�� �߷�����!!!
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT EMP_NAME, SALARY
      FROM EMPLOYEE
      ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

SELECT ROWNUM, E.*
FROM (SELECT EMP_NAME, SALARY
      FROM EMPLOYEE
      ORDER BY SALARY DESC) E
WHERE ROWNUM <= 5;

-- ���� �ֱٿ� �Ի��� ��� 5�� ��ȸ (�����, �޿�, �Ի���)
SELECT ROWNUM, E.*
FROM (SELECT EMP_NAME, SALARY, HIRE_DATE
      FROM EMPLOYEE
      ORDER BY HIRE_DATE DESC) E
WHERE ROWNUM <=5 ;

-- �� �μ��� ��ձ޿��� ���� 3���� �μ� ��ȸ (�μ��ڵ�, ��ձ޿�) =>  ��ձ޿� ��Ī �ο�
SELECT ROWNUM, DEPT_CODE, FLOOR(��ձ޿�)
FROM (SELECT DEPT_CODE, (AVG(SALARY)) AS "��ձ޿�"
        FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY AVG(SALARY)DESC)
WHERE ROWNUM <=3;
--------------------------------------------------------------------------------
/*
    * ���� �ű�� �Լ� (WINDOW FUNCTION)
    RANK() OVER(���ı���)  |  DENSE_RANK() OVER(���ı���)
    
    - RANK() OVER(���ı���) : ������ ���� ������ ����� ������ �ο��� ��ŭ �ǳʶٰ� ���� ���
                            EX) ���� 1���� 2�� �� ���� ���� 3�� => 1 1 3
   
    - DENSE_RANK() OVER(���ı���) : ������ ������ �ִٰ� �ص� �� ���� ����� ������ 1�� ������Ŵ
                            EX) ���� 1���� 2���̴��� �� ���� ������ 2��
    >> �� �Լ��� ������!! SELECT �������� ��� ����!!!
*/
-- �޿��� ���� ����� ������ �Űܼ� ��ȸ
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;
-- ���� 19�� 2�� �� ���� ������ 21 => ������ ������ ��ȸ�� ����� ����.
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;
-- ���� 19�� �� ���� ������ 20 => ������ ������ ��ȸ�� ����� �ٸ� �� ����.

--> ���� 5�� ��ȸ
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE; --1
--WHERE ���� <= 5; --2
--WHERE RANK() OVER(ORDER BY SALARY DESC) <= 5;

-- �ζ��κ並 �� �� �ۿ� ����!!!
SELECT * --3
FROM (SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE) --1
WHERE ���� <= 5; --2













