
-- int 숫자형 타입
-- auto_increment : 자동으로 1씩 증가하며 들어가는 키워드
-- datetime 시간을 넣어주는 타입
-- default : 따로 값을 넣어주지 않는 한 지정된 초기값이 들어가도록 하는 키워드
-- now() : sql 프로그램 안 현재시간을 자동으로 넣어주는 함수

select * from board;
--DELETE FROM touristSpots;
select * from userInfo;

--DELETE FROM board WHERE idx IN (10, 11);


select * from touristSpots;
select * from works;
-- DROP TABLE IF EXISTS works;

--작품테이블

--drop table touristSpots;
CREATE TABLE works
(
    workID        int auto_increment    NOT NULL, 
    mediaType     CHAR(1)            NOT NULL, 
    title         VARCHAR(50)        NOT NULL, 
    location      VARCHAR(50)      NOT NULL,
    location2      VARCHAR(50)      NOT NULL,
    PRIMARY KEY (workID)
);


CREATE TABLE touristSpots
(
    touristName VARCHAR(300) NOT NULL, 
location VARCHAR(100) NOT NULL,
location2 VARCHAR(100) NOT NULL,
    description VARCHAR(500) NULL,
    keyWord VARCHAR(100) NULL,
    PRIMARY KEY (touristName)
);



CREATE TABLE board (
    boardIdx INT AUTO_INCREMENT PRIMARY KEY,  -- 게시물 고유 식별자 (자동 증가)
    id VARCHAR(30) NOT NULL,                  -- 작성자 아이디
    boardTitle VARCHAR(500) NOT NULL,         -- 게시물 제목
    boardContent TEXT NOT NULL,      -- 게시물 내용
    created DATETIME NOT NULL,                   -- 게시물 작성일
    views INT NULL,                       -- 조회수
    commentNum INT NULL,                  -- 댓글 그룹 번호
    commentIdx INT NULL,                  -- 댓글 순서
    commentContent TEXT NULL,    -- 댓글 내용
    commentCreated DATETIME NULL              -- 댓글 작성일
);

--drop table board;

INSERT INTO board (boardIdx, id, boardType, 
boardTitle, boardContent, created, views, 
commentNum, commentIdx, commentContent, commentCreated)
VALUES ('1', '황동휘', 'y', 'ss', 'ss', '1993-06-03', '1', '1', '1', 'dd', '1993-06-03');


SELECT * FROM board;
-- int 숫자형 타입
-- auto_increment : 자동으로 1씩 증가하며 들어가는 키워드
-- datetime 시간을 넣어주는 타입
-- default : 따로 값을 넣어주지 않는 한 지정된 초기값이 들어가도록 하는 키워드
-- now() : sql 프로그램 안 현재시간을 자동으로 넣어주는 함수

CREATE TABLE userInfo
(
    id VARCHAR(30) NOT NULL,		-- 회원 고유 식별자 (아이디)
    pw VARCHAR(30) NOT NULL,		-- 비밀번호
    name VARCHAR(20) NOT NULL,		-- 이름
    phone VARCHAR(50) NOT NULL,		-- 전화번호
    email VARCHAR(50) NOT NULL,		-- 이메일
    region VARCHAR(20) NOT NULL,	-- 지역
    gender CHAR(1) NOT NULL,		-- 성별
    birthdate DATE NOT NULL,		-- 생년월일
    title VARCHAR(50),				-- 선호작품
    keyWord VARCHAR(20),				-- 선호카테고리
    PRIMARY KEY (id)
);

SELECT * FROM userInfo;

INSERT INTO board (id, pw, name, phone, email, region, gender, birthdate, title, keyWord)
VALUES ('황동휘', '1234', '황동휘', '01000000000', 'as@naver.com', '아시아', 'M', '1993-06-03', '도깨비', '역사, 문화시설');


WHERE id = 'as';



	









