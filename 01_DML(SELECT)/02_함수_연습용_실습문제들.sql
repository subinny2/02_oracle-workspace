-- �ѹ� �� �ǽ�

SELECT SYSDATE
FROM DUAL; -- �������̺�

SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ')
FROM DUAL;

SELECT LENGTH('oracle'), LENGTHB('oracle')
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME),
        EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL)
FROM EMPLOYEE; -- ���ึ�� ���� => ������

-- INSTR�� �߿�!
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL; => B�� ���°���ִ��� �������
SELECT INSTR('AABAACAABBAA', 'B', '1') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1) FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', '1', '2') FROM DUAL;
SELECT INSTR('AABAACAABBAA', 'B', -1, 3) FROM DUAL;

SELECT EMAIL, INSTR(EMAIL, '_', 1,1) AS "_��ġ", INSTR(EMAIL, '@') AS "@��ġ"
FROM EMPLOYEE;

SELECT SUBSTR('TODAY''S OOTD', 7) FROM DUAL; -- 7��° ���ں��� ����ϰڴ�.
SELECT SUBSTR('TODAY''S OOTD', 5, 2) FROM DUAL;
SELECT SUBSTR('TODAY''S OOTD', -6, 6) FROM DUAL;

SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8,1) AS "����"
FROM EMPLOYEE;

-- ���ڻ���鸸 ��ȸ
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8,1) AS "����"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN ('2' , '4')
ORDER BY EMP_NAME; -- ������������ ���� <�⺻���� ��������>

-- �Լ� ��ø���
SELECT EMP_NAME, EMAIL, EMP_NO, SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1) --�̸��Ͽ��� ID���� ����
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN ('2' ,'4') -- ���ڻ���鸸�� �����ϴ� ����
ORDER BY EMP_NAME; -- �̸� �������� 

-- ���ڿ��� ��ȸ�Ҷ� ���ϰ��ְ� ��ȸ�ϰ��� LPAD / RPAD
-- LPAD ���ʰ��� // RPAD ������ ����

-- ���ڻ���� ����� �̸� �ֹι�ȣ ���̵� �����ϰ�, �ֹι�ȣ�� ���������� ��Ÿ���� *�� ǥ�� (��Ī�ޱ�) , ���� �̸��� �������� �����Ͻÿ�.
SELECT EMP_ID AS "���", EMP_NAME AS "�̸�", RPAD(SUBSTR(EMP_NO,1,8) , 14 , '*') AS "�ֹι�ȣ(������ȣ)", SUBSTR(EMAIL,1, INSTR(EMAIL, '@')-1) AS "���̵�"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8,1) IN ('1','3')
ORDER BY EMP_NAME;

-- �ݿø� �Լ�
SELECT ROUND(45.789) FROM DUAL;  -- ROUND(����, �ݿø��� ��ġ) ��ġ�� �����ϸ� 0��° �ڸ� �ݿø� 0��° �ڸ��� 5
SELECT ROUND(45.789,1) FROM DUAL;
SELECT ROUND(45.789,-1) FROM DUAL;

-- �ø�ó���Լ�
SELECT CEIL(467.98) FROM DUAL; -- ��ġ�����Ұ�

-- ����ó���Լ� -- ��ġ���� ����Ұ�
SELECT FLOOR(456.265) FROM DUAL;
-- ����ó���Լ� -- ��ġ���� ��������
SELECT TRUNC(456.265, 0) FROM DUAL;
SELECT TRUNC(456.265, 2) FROM DUAL;
SELECT TRUNC(456.265, -2) FROM DUAL;
SELECT TRUNC(456.265, -1) FROM DUAL;

-- ��¥ó���Լ�
SELECT SYSDATE FROM DUAL;

-- �� ��¥ ������ ������
SELECT EMP_ID, EMP_NAME, HIRE_DATE, FLOOR(SYSDATE - HIRE_DATE)||'��' AS "�ټ��ϼ�",
CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))||'����' AS "�ټӰ���"
FROM EMPLOYEE;

SELECT FLOOR(SYSDATE - (TO_DATE('981118', 'RRMMDD')))||'��' AS "����ź����",
CEIL(MONTHS_BETWEEN(SYSDATE, '98/11/18'))||'����' AS "�������� ������"
FROM DUAL;

-- Ư����¥���� �ش� ���ڸ�ŭ ������ ���ϱ�
SELECT ADD_MONTHS(SYSDATE, 7) FROM DUAL;

-- Ư����¥���Ŀ� ����� �ش���� ��¥ ��ȯ 1.�Ͽ��� 
SELECT SYSDATE, NEXT_DAY(SYSDATE,6) FROM DUAL;

-- ������ ��¥
SELECT LAST_DAY('98/11/18')
FROM DUAL;

-- Ư�� ��¥�κ��� �⵵|��|�� �� ����
SELECT EXTRACT(YEAR FROM HIRE_DATE)
FROM EMPLOYEE;

SELECT ROUND(123.456, -2) FROM DUAL;

SELECT EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE
ORDER BY 3 DESC NULLS LAST;

-- < ����ȯ �Լ� >
SELECT TO_CHAR(1789) FROM DUAL; -- ����=>����Ÿ������ ����Ǿ� ���
SELECT TO_CHAR(1789, '99999') FROM DUAL; -- 5ĭ¥�� ���� Ȯ��, ������ ����, ��ĭ ���� '88888','77777' �� �ȵ�. '99999'������
SELECT TO_CHAR(1789, '00000') FROM DUAL; -- ��ĭ�� 0���� ä���. ���� 01789 ���
SELECT TO_CHAR(1789, 'L99999') FROM DUAL; -- ���� ������ ������ ȭ����� (L:LOCAL)
SELECT TO_CHAR(1789, '$99999') FROM DUAL; -- $ȭ�����
SELECT TO_CHAR(1789, 'L99,999') FROM DUAL; -- \1,789 

-- ��¥Ÿ�� => ����Ÿ��
SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL; -- ���ڷ� ���
SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL; -- AM,PM:����/���� HH:�� MI:�� SS:��
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL; --24�ð�����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL; -- YYYY-MM-DD 'D'���� ����� (�ݿ���)
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DY') FROM DUAL; -- YYYY-MM-DD 'D' �� ��� (��)
SELECT TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL; -- ���� �⵵�� ���ڷ� ����

SELECT 






