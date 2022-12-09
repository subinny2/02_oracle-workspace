-- 먼저저장
-- 3. 도서명이 25자 이상인 책 번호와 도서명을 화면에 출력하는 SQL 문을 작성하시오.
SELECT BOOK_NM, BOOK_NO
FROM TB_BOOK
WHERE LENGTH (BOOK_NM) >= 25;

-- 4. 휴대폰 번호가 ‘019’로 시작하는 김씨 성을 가진 작가를 이름순으로 정렬했을 때 가장 먼저 표시되는 작가
--    이름과 사무실 전화번호, 집 전화번호, 휴대폰 전화번호를 표시하는 SQL 구문을 작성하시오.
SELECT WRITER_NM, OFFICE_TELNO, HOME_TELNO, MOBILE_NO
FROM TB_WRITER
WHERE MOBILE_NO LIKE '019%'
AND WRITER_NM LIKE '김%'
ORDER BY 1;

-- 5. 저작 형태가 “옮김”에 해당하는 작가들이 총 몇 명인지 계산하는 SQL 구문을 작성하시오. (결과 헤더는
--    “작가(명)”으로 표시되도록 할 것)
SELECT COUNT(*) AS "작가(명)"
FROM TB_WRITER
JOIN TB_BOOK_AUTHOR USING (WRITER_NO)
WHERE COMPOSE_TYPE = '옮김';

-- 6. 300권 이상 등록된 도서의 저작 형태 및 등록된 도서 수량을 표시하는 SQL 구문을 작성하시오.(저작
--    형태가 등록되지 않은 경우는 제외할 것)
SELECT * 
FROM TB_BOOK_AUTHOR
JOIN TB_BOOK USING (BOOK_NO)
WHERE COMPOSE_TYPE IS NOT NULL;

-- 7. 가장 최근에 발간된 최신작 이름과 발행일자, 출판사 이름을 표시하는 SQL 구문을 작성하시오.
SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM
FROM (SELECT BOOK_NM, ISSUE_DATE, PUBLISHER_NM , ROWNUM
      FROM TB_BOOK
      ORDER BY 2 DESC)
WHERE ROWNUM = 1;

-- 8. 가장 많은 책을 쓴 작가 3명의 이름과 수량을 표시하되, 많이 쓴 순서대로 표시하는 SQL 구문을 작성하시오.
--   단, 동명이인(同名異人) 작가는 없다고 가정한다. (결과 헤더는 “작가 이름”, “권 수”로 표시되도록 
SELECT 



SELECT * FROM TB_BOOK;
SELECT * FROM TB_WRITER;
SELECT * FROM TB_PUBLISHER;
SELECT * FROM TB_BOOK_AUTHOR;
