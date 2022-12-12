-- ��������
/*
    < ������ SEQUENCE >
    �ڵ����� ��ȣ �߻������ִ� ������ �ϴ� ��ü
    �������� ���������� �������� ������Ű�鼭 �������� (�⺻�����δ� 1�� ����)
    
    EX) ȸ����ȣ, �����ȣ, �Խñ۹�ȣ �� ���� ���ļ��� �ȵǴ� �����͵� ....
*/

/*
    1. ������ ��ü ����
    
    [ǥ����]
    CREATE SEQUENCE ��������
    
    [��ǥ����]
    CREATE SEQUENCE ��������
    [START WITH ���ۼ���]            -- ó�� �߻���ų ���۰� ����(�⺻�� 1)
    [INCREMENT BY ����]             -- �� �� �����ų���� (�⺻�� 1)
    [MAXVALUE ����]                 -- �ִ밪 ���� (�⺻�� 999999999999999999999999999) -> ��û���� ŭ
    [MINVALUE ����]                 -- �ּڰ� ���� (�⺻�� 1) => �ִ밪 ��� ó������ �ٽ� ���ƿͼ� �����ϰ� �� �� ����.
    [CYCLE|NOCYCLE]                 -- �� ��ȯ ���� ���� (�⺻�� NOCYCLE)
    [NOCACHE|CACHE ����Ʈũ��]       -- ĳ�ø޸� �Ҵ� (�⺻�� CACHE 20)
    
    * ĳ�ø޸� : �ӽð���
                 �̸� �߻��� ������ �����ؼ� �����صδ� ����
                 �Ź� ȣ��� ������ ������ ��ȣ�� �����ϴ°� �ƴ϶�
                 ĳ�� �޸� ������ �̸� ������ ������ ������ �� �� ���� (�ӵ��� ������)
                 ������ �����Ǹ� => ĳ�ø޸𸮿� �̸� ����� �� ��ȣ���� �� ����
                 ��ȣ�� �����ϰ� �ο� �ȵ� �� ������ Ȯ���� �� �ؾ���!
    
    ���̺�� : TB_
    ���     : VW_
    ��������  : SEQ_
    Ʈ����    : TRG_
*/

CREATE SEQUENCE SEQ_TEST;

-- [����] ���� ������ �����ϰ� �ִ� ���������� ������ ������ �� ��
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE SEQ_EMP_NO
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

/*
    2. ���������
    ��������.CURRVAL : ���� �������� �� (���������� ���������� ����� NEXTVAL�� ��)
    ��������.NEXTVAL : ���������� �������� �������Ѽ� �߻��� ��
                      ���� ������ ������ INCREMENT BY �� ��ŭ ������ ��
                      ==  ��������. CURRAVAL + INCREMENT BY ��
*/

SELECT SEQ_EMP_NO.CURRVAL FROM DUAL;
-- ORA-08002: sequence SEQ_EMP_NO.CURRVAL is not yet defined in this session
-- *Action:   select NEXTVAL from the sequence before selecting CURRVAL

-- NEXTVAL�� �� �ѹ��� �������� �ʴ� �̻� CURRVAL �� �� ����!!
-- ��? ���������� ���������� ����� NEXTVAL ���̱� ������!!

-- SELECT ������ ġ��������~~����!
SELECT SEQ_EMP_NO.NEXTVAL FROM DUAL; --300
SELECT SEQ_EMP_NO.CURRVAL FROM DUAL; --300 -- ���������� ������ NEXTVAL�� ��

SELECT SEQ_EMP_NO.NEXTVAL FROM DUAL; --305
SELECT SEQ_EMP_NO.NEXTVAL FROM DUAL; --310
SELECT SEQ_EMP_NO.CURRVAL FROM DUAL; --310

SELECT * FROM USER_SEQUENCES;

SELECT SEQ_EMP_NO.NEXTVAL FROM DUAL; -- ������ MAXVALUE�� �ʰ��߱� ������ ���� �߻�! (����)
-- ORA-08004: sequence SEQ_EMP_NO.NEXTVAL exceeds MAXVALUE and cannot be instantiated

SELECT SEQ_EMP_NO.CURRVAL FROM DUAL; -- 310

/*
    3. ������ ���� ����
    ALTER SEQUENCE ��������
    [INCREMENT BY ����]             -- �� �� �����ų���� (�⺻�� 1)
    [MAXVALUE ����]                 -- �ִ밪 ���� (�⺻�� 999999999999999999999999999) -> ��û���� ŭ
    [MINVALUE ����]                 -- �ּڰ� ���� (�⺻�� 1) => �ִ밪 ��� ó������ �ٽ� ���ƿͼ� �����ϰ� �� �� ����.
    [CYCLE|NOCYCLE]                 -- �� ��ȯ ���� ���� (�⺻�� NOCYCLE)
    [NOCACHE|CACHE ����Ʈũ��]       -- ĳ�ø޸� �Ҵ� (�⺻�� CACHE 20)
*/

ALTER SEQUENCE SEQ_EMP_NO
INCREMENT BY 10
MAXVALUE 400;

SELECT SEQ_EMP_NO.NEXTVAL FROM DUAL; -- 310 +10 => 320

-- 4. ������ ����
DROP SEQUENCE SEQ_EMP_NO;

--------------------------------------------------------------------------------------
-- �����ȣ�� Ȱ���� ������ ����
CREATE SEQUENCE SEQ_EID
START WITH 400
NOCACHE;

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES (SEQ_EID.NEXTVAL, 'ȫ�浿', '111111-1111111', 'J7', 'S1', SYSDATE);

SELECT * FROM EMPLOYEE;

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES (SEQ_EID.NEXTVAL, ?, ?, ?, ?, SYSDATE);

