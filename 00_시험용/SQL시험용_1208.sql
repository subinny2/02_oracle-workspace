-- �����
CREATE USER SAMPLE IDENTIFIED BY 1234;
GRANT CONNECT, RESOURCE TO SAMPLE;

-- �˻�����
--DEPT_CODE�� D9�̰ų� D6�̰� SALARY�� 300���� �̻��̰� BONUS�� �ְ�
--�����̰� �̸����ּҰ� _ �տ� 3���� �ִ�
--����� EMP_NAME, EMP_NO, DEPT_CODE, SALARY�� ��ȸ
--�ۼ��� ��������
SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D9' OR DEPT_CODE='D6' AND SALARY > 3000000
AND EMAIL LIKE '____%' AND BONUS IS NULL;

-- 1. ESCAPE ���ϵ� ī�带 ������� �ʾƼ� �̸����ּ���� ���ǰ��� �߸��Ǿ���.
-- 2. OR�� AND �����ڴ� AND�����ڰ� �켱�������̱⶧���� ()�� �������� ������ ��°��� �߸��ȴ�.
-- 3. SALARY�� 300���� �̻��̱⶧���� >�� �ƴ�, >= �����ڷ� �����Ѵ�.
-- 4. BONUS�� �ְ� ��� �����̱� ������ IS NULL -> IS NOT NULL�� ����
-- 5. ������ ���ǽ��� ���⶧���� ������ ������ �ɾ�����Ѵ�.?

SELECT EMP_NAME, EMP_NO, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE='D9' OR DEPT_CODE='D6') AND SALARY >= 3000000
AND EMAIL LIKE '___*_%' ESCAPE '*' AND BONUS IS NOT NULL
AND SUBSTR(EMP_NO, 8, 1) IN ('1','3');

SELECT EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___*_%' ESCAPE '*';

SELECT EMP_NAME, EMP_NO
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1','3');

SELECT * FROM EMPLOYEE WHERE BONUS IS NULL AND MANAGER_ID IS NOT NULL;

SELECT TO_CHAR((TO_DATE('210505')), 'YYYY"��" FMMM"��" DD"��"')
FROM DUAL;

CREATE TABLE EMP(
EMAIL VARCHAR2(30) CONSTRAINT  EMP_EMAIL_NN NOT NULL
);

SELECT * FROM EMP;
DROP TABLE EMP;



















