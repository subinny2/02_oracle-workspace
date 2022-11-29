-- ���� ����
/*
    < �Լ� FUNCTION >
    ���޵� �÷����� �о�鿩�� �Լ��� ������ ����� ��ȯ��
    
    - ������ �Լ� : N���� ���� �о�鿩�� N���� ������� ���� (�� �� ���� �Լ����� ��� ��ȯ)
    - �׷� �Լ� : N���� ���� �о�鿩�� 1���� ������� ���� (�׷��� ���� �׷캰�� �Լ��� ������ ��ȯ)
    
    >> SELECT���� ������ �Լ��� �׷��Լ��� �Բ� ��� ����!!!
      ��?? ��� ���� ������ �ٸ��� ����!!!
      
    >> �Լ����� ��� �� �� �ִ� ��ġ : SELECT��, WHERE��, ORDER BY��, GROUP BY��, HAVING��
    
*/

/*
    < ���� ó�� �Լ� >
    
    * LENGTH / LENGTHB      => ����� NUMBER Ÿ��
    
    LENGTH(�÷� | '���ڿ� ��') : �ش� ���ڿ� ���� ���ڼ� ��ȯ
    LENGTHB(�÷� | '���ڿ� ��') : �ش� ���ڿ� ���� ����Ʈ �� ��ȯ
    
    '��', '��', '��' �ѱ��ڴ� 3BYTE   �Ѽ���=> 9����Ʈ 
    ������, ����, Ư�� �ѱ��ڴ� 1BYTE
    
*/

SELECT SYSDATE
FROM DUAL;  -- �������̺� : ���̺� ���� ���� �� ����ϴ� ��!

SELECT LENGTH('����Ŭ') , LENGTHB('����Ŭ')
FROM DUAL;  -- �������̺� : ���̺� ���� ���� �� ����ϴ� ��!

SELECT LENGTH('oracle'), LENGTHB('oracle')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
        EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE; -- ���ึ�� �� ����ǰ� ����! => ������ �Լ�

/*
    * INSTR
    ���ڿ��κ��� Ư�� ������ ������ġ�� ã�Ƽ� ��ȯ
    
    INSTR(�÷� | '���ڿ�', 'ã�����ϴ¹���', ['ã�� ��ġ�� ���۰�', [����]])      => ������� NUMBERŸ��!!
    
    ã�� ��ġ�� ���۰�
    1 : �տ������� ã�ڴ�.
    -1 : �ڿ������� ã�ڴ�.
    
*/

-- INSTR�� �ܿ����Ѵ�. --
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; -- ã�� ��ġ�� ���۰��� 1�� �⺻�� => �տ������� ã��. ������ 1 �⺻��
SELECT INSTR('AABAACAABBAA', 'B', 1) FROM DUAL; -- �տ������� B�� ã�ڴ�. => ��°��� B�� ������ �����
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL; -- �ڿ������� B�� ã�ڴ�.
SELECT INSTR('AABAACAABBAA', 'B', 1, 2) FROM DUAL; -- �տ��� ���� ã��, 2��° Bã��
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL; -- �ڿ������� 3��° Bã�� => ���� ��°��� 3

SELECT EMAIL, INSTR(EMAIL, '_', 1,1) AS "��ġ", INSTR(EMAIL, '@') AS "@��ġ"
FROM EMPLOYEE;
----------------------------------------------------------------------------------------
/*
    *SUBSTR
    ���ڿ����� Ư�� ���ڿ��� �����ؼ� ��ȯ(�ڹٿ��� subString() �޼ҵ�� ����)
    
    SUBSTR(STRING, POSITION, [LENGTH])      => ������� CHARACTER Ÿ��
    - STRING : ����Ÿ���÷� �Ǵ� '���ڿ� ��'
    - POSITION : ���ڿ��� ������ ������ġ��
    - LENGTH : ������ ���ڰ��� (������ ������ �ǹ�)
*/

SELECT SUBSTR('SHOWMETHEMONEY', 7) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', 5, 2) FROM DUAL; -- 5��°���ں��� 2���� ����
SELECT SUBSTR('SHOWMETHEMONEY', 1, 6) FROM DUAL;
SELECT SUBSTR('SHOWMETHEMONEY', -8, 3) FROM DUAL; -- �ڿ��� 8��°���ں��� 3���� ���� (�����̱⶧ ���� �ڿ�������)

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) AS "����"
FROM EMPLOYEE;

-- ���� ����鸸 ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

-- ���ڻ���鸸 ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO, 8, 1) = '1' OR SUBSTR(EMP_NO, 8, 1) = '3';
-- WHERE SUBSTR(EMP_NO, 8, 1) IN ('1', '3');
WHERE SUBSTR(EMP_NO, 8, 1) IN(1,3) -- ���������� �ڵ� ����ȯ
ORDER BY EMP_NAME; -- ������������ �����ϰڴ�. -- �⺻���� ��������
--ORDER BY 1;

-- �Լ� ��ø���
SELECT EMP_NAME, EMAIL, EMP_NO, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) AS "���̵�"
FROM EMPLOYEE;

------------------------------------------------------------------------------------
/*
    *LPAD / RPAD
    ���ڿ��� ��ȸ�� �� ���ϰ� �ְ� ��ȸ�ϰ��� �� �� ���
    
    LPAD/RPAD(STRING, ���������� ��ȯ�� ������ ����, [�����̰��� �ϴ� ����])
    
    ���ڿ��� �����̰��� �ϴ� ���ڸ� ���� �Ǵ� �����ʿ� ���ٿ��� ���� N���̸�ŭ�� ���ڿ� ��ȯ
*/

-- 20��ŭ�� ���� �� EMAIL �÷����� ���������� �����ϰ� ������ �κ��� �������� ä����
SELECT EMP_NAME, LPAD(EMAIL, 20) -- �����̰��� �ϴ� ���� ������ �⺻���� ����!!
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

-- 850101-2****** �������� ��ȸ => �ѱ��ڼ� : 14
SELECT RPAD('850101-2', 14, '*')
FROM DUAL;

SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO,1,8) , 14 , '*')AS "�ֹι�ȣ"
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    LTRIM / RTRIM
    ���ڿ����� Ư�� ���ڸ� ������ �������� ��ȯ
    
    LTRIM / RTRIM (STRING, ['������ ���ڵ�'])     => �����ϸ� ���� ��������
    
    ���ڿ��� ���� Ȥ�� �����ʿ��� �����ϰ��� �ϴ� ���ڵ��� ã�Ƽ� ���� �� ���ڿ� ��ȯ
*/

SELECT LTRIM('   K H ') FROM DUAL; -- ���� ã�Ƽ� �����ϰ� ���ڳ����� �׳� ����  -- ù���� ���� ���ʿ��ִ� ���� ����
SELECT LTRIM('123123KH123', '123') FROM DUAL; -- ���ڰ� �������� 123 �����ϰ� ���ں��� �״�� ���
SELECT LTRIM('ACABACCKH', 'ABC') FROM DUAL;
SELECT RTRIM('5782KH123', '0123456789') FROM DUAL;

/*
    * TRIM
    ���ڿ��� �� / �� / ���ʿ� �ִ� ������ ���ڵ��� ������ ������ ���ڿ� ��ȯ
    TRIM([[LEADING | TRAILING | BOTH]�����ϰ��� �ϴ� ���ڵ� FROM]STRING)   

*/
SELECT TRIM('   K H   ') FROM DUAL;
-- SELECT TRIM('ZZZKHZZZ', 'Z') FROM DUAL;
SELECT TRIM('Z' FROM 'ZZZKHZZZ') FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZ') FROM DUAL; -- LEADING : ���� �����  => LTRIM�� ����
SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZ') FROM DUAL; -- TRAILING : �� => RTRIM�� ����
SELECT TRIM(BOTH 'Z' FROM 'ZZZKHZZZ') FROM DUAL; -- BOTH : ���� => ������ �⺻��

--------------------------------------------------------------------------------------------
/*
    * LOWER / UPPER / INITCAP
    
    LOWER / UPPER / INITCAP (STRING)        => ������� CHARACTER Ÿ��
    LOWER : �� �ҹ��ڷ� ������ ���ڿ� ��ȯ (�ڹٿ����� toLowerCase() �޼ҵ� �� ����
    UPEER : �� �빮�ڷ� ������ ���ڿ� ��ȯ (�ڹٿ����� toUpperCase() �޼ҵ�� ����
    INITCAP : �ܾ� �ձ��ڸ��� �빮�ڷ� ������ ���ڿ� ��ȯ
    
*/

SELECT LOWER('Welcome To My World!') FROM DUAL;
SELECT UPPER('Welcome To My World!') FROM DUAL;
SELECT INITCAP('welcome to my world!') FROM DUAL; -- �ܾ��� �ձ��ڸ� �빮�ڷ� ����
--------------------------------------------------------------------------------
/*
    * CONCAT
    ���ڿ� �ΰ� ���޹޾� �ϳ��� ��ģ �� ��� ��ȯ
    
    CONCAT(STRING, STRING)          => ����� CHARACTERŸ��
*/

SELECT CONCAT('ABC', '���ݸ�') FROM DUAL;
SELECT 'ABC' || '���ݸ�'  FROM DUAL;

SELECT CONCAT('ABC', '���ݸ�', '�԰�ʹ�.') FROM DUAL; --- �����߻�!! : 2���� ���� �� ���� 
SELECT 'ABC' || '���ݸ� ' || '�԰�ʹ�.' FROM DUAL;

--------------------------------------------------------------------------------
/*
    * REPLACE
    
    REPLACE(STRING, STR1, STR2)         => ������� CHARACTERŸ��
*/

SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'gmail.com')
FROM EMPLOYEE;

--------------------------------------------------------------------------------
/*
    < ���� ó�� �Լ� >
    
    *ABS
    ������ ������ �����ִ� �Լ�
    
    ABS(NUMBER)         => ������� NUMBER Ÿ��!
*/

SELECT ABS(-10) FROM DUAL;
SELECT ABS(-5.7) FROM DUAL;

--------------------------------------------------------------------------------
/*
    * MOD
    �� ���� ���� ���������� ��ȯ���ִ� �Լ�
    MOD(NUMBER, NUMBER)         => ����� NUMBER Ÿ��!!
*/

SELECT MOD(10,3) FROM DUAL;
SELECT MOD(10.9,9) FROM DUAL;

--------------------------------------------------------------------------------
/*
    *ROUND
    �ݿø��� ����� ��ȯ
    
    ROUND(NUMBER, [��ġ])     => ������� NUMBER Ÿ��
    ��ġ������ 0��° �ڸ����� �ݿø�
*/

-- 123.456 �ڸ���ġ -2:1, -1:2, 0:3, 1:4, 2:5, 3:6
SELECT ROUND(123.456) FROM DUAL; -- ��ġ ������ 0
SELECT ROUND(123.456, 1) FROM DUAL;
SELECT ROUND(123.456, 5) FROM DUAL; -- ��ġ���� ū�� �Է½� �״�� ���
SELECT ROUND(123.456, -1) FROM DUAL;
SELECT ROUND(123.456, -2) FROM DUAL;
--------------------------------------------------------------------------------
/*
    * CEIL
    �ø�ó�� ���ִ� �Լ�
    
    CEIL(NUMBER)
*/
SELECT CEIL(123.152) FROM DUAL; --5�̻��� �ƴϿ��� ������ �ø�! ��ġ���� �Ұ�
--------------------------------------------------------------------------------
/*
    * FLOOR
    �Ҽ��� �Ʒ� ����ó���ϴ� �Լ�
    
    FLOOR(NUMBER)
*/
SELECT FLOOR(123.152) FROM DUAL; -- ��ġ�����Ұ� �����ǹ���ó��
SELECT FLOOR(123.952) FROM DUAL;
--------------------------------------------------------------------------------
/*
    *TRUNC(�����ϴ�)
    ��ġ ���� ������ ����ó�����ִ� �Լ�
    
    TRUNC(NUMBER, [��ġ]) -- ��ġ��������
*/
SELECT TRUNC(123.456) FROM DUAL; -- ��ġ������ ���ϸ� FLOOR�� ������
SELECT TRUNC(123.456, 1) FROM DUAL; -- �Ҽ��� �Ʒ� ù°�ڸ����� ǥ���ϰ� �ʹ�.
SELECT TRUNC(123.456, -1) FROM DUAL; -- �ش���ġ �ڷ� ������.
--------------------------------------------------------------------------------

/*
    < ��¥ ó�� �Լ� >
*/

-- * SYSDATE : �ý��� ��¥ �� �ð� ��ȯ(���� ��¥ �� �ð�)
SELECT SYSDATE FROM DUAL; -- Ŭ���ؼ� Ȯ���غ��� �ð��� Ȯ�� ����

-- * MONTHS_BETWEEN ( DATE1, DATE2) : �� ��¥ ������ ���� �� => ���������� DATE1 - DATE2�� ������ 30, 31 �� �����
-- => ������� NUMBER Ÿ��

-- EMPLOYEE���� �����, �ٹ��ϼ�, �ٹ����� �� ���
SELECT EMP_NAME, HIRE_DATE, FLOOR(SYSDATE - HIRE_DATE) || '��' AS "�ٹ��ϼ�" ,
CEIL(MONTHS_BETWEEN(SYSDATE , HIRE_DATE)) || '����' AS "�ٹ�������"
FROM EMPLOYEE;

-- * ADD_MONTHS(DATE,NUMBER) : Ư����¥�� �ش� ���ڸ�ŭ�� �������� ���ؼ� ��¥�� ����
-- => ����� : DATEŸ��
SELECT ADD_MONTHS(SYSDATE, 6) FROM DUAL;

-- EMPLOYEE���� �����, �Ի���, �Ի� �� 6������ �� ��¥
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) AS "�������ᳯ¥"
FROM EMPLOYEE;

-- * NEXT_DAY(DATE, ����(����|����)) : Ư����¥ ���Ŀ� ����� �ش� ������ ��¥�� ��ȯ���ִ� �Լ�
-- => ������� DATE Ÿ��
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�ݿ���') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
-- 1. �Ͽ���, 2. ������ .... 7. �����
SELECT SYSDATE, NEXT_DAY(SYSDATE, 6) FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'FRIDAY') FROM DUAL;

-- ��� ����
SELECT * FROM NLS_SESSION_PARAMETERS; -- ����Ȯ��
ALTER SESSION SET NLS_LANGUAGE = AMERICAN; -- ����� ����
ALTER SESSION SET NLS_LANGUAGE = KOREAN; -- �ѱ���� ����

-- * LAST_DAT(DATE) : �ش���� ������ ��¥�� ���ؼ� ��ȯ
-- => ������� DATE Ÿ��
SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- EMPLOYEE���� �����, �Ի���, �Ի��Ѵ��� ������ ��¥, �Ի��Ѵ��� �ٹ��ϼ�
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), LAST_DAY(HIRE_DATE) - HIRE_DATE
FROM EMPLOYEE;

/*
    * EXTRACT : Ư�� ��¥�κ��� �⵵|��|�� ���� �����ؼ� ��ȯ�ϴ� �Լ�
    
    EXTRACT(YEAR FROM DATE) : �⵵�� ����
    EXTRACT(MONTH FROM DATE) : ���� ����
    EXTRACT (DAY FROM DATE) : �ϸ� ����
*/

-- �����, �Ի�⵵, �Ի��, �Ի��� (��Ī����), �Ի�⵵������ ����
SELECT EMP_NAME AS "�����",
EXTRACT(YEAR FROM HIRE_DATE) AS "�Ի�⵵",
EXTRACT (MONTH FROM HIRE_DATE) AS "�Ի��",
EXTRACT(DAY FROM HIRE_DATE) AS "�Ի���"
FROM EMPLOYEE
-- ORDER BY EXTRACT(YEAR FROM HIRE_DATE);
ORDER BY "�Ի�⵵", "�Ի��", "�Ի���";
-- ORDER BY 2,3,4;
-- ORDER BY "�Ի�⵵" DESC; -- ��������

--------------------------------------------------------------------------------
/*
    < ����ȯ �Լ� >
    
    * TO CHAR() : ����Ÿ�� �Ǵ� ��¥ Ÿ���� ���� ����Ÿ������ ��ȯ�����ִ� �Լ�
    
    TO_CHAR(����|��¥, [����])            => ������� CHARACTERŸ��!!
*/

-- ����Ÿ�� => ����Ÿ��
SELECT TO_CHAR(1234) FROM DUAL; -- '1234'�� �ٲ������
SELECT TO_CHAR(1234, '99999') FROM DUAL; -- 5ĭ¥�� ���� Ȯ��, ������ ����, ��ĭ ����
SELECT TO_CHAR(1234, '00000') FROM DUAL; -- ��ĭ 0���� ä���.
SELECT TO_CHAR(1234, 'L99999') FROM DUAL; -- ���� ������ ����(LOCAL)�� ȭ�����
SELECT TO_CHAR(1234, '$99999') FROM DUAL;

SELECT TO_CHAR(1234, 'L99,999') FROM DUAL;

SELECT EMP_NAME, TO_CHAR(SALARY, 'L999,999,999')
FROM EMPLOYEE;
--------------------------------------------------------------------------------

-- ��¥Ÿ�� => ����Ÿ��
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL; --Ŭ���غ��� �ٸ� ��¥Ÿ���� �ð��� �������� �̰��� �ð��� �ȳ��´�.
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL; -- HH : 12�ð� ����
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL; -- HH24 : 24�ð� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY DY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL;

SELECT EMP_NAME, HIRE_DATE, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD DY')
FROM EMPLOYEE;

-- EX) 1990�� 02�� 06�� ��������
SELECT EMP_NAME, HIRE_DATE, TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"') -- �������� �����Ҷ��� "" �̰ŷ� ����
FROM EMPLOYEE;

-- �⵵�� ���õ� ����
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'YY'),
       TO_CHAR(SYSDATE, 'RRRR'),
       TO_CHAR(SYSDATE, 'RR'),
       TO_CHAR(SYSDATE, 'YEAR')
FROM DUAL;

-- ���� ���õ� ����
SELECT TO_CHAR(SYSDATE, 'MM'), -- MM:��  MI:��
       TO_CHAR(SYSDATE, 'MON'),
       TO_CHAR(SYSDATE, 'MONTH'),
       TO_CHAR(SYSDATE, 'RM')
FROM DUAL;

-- �Ͽ� ���� ����
SELECT TO_CHAR(SYSDATE, 'DDD'), -- ���� �������� ������ ��ĥ° ����
       TO_CHAR(SYSDATE, 'DD'), -- �� �������� ������ ��ĥ° ����
       TO_CHAR(SYSDATE, 'D') -- �� �������� ��ĥ° ����
FROM DUAL;

-- ���Ͽ� ���� ����
SELECT TO_CHAR(SYSDATE, 'DAY'),
       TO_CHAR(SYSDATE, 'DY')
FROM DUAL;

--------------------------------------------------------------------------------
/*
    * TO_DATE : ����Ÿ�� �Ǵ� ����Ÿ�� �����͸� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
    
    TO_DATE(����|����, [����]) =>  ����� : DATEŸ��
*/

SELECT TO_DATE(20100101) FROM DUAL;
SELECT TO_DATE(100101) FROM DUAL;
-- 1 2 3 4 01 02 03 04
SELECT TO_DATE(070101) FROM DUAL; -- �����߻�
SELECT TO_DATE('070101') FROM DUAL; -- ù���ڰ� 0�� ���� ����Ÿ������ �����ϰ� �ؾ���

SELECT TO_DATE('041030 143000') FROM DUAL;
SELECT TO_DATE('041030 143000', 'YYMMDD HH24MISS') FROM DUAL;

SELECT TO_DATE('140630', 'YYMMDD') FROM DUAL; -- 2014��
SELECT TO_DATE('980630', 'YYMMDD') FROM DUAL; -- 2098�� => ������ ���� ����� �ݿ�

SELECT TO_DATE('140630', 'RRMMDD') FROM DUAL; -- 2014��
SELECT TO_DATE('980630', 'RRMMDD') FROM DUAL; -- 1998��
-- RR : �ش� ���ڸ� �⵵ ���� 50�̸��� ��� ���� ���� �ݿ�, 50 �̻��� ��� �������� �ݿ�
--------------------------------------------------------------------------------
/*
    * TO_NUMBER : ���� Ÿ���� �����͸� ����Ÿ������ ��ȯ�����ִ� �Լ�
    
    TO_NUMBER(����, [����])     => ������� NUMBER Ÿ��
    
*/
SELECT TO_NUMBER('01037865116') FROM DUAL; -- ���ڷ� �ٲ���⶧���� 0�� ������ ����Ÿ������ ����ǰ� 1037865116 ���

SELECT '1000000' + '55000' FROM DUAL; -- ����Ŭ ������ �ڵ�����ȯ�� �� �Ǿ�����.
SELECT '1,000,000' + '55,000' FROM DUAL; -- �����߻�! �ȿ� ���ڸ� �־�� �ڵ�����ȯ �ȴ�.

SELECT TO_NUMBER('1,000,000', '9,999,999') + TO_NUMBER('55,000', '99,999') FROM DUAL; -- ���� ����ȯ
--------------------------------------------------------------------------------
-- ******* ������ �ܿ�� �������� ���� �߿� *******
/*
    < NULL ó�� �Լ� >
*/

-- NVL(�÷�, �ش� �÷����� NULL�ϰ�� ��ȯ�� ��)
SELECT EMP_NAME, BONUS, NVL(BONUS, 0)
FROM EMPLOYEE;

-- ��ü ����� �̸�, ���ʽ� ���� ����
SELECT EMP_NAME, (SALARY + SALARY * BONUS)*12, (SALARY + SALARY * NVL(BONUS,0))*12
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE, '�μ�����')
FROM EMPLOYEE;

-- NVL2(�÷�, ��ȯ��1, ��ȯ��2)
-- �÷����� ������ ��� ��ȯ��1 ��ȯ.
-- �÷����� NULL�ϰ�� ��ȯ��2�� ��ȯ.
SELECT EMP_NAME, NVL2(DEPT_CODE, '�μ�����', '�μ�����')
FROM EMPLOYEE;

-- ���ʽ��� �ִ� : 0.7 / ���� : 0.1 EMP_NAME,BONUS
SELECT EMP_NAME, NVL2(BONUS, 0.7, 0.1)
FROM EMPLOYEE;

-- NULLIF(�񱳴��1, �񱳴��2)
-- �� ���� ���� ��ġ�ϸ� NULL ��ȯ
-- �� ���� ���� ��ġ���� ������ �񱳴��1 ���� ��ȯ
SELECT NULLIF('123', '123') FROM DUAL; -- NULL�� ��ȯ
SELECT NULLIF('123', '456') FROM DUAL; -- �񱳴��1�� ��ȯ (�� ���� ���� ��ġ���� �ʱ� ����)

--------------------------------------------------------------------------------
/*
    < �����Լ� >
    * DECODE(���ϰ����ϴ� ���(�÷�|�������|�Լ���), �񱳰�1, �����1, �񱳰�2, �����2, ....)
    
    SWITCH(�񱳴��){
    CASE �񱳰�1 : BREAK;
    CASE �񱳰�2 : BREAK;
    ...
    DEFAULT : 
    }
    
*/
-- ���, �����, �ֹι�ȣ
SELECT
EMP_ID, EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8,1) AS "�����ڵ�",
DECODE(SUBSTR(EMP_NO, 8,1),'1','��','2','��', '3', '��', '4', '��') AS "����"
FROM EMPLOYEE;

-- ������ �޿� ��ȸ�� �� ���޺��� �λ��ؼ� ��ȸ
-- J7�� ����� �޿��� 10% �λ� (SALARY *1.1)
-- J6�� ����� �޿��� 15% �λ� (SALARY *1.15)
-- J5�� ����� �޿��� 20% �λ� (SALARY *1.2)
-- �� ���� ����� �޿��� 5% �λ� (SALARY *1.05)
SELECT EMP_NAME, JOB_CODE, SALARY || '��',
        DECODE(JOB_CODE,'J7', SALARY *1.1,
                        'J6', SALARY *1.15,
                        'J5', SALARY *1.2,
                        SALARY *1.05) ||'��' AS "�λ�� �޿�"
FROM EMPLOYEE;

/*
    * CASE WHEN THEN
    
    CASE WHEN ���ǽ�1 THEN �����1
         WHEN ���ǽ�2 THEN �����2
         ...
         ELSE �����
    END
    
*/

SELECT EMP_NAME, SALARY || '��',
       CASE WHEN SALARY >= 5000000 THEN '��� ������'
            WHEN SALARY >= 3500000 THEN '�߱� ������'
            ELSE '�ʱ� ������'
        END AS "����"
FROM EMPLOYEE;
---------------------------------< �׷��Լ� >------------------------------------
-- 1. SUM(����Ÿ���÷�) : �ش��÷� ������ �� �հ踦 ���ؼ� ��ȯ���ִ� �Լ�

-- EMPLOYEE ���̺��� �� ����� �� �޿���
SELECT SUM(SALARY)
FROM EMPLOYEE; -- ��ü ����� �� �׷����� ����

-- ���� ������� �� �޿� ��
SELECT SUM(SALARY)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN('1','3'); -- ���� ������� �� �׷����� ����

-- �����غ���
-- �μ��ڵ尡 D5�� ������� �� ���� ��
--SELECT SUM(SALARY + SALARY * NVL(BONUS,0))*12
SELECT SUM(SALARY*12)
FROM EMPLOYEE
WHERE DEPT_CODE ='D5';

-- 2. AVG(����Ÿ��) : �ش� �÷����� ��հ��� ���ؼ� ��ȯ
-- ��ü ����� ��� �޿� ��ȸ
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

-- 3. MIN(����Ÿ��) : �ش� �÷����� �߿� ���� ���� �� ���ؼ� ��ȯ
SELECT MIN(EMP_NAME), MIN(SALARY), MIN(HIRE_DATE)
FROM EMPLOYEE;

-- 4. MAX(����Ÿ��) : �ش� �÷����� �߿� ���� ū �� ���ؼ� ��ȯ
SELECT MAX(EMP_NAME), MAX(SALARY), MAX(HIRE_DATE)
FROM EMPLOYEE;

-- 5. COUNT(* | �÷� | DISTINCT �÷�) : ��ȸ�� �� ������ ���� ��ȯ
--    COUNT(*) : ��ȸ�� ����� ��� �� ������ ���� ��ȯ
--    COUNT(�÷�) : ������ �ش� �÷����� NULL�� �ƴѰ͸� �� ���� ���� ��ȯ
--    COUNT(DISTINCT �÷�) : �ش� �÷��� �ߺ��� ������ �� �� ������ ���� ��ȯ

-- ��ü ��� ��
SELECT COUNT(*)
FROM EMPLOYEE;

-- ���� ��� ��
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('2', '4');

-- ���ʽ��� �޴� ��� ��
SELECT COUNT(BONUS) -- �÷� NULL�� �ƴѰ͸� ī���� �Ѵ�.
FROM EMPLOYEE;

-- ����
-- �μ���ġ�� ���� ��� ��
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;

SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;









