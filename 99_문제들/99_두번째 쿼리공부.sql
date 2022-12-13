-- ���� ����
------------------------------------ QUIZ 1 ------------------------------------
-- ROWNUM�� Ȱ���ؼ� �޿��� ���� ���� 5���� ��ȸ�ϰ�;�����, ����� ��ȸ�� �ȵ���!!!
-- �̶� �ۼ��� SQL���� �Ʒ��� ����.
SELECT ROWNUM, EMP_NAME, SALARY --3
FROM EMPLOYEE --1
WHERE ROWNUM <= 5 --2
ORDER BY SALARY DESC; --4

-- � �������� �ִ��� , �ذ�� SQL�� �ۼ�!!!
-- ������ : ������ �Ǳ⵵ ���� ROWNUM�� �ο���. �����Ͱ� �̻��ϰ� �����
-- �ذ���
SELECT ROWNUM, EMP_NAME, SALARY
FROM (SELECT *
        FROM EMPLOYEE
        ORDER BY SALARY DESC)
WHERE ROWNUM <= 5;

------------------------------------ QUIZ 2 ------------------------------------
-- �μ��� ��ձ޿��� 270������ �ʰ��ϴ� �μ��鿡 ���� (�μ��ڵ�, �μ��� �ѱ޿���, �μ��� ��ձ޿�, �μ��� �����)
-- �̶� �ۼ��� SQL���� �Ʒ��� ����
SELECT DEPT_CODE, SUM(SALARY) ����, FLOOR(AVG(SALARY)) ���, COUNT(*) �ο���
FROM EMPLOYEE
WHERE SALARY > 2700000
GROUP BY DEPT_CODE
ORDER BY 1;

-- � �������� �ִ���, �ذ�� SQL�� �ۼ�!!!
-- GROUP BY �� ������ �ٶ� WHERE���� �ƴ� HAVING ���� �ش�.
SELECT DEPT_CODE, SUM(SALARY) ����, FLOOR(AVG(SALARY)) ���, COUNT(*) �ο���
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) > 2700000
ORDER BY 1;

--------------------------------------------------------------------------------

SELECT DEPT_CODE, ���� , ���, �ο���
FROM (SELECT DEPT_CODE, SUM(SALARY) AS "����", FLOOR(AVG(SALARY)) AS "���", COUNT(*) AS "�ο���"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY ��� DESC)
WHERE ��� > 2700000;
--------------------------------------------------------------------------------
-- ������ ���
-- JOIN ���� (��������, �ܺ�����, ��� ...) �� Ư¡, ����
-- �Լ� ���� (TRIM, ...) �� ������ ����

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

-- '21/09/28' �� ���� ���ڿ��� ������ '2021-09-28'�� ǥ���غ���
-- TO_DATE('���ڿ�', [����]) : DATE
-- TO_CHAR(��¥, [����]) : CHARACTER
SELECT TO_CHAR(TO_DATE('21/09/08'), 'YYYY-MM-DD')
FROM DUAL;

SELECT TO_DATE('21/09/08')
FROM DUAL;

-- '210908'�� ���� ���ڿ��� ������ 2021�� 9�� 8�� ǥ��
-- ��¥ǥ���� 0�� ���������� FM��� -> �ѹ��� ����ص� �ڿ���¥�� �ִ� 0�� ��������.
SELECT TO_CHAR(TO_DATE('21/09/08'), 'YYYY"�� "FMMM"�� "DD"��"') AS "��¥"
FROM DUAL;
-- FM!!


