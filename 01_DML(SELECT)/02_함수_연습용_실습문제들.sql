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





