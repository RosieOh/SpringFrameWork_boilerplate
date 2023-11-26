CREATE DATABASE haebeop_1;

USE haebeop_1;

CREATE TABLE test(num INT AUTO_INCREMENT PRIMARY KEY,
                  title VARCHAR(100) NOT NULL);

INSERT INTO test VALUES (DEFAULT, '테스트제목1');
INSERT INTO test VALUES (DEFAULT, '테스트제목2');
INSERT INTO test VALUES (DEFAULT, '테스트제목3');
INSERT INTO test VALUES (DEFAULT, '테스트제목4');
INSERT INTO test VALUES (DEFAULT, '테스트제목5');

SELECT * from test;

COMMIT;

SELECT * FROM emp;
haebeop
DESC test;

DESC emp;

CREATE TABLE member(
                       id VARCHAR(20) PRIMARY KEY,
                       pw VARCHAR(350) NOT NULL,
                       name VARCHAR(50) NOT NULL,
                       email VARCHAR(150),
                       tel VARCHAR(20),
                       addr1 VARCHAR(200),
                       addr2 VARCHAR(200),
                       postcode VARCHAR(20),
                       regdate DATETIME DEFAULT CURRENT_TIME,
                       birth DATE DEFAULT CURRENT_DATE,
                       pt INT DEFAULT 0,
                       visited INT DEFAULT 0
);

DESC MEMBER;

INSERT INTO member VALUES ('admin', '1234', '관리자',
                           'admin@teaspoon.co.kr', '02-1234-1234',
                           '서울특별시 금천구 디지털로9길 23 (마리오2 패션타워)',
                           '11층 1108호', '08511', DEFAULT, '2023-12-25',
                           DEFAULT, DEFAULT);


INSERT INTO member VALUES ('sirious920', '1234', '오태훈',
                           'sirious920@teaspoon.co.kr', '010-7329-7484',
                           '서울특별시 금천구 가산로9길 54',
                           '천재교과서', '08513', DEFAULT, '1998-09-20',
                           DEFAULT, DEFAULT);

COMMIT;

UPDATE member SET pw='$2a$10$TMTp1e7vW8nx7l7B49a2d.0robqb2qUFTuBPntKHRvVILg0CmBkqW' WHERE id='admin';

UPDATE member SET pw='$2a$10$mpr36CRQpp903gPf.f76auK1CYzFkq.LD65JsGzdrBCiOluBotWYW' WHERE id='sirious920';

SELECT * FROM member;

-- 자유게시판
CREATE TABLE free(
                     fno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
                     title VARCHAR(100) NOT null,   -- 글제목
                     content VARCHAR(1500) not null,    -- 글내용
                     regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                     visited INT,    -- 조회수
                     id VARCHAR(20),    -- 작성자
                     rec INT -- 추천수
);

CREATE TABLE free_comment(
                             cno INT PRIMARY KEY AUTO_INCREMENT,
                             fno INT,
                             author VARCHAR(16) NOT NULL,
                             resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             content VARCHAR(200),
                             FOREIGN KEY(fno) REFERENCES free(fno) ON DELETE CASCADE
);

CREATE VIEW freecommentlist AS (SELECT a.cno AS cno, a.fno as fno, a.content AS content, a.author AS author, a.resdate AS resdate,
                                       b.name AS name FROM free_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);

CREATE TABLE record (
                        rno INT AUTO_INCREMENT PRIMARY KEY,
                        fno INT REFERENCES free(fno) ON DELETE CASCADE,
                        id VARCHAR(20),
                        flag INT DEFAULT 0
);

CREATE TABLE fileinfo(
                         NO INT AUTO_INCREMENT PRIMARY KEY,  -- 번호
                         articleno varchar(45) DEFAULT NULL,	-- 글번호
                         saveFolder varchar(45) DEFAULT NULL,	-- 저장 디렉토리
                         originFile varchar(45) DEFAULT NULL,	--
                         saveFile varchar(45) DEFAULT NULL
);

CREATE TABLE fileobj (
                         no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         postno INT NOT NULL,
                         savefolder VARCHAR(400),
                         originfile VARCHAR(400),
                         savefile VARCHAR(800),
                         filesize LONG,
                         uploaddate VARCHAR(100)
);
CREATE TABLE fileboard (
                           postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
                           title VARCHAR(100) not null,   -- 글제목
                           content VARCHAR(1500) not null,    -- 글내용
                           regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                           visited INT DEFAULT 0   -- 조회수
);
DESC fileobj;
DESC fileboard;
SELECT * FROM fileobj;
SELECT * FROM fileboard;

CREATE TABLE board (
                       bno INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(100) NOT NULL,
                       content VARCHAR(1000) NOT NULL,
                       nickname VARCHAR(20),
                       regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
                       visited INT DEFAULT 0
);


-- 공지사항

DROP TABLE notice;

CREATE table notice(
                       no INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content VARCHAR(2000) NOT NULL,
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0
);

DESC notice

INSERT INTO notice VALUES(
DEFAULT,
'[애니키즈] 다시보기 서비스 중지 프로그램 안내',
'"애니키즈" VOD 다시보기 프로그램 중 서비스 계약 만료에 따라<br>
10월 17일(화)부터 서비스 이용이 불가능한 프로그램을 알려드립니다.<br>
<br>
* 서비스 중단일 : 10월17일(화)<br>
<br>
① 모험왕 블링키<br>
② 안녕 자두야 1<br>
③ 극장판 안녕 자두야<br>
④ 콩순이 쑥쑥 인기동요(한/영)<br>
⑤ 콩순이 쑥쑥 베스트송(한/영)<br>
⑥ 콩순이 쑥쑥 여행동요(한/영)<br>
⑦ 콩순이 쑥쑥 창의력동요(한/영)<br>
⑧ 콩순이 쑥쑥 놀이동요(한/영)<br>
⑨ 콩순이 쑥쑥 요리동요(한/영)<br>
⑩ 콩순이 쑥쑥 자존감동요(한/영)<br>
⑪ 콩순이 쑥쑥 교통수단동요(한/영)<br>
⑫ 콩순이 쑥쑥 상상력동요(한/영)<br>
⑬ 콩순이 쑥쑥 탐험동요(한/영)<br>
<br>
애니키즈 프로그램에 많은 관심 부탁드리며<br>
앞으로 더 좋은 서비스로 보답하겠습니다.<br>
<br>
감사합니다.',
DEFAULT,
DEFAULT
);

INSERT INTO notice VALUES(
                             DEFAULT,
                             'macOS 14.0 업데이트에 따른 학습용 플레이어 서비스 이용제한 안내',
                             'macOS 14.0 업데이트 버전이 2023년 9월 27일 신규 패치됨에 따라,<br>
                              안정적인 강좌 스트리밍 서비스를 위해 자동/수동 업데이트를 추석 연휴 이후 진행을 부탁드립니다.<br>
                             <br>
                             macOS 14.0 이하 기존 사용자는 현재 서비스 그대로 학습용 플레이어를 통해 강좌 학습을 이용하시면 되며,<br>
                             OS 업데이트 하신 분들은 강좌 학습 이용에 제한이 있을 수 있습니다.<br>
                             <br>
                             OS버전 업데이트를 하신 사용자분은 불편하시겠지만<br>
                              플레이어 업데이트(2023.10.05. 예정) 전까지는 모바일에서 이용을 부탁드립니다. ',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '[안내] 9/17 카카오페이 서비스 점검 안내',
                             '1. 작업내용 : 카카오페이 네트워크 대역폭 개선 및 방화벽 교체를 위한 서비스 점검<br>
                             2. 작업시간 : 2023년 9월 17일 (일) 01:00~07:00<br>
                             3. 결제수단 : 카카오페이(카드), 카카오페이(머니)<br>
                             4. 작업영향 : 카카오페이의 모든 관련 서비스 중단 <br>
                             <br>
                             ※ 점검 시간 동안 카카오페이 결제수단을 통한 결제는 불가합니다.<br>
                             감사합니다.',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '[공인중개사, 공무원, 자격증, 컴활] 알쓸E잡 퀴즈 이벤트 당첨 안내',
                             '신년맞이 알쓸E잡 퀴즈 이벤트에 참여해 주셔서 감사합니다.<br>
                             <br>
                             ◎ 개인정보(연락처) 입력 기간 : 2023년 1월 20일(금) ~ 2023년 1월 26일(목)<br>
                             ◎ 경품 발송 예정일 : 2023년 2월 2일(목)부터<br>
                             ※ 개인정보 이용에 동의하지 않은 참여자는 당첨자 선정에서 제외됩니다.<br>
                             ※ 경품 발송 후 잘못된 개인정보로 인한 미배송이나 오배송은 재발송이 불가능합니다.<br>
                              <br>
                             경품 발송 및 안내사항<br>
                             - 이벤트 경품 수령을 위해 당첨자가 직접 개인정보(주소 및 연락처)를 입력해주셔야 합니다.<br>
                             - 정해진 기간 내에 개인정보를 입력하셔야 경품 수령이 가능합니다.<br>
                             - 해당절차는 [정보통신망 이용촉진 및 정보보호 등에 관한 법률],<br>
                              [개인정보 보호법] 등의 규정에 따라 무분별한 개인정보 수집을 지양하고<br>
                               당첨자에 한하여 최소한의 개인정보를 취득하기 위한 조치입니다.<br>
                             - 5만원 초과 상품에 대한 제세공과금(22%)은 당첨자 본인 부담입니다.',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '영유아 언어 및 사회성 발달 증진 프로젝트 참여자 모집 (20~36개월)',
                             '- 모집 안내 - <br>
                             <br>
                             ■ 모집기간 : ~2023년 2월 19일 정오 (낮 12시 마감, 마감시간 꼭 지켜주세요)<br>
                             ■ 참여대상 : 20개월 ~ 36개월<br>
                             - 또래보다 유난히 낯을 많이 가리고 눈맞춤을 잘 하지 않는 아이<br>
                             - 또래보다 말이 늦고 말을 걸어도 대답을 잘하지 않는 아이<br>
                             - 또래보다 칭얼댐이 잦고, 말로 표현하기 보다는 신체적으로 표현하려고 하는 아이<br>
                             - 한 자리에서 오랫동안 가만히 앉아 있거나 주변 사물 등에 대한 반응이 많지 않은 아이<br>
                             - 정서적으로 불안을 호소하는 아이<br>
                              *관련 기관에서 언어발달 지연, 자폐 등 진단을 받은 경우, 36개월~48개월 미만 지원 가능<br>
                             <br>
                             ■ 모집방법 : 1차 서류, 2차 놀이상황 셀프카메라 (*2차 셀프 카메라 참여 방법은 추후 별도 안내)<br>
                             ■ 참여내용 : 전문가의 진단 및 약 3개월 간의 솔루션<br>
                             <br>
                             *보호자는 참여기간 동안 이루어지는 솔루션에 적극적으로 참여하셔야 합니다.<br>
                             *참여기간 동안 이루어지는 모든 활동은 방송을 위한 촬영을 전제로 진행합니다.<br>
                             *검사 및 진단, 솔루션은 연세대학교 소아청소년정신과 신의진 교수 연구팀과 함께합니다.<br>
                             *개인정보는 참여자 선정을 위해서만 사용하며, 최종 선정 완료 후 삭제, 폐기합니다',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '제20회 대한민국 교육박람회 개최 안내',
                             '공교육 분야 최고의 정부 인증 전시회!<br>
                             20주년을 맞이한 대한민국 교육박람회가<br>
                             2023년 1월 12일(목)부터 14일(토)까지 서울 코엑스 1층 전관에서 진행됩니다!<br>
                             미래 교육 트렌드가 궁금하시다면 사전등록 GOGO!!<br>
                             <br>
                             - 행사 일정 : 2023년 1월 12일(목) ~ 14일(토), 3일간<br>
                             - 장소 : 서울 코엑스<br>
                             - 참여방법 : 온라인 사전등록 5,000원, 현장등록 10,000원<br>
                             - 사전 예매 : 대한민국 교육박람회 홈페이지 사전등록<br>
                             - 사전등록 기간 : ~2023년 1월 11일 18:00까지<br>
                             - 사전등록 링크 : http://www.educationkorea.kr/visit/01.php<br>
                             <br>
                             * 자세한 내용은 대한민국 교육박람회 홈페이지를 참고해주세요.<br>
                             http://www.educationkorea.kr',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '김상균 교수에게 물어보살!',
                             '재밌지만 그만큼 조절하기 어려운 게임!<br>

                             ‘메타버스’ 및 ‘게이미피케이션’ 관련 국내최고의 전문가.<br>

                             김상균 교수님이 여러분의 고민을 해결해드립니다.<br>
                             <br>
                             촬영일시 : 12월 4일 일요일 넷마루 스튜디오[서울특별시 구로구]<br>

                             참여신청 : mina201103@naver.com(2022년 11월 31일까지)<br>
                             <br>
                             [성함/연락처/사연]을 적어보내주세요.<br>

                             촬영에 동의하시는 분들만 신청 부탁드립니다.<br>
                             *참석하시는 분들에게 교통비가 지급됩니다.',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '개인정보 이용내역을 안내 해 드립니다.',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '[초등] 1~2학년 2학기 온라인 개학 및 3~6학년 수업 지원 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '2024 초·중·고교 교재 신규 집필진 공모',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '오디오지식 SNS공유 이벤트 당첨 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '2024 수강생 만족도 조사 ',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '사이트 접속 지연 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '평생교육바우처 수강 지원 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

SELECT * FROM notice;

-- 후기

DROP TABLE review

CREATE table review(
                       no INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content VARCHAR(2000) NOT NULL,
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0,
                       id VARCHAR(50)
);

INSERT INTO review VALUES(
                             DEFAULT,
                             'OO 대학교 합격 수기 (수학 3등급->수능 96점,전교1등)',
                             '1. 매 수업마다 테스트 진행<br>
                             수업 시작 전 테스트를 진행했고 친구들과 점수와 틀린문제를 공유하며 어디서 부족한 지 점검할 수 있었습니다. <br>
                             처음에는 낮은 점수를 받을때마다 부끄러웠지만 다음엔 절대 그러지 않겠다는 다짐을 하고<br>
                             열심히 공부할 수 있었기에 성장할 수 있었습니다.<br><br>
                             2. 좋은 수업 분위기와 좋은 친구들<br>
                             공부를 열심히하고 잘하는 친구들이 많아서 제가 조금이라도 공부를 대충한 날이 있으면 바로 티가 났습니다. <br>
                             그래서 큰 슬럼프없이 공부를 집중할 수 있었습니다. <br>
                             서광선생님의 수업을 듣는 학생들은 1등급인 학생이 1등급이 아닌 학생보다 더 많았습니다.<br>
                             덕분에 공부자극을 받으며 더 열정적으로 할 수 있었습니다. <br>
                             열심히 공부하면 김수현선생님이 선물도 주셔서 공부가 괴롭지 않았습니다!<br><br>
                             3. 영재학습실과 개별질문시간<br>
                             수업을 듣고 난 뒤 영재학습실에서 오답과 숙제를 90분정도 했습니다. <br>
                             모르는 문제를 조교선생님께 질문하면 친절하게 설명해주셨고 이해가 잘 됐습니다. <br>
                             학원에 다니기 전에는 앉아있는 시간이 길지 않아 공부하는 시간도 적었습니다. <br>
                             스마트해법에 다니면서 앉아있는 시간이 늘었고 자연스레 공부하는 시간도 늘었습니다. <br>
                             덕분에 고3내내 10시간 공부를 할 수 있었고 큰 성장을 이룰 수 있었습니다.<br><br>
                             열심히 하고자하는 학생, 수학을 잘하고 싶은 학생은 스마트해법을 강추합니다.',
                             DEFAULT,
                             DEFAULT,
                             'leeeunyoung'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '학원이 고민될땐? (스마트해법 추천!)',
                             '저는 고등학생에게 적극 추천하는데 고1,2 학생들은 비법서, <br>
                             여러 개념문제를 통해 수학의 틀이 되는 기본 개념들을 견고하게 쌓을 수 있습니다. <br>
                             고3은 이미 늦었다고 생각하실텐데 기간대비 최대효율을 내는 것이 길벗의 특징입니다. <br>
                             수능 영어 80점과 89점이 같은 2등급이죠? 그렇기 때문에 높은 점수를 위한 것도 있지만 <br>
                             오로지 높은 점수를 바라보는 것이 아닌 학생 개개인의 역량을 확인하고 자신에게 맞는 전략을 짜줍니다. <br>
                             그렇기에 짧은 시간동안 최대한의 효율을 뽑아내는 것이죠.<br>
                              길가다가 이런 문구 한번쯤을 봤을 겁니다. <br>선생님도 시험보는 학원 저희 선생님들은 다 검증이 되어있습니다. <br>
                              그 또한 길벗의 특색이라고 할 수 있죠.<br>
                              물론 한번에 만족하기는 쉽지 않을겁니다.<br> 하지만 길벗는 다양한 선생님들이 있기 때문에 반을 바꾸며 선생님마다 다른 색을 느껴보고<br>
                               나에게 맞는 선생님을 찾는 것도 가능합니다. <br>참고로 저는 고3에 선생님이 바꼈었는데 그 선생님의 스타일이 저랑 잘 맞아서 영어가 쉬워졌습니다.
                              <br>못하는 학생들도 발전가능성을 믿고 사랑으로 지도하기 때문에 <br>선행이 많이 되어있고 잘하는 학생만 선호하는 타학원과 다르다고 생각합니다. <br>
                              내신과 수능 다 챙길 수 있는, 3,4등급이 1,2등급으로 바뀌는 기적을 경험할 수 있는 학원. <br>이제 더는 고민하지말고 목동수학학원 스마트해법으로 오세요!',
                             DEFAULT,
                             DEFAULT,
                             'leesoyoon'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             ' 의지만 갖고 오세요!',
                             '전 수학 이소윤 선생님께 배우고 있습니다.<br><br>
                             이소윤 선생님께는 중3 때부터 시작해서 벌써 3년째 진득히 배우고 있는데요. <br>
                             선생님의 관리 능력이 제 성적향상에 가장 큰 보탬이 된 것 같습니다. <br>
                             전 2학년 때 수학 성적 미적1, 미적2, 확통 모두 100점을 받았습니다. <br>
                             저 혼자 독학을 했다면 이런 성과는 얻어낼 수 없었을 것입니다.<br>
                             혹시 ‘원래 잘하던 사람이니까’ 라고 오해하실까봐 말씀드리자면, <br>
                             이소윤 선생님께서는 수많은 기적에 가까운 성적향상을 이루어내셨습니다.<br>
                             예를 들어 진명여고 1학년 친구가 9등급에서 2등급으로 올랐고, <br>
                             명덕여고 전교 최하위권이 모고 2등급, 그것도 4점 모자란 2등급을 받아냈습니다. <br>
                             그 외에도 부현준 친구 등 정말 수많은 친구들이 말도 안되는 성적 향상을 이루어냈습니다. <br>
                             이런 결과로 미루어보아, 김수현 선생님과 함께라면 전교 꼴등도 의지만 있다면 3등급까지는 <br>
                             확실히 올려줄 수 있는 능력을 갖고 계시다고 저는 확신합니다.<br>

                             아울러 다른 선생님들도 공부할 의지가 있는 학생이라면 <br>성적향상에 확실한 노하우를 가지고 계십니다.<br>
                             수많은 훌룡한 강사진과 문제풀이실, 그것이 전 길벗 수학관의 최대 강점이라고 생각합니다. <br>
                             또한 저 같은 전교 10등도 전교 1등으로 만들어주는 학원은 많지 않을 것이라고 확신합니다. <br>
                             해법의 여러 시스템이 이런 결과를 만든 것 같습니다. <br>
                             제가 진심으로 좋다고 느꼈기 때문에 친한 친구 2~3명을 학원에 추천하였고, <br>
                             그 친구의 말로는 자기가 지금까지 공부해온 양보다 몇 주 사이에 공부를 더 한 것 같다고 했습니다. <br>
                             전 그 친구 또한 금방 성적이 오를 것이라고 확신합니다. 이제껏 제가 느낀 솔직한 체험수기였습니다.<br><br>

                             의지만 갖고 오세요! 해법이 모든 것을 만들어 줄 것입니다!',
                             DEFAULT,
                             DEFAULT,
                             'seo'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '스마트해법을 다니고 연세대에 오기까지의 여정',
                             '제가 해법을 추천하는 가장 큰 이유는 체계적인 커리큘럼과 학생들의 학습을 위한 방안이 풍부하다는 것입니다.<br>
                             고등학생이 되면 내신 공부 기간, 수능 공부 기간이 별개로 이루어지게 됩니다. <br>

                             내신 공부 때에는 내신 성적 올리기 혹은 유지하기에 포커스를 맞추어 선생님께서 저희를 가르쳐 주십니다. <br>
                             선생님께서 내신에 자주 나오는 유형, 심화 문제, 문제 풀 때 팁, 서술형 문제 대비법 등을 알려주셔서 <br>
                             더욱 세밀하게 공부 할 수 있었고 그 결과 수학 내신 1등급을 얻을 수 있었습니다! <br>
                             또한 한선 선생님께서 최선을 다해서 가르쳐 주셨기에 저 또한 최선을 다해서 배우도록 노력했습니다.<br>
                             수능 공부 때에는 모의고사를 푸는 방식으로 공부를 했습니다. <br>
                             해법에서는 수업을 듣기 전이나 후에 수학 영재실을 가서 자습하는 형태로 이루어지는데, <br>이 때 모의고사를 풀었습니다.<br>
                             모의고사를 풀고 나서는 선생님께서 킬러 문제들을 설명해주셨는데 <br>
                             문제의 핵심과 접근법 등을 이해하기 쉽게 설명해 주셔서 좋았습니다!<br>
                             이 시기에 사설 모의고사, 혹은 교육청 기출, 평가원 기출을 풀면 풀 수록 <br>
                             제 수학 실력이 올라가는 게 느껴졌고 이러한 것이 제 수학 내신 풀 때에도 도움이 됐다고 생각합니다.',
                             DEFAULT,
                             DEFAULT,
                             'han'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '수학 이은영 선생님을 추천해요!',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'leesoyoon'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '스마트해법을 다니고 △△대학교 합격수기',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'leeeunyoung'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '국 영 수 탐 전교1등! 전과목 1등급!',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'seo'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '여행의 끝을 기념하며',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'han'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '성적아 이제 오를 곳이 없다!!',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'oh'
                         );

SELECT * FROM review;

-- 강의

DROP TABLE video;

CREATE table video(
                      no INT AUTO_INCREMENT PRIMARY KEY,
                      title VARCHAR(200) NOT NULL, -- 강의 제목
                      img VARCHAR(2000) NOT NULL, -- List에 올라갈 이미지
                      content VARCHAR(2000) NOT NULL, -- 강의 내용
                      videofile VARCHAR(5000) NOT NULL, -- 영상 경로
                      teacher VARCHAR(50), -- 강의 선생님
                      resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      visit int DEFAULT 0
);

INSERT INTO video VALUES(
                            DEFAULT,
                            '[파이널 체크포인트]  이소윤의 문학+독서',
                            'soyoon.png',
                            '수능연계 핵심만 뽑아서 주머니 속으로,<br> 포켓 수능연계
                            <br><br>
                            ■ 강의 특징<br><br>
                            단 7강으로 수능특강, 수능완성 알맹이만!<br>
                            ⇨ 공통 영역(독서, 문학)의 핵심 요소를 정확하게 뽑아서<br>
                            군더더기 없이 속도감 있는 전개에 학습 탄력을 더한다.',
                            'video1.mp4',
                            '이소윤 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능특강]  이은영의 확률과 통계',
                            'eunyoung.png',
                            '중학교 개념부터 정리가 필요한<br> 기초 부족 수강생들 모여라!
                            <br><br>
                            ■ 강의 특징<br><br>
                            핵심을 확실하게 알려주는 강좌<br>
                            기본에 충실한 강좌<br>
                            쉽게 설명하는 강좌',
                            'video2.mp4',
                            '이은영 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능완성]  서광의 영어',
                            'seo.png',
                            '이제 중요한 건 <시간 단축>이다!<br><br>
                            각 문장을 연결 지어 이해하고, <br>이를 통해 모르는 부분을 추론해가면,<br>
                            완벽히 이해하지 못한 지문이라도<br> 어쨌든 정답은 찾을 수 있기 때문!',
                            'video3.mp4',
                            '서광 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능특강]  한선의 사회문화',
                            'han.png',
                            '문제와 개념을 밀도있게 반복하는 한선쌤만의 강의!<br><br>
                            1. 처음 사문을 공부하는 학생은 꼭 완강해주세요!<br>

                            2. 개념홀릭에 이어 2회독 하는 학생은 문제만 찾아들을 수도 있지만,<br>

                            완강하면 더더욱 탄탄하게 개념을 익히고,<br> 문제 유형 파악 및 선지 분석을 할 수 있습니다.',
                            'video4.mp4',
                            '한선 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능특강]  오태훈의 지구과학',
                            '5.png',
                            '핵심을 확실하고 꼼꼼하게<br> 지구과학1 전 범위를 끝내보아요.<br><br>
                            ■ 강의 특징<br><br>
                            꼼꼼한 강좌<br>
                            핵심을 확실하게 알려주는 강좌<br>
                            쉽게 설명하는 강좌',
                            'video5.mp4',
                            '오태훈 선생님',
                            DEFAULT,
                            DEFAULT
                        );

SELECT * FROM video


-- faq

CREATE TABLE faq (
                     fno INT AUTO_INCREMENT PRIMARY KEY,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);


INSERT INTO faq VALUES(
                          DEFAULT,
                          'ZOOM 관련 화면 캡쳐 차단 메세지 해결방법!',
                          '최근에 ZOOM(화상 미팅) 프로그램 사용이 많이 늘고 있습니다.<br>
                          보안프로그램으로 사용하고있는 kollus(동영상 보안프로그램)에서는<br>
                          zoom을 캡쳐프로그램으로 인식하여 "에러 1002 코드"를 팝업하며 동영상을 중지 시킬 수 있습니다.<br>
                          그런 경우에는 zoom 프로그램을 종료 후 접속하면 문제없이 접속 가능합니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '수강확인증은 어떻게 받을 수 있나요?',
                          '많은 분들이 청년취업지원, 제대군인 지원, 학교 내 어학지원 등<br>
                          각종 지원 사업을 통해 수강을 하고 계십니다.<br>
                          지원 사업이다보니 수강확인증을 필요로 하시는데요!<br>
                          신청방법은 카카오톡 플친으로 성함과 인강사이트 아이디를 알려주시고<br>
                          필요한 확인증을 요청하시면 간단한 수강이력 확인 후 발급해드립니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '환불 규정에 대해 알려주세요.',
                          '정규과정 상품 환불정책<br>
                          ① 수강시작 후 7일 미만 & 5강 미만 수강 시에는 100% 환불 가능<br>
                          ② 수강시작 후 7일 이상 또는 5강 이상 수강 시에는 잔여일에 대한 일할 계산 환불 가능<br>
                          ③ 수강시작 후 수강기간 또는 수강한 강의 수가 전체의 50% 이상 경과한 경우 환불 불가<br>
                          ※ 환불금액 = 결제금액 – {정상가*(실제 수강일/전체 수강일)}<br>
                              단, 할인적용 등록 시 정상가를 기준으로 환불됨을 숙지해주세요.<br>
                          ※ 전체 수강일은 복습기간을 제외한 수강일입니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '수강결제를 했는데 수강시작은 언제부터 가능한가요?',
                          '수강결제와 함께 수강일 카운트가 바로 시작됩니다!<br>
                          필히 확인 후 결제 해주시기 바랍니다.<br>
                          수업의 특성상 교재를 가지고 강의를 들어야 하기 때문에<br>
                          교재가 없는 경우 교재를 배송 받을 기간동안 수업을 들을 수 있도록<br>
                          수업 전 공지사항에 샘플교재를 다운 받으실 수 있습니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,ㄴ
        '교재를 미리 구매하고 싶으면 어떻게 해야하나요?',
                          '교재는 수강 신청 시에 함께 구매할 수 있으며,<br>
                          과목마다 필요교재가 다르기 때문에<br>
                          수강하려는 과목에 필수교재 확인 후 구매 부탁드립니다.<br><br>
                          1.카르페디엠 : 카르페디엠SET(본교재,토익,워크북 3종)<br>
                          *카르페디엠SET 구매하면 카르페디엠 1,2,3,4 수강 시 사용가능합니다.<br>
                          2.카이로스 : 카이로스SET(본교재,서플리먼트 2종)<br>
                          3.독해하이라이트 : 독해하이라이트SET(본교재,리딩북 2종)<br>
                            *리딩북의 경우 카르페디엠3,4에서도 사용되는 교재임으로 구매하신경우<br>
                             SET가 아닌 독해본교재 단품 구매해주세요.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '구독하기를 결제하면 어떤 혜택이 있나요?',
                          '연간 전체구독권 및 전체구독권 구매하시면<br>
                          6종 쿠폰이 자동결제 시 마다 지급이 됩니다.<br>

                          연간결제는 사용 기간은 12개월 안으로 6종 쿠폰 사용 ,<br>
                          월간결제는 사용 기간은 1개월 안으로 6종 쿠폰 사용이 가능합니다.<br>
                          <br>

                          <지급쿠폰의 종류><br>

                           - 오디오 북 : 2천 원 쿠폰<br>

                           - 중학 프리미엄: 단과과정 1만 원 쿠폰, 프리패스 과정 3만 원 쿠폰<br>

                           - 직업: 단과과정 1만 원 쿠폰, 패키지 과정 3만 원 쿠폰<br>

                           - 직업(컴퓨터활용능력): 특정 패키지 과정 1만 원 쿠폰',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '회원 탈퇴는 어떻게 하나요?',
                          '
                          회원 탈퇴 방법은 아래와 같습니다.<br>
                          <br>

                          1. 로그인<br>

                          2. [마이페이지 > 회원정보수정] 메뉴 선택<br>

                          3. [회원 탈퇴하기] 선택 후 진행',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '모바일웹에서 문제콘텐츠는 어떻게 이용하나요?',
                          '1. 안드로이드 계열 모바일 이용 환경<br>
                          <br>
                          안드로이드 버전 6.0이상에서 최적화되어 있습니다.<br>

                          구형 안드로이드 핸드폰(갤럭시S4 이상)의 기본 인터넷 브라우저의 경우<br>
                          문제은행 서비스 이용이 원활하지 않을 수 있습니다.<br>

                          이 경우 아래와 같은 방법으로 문제를 해결하실 수 있습니다.<br><br>

                          ① 크롬 브라우저 이용<br>
                          ② 삼성 브라우저 앱 업데이트<br><br>

                          2. iOS 계열 모바일 이용 환경<br><br>
                          iOS 버전 9.3이상에서 안정적으로 서비스를 이용하실 수 있습니다.<br>

                          설정>소프트웨어 업데이트 메뉴로 들어가<br>
                          "신규 소프트웨어 업데이트"를 통해 버전 업데이트를 하시기 바랍니다.<br>
                          <br>
                          *수식입력을 제외한 모든 기능은 낮은 버전에서도 동일하게 이용 가능합니다.',
                          DEFAULT
                      );

SELECT * FROM faq;

-- 강사 - 강사코드, 강사명, 연락처, 이메일
CREATE TABLE teacher (
                         tid VARCHAR(50) PRIMARY KEY,
                         teacher_name VARCHAR(50) NOT NULL,
                         tel VARCHAR(200),
                         email VARCHAR(150)
);

INSERT INTO teacher VALUES("park", "박정우", "01012341234", "park@academy.com");



CREATE TABLE course (
                        cno INT AUTO_INCREMENT PRIMARY KEY, -- 강의 코드
                        course_name VARCHAR(100) NOT NULL, -- 강의명
                        price INT NOT NULL, -- 강의 가격
                        start_date DATE NOT NULL ,  -- 개강일
                        end_date DATE NOT NULL , -- 종강일
                        total_num INT NOT NULL, -- 총 인원 수
                        curr_num INT NOT NULL DEFAULT 0, -- 현재 신청 인원 수
                        teacher_name VARCHAR(50) NOT NULL , -- 강사j명 ( teacher 테이블에서 조인)
                        content VARCHAR(3000) NOT NULL, -- 강의 소개
                        book_name VARCHAR(100) NOT NULL, -- 교재 이름
                        book_price INT NOT NULL, -- 교재 가격
                        imgsrc1 VARCHAR(256) DEFAULT 'noimg.jpg', -- 강의 사진
                        imgsrc2 VARCHAR(256) DEFAULT 'noimg.jpg' -- 교재 사진
);

INSERT INTO course VALUES(DEFAULT, "독해하이라이트", 120000, "2023-10-20", "2023-12-31", 100, DEFAULT, "park", "d", "독해하이라이트 리딩북", 21000, DEFAULT, DEFAULT);
INSERT INTO course VALUES(DEFAULT, "독해하이라이트2", 320000, "2023-10-20", "2023-12-31", 1, DEFAULT, "park", "d", "독해하이라이트 리딩북2", 21000, DEFAULT, DEFAULT);

INSERT INTO course VALUES(DEFAULT, "독해하이라이트3", 120000, "2023-10-20", "2023-12-31", 100, DEFAULT, "park", "d", "독해하이라이트 리딩북3", 21000, DEFAULT, DEFAULT);
INSERT INTO course VALUES(DEFAULT, "독해하이라이트4", 120000, "2023-10-20", "2023-12-31", 100, DEFAULT, "park", "d", "독해하이라이트 리딩북4", 21000, DEFAULT, DEFAULT);


-- 수강 - 수강코드, 강의코드, 학생아이디, 수강총시간, 수강완료여부
CREATE TABLE enroll (
                        eno INT AUTO_INCREMENT PRIMARY KEY, -- 수강코드
                        cno int NOT NULL, -- 수강신청한 강의 코드
                        id VARCHAR(20) NOT NULL, -- 수강신청한 회원의 아이디
    -- total_time INT NOT NULL, -- 총 강의 시간
    -- curr_time INT NOT NULL, -- 수강한 시간
                        complete BOOLEAN NOT NULL DEFAULT 0, -- 수강 완료 여부
                        book BOOLEAN NOT NULL DEFAULT 1, -- 교재 선택 여부 (기본값은 1이며, 0은 미선택 1은 선택)
                        enroll_price INT NOT NULL, -- 총 수강 가격 (교재 선택 여부에 따라 달라짐)
                        book_name VARCHAR(100) NOT NULL -- 교재 이름
);


INSERT INTO enroll VALUES(DEFAULT, 1, "park", DEFAULT, DEFAULT, 141000, "리딩북");


-- 결제 테이블 생성
create table payment(
                        sno serial primary key,
                        cid varchar(20) not null,
                        pno integer not null,
                        amount integer default 1,
                        pmethod varchar(100),
                        pcom varchar(100),
                        cnum varchar(100),
                        payprice integer default 1000,
                        dno varchar(100)
);
CREATE DATABASE haebeop_1;

USE haebeop_1;

CREATE TABLE test(num INT AUTO_INCREMENT PRIMARY KEY,
                  title VARCHAR(100) NOT NULL);

INSERT INTO test VALUES (DEFAULT, '테스트제목1');
INSERT INTO test VALUES (DEFAULT, '테스트제목2');
INSERT INTO test VALUES (DEFAULT, '테스트제목3');
INSERT INTO test VALUES (DEFAULT, '테스트제목4');
INSERT INTO test VALUES (DEFAULT, '테스트제목5');

SELECT * from test;

COMMIT;

SELECT * FROM emp;
haebeop
DESC test;

DESC emp;

CREATE TABLE member(
                       id VARCHAR(20) PRIMARY KEY,
                       pw VARCHAR(350) NOT NULL,
                       name VARCHAR(50) NOT NULL,
                       email VARCHAR(150),
                       tel VARCHAR(20),
                       addr1 VARCHAR(200),
                       addr2 VARCHAR(200),
                       postcode VARCHAR(20),
                       regdate DATETIME DEFAULT CURRENT_TIME,
                       birth DATE DEFAULT CURRENT_DATE,
                       pt INT DEFAULT 0,
                       visited INT DEFAULT 0
);

DESC MEMBER;

INSERT INTO member VALUES ('admin', '1234', '관리자',
                           'admin@teaspoon.co.kr', '02-1234-1234',
                           '서울특별시 금천구 디지털로9길 23 (마리오2 패션타워)',
                           '11층 1108호', '08511', DEFAULT, '2023-12-25',
                           DEFAULT, DEFAULT);


INSERT INTO member VALUES ('sirious920', '1234', '오태훈',
                           'sirious920@teaspoon.co.kr', '010-7329-7484',
                           '서울특별시 금천구 가산로9길 54',
                           '천재교과서', '08513', DEFAULT, '1998-09-20',
                           DEFAULT, DEFAULT);

COMMIT;

UPDATE member SET pw='$2a$10$TMTp1e7vW8nx7l7B49a2d.0robqb2qUFTuBPntKHRvVILg0CmBkqW' WHERE id='admin';

UPDATE member SET pw='$2a$10$mpr36CRQpp903gPf.f76auK1CYzFkq.LD65JsGzdrBCiOluBotWYW' WHERE id='sirious920';

SELECT * FROM member;

-- 자유게시판
CREATE TABLE free(
                     fno INT AUTO_INCREMENT PRIMARY KEY,  -- 글번호
                     title VARCHAR(100) NOT null,   -- 글제목
                     content VARCHAR(1500) not null,    -- 글내용
                     regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                     visited INT,    -- 조회수
                     id VARCHAR(20),    -- 작성자
                     rec INT -- 추천수
);

CREATE TABLE free_comment(
                             cno INT PRIMARY KEY AUTO_INCREMENT,
                             fno INT,
                             author VARCHAR(16) NOT NULL,
                             resdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                             content VARCHAR(200),
                             FOREIGN KEY(fno) REFERENCES free(fno) ON DELETE CASCADE
);

CREATE VIEW freecommentlist AS (SELECT a.cno AS cno, a.fno as fno, a.content AS content, a.author AS author, a.resdate AS resdate,
                                       b.name AS name FROM free_comment a, member b WHERE a.author=b.id ORDER BY a.cno ASC);

CREATE TABLE record (
                        rno INT AUTO_INCREMENT PRIMARY KEY,
                        fno INT REFERENCES free(fno) ON DELETE CASCADE,
                        id VARCHAR(20),
                        flag INT DEFAULT 0
);

CREATE TABLE fileinfo(
                         NO INT AUTO_INCREMENT PRIMARY KEY,  -- 번호
                         articleno varchar(45) DEFAULT NULL,	-- 글번호
                         saveFolder varchar(45) DEFAULT NULL,	-- 저장 디렉토리
                         originFile varchar(45) DEFAULT NULL,	--
                         saveFile varchar(45) DEFAULT NULL
);

CREATE TABLE fileobj (
                         no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         postno INT NOT NULL,
                         savefolder VARCHAR(400),
                         originfile VARCHAR(400),
                         savefile VARCHAR(800),
                         filesize LONG,
                         uploaddate VARCHAR(100)
);
CREATE TABLE fileboard (
                           postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
                           title VARCHAR(100) not null,   -- 글제목
                           content VARCHAR(1500) not null,    -- 글내용
                           regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                           visited INT DEFAULT 0   -- 조회수
);
DESC fileobj;
DESC fileboard;
SELECT * FROM fileobj;
SELECT * FROM fileboard;

CREATE TABLE board (
                       bno INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(100) NOT NULL,
                       content VARCHAR(1000) NOT NULL,
                       nickname VARCHAR(20),
                       regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
                       visited INT DEFAULT 0
);


-- 공지사항

DROP TABLE notice;

CREATE table notice(
                       no INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content VARCHAR(2000) NOT NULL,
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0
);

DESC notice

INSERT INTO notice VALUES(
DEFAULT,
'[애니키즈] 다시보기 서비스 중지 프로그램 안내',
'"애니키즈" VOD 다시보기 프로그램 중 서비스 계약 만료에 따라<br>
10월 17일(화)부터 서비스 이용이 불가능한 프로그램을 알려드립니다.<br>
<br>
* 서비스 중단일 : 10월17일(화)<br>
<br>
① 모험왕 블링키<br>
② 안녕 자두야 1<br>
③ 극장판 안녕 자두야<br>
④ 콩순이 쑥쑥 인기동요(한/영)<br>
⑤ 콩순이 쑥쑥 베스트송(한/영)<br>
⑥ 콩순이 쑥쑥 여행동요(한/영)<br>
⑦ 콩순이 쑥쑥 창의력동요(한/영)<br>
⑧ 콩순이 쑥쑥 놀이동요(한/영)<br>
⑨ 콩순이 쑥쑥 요리동요(한/영)<br>
⑩ 콩순이 쑥쑥 자존감동요(한/영)<br>
⑪ 콩순이 쑥쑥 교통수단동요(한/영)<br>
⑫ 콩순이 쑥쑥 상상력동요(한/영)<br>
⑬ 콩순이 쑥쑥 탐험동요(한/영)<br>
<br>
애니키즈 프로그램에 많은 관심 부탁드리며<br>
앞으로 더 좋은 서비스로 보답하겠습니다.<br>
<br>
감사합니다.',
DEFAULT,
DEFAULT
);

INSERT INTO notice VALUES(
                             DEFAULT,
                             'macOS 14.0 업데이트에 따른 학습용 플레이어 서비스 이용제한 안내',
                             'macOS 14.0 업데이트 버전이 2023년 9월 27일 신규 패치됨에 따라,<br>
                              안정적인 강좌 스트리밍 서비스를 위해 자동/수동 업데이트를 추석 연휴 이후 진행을 부탁드립니다.<br>
                             <br>
                             macOS 14.0 이하 기존 사용자는 현재 서비스 그대로 학습용 플레이어를 통해 강좌 학습을 이용하시면 되며,<br>
                             OS 업데이트 하신 분들은 강좌 학습 이용에 제한이 있을 수 있습니다.<br>
                             <br>
                             OS버전 업데이트를 하신 사용자분은 불편하시겠지만<br>
                              플레이어 업데이트(2023.10.05. 예정) 전까지는 모바일에서 이용을 부탁드립니다. ',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '[안내] 9/17 카카오페이 서비스 점검 안내',
                             '1. 작업내용 : 카카오페이 네트워크 대역폭 개선 및 방화벽 교체를 위한 서비스 점검<br>
                             2. 작업시간 : 2023년 9월 17일 (일) 01:00~07:00<br>
                             3. 결제수단 : 카카오페이(카드), 카카오페이(머니)<br>
                             4. 작업영향 : 카카오페이의 모든 관련 서비스 중단 <br>
                             <br>
                             ※ 점검 시간 동안 카카오페이 결제수단을 통한 결제는 불가합니다.<br>
                             감사합니다.',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '[공인중개사, 공무원, 자격증, 컴활] 알쓸E잡 퀴즈 이벤트 당첨 안내',
                             '신년맞이 알쓸E잡 퀴즈 이벤트에 참여해 주셔서 감사합니다.<br>
                             <br>
                             ◎ 개인정보(연락처) 입력 기간 : 2023년 1월 20일(금) ~ 2023년 1월 26일(목)<br>
                             ◎ 경품 발송 예정일 : 2023년 2월 2일(목)부터<br>
                             ※ 개인정보 이용에 동의하지 않은 참여자는 당첨자 선정에서 제외됩니다.<br>
                             ※ 경품 발송 후 잘못된 개인정보로 인한 미배송이나 오배송은 재발송이 불가능합니다.<br>
                              <br>
                             경품 발송 및 안내사항<br>
                             - 이벤트 경품 수령을 위해 당첨자가 직접 개인정보(주소 및 연락처)를 입력해주셔야 합니다.<br>
                             - 정해진 기간 내에 개인정보를 입력하셔야 경품 수령이 가능합니다.<br>
                             - 해당절차는 [정보통신망 이용촉진 및 정보보호 등에 관한 법률],<br>
                              [개인정보 보호법] 등의 규정에 따라 무분별한 개인정보 수집을 지양하고<br>
                               당첨자에 한하여 최소한의 개인정보를 취득하기 위한 조치입니다.<br>
                             - 5만원 초과 상품에 대한 제세공과금(22%)은 당첨자 본인 부담입니다.',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '영유아 언어 및 사회성 발달 증진 프로젝트 참여자 모집 (20~36개월)',
                             '- 모집 안내 - <br>
                             <br>
                             ■ 모집기간 : ~2023년 2월 19일 정오 (낮 12시 마감, 마감시간 꼭 지켜주세요)<br>
                             ■ 참여대상 : 20개월 ~ 36개월<br>
                             - 또래보다 유난히 낯을 많이 가리고 눈맞춤을 잘 하지 않는 아이<br>
                             - 또래보다 말이 늦고 말을 걸어도 대답을 잘하지 않는 아이<br>
                             - 또래보다 칭얼댐이 잦고, 말로 표현하기 보다는 신체적으로 표현하려고 하는 아이<br>
                             - 한 자리에서 오랫동안 가만히 앉아 있거나 주변 사물 등에 대한 반응이 많지 않은 아이<br>
                             - 정서적으로 불안을 호소하는 아이<br>
                              *관련 기관에서 언어발달 지연, 자폐 등 진단을 받은 경우, 36개월~48개월 미만 지원 가능<br>
                             <br>
                             ■ 모집방법 : 1차 서류, 2차 놀이상황 셀프카메라 (*2차 셀프 카메라 참여 방법은 추후 별도 안내)<br>
                             ■ 참여내용 : 전문가의 진단 및 약 3개월 간의 솔루션<br>
                             <br>
                             *보호자는 참여기간 동안 이루어지는 솔루션에 적극적으로 참여하셔야 합니다.<br>
                             *참여기간 동안 이루어지는 모든 활동은 방송을 위한 촬영을 전제로 진행합니다.<br>
                             *검사 및 진단, 솔루션은 연세대학교 소아청소년정신과 신의진 교수 연구팀과 함께합니다.<br>
                             *개인정보는 참여자 선정을 위해서만 사용하며, 최종 선정 완료 후 삭제, 폐기합니다',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '제20회 대한민국 교육박람회 개최 안내',
                             '공교육 분야 최고의 정부 인증 전시회!<br>
                             20주년을 맞이한 대한민국 교육박람회가<br>
                             2023년 1월 12일(목)부터 14일(토)까지 서울 코엑스 1층 전관에서 진행됩니다!<br>
                             미래 교육 트렌드가 궁금하시다면 사전등록 GOGO!!<br>
                             <br>
                             - 행사 일정 : 2023년 1월 12일(목) ~ 14일(토), 3일간<br>
                             - 장소 : 서울 코엑스<br>
                             - 참여방법 : 온라인 사전등록 5,000원, 현장등록 10,000원<br>
                             - 사전 예매 : 대한민국 교육박람회 홈페이지 사전등록<br>
                             - 사전등록 기간 : ~2023년 1월 11일 18:00까지<br>
                             - 사전등록 링크 : http://www.educationkorea.kr/visit/01.php<br>
                             <br>
                             * 자세한 내용은 대한민국 교육박람회 홈페이지를 참고해주세요.<br>
                             http://www.educationkorea.kr',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '김상균 교수에게 물어보살!',
                             '재밌지만 그만큼 조절하기 어려운 게임!<br>

                             ‘메타버스’ 및 ‘게이미피케이션’ 관련 국내최고의 전문가.<br>

                             김상균 교수님이 여러분의 고민을 해결해드립니다.<br>
                             <br>
                             촬영일시 : 12월 4일 일요일 넷마루 스튜디오[서울특별시 구로구]<br>

                             참여신청 : mina201103@naver.com(2022년 11월 31일까지)<br>
                             <br>
                             [성함/연락처/사연]을 적어보내주세요.<br>

                             촬영에 동의하시는 분들만 신청 부탁드립니다.<br>
                             *참석하시는 분들에게 교통비가 지급됩니다.',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '개인정보 이용내역을 안내 해 드립니다.',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '[초등] 1~2학년 2학기 온라인 개학 및 3~6학년 수업 지원 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '2024 초·중·고교 교재 신규 집필진 공모',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '오디오지식 SNS공유 이벤트 당첨 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '2024 수강생 만족도 조사 ',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '사이트 접속 지연 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

INSERT INTO notice VALUES(
                             DEFAULT,
                             '평생교육바우처 수강 지원 안내',
                             '공지사항',
                             DEFAULT,
                             DEFAULT
                         );

SELECT * FROM notice;

-- 후기

DROP TABLE review

CREATE table review(
                       no INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content VARCHAR(2000) NOT NULL,
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0,
                       id VARCHAR(50)
);

INSERT INTO review VALUES(
                             DEFAULT,
                             'OO 대학교 합격 수기 (수학 3등급->수능 96점,전교1등)',
                             '1. 매 수업마다 테스트 진행<br>
                             수업 시작 전 테스트를 진행했고 친구들과 점수와 틀린문제를 공유하며 어디서 부족한 지 점검할 수 있었습니다. <br>
                             처음에는 낮은 점수를 받을때마다 부끄러웠지만 다음엔 절대 그러지 않겠다는 다짐을 하고<br>
                             열심히 공부할 수 있었기에 성장할 수 있었습니다.<br><br>
                             2. 좋은 수업 분위기와 좋은 친구들<br>
                             공부를 열심히하고 잘하는 친구들이 많아서 제가 조금이라도 공부를 대충한 날이 있으면 바로 티가 났습니다. <br>
                             그래서 큰 슬럼프없이 공부를 집중할 수 있었습니다. <br>
                             서광선생님의 수업을 듣는 학생들은 1등급인 학생이 1등급이 아닌 학생보다 더 많았습니다.<br>
                             덕분에 공부자극을 받으며 더 열정적으로 할 수 있었습니다. <br>
                             열심히 공부하면 김수현선생님이 선물도 주셔서 공부가 괴롭지 않았습니다!<br><br>
                             3. 영재학습실과 개별질문시간<br>
                             수업을 듣고 난 뒤 영재학습실에서 오답과 숙제를 90분정도 했습니다. <br>
                             모르는 문제를 조교선생님께 질문하면 친절하게 설명해주셨고 이해가 잘 됐습니다. <br>
                             학원에 다니기 전에는 앉아있는 시간이 길지 않아 공부하는 시간도 적었습니다. <br>
                             스마트해법에 다니면서 앉아있는 시간이 늘었고 자연스레 공부하는 시간도 늘었습니다. <br>
                             덕분에 고3내내 10시간 공부를 할 수 있었고 큰 성장을 이룰 수 있었습니다.<br><br>
                             열심히 하고자하는 학생, 수학을 잘하고 싶은 학생은 스마트해법을 강추합니다.',
                             DEFAULT,
                             DEFAULT,
                             'leeeunyoung'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '학원이 고민될땐? (스마트해법 추천!)',
                             '저는 고등학생에게 적극 추천하는데 고1,2 학생들은 비법서, <br>
                             여러 개념문제를 통해 수학의 틀이 되는 기본 개념들을 견고하게 쌓을 수 있습니다. <br>
                             고3은 이미 늦었다고 생각하실텐데 기간대비 최대효율을 내는 것이 길벗의 특징입니다. <br>
                             수능 영어 80점과 89점이 같은 2등급이죠? 그렇기 때문에 높은 점수를 위한 것도 있지만 <br>
                             오로지 높은 점수를 바라보는 것이 아닌 학생 개개인의 역량을 확인하고 자신에게 맞는 전략을 짜줍니다. <br>
                             그렇기에 짧은 시간동안 최대한의 효율을 뽑아내는 것이죠.<br>
                              길가다가 이런 문구 한번쯤을 봤을 겁니다. <br>선생님도 시험보는 학원 저희 선생님들은 다 검증이 되어있습니다. <br>
                              그 또한 길벗의 특색이라고 할 수 있죠.<br>
                              물론 한번에 만족하기는 쉽지 않을겁니다.<br> 하지만 길벗는 다양한 선생님들이 있기 때문에 반을 바꾸며 선생님마다 다른 색을 느껴보고<br>
                               나에게 맞는 선생님을 찾는 것도 가능합니다. <br>참고로 저는 고3에 선생님이 바꼈었는데 그 선생님의 스타일이 저랑 잘 맞아서 영어가 쉬워졌습니다.
                              <br>못하는 학생들도 발전가능성을 믿고 사랑으로 지도하기 때문에 <br>선행이 많이 되어있고 잘하는 학생만 선호하는 타학원과 다르다고 생각합니다. <br>
                              내신과 수능 다 챙길 수 있는, 3,4등급이 1,2등급으로 바뀌는 기적을 경험할 수 있는 학원. <br>이제 더는 고민하지말고 목동수학학원 스마트해법으로 오세요!',
                             DEFAULT,
                             DEFAULT,
                             'leesoyoon'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             ' 의지만 갖고 오세요!',
                             '전 수학 이소윤 선생님께 배우고 있습니다.<br><br>
                             이소윤 선생님께는 중3 때부터 시작해서 벌써 3년째 진득히 배우고 있는데요. <br>
                             선생님의 관리 능력이 제 성적향상에 가장 큰 보탬이 된 것 같습니다. <br>
                             전 2학년 때 수학 성적 미적1, 미적2, 확통 모두 100점을 받았습니다. <br>
                             저 혼자 독학을 했다면 이런 성과는 얻어낼 수 없었을 것입니다.<br>
                             혹시 ‘원래 잘하던 사람이니까’ 라고 오해하실까봐 말씀드리자면, <br>
                             이소윤 선생님께서는 수많은 기적에 가까운 성적향상을 이루어내셨습니다.<br>
                             예를 들어 진명여고 1학년 친구가 9등급에서 2등급으로 올랐고, <br>
                             명덕여고 전교 최하위권이 모고 2등급, 그것도 4점 모자란 2등급을 받아냈습니다. <br>
                             그 외에도 부현준 친구 등 정말 수많은 친구들이 말도 안되는 성적 향상을 이루어냈습니다. <br>
                             이런 결과로 미루어보아, 김수현 선생님과 함께라면 전교 꼴등도 의지만 있다면 3등급까지는 <br>
                             확실히 올려줄 수 있는 능력을 갖고 계시다고 저는 확신합니다.<br>

                             아울러 다른 선생님들도 공부할 의지가 있는 학생이라면 <br>성적향상에 확실한 노하우를 가지고 계십니다.<br>
                             수많은 훌룡한 강사진과 문제풀이실, 그것이 전 길벗 수학관의 최대 강점이라고 생각합니다. <br>
                             또한 저 같은 전교 10등도 전교 1등으로 만들어주는 학원은 많지 않을 것이라고 확신합니다. <br>
                             해법의 여러 시스템이 이런 결과를 만든 것 같습니다. <br>
                             제가 진심으로 좋다고 느꼈기 때문에 친한 친구 2~3명을 학원에 추천하였고, <br>
                             그 친구의 말로는 자기가 지금까지 공부해온 양보다 몇 주 사이에 공부를 더 한 것 같다고 했습니다. <br>
                             전 그 친구 또한 금방 성적이 오를 것이라고 확신합니다. 이제껏 제가 느낀 솔직한 체험수기였습니다.<br><br>

                             의지만 갖고 오세요! 해법이 모든 것을 만들어 줄 것입니다!',
                             DEFAULT,
                             DEFAULT,
                             'seo'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '스마트해법을 다니고 연세대에 오기까지의 여정',
                             '제가 해법을 추천하는 가장 큰 이유는 체계적인 커리큘럼과 학생들의 학습을 위한 방안이 풍부하다는 것입니다.<br>
                             고등학생이 되면 내신 공부 기간, 수능 공부 기간이 별개로 이루어지게 됩니다. <br>

                             내신 공부 때에는 내신 성적 올리기 혹은 유지하기에 포커스를 맞추어 선생님께서 저희를 가르쳐 주십니다. <br>
                             선생님께서 내신에 자주 나오는 유형, 심화 문제, 문제 풀 때 팁, 서술형 문제 대비법 등을 알려주셔서 <br>
                             더욱 세밀하게 공부 할 수 있었고 그 결과 수학 내신 1등급을 얻을 수 있었습니다! <br>
                             또한 한선 선생님께서 최선을 다해서 가르쳐 주셨기에 저 또한 최선을 다해서 배우도록 노력했습니다.<br>
                             수능 공부 때에는 모의고사를 푸는 방식으로 공부를 했습니다. <br>
                             해법에서는 수업을 듣기 전이나 후에 수학 영재실을 가서 자습하는 형태로 이루어지는데, <br>이 때 모의고사를 풀었습니다.<br>
                             모의고사를 풀고 나서는 선생님께서 킬러 문제들을 설명해주셨는데 <br>
                             문제의 핵심과 접근법 등을 이해하기 쉽게 설명해 주셔서 좋았습니다!<br>
                             이 시기에 사설 모의고사, 혹은 교육청 기출, 평가원 기출을 풀면 풀 수록 <br>
                             제 수학 실력이 올라가는 게 느껴졌고 이러한 것이 제 수학 내신 풀 때에도 도움이 됐다고 생각합니다.',
                             DEFAULT,
                             DEFAULT,
                             'han'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '수학 이은영 선생님을 추천해요!',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'leesoyoon'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '스마트해법을 다니고 △△대학교 합격수기',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'leeeunyoung'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '국 영 수 탐 전교1등! 전과목 1등급!',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'seo'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '여행의 끝을 기념하며',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'han'
                         );

INSERT INTO review VALUES(
                             DEFAULT,
                             '성적아 이제 오를 곳이 없다!!',
                             '후기',
                             DEFAULT,
                             DEFAULT,
                             'oh'
                         );

SELECT * FROM review;

-- 강의

DROP TABLE video;

CREATE table video(
                      no INT AUTO_INCREMENT PRIMARY KEY,
                      title VARCHAR(200) NOT NULL, -- 강의 제목
                      img VARCHAR(2000) NOT NULL, -- List에 올라갈 이미지
                      content VARCHAR(2000) NOT NULL, -- 강의 내용
                      videofile VARCHAR(5000) NOT NULL, -- 영상 경로
                      teacher VARCHAR(50), -- 강의 선생님
                      resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                      visit int DEFAULT 0
);

INSERT INTO video VALUES(
                            DEFAULT,
                            '[파이널 체크포인트]  이소윤의 문학+독서',
                            'soyoon.png',
                            '수능연계 핵심만 뽑아서 주머니 속으로,<br> 포켓 수능연계
                            <br><br>
                            ■ 강의 특징<br><br>
                            단 7강으로 수능특강, 수능완성 알맹이만!<br>
                            ⇨ 공통 영역(독서, 문학)의 핵심 요소를 정확하게 뽑아서<br>
                            군더더기 없이 속도감 있는 전개에 학습 탄력을 더한다.',
                            'video1.mp4',
                            '이소윤 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능특강]  이은영의 확률과 통계',
                            'eunyoung.png',
                            '중학교 개념부터 정리가 필요한<br> 기초 부족 수강생들 모여라!
                            <br><br>
                            ■ 강의 특징<br><br>
                            핵심을 확실하게 알려주는 강좌<br>
                            기본에 충실한 강좌<br>
                            쉽게 설명하는 강좌',
                            'video2.mp4',
                            '이은영 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능완성]  서광의 영어',
                            'seo.png',
                            '이제 중요한 건 <시간 단축>이다!<br><br>
                            각 문장을 연결 지어 이해하고, <br>이를 통해 모르는 부분을 추론해가면,<br>
                            완벽히 이해하지 못한 지문이라도<br> 어쨌든 정답은 찾을 수 있기 때문!',
                            'video3.mp4',
                            '서광 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능특강]  한선의 사회문화',
                            'han.png',
                            '문제와 개념을 밀도있게 반복하는 한선쌤만의 강의!<br><br>
                            1. 처음 사문을 공부하는 학생은 꼭 완강해주세요!<br>

                            2. 개념홀릭에 이어 2회독 하는 학생은 문제만 찾아들을 수도 있지만,<br>

                            완강하면 더더욱 탄탄하게 개념을 익히고,<br> 문제 유형 파악 및 선지 분석을 할 수 있습니다.',
                            'video4.mp4',
                            '한선 선생님',
                            DEFAULT,
                            DEFAULT
                        );

INSERT INTO video VALUES(
                            DEFAULT,
                            '[수능특강]  오태훈의 지구과학',
                            '5.png',
                            '핵심을 확실하고 꼼꼼하게<br> 지구과학1 전 범위를 끝내보아요.<br><br>
                            ■ 강의 특징<br><br>
                            꼼꼼한 강좌<br>
                            핵심을 확실하게 알려주는 강좌<br>
                            쉽게 설명하는 강좌',
                            'video5.mp4',
                            '오태훈 선생님',
                            DEFAULT,
                            DEFAULT
                        );

SELECT * FROM video


-- faq

CREATE TABLE faq (
                     fno INT AUTO_INCREMENT PRIMARY KEY,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);


INSERT INTO faq VALUES(
                          DEFAULT,
                          'ZOOM 관련 화면 캡쳐 차단 메세지 해결방법!',
                          '최근에 ZOOM(화상 미팅) 프로그램 사용이 많이 늘고 있습니다.<br>
                          보안프로그램으로 사용하고있는 kollus(동영상 보안프로그램)에서는<br>
                          zoom을 캡쳐프로그램으로 인식하여 "에러 1002 코드"를 팝업하며 동영상을 중지 시킬 수 있습니다.<br>
                          그런 경우에는 zoom 프로그램을 종료 후 접속하면 문제없이 접속 가능합니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '수강확인증은 어떻게 받을 수 있나요?',
                          '많은 분들이 청년취업지원, 제대군인 지원, 학교 내 어학지원 등<br>
                          각종 지원 사업을 통해 수강을 하고 계십니다.<br>
                          지원 사업이다보니 수강확인증을 필요로 하시는데요!<br>
                          신청방법은 카카오톡 플친으로 성함과 인강사이트 아이디를 알려주시고<br>
                          필요한 확인증을 요청하시면 간단한 수강이력 확인 후 발급해드립니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '환불 규정에 대해 알려주세요.',
                          '정규과정 상품 환불정책<br>
                          ① 수강시작 후 7일 미만 & 5강 미만 수강 시에는 100% 환불 가능<br>
                          ② 수강시작 후 7일 이상 또는 5강 이상 수강 시에는 잔여일에 대한 일할 계산 환불 가능<br>
                          ③ 수강시작 후 수강기간 또는 수강한 강의 수가 전체의 50% 이상 경과한 경우 환불 불가<br>
                          ※ 환불금액 = 결제금액 – {정상가*(실제 수강일/전체 수강일)}<br>
                              단, 할인적용 등록 시 정상가를 기준으로 환불됨을 숙지해주세요.<br>
                          ※ 전체 수강일은 복습기간을 제외한 수강일입니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '수강결제를 했는데 수강시작은 언제부터 가능한가요?',
                          '수강결제와 함께 수강일 카운트가 바로 시작됩니다!<br>
                          필히 확인 후 결제 해주시기 바랍니다.<br>
                          수업의 특성상 교재를 가지고 강의를 들어야 하기 때문에<br>
                          교재가 없는 경우 교재를 배송 받을 기간동안 수업을 들을 수 있도록<br>
                          수업 전 공지사항에 샘플교재를 다운 받으실 수 있습니다.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,ㄴ
        '교재를 미리 구매하고 싶으면 어떻게 해야하나요?',
                          '교재는 수강 신청 시에 함께 구매할 수 있으며,<br>
                          과목마다 필요교재가 다르기 때문에<br>
                          수강하려는 과목에 필수교재 확인 후 구매 부탁드립니다.<br><br>
                          1.카르페디엠 : 카르페디엠SET(본교재,토익,워크북 3종)<br>
                          *카르페디엠SET 구매하면 카르페디엠 1,2,3,4 수강 시 사용가능합니다.<br>
                          2.카이로스 : 카이로스SET(본교재,서플리먼트 2종)<br>
                          3.독해하이라이트 : 독해하이라이트SET(본교재,리딩북 2종)<br>
                            *리딩북의 경우 카르페디엠3,4에서도 사용되는 교재임으로 구매하신경우<br>
                             SET가 아닌 독해본교재 단품 구매해주세요.',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '구독하기를 결제하면 어떤 혜택이 있나요?',
                          '연간 전체구독권 및 전체구독권 구매하시면<br>
                          6종 쿠폰이 자동결제 시 마다 지급이 됩니다.<br>

                          연간결제는 사용 기간은 12개월 안으로 6종 쿠폰 사용 ,<br>
                          월간결제는 사용 기간은 1개월 안으로 6종 쿠폰 사용이 가능합니다.<br>
                          <br>

                          <지급쿠폰의 종류><br>

                           - 오디오 북 : 2천 원 쿠폰<br>

                           - 중학 프리미엄: 단과과정 1만 원 쿠폰, 프리패스 과정 3만 원 쿠폰<br>

                           - 직업: 단과과정 1만 원 쿠폰, 패키지 과정 3만 원 쿠폰<br>

                           - 직업(컴퓨터활용능력): 특정 패키지 과정 1만 원 쿠폰',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '회원 탈퇴는 어떻게 하나요?',
                          '
                          회원 탈퇴 방법은 아래와 같습니다.<br>
                          <br>

                          1. 로그인<br>

                          2. [마이페이지 > 회원정보수정] 메뉴 선택<br>

                          3. [회원 탈퇴하기] 선택 후 진행',
                          DEFAULT
                      );

INSERT INTO faq VALUES(
                          DEFAULT,
                          '모바일웹에서 문제콘텐츠는 어떻게 이용하나요?',
                          '1. 안드로이드 계열 모바일 이용 환경<br>
                          <br>
                          안드로이드 버전 6.0이상에서 최적화되어 있습니다.<br>

                          구형 안드로이드 핸드폰(갤럭시S4 이상)의 기본 인터넷 브라우저의 경우<br>
                          문제은행 서비스 이용이 원활하지 않을 수 있습니다.<br>

                          이 경우 아래와 같은 방법으로 문제를 해결하실 수 있습니다.<br><br>

                          ① 크롬 브라우저 이용<br>
                          ② 삼성 브라우저 앱 업데이트<br><br>

                          2. iOS 계열 모바일 이용 환경<br><br>
                          iOS 버전 9.3이상에서 안정적으로 서비스를 이용하실 수 있습니다.<br>

                          설정>소프트웨어 업데이트 메뉴로 들어가<br>
                          "신규 소프트웨어 업데이트"를 통해 버전 업데이트를 하시기 바랍니다.<br>
                          <br>
                          *수식입력을 제외한 모든 기능은 낮은 버전에서도 동일하게 이용 가능합니다.',
                          DEFAULT
                      );

SELECT * FROM faq;

-- 강사 - 강사코드, 강사명, 연락처, 이메일
CREATE TABLE teacher (
                         tid VARCHAR(50) PRIMARY KEY,
                         teacher_name VARCHAR(50) NOT NULL,
                         tel VARCHAR(200),
                         email VARCHAR(150)
);

INSERT INTO teacher VALUES("park", "박정우", "01012341234", "park@academy.com");



CREATE TABLE course (
                        cno INT AUTO_INCREMENT PRIMARY KEY, -- 강의 코드
                        course_name VARCHAR(100) NOT NULL, -- 강의명
                        price INT NOT NULL, -- 강의 가격
                        start_date DATE NOT NULL ,  -- 개강일
                        end_date DATE NOT NULL , -- 종강일
                        total_num INT NOT NULL, -- 총 인원 수
                        curr_num INT NOT NULL DEFAULT 0, -- 현재 신청 인원 수
                        teacher_name VARCHAR(50) NOT NULL , -- 강사j명 ( teacher 테이블에서 조인)
                        content VARCHAR(3000) NOT NULL, -- 강의 소개
                        book_name VARCHAR(100) NOT NULL, -- 교재 이름
                        book_price INT NOT NULL, -- 교재 가격
                        imgsrc1 VARCHAR(256) DEFAULT 'noimg.jpg', -- 강의 사진
                        imgsrc2 VARCHAR(256) DEFAULT 'noimg.jpg' -- 교재 사진
);

INSERT INTO course VALUES(DEFAULT, "독해하이라이트", 120000, "2023-10-20", "2023-12-31", 100, DEFAULT, "park", "d", "독해하이라이트 리딩북", 21000, DEFAULT, DEFAULT);
INSERT INTO course VALUES(DEFAULT, "독해하이라이트2", 320000, "2023-10-20", "2023-12-31", 1, DEFAULT, "park", "d", "독해하이라이트 리딩북2", 21000, DEFAULT, DEFAULT);

INSERT INTO course VALUES(DEFAULT, "독해하이라이트3", 120000, "2023-10-20", "2023-12-31", 100, DEFAULT, "park", "d", "독해하이라이트 리딩북3", 21000, DEFAULT, DEFAULT);
INSERT INTO course VALUES(DEFAULT, "독해하이라이트4", 120000, "2023-10-20", "2023-12-31", 100, DEFAULT, "park", "d", "독해하이라이트 리딩북4", 21000, DEFAULT, DEFAULT);


-- 수강 - 수강코드, 강의코드, 학생아이디, 수강총시간, 수강완료여부
CREATE TABLE enroll (
                        eno INT AUTO_INCREMENT PRIMARY KEY, -- 수강코드
                        cno int NOT NULL, -- 수강신청한 강의 코드
                        id VARCHAR(20) NOT NULL, -- 수강신청한 회원의 아이디
    -- total_time INT NOT NULL, -- 총 강의 시간
    -- curr_time INT NOT NULL, -- 수강한 시간
                        complete BOOLEAN NOT NULL DEFAULT 0, -- 수강 완료 여부
                        book BOOLEAN NOT NULL DEFAULT 1, -- 교재 선택 여부 (기본값은 1이며, 0은 미선택 1은 선택)
                        enroll_price INT NOT NULL, -- 총 수강 가격 (교재 선택 여부에 따라 달라짐)
                        book_name VARCHAR(100) NOT NULL -- 교재 이름
);


INSERT INTO enroll VALUES(DEFAULT, 1, "park", DEFAULT, DEFAULT, 141000, "리딩북");


-- 결제 테이블 생성
create table payment(
                        sno serial primary key,
                        cid varchar(20) not null,
                        pno integer not null,
                        amount integer default 1,
                        pmethod varchar(100),
                        pcom varchar(100),
                        cnum varchar(100),
                        payprice integer default 1000,
                        dno varchar(100)
);












