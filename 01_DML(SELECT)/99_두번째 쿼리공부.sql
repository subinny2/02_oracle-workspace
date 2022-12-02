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



SELECT DEPT_CODE, ���� , ���, �ο���
FROM (SELECT DEPT_CODE, SUM(SALARY) AS "����", FLOOR(AVG(SALARY)) AS "���", COUNT(*) AS "�ο���"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY ��� DESC)
WHERE ��� > 2700000;




