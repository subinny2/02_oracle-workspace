-- ��������
-- ��������� ���� ����

/*
    DQL (QUERY ������ ���� ���) : SELECT
    
    DML (MANIPULATION ������ ���� ���) : [SELECT], INSERT, UPDATE, DELETE
    DDL (DEFINITION ������ ���� ���) : CREATE, ALTER, DROP
    DCL (CONTROL ������ ���� ���) : GRANT, REVOKE , [COMMIT, ROLLBACK]
    
    TCL (TRANSACTION Ʈ������ ���� ���) : COMMIT, ROLLBACK
    
    < DML : DATA MANIPULATION LANGUAGE>
    ������ ���� ���
    
    ���̺� ���� ����(INSERT) �ϰų�, ����(UPDATE) �ϰų�, ����(DELETE) �ϴ� ����
*/

/*
    1. INSERT
       ���̺� ���ο� ���� �߰��ϴ� ����
       
       [ǥ����]
       1) INSERT INTO ���̺�� VALUES(��1, ��2, ....);
          ���̺� ��� �÷��� ���� ���� ���� �����ؼ� �� �� INSERT �ϰ��� �� �� ���
          �÷� ������ ���Ѽ� VALUES�� ���� �����ؾߵ�!!!
          
          �����ϰ� ���� �������� ��� => not enough value ����!
          ���� �� ���� �������� ��� => too many values ����!
*/

INSERT INTO EMPLOYEE
VALUES(900, '������', '900101-1234567', 'cha_00@kh.or.kr', '01011112222',
        'D1', 'J7', 'S3', 4000000, 0.2, 200, SYSDATE, NULL, DEFAULT);
        
SELECT * FROM EMPLOYEE;

/*
    2) INSERT INTO ���̺��(�÷���1, �÷���2, ..) VALUES (��1, ��2, ...);
        ���̺� ���� ������ �÷��� ���� ���� INSERT �� �� ���
        ������ �ȵ� �÷��� �⺻�����δ� NULL�� ��.
        => NOT NULL ���������� �ɷ��ִ� �÷��� �ݵ�� �����ؼ� ���� �� �����ؾߵ�!!!
        ��, DEFAULT ���� �ִ� ���� NULL�� �ƴ� DEFAULT�� ����!
*/

INSERT
 INTO EMPLOYEE
      (
         EMP_ID
       , EMP_NAME
       , EMP_NO
       , JOB_CODE
       , SAL_LEVEL
       , HIRE_DATE
       )
VALUES
     (
       901
       , '������'
       , '880202-1111111'
       , 'J2'
       , 'S2'
       , SYSDATE
       );
-- ENT_YN�� ����Ʈ������ ������!!
-- �������� ���� �ڵ� �̷������� ����
-- �����߿�
--------------------------------------------------------------------------------
/*
    3) INSERT INTO ���̺�� (��������)
       VALUES�� �� ���� ����ϴ°� ��ſ�
       ���������� ��ȸ�� ������� ��°�� INSERT ����!! (������ INSERT ����!!!)
*/

CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    DEPT_TITLE VARCHAR2(20)
);

SELECT * FROM EMP_01;

-- ��ü ������� ���, �̸�, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

INSERT INTO EMP_01 (
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
);

SELECT * FROM EMP_01;

/*
    [ ǥ���� ]
    INSERT ALL
    INTO ���̺��1 VALUES(�÷���, �÷���, ... )
    INTO ���̺��2 VALUES(�÷���, �÷���, ... )
    ��������;
*/
-- �켱 �׽�Ʈ�� ���̺� �����
-- ������ �賢��
CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
   FROM EMPLOYEE
   WHERE 1 = 0;
   
SELECT * FROM EMP_DEPT;

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
   FROM EMPLOYEE
   WHERE 1 = 0;
   
SELECT * FROM EMP_MANAGER; 

-- �μ��ڵ尡 D1�� ������� ���, �̸�, �μ��ڵ�, �Ի��� , ������ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';

INSERT ALL
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
    SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
    FROM EMPLOYEE
    WHERE DEPT_CODE = 'D1';


-- * ������ ����ؼ��� �� ���̺� �� INSERT ����
--> 2000�⵵ ���� �Ի��� �Ի��ڵ鿡 ���� �������� ���̺�
-- ���̺� ������ �貸�� ���� �����
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1 = 0;

-- EMP_NEW
CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
    FROM EMPLOYEE
    WHERE 1 = 0;

SELECT * FROM EMP_OLD; -- 2000�⵵ ���� �Ի���
SELECT * FROM EMP_NEW; -- 2000�⵵ ���� �Ի���

/*
    [ ǥ���� ]
    INSERT ALL
    WHEN ����1 THEN
        INTO ���̺��1 VALUES(�÷���, �÷���, ....)
    WHEN ����2 THEN    
        INTO ���̺��2 VALUES(�÷���, �÷���, ....)
    ��������;
    
*/

INSERT ALL

WHEN HIRE_DATE < '2000/01/01' THEN
    INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE >= '2000/01/01' THEN
    INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE;

SELECT * FROM EMP_OLD; -- 2000�⵵ ���� �Ի���
SELECT * FROM EMP_NEW; -- 2000�⵵ ���� �Ի���
--------------------------------------------------------------------------------
/*
    CRUD
    C : CREATE ���� => INSERT
    R : READ => SELECT
    U : UPDATE
    D : DELETE
    3. UPDATE
        ���̺� ��ϵǾ��ִ� ������ �����͸� �����ϴ� ����
        
        [ ǥ���� ]
        UPDATE ���̺��
        SET �÷��� = �ٲܰ�,
            �÷��� = �ٲܰ�,
            �÷��� = �ٲܰ�,
                        --> �������� �÷��� ���� ���� ���� (,�� �����ؾߵ�!! AND �ƴ�)
        [WHERE ����];    --> �����ϸ� ��ü���� ��� ���� �����Ͱ� ����ȴ�..!! => �׷��� �� ������ ��� �ؾߵ�!!
    
*/

-- ���纻 ���̺� ���� �� �۾�
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

UPDATE DEPT_COPY
SET DEPT_TITLE = '������ȹ��'; -- �ѹ���

ROLLBACK;

-- D9�� �μ����� '������ȹ��'���� ����
UPDATE DEPT_COPY
SET DEPT_TITLE = '������ȹ��' -- �ѹ���
WHERE DEPT_ID = 'D9';
-- ��� Ȯ���ʼ�!!!
-- void -> int ��� ������ �ؾ��ϱ⶧��..!!

SELECT * FROM DEPT_COPY;

-- �켱 ���纻 ���� ����
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
    FROM EMPLOYEE;

SELECT * FROM EMP_SALARY;

-- ���ö ����� �޿��� 100�������� ���� -- ������ �ּ����� ����� �صα�
SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '���ö';

UPDATE EMP_SALARY
SET SALARY = 1000000 -- 3700000
WHERE EMP_NAME = '���ö';

-- ������ ����� �޿��� 700�������� �����ϰ� BONUS�� 0.2�� ����
SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '������';

UPDATE EMP_SALARY
SET SALARY = 7000000, -- 8000000
    BONUS = 0.2 -- 0.3
WHERE EMP_NAME = '������';

-- ��ü ����� �޿��� ������ �޿��� 10���� �λ��� �ݾ� (���� �ݾ� * 1.1)
SELECT * FROM EMP_SALARY;

UPDATE EMP_SALARY
SET SALARY = SALARY * 1.1;

-- * UPDATE�� ���������� ��� ����
/*
    UPDATE ���̺��
    SET �÷��� = (��������)
    WHERE ����;
*/

-- ���� ����� �޿�, ���ʽ�, ���ʽ� ���� ����� ����� �޿��� ���ʽ� ������ ����
SELECT * FROM EMP_SALARY
WHERE EMP_NAME = '����'; -- 214	����	D1	1518000	NULL

-- ������ ��������
UPDATE EMP_SALARY
SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME = '�����'), -- 1518000
    BONUS = (SELECT BONUS FROM EMP_SALARY WHERE EMP_NAME = '�����') -- NULL
WHERE EMP_NAME = '����';

-- ���߿� ��������
UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS  -- 1518000 , NULL
                        FROM EMP_SALARY 
                        WHERE EMP_NAME = '�����')
WHERE EMP_NAME = '����';

-- ASIA �������� �ٹ��ϴ� ������� ���ʽ����� 0.3���� ����
-- ASIA �������� �ٹ��ϴ� ����� ��ȸ
UPDATE EMP_SALARY
SET BONUS = 0.3
WHERE BONUS IN (SELECT BONUS
              FROM EMPLOYEE, LOCATION, DEPARTMENT
              WHERE DEPT_CODE = DEPT_ID
              AND LOCAL_CODE = LOCATION_ID
              AND LOCAL_NAME LIKE 'ASIA%');
--------------------------------------------------------------------------------
-- ���� ������
SELECT *
FROM EMP_SALARY
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
WHERE LOCAL_NAME LIKE 'ASIA%';

UPDATE EMP_SALARY
SET BONUS = 0.3
WHERE EMP_ID IN (SELECT EMP_ID
                FROM EMP_SALARY
                JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                JOIN LOCATION ON (LOCATION_ID = LOCAL_CODE)
                WHERE LOCAL_NAME LIKE 'ASIA%');
-- ORA-01427: single-row subquery returns more than one row
--              = �� ������ IN�� ������ ���߿�!! IN���� ����!!

SELECT * FROM EMP_SALARY;
SELECT * FROM EMPLOYEE;
SELECT * FROM LOCATION; -- L1 L2 L3  LOCAL_CODE
SELECT * FROM DEPARTMENT; -- L1, L2,L3  D1 D2 D3 D4 D5 D9

--------------------------------------------------------------------------------
-- UPDATE�ÿ��� �ش� �÷��� ���� �������� �����ϸ� �ȵ�!!
-- ����� 200���� ����� �̸��� NULL�� �ϰڴ�.
SELECT * FROM EMPLOYEE;
UPDATE EMPLOYEE
SET EMP_NAME = NULL -- ������
WHERE EMP_ID = '200';
-- ��ȿ�� �����Ͱ� �ƴ�
-- ORA-01407: cannot update ("KH"."EMPLOYEE"."EMP_NAME") to NULL
-- NOT NULL �������� ����!!!

-- ���ö ����� �����ڵ带 J9�� ����
UPDATE EMPLOYEE
SET JOB_CODE = 'J9'
WHERE EMP_NAME = '���ö';
-- ORA-02291: integrity constraint (KH.SYS_C007147) violated - parent key not found
-- FOREIGN KEY �������� ����!!
-- JOB�� parent key�� ����. (�θ�Ű�� ���� ��, J9�� ����)

--------------------------------------------------------------------------------
-- �
-- ���� (��������) : SM (�ý��۸Ŵ�����Ʈ) ����߰� �� ����
-- ���� : SI ���ο� �ý����� �����.
COMMIT;

/*
    4. DELETE
       ���̺� ��ϵ� �����͸� �����ϴ� ���� (�� �� ������ ������)
       
       [ ǥ���� ]
       DELETE FROM ���̺��
       [WHERE ����]; --> WHERE�� ���ø� ���ϸ� ��ü �� �� ������
*/
-- ������ ����� ������ �����
SELECT * FROM EMPLOYEE
WHERE EMP_NAME = '������';

ROLLBACK;

DELETE FROM EMPLOYEE
WHERE EMP_NAME = '������';


COMMIT;

-- DEPT_ID�� D1�� �μ��� ����
SELECT * FROM DEPARTMENT
WHERE DEPT_ID = 'D1';

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';
-- ORA-02292: integrity constraint (KH.SYS_C007146) violated - child record found
-- �ܷ�Ű �������� ����!!
-- D1�� ���� ������ ���� �ڽ� �����Ͱ� �ֱ� ������ ������ �ȵ�!!!

SELECT * FROM EMPLOYEE
WHERE DEPT_CODE = 'D3';

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D3';

ROLLBACK;

-- * TRUNCATE : ���̺��� ��ü ���� ������ �� ���Ǵ� ����
--              DELETE ���� ����ӵ��� ����
--              ������ ���� ���� �Ұ�, ROLLBACK �Ұ�.
-- [ ǥ���� ] TRUNCATE TABLE ���̺��;

SELECT * FROM EMPLOYEE_COPY3;

TRUNCATE TABLE EMPLOYEE_COPY3;
-- Table EMPLOYEE_COPY3��(��) �߷Ƚ��ϴ�.

ROLLBACK;
-- �ѹ��ص� ���̺��� �����͵��� ������. �ѹ� �Ұ�!!











