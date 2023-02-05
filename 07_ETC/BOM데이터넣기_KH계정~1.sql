-- TB_MEMBER
INSERT INTO TB_MEMBER VALUES(1, 'tnqls787@naver.com', 'userpwd01', '한수빈', '수바니', 'F', SYSDATE, 'U', '넷플릭스/티빙', 'Y');
INSERT INTO TB_MEMBER VALUES(2, 'young123@gmail.com', 'userpwd02', '최영재', '코딩영재', 'M', SYSDATE, 'U', '넷플릭스/티빙/왓챠/쿠팡플레이', 'Y');
INSERT INTO TB_MEMBER VALUES(3, 'susu456@nate.com', 'userpwd03', '박수현', '수햔이', 'F', SYSDATE, 'U', '넷플릭스/티빙/왓챠/웨이브/디지니플러스/쿠팡플레이/애플티비', 'N');
INSERT INTO TB_MEMBER VALUES(4, 'huiwhite789@naver.com', 'userpwd04', '최희승', '희희웃는승', 'F', SYSDATE, 'U', '넷플릭스/티빙/왓챠', 'Y');
INSERT INTO TB_MEMBER VALUES(5, 'admin4@naver.com', 'adminpwd04', '관리자4', '관리자4', 'F', SYSDATE, 'A', '넷플릭스/티빙/왓챠/웨이브/디지니플러스/쿠팡플레이/애플티비', 'N');

-- TB_CONTENT
INSERT INTO TB_CONTENT VALUES(1, '일타 스캔들', '사교육 전쟁터에서 펼쳐지는 국가대표 반찬가게 열혈사장과 대한민국 수학일타 강사의 달콤 쌉싸름한 로맨스','드라마', 2023, '한국', 15, 5, NULL, '15세이상', 'https://www.tving.com/contents/P001685600', NULL, '넷플릭스/티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001685600.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(2, '대행사', 'VC그룹 최초로 여성 임원이된 ''고아인''이 최초를 넘어 최고의 위치까지 자신의 커리어를 만들어가는 모습을 그린 우아하게 처절한 광고인들의 전투극','드라마', 2023, '한국', '15세이상', 4, NULL, 15, 'https://www.tving.com/contents/P001683307', NULL, '티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001683307.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(3, '술꾼 도시 여자들2', '하루 끝의 술 한잔이 인생의 신념인 세 여자의 일상을 그린 본격 기승전술 드라마 시즌2','드라마', 2022, '한국', '청소년관람불가', 4.1, NULL, 15, 'https://www.tving.com/contents/P001651316', NULL, '티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001651316.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(4, '사랑의 이해', '각기 다른 이해를 가진 이들이 만나 진정한 ''사랑''의 의미를 이해하게 되는 이야기를 담은 멜로드라마','드라마', 2022, '한국', '15세이상', 5, NULL, 15, 'https://www.tving.com/contents/P001677673', NULL, '넷플릭스/티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001677673.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(5, '술꾼 도시 여자들', '하루 끝의 술 한잔이 인생의 신념인 세 여자의 일상을 그린 본격 기승전술 드라마 시즌1','드라마', 2021, '한국', '15세이상', 5, NULL, 15, 'https://www.tving.com/contents/P001518829', NULL, '티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001518829.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(6, '철인왕후', '불의의 사고로 대한민국 대표 허세남 영혼이 깃들어 ''저세상텐션''을 갖게된 중전 김소용과 두 얼굴의 철종 사이에서 벌어지는 영혼가출 스캔들','드라마', 2020, '한국', '15세이상', 5, NULL, 15, 'https://www.tving.com/contents/P001392764', NULL, '넷플릭스/티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001392764.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(7, '도깨비', '불멸의 삶을 끝내기 위해 인간 신부가 필요한 도깨비, 그와 기묘한 동거를 시자한 기억상실증 저승사자. 그런 그들 앞에 ''도깨비신부''라 주장하는 ''죽었어야 할 운명''의 소녀가 나타나며 벌어지는 신비로운 낭만설화','드라마', 2016, '한국', '15세이상', 5, NULL, 15, 'https://www.tving.com/contents/P000340362', NULL, '넷플릭스/티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P000340362.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(8, '굿 와이프', '그의 스캔들, 그녀의 스토리', '드라마', 2016, '한국', '15세이상', 3.8, NULL, 15, 'https://www.tving.com/contents/P000297042', NULL, '티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P000297042.jpg/dims/resize/F_webp,480' );
INSERT INTO TB_CONTENT VALUES(9, '더 글로리', '고등학교 동급생들의 지독한 괴롭힘, 하지만 도움을 청할 곳은 그 어디에도 없다. 그렇게 절망의 늪에 빠진 문동은이 어느 날 새로운 삶의 목표를 발견한다.', '드라마', 2022, '한국', '청소년관람불가', 5, NULL, 1215167, 'https://www.netflix.com/search?q=%EB%8D%94%EA%B8%80%EB%A1%9C%EB%A6%AC&jbv=81519223', NULL, '넷플릭스', 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMjJfNDUg%2FMDAxNjcxNjY4OTgyNTU0.94xrjJ6dcxwqRG_HkQwi4qhg2XEkKQfghhGJJvebdWYg.aab5FlzF0l0yj0B2-wJl6WKpX0k6MUvJ2DYPMRpvl40g.JPEG.ddochiyam7%2FScreenshot_2022-12-22_at_09.29.21.JPG&type=sc960_832');
INSERT INTO TB_CONTENT VALUES(10, '남자친구', '한 번도 자신이 선택한 삶을 살아보지 못한 수현과 자유롭고 맑은 영혼 진혁의 우연한 만남으로 시작된 설레는 감성멜로 드라마', '드라마', 2018, '한국', '15세이상', 3.7, NULL, 56987, 'https://www.tving.com/contents/P000728939', NULL, '넷플릭스/티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P000728939.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(11, '그 겨울 바람이 분다', '여자,술,포커가 인생의 전부인 사기꾼. 시각장애를 가진 재벌가 상속녀에게 접근해 한몫 챙길 셈이다. 하지만 자기를 닮은 그녀의 모습에 미묘한 감정을 느끼고, 계획에서 멀어지기 시작한다. 자신의 목숨이 걸린 일이란것도 잊은채', '드라마', 2013, '한국', '15세이상', 3.9, DEFAULT, 4567893, 'https://www.tving.com/contents/P001497671', NULL, '넷플릭스/티빙/웨이브/쿠팡플레이', 'https://nujhrcqkiwag1408085.cdn.ntruss.com/static/upload/drama_poster_images/280x400/drama_80631_1586846561.jpg');
INSERT INTO TB_CONTENT VALUES(12, '인간실격', '결국 아무것도 되지 못한 채 길을 잃은 여자와 결국 아무것도 못 될 것 같은 자기 자신이 두려워진 남자의 이야기를 담는 드라마', '드라마', 2021, '한국', '15세이상', 3.1, NULL, 12345,'https://www.tving.com/contents/P001506481', NULL, '넷플릭스/티빙', 'https://image.tving.com/upload/cms/caip/CAIP0900/P001506481.jpg/dims/resize/F_webp,480');
INSERT INTO TB_CONTENT VALUES(13, '지금, 헤어지는 중입니다', '''이별''이라 쓰고 ''사랑''이라 읽는 달고 짜고 맵고 시고 쓴 이별 액츄얼리', '드라마', 2021, '한국', '15세이상', 2.9, NULL, 6789,'URL', NULL, '웨이브/쿠팡플레이', 'URL');
INSERT INTO TB_CONTENT VALUES(14, '태양의 후예', '낯선 땅 극한의 환경 속에서 사랑과 성공을 꿈꾸는 젊은 군인과 의사들을 통해 삶의 가치를 담아낼 블록버스터급 휴먼 멜로 드라마', '드라마', 2016, '한국', '15세이상', 4.9, NULL, 456789421,'URL', NULL, '웨이브/쿠팡플레이/왓챠', 'URL');
INSERT INTO TB_CONTENT VALUES(15, '재벌집 막내아들', '재벌 총수 일가의 오너리스크를 관리하는 비서가 재벌가의 막내아들로 회귀하여 인생 2회차를 사는 판타지 드라마', '드라마', 2022, '한국', '15세이상', 4.6, NULL, 45621322, 'URL', NULL, '넷플릭스/티빙', 'URL');
INSERT INTO TB_CONTENT VALUES(16, '기지적상반장 청춘시대', '9월 1일, 각자 다른 곳에서 온 4명의 소녀가 룸메이트가 되어 4년간의 대학 생활을 하며 겪는 그들의 우여곡절 우정 성장 스토리를 그린 드라마', '드라마', 2021, '중국', '15세이상', 4.8, NULL, 455621322, 'URL', NULL, '넷플릭스/티빙/웨이브/왓챠', 'URL');
INSERT INTO TB_CONTENT VALUES(17, '암격리적비밀 서랍 속 비밀', '아빠의 직장을 따라 선하이시로 이사온 딩셴은 아빠 친구 아들인 우등생 저우쓰웨와 짝이 된다. 저우쓰웨와 같은 대학교에 들어가고 싶었던 딩셴은 1년을 다시 공부해 저우쓰웨의 후배가 된다. 하지만 집안이 갑자기 기울어진 저우쓰웨는 딩셴의 마음을 밀어내는데...', '드라마', 2021, '중국', '15세이상', 4.3, NULL, 456241322, 'URL', NULL, '넷플릭스/티빙/웨이브/왓챠', 'URL');
INSERT INTO TB_CONTENT VALUES(18, '상견니', '사고로 연인 왕취안성을 잃은 황위쉬안. 우연히 배달된 카세트 플레이어로 인해 타임슬립을 하게 된 그녀는 18살 고등학생 천윈루가 되어 왕취안성과 똑같은 얼굴을 가진 리쯔웨이를 만나게 된다.', '드라마', 2019, '대만', '15세이상', 4.3, NULL, 4562322, 'URL', NULL, '넷플릭스/티빙/웨이브/쿠팡플레이/왓챠', 'URL');
INSERT INTO TB_CONTENT VALUES(19, '치아문단순적소미호', '여고생 천샤오시가 19년간 같은 아파트에서 살아온 친구 장천을 짝사랑하게 되면서 벌어지는 젊고 풋풋한 청춘들의 사랑 이야기', '드라마', 2017, '중국', '15세이상', 3.7, NULL, 45621322, 'URL', NULL, '넷플릭스/티빙/웨이브/왓챠', 'URL');
INSERT INTO TB_CONTENT VALUES(20, '지속 가능한 사랑입니까?', '요가 강사인 딸과 홀로 된 아버지. 두 사람이 결혼이라는 인생에 도전하며 펼쳐지는 사랑 이야기를 그린 드라마', '드라마', 2022, '일본', '15세이상', 4.6, NULL, 45621322, 'URL', NULL, '왓챠', 'URL');

-- TB_DIRECTOR
INSERT INTO TB_DIRECTOR VALUES(1, '이응복', 14, '태양의 후예'); -- 태양의 후예, 도깨비 컨텐츠 번호를 여러개 써야하는데.. ? 
INSERT INTO TB_DIRECTOR VALUES(1, '이응복', 7, '도깨비');
INSERT INTO TB_DIRECTOR VALUES(2, '백상훈', 14, '태양의 후예');
INSERT INTO TB_DIRECTOR VALUES(3, '박신우', 10, '남자친구');
INSERT INTO TB_DIRECTOR VALUES(4, '안길호', 9, '더 글로리');
INSERT INTO TB_DIRECTOR VALUES(5, '정대윤', 15, '재벌집 막내아들');

-- TB_ACTOR
INSERT INTO TB_ACTOR VALUES(1, '전도연', 1, '일타 스캔들');
INSERT INTO TB_ACTOR VALUES(1, '전도연', 8, '굿 와이프'); -- 배우 넘버는 PRIMARY KEY 중복 불가.. ?
INSERT INTO TB_ACTOR VALUES(1, '전도연', 12, '인간실격');
INSERT INTO TB_ACTOR VALUES(2, '송혜교', 9, '더 글로리');
INSERT INTO TB_ACTOR VALUES(2, '송혜교', 10, '남자친구');
INSERT INTO TB_ACTOR VALUES(2, '송혜교', 11, '그 겨울 바람이 분다');
INSERT INTO TB_ACTOR VALUES(2, '송혜교', 14, '태양의 후예');
INSERT INTO TB_ACTOR VALUES(3, '심월', 19, '치아문단순적소미호');
INSERT INTO TB_ACTOR VALUES(4, '이보영', 2, '대행사');
INSERT INTO TB_ACTOR VALUES(5, '손나은', 2, '대행사');

-- TB_REVIEW
INSERT INTO TB_REVIEW VALUES(1, 1, 1, '수바니', 4.7, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '우와 전도연은 나이가 안드나부다 정경호 코믹연기 짱', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(2, 1, 3, '수바니', 3.5, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '시즌1이 더 재밌는듯 그리고 보면 술마시고싶어짐 ㅠㅠ 술마시러 가야징', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(3, 1, 14, '수바니', 5.0, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '인생드라마 봐도봐도 재밌음 송중기 얼굴 너무 재밌다 나도 빅보스 가질게요', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(4, 1, 19, '수바니', 3.5, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '역시 중국드라마는 항마력이 딸리지만 그런 재미로 본다 가볍게 보기 좋은듯!', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(5, 1, 6, '수바니', 4.2, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '신혜선 완전 존예 ! 영혼 바뀌는 드라마 오랜만이였슴 그리고 괜히 나도 요리해서 먹고싶음ㅋㅋ', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(6, 2, 3, '코딩영재', 4.1, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '여자들도 술을 많이마시네 나도 술마시러가야징', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(7, 3, 11, '수햔이', 3.7, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '조인성 송혜교 얼굴합이 재밌음', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(8, 3, 9, '수햔이', 4.8, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '초반에 좀 보기 거북했는데 보면 볼수록 시간가는줄 모름.. 시즌2 언제나오냐..', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(9, 4, 9, '희희웃는승', 4.8, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '왜 사람들이 보는지 알거같음.. 영상미도 좋고 내용도 탄탄함 ! 시즌2 기다릴만한듯!', TITLE_HT_NO, NORMAL_HT_NO);
INSERT INTO TB_REVIEW VALUES(10, 4, 15, '희희웃는승', 4.2, 'Y', 'N', DEFAULT, DEFAULT, DEFAULT, '송중기 어렸을때 모습은 CG티가 많이 나지만 내용이 그걸 커버하는듯 재밌고 일단 진양철회장님이 연기를 너무잘함! 다른 배우들도 마찬가지 한번 봐보세요 추천추천', TITLE_HT_NO, NORMAL_HT_NO);

-- TB_NOTICE -- 근데 관리자가 해쉬태그를 쓰나..?
INSERT INTO TB_NOTICE VALUES(1, 5, TITLE_HT_NO, NORMAL_HT_NO, DEFAULT, 12345, COM_COUNT, ATTACH_FILE);

-- TB_NOTICE_COMMENT
INSERT INTO TB_NOTICE_COMMENT VALUES(1, 1, 1,'수바니','아 그렇구나 이게 바뀌었구나..');

-- TB_COMM
INSERT INTO TB_COMM VALUES(1, 1, 'tnqls787@naver.com', '수바니', DEFAULT, 1, 1, 1, 'N', TITLE_HT_NO, NORMAL_HT_NO);