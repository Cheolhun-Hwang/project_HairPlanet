create table user(
	uid 		int(20)			NOT NULL AUTO_INCREMENT,
    uuid		varchar(20)		NOT NULL,
    uname 		varchar(20) 	NOT NULL,
    upwd		varchar(50)		NOT NULL,
    uphone		varchar(20)		NOT NULL,
	ucreate		varchar(30)		NOT NULL,
    upoint		int(30)			NOT NULL,
    isUse		int(5)			NOT NULL,
    utwhy		int(5)			NULL,
    PRIMARY KEY (uid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO user (uuid, upwd, uname, uphone, ucreate, upoint) values ('qewqsa', 'hch', '황철훈', '010-4826-0178', '2017-12-10', 0, 0);
INSERT INTO user (uuid, upwd, uname, uphone, ucreate, upoint) values ('user', 'user', '임시유저', '000-0000-0000', '2017-12-10', 0, 0);
INSERT INTO user (uuid, upwd, uname, uphone, ucreate, upoint) values ('mijeong94', 'user', '김미정', '000-0000-0000', '2017-12-10', 0, 0);
INSERT INTO user (uuid, upwd, uname, uphone, ucreate, upoint) values ('jason2213', 'user', '김철주', '000-0000-0000', '2017-12-10', 0, 0);
INSERT INTO user (uuid, upwd, uname, uphone, ucreate, upoint) values ('ericnam', 'user', '이병헌', '000-0000-0000', '2017-12-10', 0, 0);

create table qa(
	qaid 		int(20)			NOT NULL AUTO_INCREMENT,
    uid			int(20)			NOT NULL,
    qadate 		varchar(30) 	NOT NULL,
	qacontext	varchar(100)	NOT NULL,
    PRIMARY KEY (qaid),
    FOREIGN KEY (uid) REFERENCES user (uid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO qa (uid, qadate, qacontext) values (3, '2017-12-10', '가격도 괜찮았고 직접 원하는 스타일 미리 공유하고 가니까 헤어디자이너분이 더 신경써서 설명해주셨어요!! 앞으로 자주 이용할 것 같아요!!!! 넘나 만족인것~');
INSERT INTO qa (uid, qadate, qacontext) values (4, '2017-12-10', '헤어플래닛 너무너무 편하고 좋습니다. 전화로 예약하기 좀 그런경우 많은데 헤어플래닛으로 편하게 시간대별 디자이너별 시술 예약할 수 있어서 너무 좋아요!!');
INSERT INTO qa (uid, qadate, qacontext) values (5, '2017-12-10', '모르는 곳 가서도 디자이너분 선택해서 잘 이용하였네요. 그런데... 해당 디자이너분이 그만두신건지 안보이시는데;; 디자이너 검색도 있었으면 좋겠습니다 ㅎㅎ');

create table admin(
	adid 		int(20)			NOT NULL AUTO_INCREMENT,
    aduid 		varchar(15) 	NOT NULL,
    adpwd		varchar(50)		NOT NULL,
    adname		varchar(20)		NOT NULL,
    PRIMARY KEY (adid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO admin (aduid, adpwd, adname) values ('admin', 'admin', '관리자');

create table shops(
	sid 		int(20)			NOT NULL AUTO_INCREMENT,
    sname 		varchar(30) 	NOT NULL,
    sdate		varchar(30)		NOT NULL,
    skey		varchar(50)		NOT NULL,
    sddr		varchar(50)		NOT NULL,
    sgpsx		double			NOT NULL,
    sgpsy		double			NOT NULL,
    sphone		varchar(20)		NOT NULL,
    srepre		varchar(20)		NOT NULL,
    sopen		varchar(20)		NOT NULL,
    srest		varchar(20)		NOT NULL,
    spaking		varchar(20)		NOT NULL,
    sinfo		varchar(1000)	DEFAULT NULL,
    sphoto1		varchar(50)		NOT NULL,
    sphoto2		varchar(50)		DEFAULT NULL,
    sphoto3		varchar(50)		DEFAULT NULL,
    PRIMARY KEY (sid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('이철헤어커커 가락점', '2017-12-10', '#인기#남성#여성', '서울 송파구 중대로9길 35', 37.496285, 127.118326, '02-400-2326', '신유섭', '10:30 - 21:00', '연중무휴',
		'건물 내 주차 가능합니다.', ' 이철헤어커커는 보다 감각적인 삶을 원하는 대중들을 위한 매스티지 브랜드로 고객의 라이프스타일에 스타일을 더해 가치를 창조하는 뷰티 브랜드입니다.
대중적으로 접근이 가능한 합리적인 가격대에 높은 퀄리티의 서비스를 접목시키고, 아름다움을 추구하는 권리는 모든 사람들에게 평등하게 주어져야 한다는 기업 철학을 바탕으로 모든 고객이 동일한 가치를 느낄 수 있도록 전국 매장의 인테리어와 서비스를 비롯한 다양한 문화에 Magic 8이라는 동일한 아이덴티티를 부여합니다.
1988년 이철헤어커커가 시작된 이래로 우리는 세계적인 문화 예술의 시대정신과 함께 하여 숙련되고 창의적인 디자인 재능을 개발해 왔습니다.', 'images/shops/1-1.PNG', 'images/shops/1-2.PNG', 'images/shops/1-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('박승철헤어스투디오 센텀시티점', '2017-12-10', '#인기#여성#심야', '부산광역시 해운대구 센텀동로 25', 35.171605, 129.130983, '051-744-8845', '윤창정', '10:30 - 20:00', '매주 월요일',
		'건물 내 주차 가능합니다.', ' 저희 박승철헤어스투디오 센텀시티2호점은 항상 고객님의 소리에 귀를 귀울이고있습니다. 잘해주신거 많이 칭찬해주시고 불편하신점은 담당선생님하고 시술내용을 이야기해주시면 교육을 통해 수정보완해서 다신 그런일없도록 노력하는 센텀시티2호점 박승철이 되도록 노력하겠습니다.^^~; 항상 저희 지점은 케라스타즈, 로레알, 무알카리펌제, 일본무코타을 사용하고있으며 고객님앞에서 보이는곳에서 오픈하는것을 철칙으로하고 있습니다.', 'images/shops/2-1.PNG', 'images/shops/2-2.PNG', 'images/shops/2-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('차홍아르더 청담힐', '2017-12-10', '#인기#남성#여성', '서울특별시 강남구 압구정로80길 30 삼도빌딩', 37.524825, 127.044290, '02-400-2326', '이은실', '10:00 - 21:00', '연중무휴',
		'건물 내 주차 공간이 없습니다.', '한국인 최초 로레알 프로페셔널 파리의 세계적인 아티스트로 선정된 차홍원장이 이끄는 청담동미용실 차홍아르더 청담갤러리, 청담파크, 청담힐은 헤어, 메이크업 ,네일 전문가들이 수많은 셀렙들의 스타일은 물론 가장 트랜디한 스타일과 프라이빗한 고급서비스를 전달하는 공간입니다. 
2015, 2016년 연속 국가브랜드 대상을 수상한 차홍에서 그동안 경험하지 못했던 최상의 서비스와 디자인을 만나보세요.', 'images/shops/3-1.PNG', 'images/shops/3-2.PNG', 'images/shops/3-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('리안헤어 대구동성로점', '2017-12-10', '#인기#남성#여성#심야', '대구광역시 중구 동성로2길 24', 35.867054, 128.596415, '053-423-3040', '이지아', '09:00 - 21:30', '매주 수요일',
		'건물 내 주차 가능합니다.', '고객 선호도 1위 , 리뷰 만족도 100%를 자랑하는 동성로 미용실, 편안한 분위기의 인테리어, 최고의 서비스, 동성로 리안헤어만의 차별화된 스타일로 아름다움을 선사합니다.', 'images/shops/4-1.PNG', 'images/shops/4-2.PNG', 'images/shops/4-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('이가자헤어비스 동탄점', '2017-12-10', '#인기#남성#여성#웨딩', '경기도 화성시 동탄중심상가1길 5', 35.834451, 128.719834, '031-613-2280', '정락', '10:30 - 21:00', '연중무휴',
		'건물 내 주차 가능합니다.', '이철헤어커커는 보다 감각적인 삶을 원하는 대중들을 위한 매스티지 브랜드로 고객의 라이프스타일에 스타일을 더해 가치를 창조하는 뷰티 브랜드입니다.
대중적으로 접근이 가능한 합리적인 가격대에 높은 퀄리티의 서비스를 접목시키고, 아름다움을 추구하는 권리는 모든 사람들에게 평등하게 주어져야 한다는 기업 철학을 바탕으로 모든 고객이 동일한 가치를 느낄 수 있도록 전국 매장의 인테리어와 서비스를 비롯한 다양한 문화에 Magic 8이라는 동일한 아이덴티티를 부여합니다.
1988년 이철헤어커커가 시작된 이래로 우리는 세계적인 문화 예술의 시대정신과 함께 하여 숙련되고 창의적인 디자인 재능을 개발해 왔습니다.', 'images/shops/5-1.PNG', 'images/shops/5-2.PNG', 'images/shops/5-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('머리하는남자 전북대점', '2017-12-10', '#남성#여성', '경기도 화성시 동탄중심상가1길 5', 35.841275, 127.127671, '070-8830-8913', '준호', '10:00 - 21:00', '연중무휴',
		'건물 내 주차 가능합니다.', '여성고객님 단골도 많지만 특히 남자는 머리하는남자에서 머리해야 한다는 전북대에서 소문난 미용실!! 전주미용실/ 전북대 미용실 머리하는남자 입니다. ^^ 저렴한가격과 좋은제품(시세이도,밀본)으로 고객님과 소통하여 전주에서 소문난 좋은 제품으로 기장추가없는 미용실!! 여자머리는 당연히 잘하고 남자머리 또한 잘하는 미용실  여성머리 열펌, 염색 전문 미용실 / 남자전문미용실 / 남성 아이롱펌 전문 타 미용실에서 체인이라고 터무니없이 높은 가격으로 받지 마시고 한번 와보세요.', 'images/shops/6-1.PNG', 'images/shops/6-2.PNG', 'images/shops/6-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('지오헤어 위례 중앙타워점', '2017-12-10', '#남성#여성#아이', '서울 송파구 위례광장로 230 ', 37.479739, 127.144021, '02-400-8185', '이정미', '09:30 - 20:00', '매주 화요일',
		'건물 내 주차 공간이 없습니다.', '안녕하세요, 준오헤어 위례 중앙타워점입니다. 가장 떠오르고 있는 신도시 위례에 준오헤어 가든 위례 중앙타워점이 오픈하였습니다. 준오헤어 가든 위례 중앙타워점은1,2층으로 되어있으며 준오헤어의 과거를 돌이켜보고, 현재와 미래를 바라보는 컨셉으로 디자인 되었습니다.', 'images/shops/7-1.PNG', 'images/shops/7-2.PNG', 'images/shops/7-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('오다헤어 중앙대점', '2017-12-10', '#인기#여성#특수#네일', '서울특별시 동작구 흑석로 106-5 3F', 37.442848, 127.153518, '02-812-6999', '고영태', '10:00 - 21:00', '연중무휴',
		'건물 내 주차 공간이 없습니다.', '오다헤어 중앙대점은 합리적인 가격과 1:1고객맞춤서비스로 고객님만의 개성과 스타일을 표현해 드립니다~ 방문해 주시는 고객님께 항상 웃음과 만족을 드리도록 최선을 다하겠습니당~', 'images/shops/8-1.PNG', 'images/shops/8-2.PNG', 'images/shops/8-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('살롱드도로시 2호점', '2017-12-10', '#인기#남성#여성#네일#웨딩', '충청북도 충주시 호암동 140-2', 36.954288, 127.940611, '043-855-8778', '희재', '11:00 - 18:30', '매주 수요일',
		'건물 내 주차 가능합니다.', '대형살롱 출신 디자이너들이 직접 시술해 주는 충주 최고 헤어샵으로, 디자인커트, 프로페셔널 컬러, 열펌 전문의 프리미엄 헤어살롱 입니다! 이제 차별화 된 시스템과 실력으로 준비된 “살롱드 도로시“에서  최고의 디자이너와 함께, 인생에 가장 아름다운 순간을 만들어보세요!', 'images/shops/9-1.PNG', 'images/shops/9-2.PNG', 'images/shops/9-3.PNG');

INSERT INTO shops (sname, sdate, skey, sddr, sgpsy, sgpsx, sphone, srepre, sopen, srest, spaking, sinfo, sphoto1, sphoto2, sphoto3) 
values ('그라티아', '2017-12-10', '#인기#남성#여성#네일#웨딩', '서울특별시 마포구 동교로19길 20', 37.557237, 126.917805, '02-324-9421', '정용하', '10:00 - 21:30', '연중무휴',
		'건물 내 주차 가능합니다.', '홍대 최대의 규모와 홍대 유일의 전원주택 헤어살롱 그라티아입니다. 고급스러운 분위기와 자연속에서 몸과 마음의 여유를 가지며 헤어, 케어, 메이크업, 웨딩 등을 받으실 수 있으며 청담동출신 최고의 헤어디렉터와 메이크업아티스트의 특별하고 감성적인 서비스를 받으실 수 있는 VIP 프리미엄 헤어살롱입니다.', 'images/shops/10-1.PNG', 'images/shops/10-2.PNG', 'images/shops/10-3.PNG');

create table sdesiner(
	sdid 		int(20)			NOT NULL AUTO_INCREMENT,
    sid			int(20)			NOT NULL,
    sdname 		varchar(15) 	NOT NULL,
    PRIMARY KEY (sdid),
    FOREIGN KEY (sid) REFERENCES shops (sid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;
  
INSERT INTO sdesiner (sid, sdname) values (1, '신유섭');
INSERT INTO sdesiner (sid, sdname) values (1, '지은');
INSERT INTO sdesiner (sid, sdname) values (1, '다인');

INSERT INTO sdesiner (sid, sdname) values (2, '사라');
INSERT INTO sdesiner (sid, sdname) values (2, '정철');
INSERT INTO sdesiner (sid, sdname) values (2, '주은호');
INSERT INTO sdesiner (sid, sdname) values (2, '민준');

INSERT INTO sdesiner (sid, sdname) values (3, '연주');
INSERT INTO sdesiner (sid, sdname) values (3, '수지');

INSERT INTO sdesiner (sid, sdname) values (4, '권명희');
INSERT INTO sdesiner (sid, sdname) values (4, '니시');
INSERT INTO sdesiner (sid, sdname) values (4, '노을');

INSERT INTO sdesiner (sid, sdname) values (5, '수현');
INSERT INTO sdesiner (sid, sdname) values (5, '태이');
INSERT INTO sdesiner (sid, sdname) values (5, '태양');

INSERT INTO sdesiner (sid, sdname) values (6, '수빈');
INSERT INTO sdesiner (sid, sdname) values (6, '김호');
INSERT INTO sdesiner (sid, sdname) values (6, '정원');

INSERT INTO sdesiner (sid, sdname) values (7, '솔이');
INSERT INTO sdesiner (sid, sdname) values (7, '한진호');

INSERT INTO sdesiner (sid, sdname) values (8, '김현서');
INSERT INTO sdesiner (sid, sdname) values (8, '시우');
INSERT INTO sdesiner (sid, sdname) values (8, '미료');
INSERT INTO sdesiner (sid, sdname) values (8, '유리');

INSERT INTO sdesiner (sid, sdname) values (9, '성일');
INSERT INTO sdesiner (sid, sdname) values (9, '현진');

INSERT INTO sdesiner (sid, sdname) values (10, '신현주');
INSERT INTO sdesiner (sid, sdname) values (10, '유라');
INSERT INTO sdesiner (sid, sdname) values (10, '지혜');

create table sbest(
	sbid 		int(20)			NOT NULL AUTO_INCREMENT,
    sid			int(20)			NOT NULL,
    sbhairname 	varchar(40) 	NOT NULL,
    sbhairimage varchar(50) 	NOT NULL,
    PRIMARY KEY (sbid),
    FOREIGN KEY (sid) REFERENCES shops (sid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;
  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (1, '5:5 가르마펌', 'images/man1.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (1, '층낸머리 롱 리즈펌', 'images/woman1.PNG'); 
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (1, '단발머리 투블럭컷', 'images/man2.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (2, '긴얼굴 시스루뱅 올여름 염색', 'images/woman2.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (2, '포마드 스타일링', 'images/man3.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (2, '단발머리 볼륨펌 리즈 마호가니 포인트컬러', 'images/woman12.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (3, '어중간한머리 시스루뱅', 'images/woman3.PNG'); 
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (3, '5:5 가르마펌', 'images/man4.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (3, '앞머리있는 긴머리웨이브 리즈펌', 'images/woman4.PNG'); 
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (4, '볼륨펌', 'images/man5.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (4, '리즈 c컬펌', 'images/woman5.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (4, '투블럭컷', 'images/man6.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (5, '로즈 뱅 웨이브', 'images/woman6.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (5, '포마드 투블럭컷', 'images/man7.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (5, '굵은웨이브 글램 리즈펌', 'images/woman7.PNG');   
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (6, '세미 투블럭컷 스핀스왈로펌', 'images/man8.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (6, '단발머리 시스루뱅', 'images/woman8.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (6, '투블럭 쉐도우펌', 'images/man9.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (7, '레이어드컷 긴머리 리즈펌', 'images/woman9.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (7, '투블럭 포마드', 'images/man10.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (7, '단발머리 리즈펌', 'images/woman10.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (8, '투블럭 웨이브펌', 'images/man11.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (8, '라인브릿지 컬러', 'images/woman11.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (8, '포마드 투블럭컷', 'images/man12.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (9, '단발머리 볼륨펌 리즈 마호가니 포인트컬러', 'images/woman12.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (9, '5:5 가르마펌', 'images/man1.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (9, '층낸머리 롱 리즈펌', 'images/woman1.PNG'); 
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (10, '단발머리 투블럭컷', 'images/man2.PNG');
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (10, '긴얼굴 시스루뱅 올여름 염색', 'images/woman2.PNG');  
INSERT INTO sbest (sid, sbhairname, sbhairimage) values (10, '포마드 스타일링', 'images/man3.PNG');

create table sprice(
	spid 		int(20)			NOT NULL AUTO_INCREMENT,
    sid			int(20)			NOT NULL,
    sptype		varchar(10)		NOT NULL,
    sphairname 	varchar(40) 	NOT NULL,
    spbprice 	int(30)			 	NOT NULL,
    spdprice 	int(30) 		NOT NULL,
    PRIMARY KEY (spid),
    FOREIGN KEY (sid) REFERENCES shops (sid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;
  
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (1, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (1, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (1, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (1, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (1, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (1, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (2, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (2, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (2, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (2, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (2, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (2, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (3, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (3, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (3, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (3, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (3, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (3, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (4, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (4, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (4, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (4, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (4, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (4, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (5, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (5, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (5, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (5, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (5, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (5, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (6, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (6, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (6, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (6, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (6, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (6, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (7, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (7, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (7, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (7, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (7, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (7, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (8, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (8, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (8, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (8, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (8, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (8, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (9, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (9, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (9, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (9, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (9, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (9, 'A','프리미엄 셋팅', 135000, 130000);

INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (10, 'M','남성 컷트', 10000, 8000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (10, 'W','여성 컷트', 12000, 10000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (10, 'M','남성 뿌리염색', 30000, 27000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (10, 'W','여성 뿌리염색', 59000, 49000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (10, 'A','프리미엄 매직', 210000, 200000);
INSERT INTO sprice (sid, sptype, sphairname, spbprice, spdprice)
values (10, 'A','프리미엄 셋팅', 135000, 130000);

create table appoint(
	apid 		int(20)			NOT NULL AUTO_INCREMENT,
    uid			int(20)			NOT NULL,
    sid			int(20)			NOT NULL,
    sdid		int(20)			NOT NULL,
    spid		int(20)			NOT NULL,
    apdate		varchar(30)		NOT NULL,
    apupoint 	int(30) 		NOT NULL,
    apapoint 	int(30)			NOT NULL,
    aprprice 	int(30) 		NOT NULL,
    PRIMARY KEY (apid),
    FOREIGN KEY (uid) REFERENCES user (uid),
    FOREIGN KEY (sid) REFERENCES shops (sid),
    FOREIGN KEY (sdid) REFERENCES sdesiner (sdid),
    FOREIGN KEY (spid) REFERENCES sprice (spid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

create table trend(
	tid 		int(20)			NOT NULL AUTO_INCREMENT,
    ttype		varchar(10)		NOT NULL,
    ttitle		varchar(30)		NOT NULL,
    tdate 		varchar(30) 	NOT NULL,
    tcontext 	varchar(1000)	NOT NULL,
    timage 		varchar(50) 	NOT NULL,
    PRIMARY KEY (tid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;
  
INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '5:5 가르마펌', '2017-12-10', '투블럭 댄디펌으로 연출 하였는데요 중간 기장의 5:5 가르마 헤어는 조금 애매할 수 있는 스타일이라 연출하기에 
다소 까다로운 스타일인데요,   자칫 올드한 스타일이 될수 있기 때문에   남자 5:5 가르마 스타일을 원하시는 분들께는 펌을 하시는것을 추천해 드려요^^ 
오늘 소개해 드리는 남자 5:5 가르마펌 투블럭 댄디펌은 중간기장에 볼륨을 충분하게 살렸는데요 
리드미컬한 s컬의 웨이브로 연출하여 5:5 가르마 헤어스타일의 부자연스러움을 잡아주었고 
가르마 부분에 볼륨을 많이 살려 캐주얼한 멋스러움을 연출하여 주었어요 
뒷머리 네이프 부분에는 디자인 컷을 넣어 딱딱할 수 있는 가르마펌 스타일에 독특한 개성을 부여한 스타일입니다^^ 
컬러는 다크브라운 컬러로 고급스러우면서도 차분함을 주는 컬러에요 
피부톤은 보정해주며,또렷한 인상을 주는 컬러라고 생각해요^^ 
중간머리 기장이라고 해도 라인 자체는 깔끔하게 투블럭 컷으로 연출 하였기 때문에 무더운 올여름에도 추천해드리는 개성있는 헤어스타일 이에요^^ 
남자 5:5 가르마펌 투블럭 댄디펌으로 댄디 하면서도 개성있는 남자 헤어스타일 연출하셔도 좋으실것 같아요^^',
'images/man1.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '단발머리 투블럭컷', '2017-12-10', '중성적인 매력의 단발머리 와 투블럭컷 의 만남! 개성있는 남자머리스타일이 아닐까 생각해요^^ 
트렌드의 변화에 따라 투블럭컷을 하나의 개성으로 받아들이고 많이들 시도하는 추세인데요,남자분들 중 투블럭컷 을 안해본 분들이 없을정도로 기존에 많이들 고수하던 댄디하고 단정한 짧은 남자머리 에서 
개성있는 투블럭컷 스타일을 많이들 선호 하고 있는데요. 
투블럭컷 중에서도 단발머리 기장으로의 변신을 통해 중성적인 매력과 더불어 신비롭고 분위기 있는 스타일을 연출하였어요 
날씨가 더워지면서 라인 자체가 지저분한것을 원치 않으시고, 깔끔함을 원하기 때문에 누구나 할거 없이 투블럭컷은 남자분들 헤어스타일중 기본으로 자리잡고 있는거 같아요 
오늘 소개해드리는 스타일은 단발머리 와 투블럭컷의 조합으로 새로운 트렌드의 남자머리스타일 이라고 말씀드릴수 있는데요, 헤어스타일 만으로도 강한 개성을 어필할 수 있기 때문에 조화로운 연출이 가능할거 같아요^^ 
컬러는 네추럴브라운 컬러로 고급스러우면서도 부드러운 인상을 주는 무난하게 소화할수 있는 컬러에요. 
올여름 좀 더 개성있고 트렌디한 스타일을 원하시는 남성분들께 추천해드리는 개성있는 남자머리스타일 투블럭컷 으로 변신! 하셔도 좋으실것 같아요',
'images/man2.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '포마드 스타일링', '2017-12-10', '손질하기 쉬운 포마드 스타일 남자가르마 스타일링법 알려드릴께요^^ 
포마드 스타일링의 7:3 , 8:2 많이 하고 계시는데요. 깔끔하게 비스듬한 사선으로 연출을 하되 좀 더 세련되고 지적인 이미지를 연출할 수 있는 스타일이라고 말씀드리고 싶어요 
정수리 볼륨과 앞머리 볼륨을 풍성하게 살려 포마드 스타일과는 달리 매트하게 연출된 스타일 입니다. 
극단적인 투블럭 느낌 보다는 전체적으로 헤어라인은 깔끔하면서도 옆머리와 오버파트의 포마드 헤어스타일로 고급스럽고 댄디한 이미지의 남성상을 연출 해 주어요 
손질 못하시는 분들을 위한 손질편한 머리스타일 인데요. 
펌으로 가볍게 말려만 주어도 볼륨감 있게 연출하실수 있으시지만 , 가벼운 드라이를 원하시는 분들은 드라이로 틀을 잡아준 다음 왁스를 발라 연출하시면 깔끔하고 세련된 헤어스타일 연출하실수 있으실 거라 생각해요!^^ 
사이드가 많이 뜨는 분들은 왁스를 겉에만 바르는게 아니라, 속안까지 꼼꼼하게 발라주시고 드라이기 열 바람으로 잡아주시면 오랜 시간 동안 깔끔하게 유지 되시니 참고 하시면 좋으실것 같아요^^ 
기장이 많이 길지 않은 스타일 이기에 광대밑으로 얼굴형 커버는 어려운 점이 있지만 , 각진 얼굴형 , 역삼각 얼굴형을 지닌 분들께 적합한 스타일 이라고 생각해요 
깔끔한 스타일 임에도 불구하고 다소 날카로운 인상을 가진 분들께 부드러운 이미지를 부여할 수 있어요 
포멀한 느낌의 룩과 단정하고 깔끔한 차림의 캐주얼룩에 매치하시면 무난하게 어울릴것 같아 추천해 드러요','images/man3.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '5:5 가르마펌', '2017-12-10', '멋을 아는 남자로의 변신을 이끌어 줄 5대5 가르마펌 스타일 입니다. 
남자 머리스타일도 자연스러운 c컬 펌을 넣으면 많은 손질을 필요로 하지 않는 손질쉬운 헤어스타일을 연출 하실 수 있으세요.
깔끔하고 댄디한 느낌의 컷 스타일로 컬러는 다크 브라운 으로 차분함을 주었어요 
기장이 길지 않은 5대5 가르마펌 스타일이기에 광대 밑으로의 얼굴형 커버는 어려운 점이 있기 때문에 광대의 단점이 있는 각진 얼굴형 , 역삼각 얼굴형을 지닌 분들께 적합한 스타일 이라고 생각해요. 
5대5 가르마펌은 다소 날카로운 인상을 지닌 분들께 부드러운 이미지를 부여할 수 있는 스타일이에요. 
턱선과 하관이 부각되는 얼굴형을 가진 분들께는 그 단점을 부각시킬 수 있으니
스타일링 하실 때 참고하시면 좋으실 것 같아요 
댄디하고 부드러운 남성상을 연출 할 수 있는 스타일이기에 
댄디룩이나 캐주얼한 느낌을 강조한 코디에 매치하셔도 좋으실것 같아요 
라인 자체는 깔끔한 느낌이기 때문에 긴머리의 남자 머리스타일 이라해도 깔끔하면서도 멋스러운 연출 가능하실것 같아요^^',
'images/man4.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '볼륨펌', '2017-12-10', '볼륨감있는 볼륨펌 스타일로 투블럭컷과 남자 볼륨펌 스타일의 만남으로 
댄디함과 캐주얼한 멋을 연출할 수 있는 헤어스타일이에요^^ 
투블럭 컷을 기반으로 한 스타일에 리젠트펌과 번트브라운 컬러가 만나 깔끔하고 단정하면서도 그 범주를 벗어나지 않는 선에서 개성있고 액티브한 멋을 연출 할 수 있는 헤어스타일이 아닐까 생각해요. 
번트브라운 컬러는 브라운에 살짝 붉은 느낌의 컬러가 가미되어 남자분들이 무난하게 멋스럽게 소화할수 있는 컬러에요. 
투블럭컷으로 볼륨감있는 헤어에, 라인은 깔끔하게 정리하여, 
전체적으로 댄디한 깔끔한 느낌의 단정한 남자머리 스타일이에요. 
리젠트펌의 풍성한 볼륨이 주 포인트가 되는 남자 볼륨펌 스타일이기에 얼굴에 각이 많은 역삼각형 얼굴형 , 긴 얼굴형 ,
각진 얼굴형에 부드러운 쉐입을 주어 단점을 자연스럽게 커버하며 부드럽고 편안한 인상을 줄 수 있는 스타일이에요. 
어울리는 패션 또한 수트를 기반으로 한 룩부터 스포티한 룩까지 폭넓은 매치가 가능한 헤어스타일이니 
참고 하시면 좋으실것 같아요 
남성분들도 다양하고 개성있는 헤어스타일을 많이 선호 하시는데요. 올겨울 남자볼륨펌 , 투블럭컷 으로 댄디하고 멋스러운 단정한 스타일 연출하셔도 좋으실것 같아요.',
'images/man5.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '투블럭컷', '2017-12-10', '이번 시즌 남자머리 스타일의 대세였던 투블럭컷을 좀 더 개성있는 개성강하게 
표현하기 위해 앞머리 까지 단차를 낸 투블럭컷에 베이비 브라운의 골드빛 도는 컬러로 입체감있게 표현한 유니크한 남자머리 스타일이에요 
베이비브라운의 고급스러움과 스모크 브라운의 매트함으로 부드러운 남성미를 표현할수 있는 투블럭컷 스타일인데요 
유니크한 투블럭컷으로 강한 개성있는 남자머리를 연출할수 있는 반면, 
얼굴형에 많은 제약이 따르는 것도 사실이지만, 길이에 따라 조절이 어느 정도 가능하세요^^ 
손질을 잘못하시는 분들은 투블럭 펌으로 좀 더 자연스러운 남자머리 스타일 연출 가능하시고, 
사이드가 많이 뜨시는 분들은, 사이드 부분펌으로 손질 쉽게 연출 하실수 있으실것 같아요~^^',
'images/man6.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '포마드 투블럭컷', '2017-12-10', '투블럭컷이 베이스로 들어간 포마드를 사용해 오버가르마된 스타일을 연출하였는데요 
깔끔한 스타일인 만큼 다크브라운 컬러로 포마드 투블럭 머리스타일과 함께 안정감을 주어 
전체적으로 깔끔하게 쳐낸 옆머리 라인과 오버파트의 가르마로 연출한 포마드 헤어스타일로 
고급스럽고 댄디한 이미지의 남성상을 연출하였습니다 
포마드 투블럭 스타일은 둥근 얼굴형이나 긴 얼굴형을 가진 분들은 
오히려 단점을 부각되어 보일 수 있으니 주의 하시면 좋으실것 같아요 
모발 자체가 가늘거나 힘이 없는 모발은 제품 손질 만으로는 포마드 가르마 연출이 어려우실수 있으세요 
머리손질이 어려우신 분들은 휠펌이나 볼륨펌으로 포마드 투블럭 머리스타일 좀 더 쉽게 연출 가능하실것 같으세요^^ 
올가을 깔끔하고 댄디한 남자머리 스타일 포마드 투블럭 으로 좀 더 젠틀한 남성미 연출하셔도 좋으실것 같아요^^',
'images/man7.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '세미 투블럭컷 스핀스왈로펌', '2017-12-10', '세미 투블럭컷이 기반된 스핀스왈로펌 단차를 심하게 내지 않은 세미 투블럭컷과 두꺼운 호수를 사용하여 
와인딩과 부분부분 포인트로 들어간 휠펌으로 정형화된 컬의 느낌이 아닌 유연하고 개성있는 컬의 흐름을 만들었어요^^ 
거기에 좀 더 극적인 연출을 하고자 붉은 갈색빛의 번트브라운 컬러로 
좀 더 생동감 있는 컬링과 개성있는 스타일을 연출하였습니다 
머리를 세워서 왁스를 바르는 방법으로 깔끔하고 댄디한 이미지를 연출 할 수 있으세요~ 
볼륨을 살짝 죽이고 컬의 결감을 더욱 살려 왁스를 바르는방법으로는 
빈티지하고 러프한 개성이 있는 이미지를 연출할 수 있으세요^^ 
세미 투블럭컷과 스핀스왈로펌이 만난 스타일로 이번 헤어스타일의 가장 두드러지는 이미지는 
깔끔함과 댄디한 멋이 아닐까 생각해요^^',
'images/man8.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '투블럭 쉐도우펌', '2017-12-10', '남자헤어스타일의 기본이라 할수있는 투블럭 컷 스타일에서 단차를 최소한으로 줄인 세미 투블럭 스타일로 
전체적인 디자인을 잡고 탑부분에는 탄력있는 c컬 웨이브를 불규칙하게 넣어 
겉은 거칠지만 속은 부드럽고 섬세한 남성의 이미지를연출한 쉐도우펌 스타일이에요 
풍성한 투블럭 쉐도우펌 스타일을 표현하기 위해 세미 투블럭컷으로 라인을 정리하여 
깔끔함을 주고 탑쪽의 긴 모발에 쿠션펌을 진행하였고 
컬러는 입체감과 볼륨감을 더욱 살리기 위해 번트브라운 컬러를 입혔지만 
톤 다운을 시켜 디자인에서 오는 다소 거친 느낌을 중화시켜 주었습니다 
투블럭컷 스타일이 기본적으로 들어가있는 스타일이지만 단차가 미약하게 들어갔으며, 
탄력있는 쉐도우펌 웨이브가 주는 탑과 사이드의 볼륨감으로 광대와 턱이 부각되는 얼굴형인 
역삼각형 얼굴형과 각진 얼굴형을 가지신 분들에게 얼굴에 부드러운 쉐입을 부여할수 있는 헤어스타일이라 생각해요',
'images/man9.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '투블럭 포마드', '2017-12-10', '개성있고 톡톡톡튀는 헤어스타일 이라기 보다는 단정하고 격식있는 
이미지를 연출할수 있는 무난하게 남성분들이 소화할수 있는 스타일 인데요^^ 
포마드헤어와 단차가 강한 투블럭컷을 매치하여 좀 더 댄디하고 고급스러운 이지미를 연출할수 있는 스타일입니다^^ 
꾸준하게 남성분들께 사랑받고 있는 포마드를 사용한 스타일링과 투블럭컷을 기반으로 하는 다양한 스타일링 인데요 
이에 투블럭포마드 스타일 또한, 새롭게 각광 받는 남자머리스타일로 급부상하고 있는 추세에요^^ 
단차가 심한 투블럭컷의 경우 얼굴형 보완이라는 측면에서는 사실상 많은 단점을 찾을 수 있는 스타일이지만, 
서구형 얼굴이라 할 수 있는 긴 얼굴형, 각진 얼굴형, 역삼각 얼굴형 같이 볼살이 크게 부각되지 않는 슬림한 얼굴형에는 무난하게 소화할수 있는 남자머리스타일로 추천해드려요',
'images/man10.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '투블럭 웨이브펌', '2017-12-10', '이제는 남자머리스타일의 베이스라 할 수 있는 투블럭컷을 바탕으로 남자 웨이브펌 으로 표현하고 
다크 브라운컬러로 댄디한 멋을 입힌 남성미 짙은 남자머리스타일 이에요 
시원스러운 남자머리스타일 투블럭 웨이브펌은 러프하면서도 댄디한 멋을 내는 스타일로 적극 추천 해드려요 
역동적인 움직임을 헤어스타일로써 표현하기 위해 러프한 컬을 잡고 앞머리와 사이드는 
자연스럽게 넘어가는 실루엣을 연출하였으며 
거기에 다크브라운 컬러를 입혀 러프한 컬링에도 결코 가벼워 보이지 않는 
중후한 멋을 연출할 수 있는 남자머리스타일 이에요 
세미 투블럭컷이 기본 베이스로 깔려있지만 투블럭컷의 특징인 단차를 찾아보기 힘들 정도로 단차를 줄여 
이 헤어스타일의 특징인 위에서 흐르는 러프한 투블럭 웨이브펌 스타일로 표현하였는데요^^
가르마를 중심으로 앞머리가 옆으로 흐르는 
남자머리스타일은 얼굴에 부드러운 시각적 효과를 줄 수 있는 스타일이기에 광대가 도드라진 각진 얼굴형과 
마르거나 긴 얼굴형에 적합한 헤어스타일이지만, 
턱이나 하관의 각짐이 도드라지는 얼굴형을 가진 분들에게는 나이가 들어보이고 다소 고지식해 보일수 있으니 주의 하세요^^',
'images/man11.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('M', '포마드 투블럭컷', '2017-12-10', '포마드 투블럭컷 스타일 남자 2대8 가르마펌 은 볼륨감 있으면서도 고유의 멋을 그대로 가지고 가면서 
남성분들을 위한 댄디한 남자헤어스타일 로써 재해석되었다고 말씀드릴수 있는데요, 
요즘 남자헤어스타일의 대세를 이루고있는 포마드 투블럭컷 스타일링과 자연스러운 남자 2대8 가르마펌 이 만나 
남자헤어스타일로써 자연스러운 멋과 투블럭컷이 기반되고 절제되어 짝 달라붙는 
포마드헤어의 특징인 깔끔함과 댄디함이 눈여겨 볼 점이라고 생각해요 
남성분들 깔끔하고 댄디한 2대8 가르마펌 스타일 많이 선호 하시는데요 
지금 소개해드리는 포마드 투플럭컷 은 웨이브를 잘 활용한 기본적이면서도 유니크한 남자헤어스타일이 아닐까 생각합니다 
패션에 제약이 있는 스타일이기에 당연하게도 얼굴형에 제약 또한 받는 스타일인데요 
외국인들이 많이 가지고 있는 그런 다소 각이 졌으면서도 슬림한 서구적 얼굴형이 이번 포마드 투블럭컷 남자헤어스타일과 무난하게 소화하실수 있으실것 같아요^^',
'images/man12.PNG');



INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '층낸머리 롱 리즈펌', '2017-12-10', '청순한 여성미를 부각시켜 주는 헤어스타일. 여성분들이 롱기장에서 
가장 선호하는 자연스러운 여자 층낸머리 롱 리즈펌 인데요. 자연스럽게 층을 낸 레이어드컷 스타일이에요. 
따스한 봄햇살에 어울리는 웨이브의 흐름으로 더욱더 멋스럽게 연출한, 긴머리 스타일^^ 
따스한 날씨에 산뜻하게 무거움을 덜어내고 요즘은, 가벼운 스타일의 헤어를 많이 선호 하시는것 같아요^^ 
생동감과 여유스러움을 주어, 요즘 계절에 연출하기 좋은 펌 스타일 입니다^^ 
무엇보다 봄의 날씨에 어울리는 시크릿투톤 핑크에 브라운 이 가미되어 
하이라이트로 포인트를 주었기 때문에 좀 더 트렌디하고 개성있게 연출하실수 있을것 같아요^^ 
평범할수 있는 스타일에 컬러로 포인트를 주었는데요, 
긴머리스타일은 얼굴형에 따라, 가르마로 연출하시면 좋을것 같아요^^ 
6:4 가르마 하나도 지그재그로 자칫 길어보일수 있는 얼굴도 짧게 잡아주어 어려보이게 연출하시면 좋을것 같아요^^ 
과하지 않는 레이어 스타일 이기 때문에 너무 가벼워 보이지 않을까 걱정하시는 분들도 모량이나, 
스타일에 따라 상담 후 진행하시면 좋으실것 같아요^^ 
올 봄 시크릿 투톤 으로 포인트를 주고 자연스러운 웨이브가 더 해져 청초하고 매력있게 연출하셔도 좋으실것 같아요^^',
'images/woman1.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '긴얼굴 시스루뱅 올여름 염색', '2017-12-10', '몽환적인 느낌을 주면서 올여름 포인트 염색 으로 산뜻함을 주는 긴머리 스타일 인데요, 
앞머리 그리고, 굵은 웨이브의 실루엣이 돋보이는 리즈 롱 웨이브 스타일 이에요 
앞머리 스타일은, 여성스러움을 더해주고 분위기를 바꿔 보고싶은 분들이 스타일 변화를 많이 주는데요, 
시스루뱅 은 긴얼굴 보완에도 큰 장점이 있는 스타일 이에요. 
얼굴이 작아보이고, 짧아 보이기 때문에 어려보일수 밖에 없는것 같아요~ 
태양의 후예의 여 주인공 송혜교 씨 때문에 요즘 가장 핫한 앞머리 인거 같아요, 
이미지 체인지에서 필수 인 스타일.^^ 
그리고 고급스러움을 주는 마호가니 컬러에 애쉬브라운이 가미되어 그라데이션으로 
부드럽고 자연스러움을 더해주는 신비한 이미지를 만들어 주는것 같아요 
스타일 변화가 필요할때 , 한번쯤 시도해 보셔도 좋으실것 같아 추천해드려요^^',
'images/woman2.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '어중간한머리 시스루뱅', '2017-12-10', '긴단발 머리나, 중간머리 기장은 자연스러운 C컬 스타일로 차분하고 여성스럽게 연출을 하거나, 
보통 S컬 이상의 웨이브를 넣으면 발랄해 보이고 상큼한 이미지를 연출 할 수 있는데요, 
중간머리 기장은 단정하고 굵은 웨이브의 성숙함, 고급스러움이 더해지면서 
가르마에 따라 이미지가 다양하게 연출되는것 같아요 
하지만, 어중간한머리 일때, 자칫 나이가 들어 보일수 있는 단점 자연스러운 앞머리 스타일로 영 해보이고~ 
얼굴도 작아보이는 효과를 주는게 어떨까요 어려보이는 시스루뱅 연출 봄헤어스타일로 추천해 드리고 싶어요. 
청순하면서도 동안헤어스타일로 사랑스럽고 여성스러운 매력을 동시에 어필할 수 있는 스타일 인것 같아요 
거기에 밝고 선명한 톤의 오렌지 브라운 컬러가 가미되어 앞머리 연출과 함께 
중간머리 웨이브의 우아하고 고급스러운 이미지는 유지하면서 영한 감성까지 모두 연출 할수 잇는 스타일 이에요^^ 
중간머리 S컬을 넣은 스타일 이기 때문에 뿌리 볼륨을 살리지 않아도 
볼륨감 자체가 풍성하여 더욱 젊은 느낌을 강조할 수 있어 
올 봄 상큼발랄한 이미지 변신을 원하시는 분들께 추천해 드리고 싶어요^^',
'images/woman3.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '앞머리있는 긴머리웨이브 리즈펌', '2017-12-10', '자연스러운 웨이브의 흐름과 볼륨을 살린 앞머리를 함께 연출한 앞머리있는 긴머리웨이브 리즈 웨이브 펌 이에요 
자연스러운 웨이브는 컬이 흐름만 느껴질 정도로 굵은 펌 인데요 
탄력있는 컬은 아니지만, 꾸민듯 꾸지 않은 자연스러움과 굵은 웨이브의 부드러운 느낌을 주는 스타일 이에요 
청순하고 지적인 이미지를 연출할 수 있어 여성스러움을 강조하고 싶은 분들께 추천하고 싶어요 
청순함을 강조한 긴머리웨이브 스타일은 앞머리를 내지 않고 가르마와 함께 연출한 스타일이 많지만, 
오늘 소개해 드리는 리즈펌 스타일은 볼륨을 살린 앞머리를 함께 연출하여 
전체적인 컬의 흐름과 조화를 이루도록 연출하였어요 
여성스럽고 차분한 느낌을 원하시는 분들께 긴머리웨이브 리즈펌 추천해드려요.',
'images/woman4.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '리즈 c컬펌', '2017-12-10', '어중간한 머리 고민해결! 자연스러움을 더해주는 리즈 c컬펌 소개해 드릴께요 
미디움 기장에서 머리를 기르는 과정이 가장 고민을 많이 하시는것 같아요, 
이 때, 참지 못하고 단발로 자르거나, 또는 앞머리나 레이어드컷 으로 가볍게 변화를 주는데요, 
머리를 기르는 과정에서도 컬이 있는것과 없는것의 스타일은 큰 차이가 있어요, 
오늘 소개해드리는 리즈 c컬펌은 어중간한 머리에 가장 무난하게 연출할수 있는 펌 스타일로 
자연스러움을 더해주는 스타일인데요 
머리를 기르는 분들이 가장 힘들어 하는 어깨선을 살짝 넘어가는 기장은 s컬 이상의 웨이브를 넣으면 모발과 어깨와 쇄골에 걸려 뻗치기 때문에 자칫 지저분해 보일수 있어요, 그래서 저는 보통컬이 없는 스트레이트는 어중간한 머리에서 오는 기장의 애매함이 더욱 부각될수 있기 때문에 c컬 웨이브를 많이 추천해 드리는데요, 
리즈 c컬펌은 자연스러우면서도 볼륨감을 더해주는 스타일 이기에 
헤어스타일 자체가 심심하고 초라해 보일수 있는점을 보완 해 주는 것 같아요 
리즈 c컬 웨이브는 그 자체로 풍성한 볼륨감과 역동적인 컬의 느낌을 연출해 주기 때문에 
어깨선에 걸리는 어중간한 머리에 연출하면 기장 자체에 안정감을 더 해주고 꾸민듯 꾸미지 않은듯 자연스러움.! 
톡톡 튀는 개성 보다는 단정하고 소녀스러운, 여성스러운 느낌이 강한 스타일 이기 때문에 
무난하게 소화할 수 있으실것 같아요',
'images/woman5.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '로즈 뱅 웨이브', '2017-12-10', '화려하고 여성스러운 느낌을 강하게 주는 물결웨이브와 귀엽고 사랑스러운 이미지의 짧은 앞머리뱅. 
로즈 뱅 웨이브 스타일. 
보통 긴머리 물결웨이브 스타일은 앞머리를 내지 않고 연출하여 
여성스러운 이미지 지적인 느낌을 많이 살려 연출하는데요, 
로즈 뱅 웨이브는 개성있는 스타일로 짧은앞머리 를 연출하여 자연스러운 c컬을 넣어 
전체적인 웨이브의 흐름과 조화를 이루며 
기존에 긴머리 웨이브 스타일에서 느끼기 힘들었던
어려보이고 발랄한 사랑스러운 이미지를 연출해 주는 스타일이에요 
앞머리 하나로 어려보이고, 또는 청순해보이고 여자여자한~ 
짧은앞머리 뱅과 역동적인 물결웨이브, 그리고 밝은 톤의 애쉬 브라운 컬러가 만나 
화려하고 화사한 이미지를 주는 헤어스타일 이기 때문에 올겨울 
개성있는 짧은앞머리 사랑스럽게 연출해 보셔도 좋으실것 같아요^^',
'images/woman6.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '굵은웨이브 글램 리즈펌', '2017-12-10', '긴머리 웨이브 스타일의 리즈펌은 보통 층을 내어 가볍게 연출하거나 층을 내지 않고 
무거운 라인으로 연출하는 스타일로 크게 나누어 볼수 있는데요. 
층을 내어 가볍게 연출 하였을 때는, 볼륨감이 살아 보이고 
가벼운 스타일로 머리를 자주 묶는 분들께 추천해드리고, 
끝라인이 너무 날리거나 차분함을 원하고, 가벼운 느낌을 싫어하시는 분들께 층을 내지않고 
깔끔하게 떨어지는 무거운 라인을 추천해 드려요. 
글램 리즈펌은 층을 조금 내고 볼륨을 많이 살려 두 스타일의 장점 모두를 연출한 헤어라고 말씀드릴수 있는데요 , 
층을 낸 리즈펌의 탄력있는 웨이브의 흐름이 얼굴을 작고 갸름해 보이게 해주며 
많이 살린 볼륨으로 무게감을 주어 전체적으로 안정감을 주어 
순해보이고 청순한 이미지를 줄 수 있어 올 봄 유행스타일로 적합한거 같아요 
컬러감 또한, 생기를 불어 넣어 주어 봄 유행 머리로 볼수 있는 스타일 이기에 올 봄 
굵은웨이브 스타일 글램 리즈펌 으로 더욱더 아름다워 지세요^^',
'images/woman7.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '단발머리 시스루뱅', '2017-12-10', '단발머리 시스루뱅은 여성들에게 사랑받고 있는 스타일 중 하나인거 같아요 
태양의 후예 송혜교머리 스타일로 요즘 긴머리 단발머리 할거 없이 큰 사랑을 받고 있는 앞머리 
단발머리 리즈펌은 c컬 스타일 이지만, 율동감 있는 컬링으로 
여성스러우면서도 발랄한 이미지를 연출해 주는데요, 거기에 시스루뱅 앞머리가 더해져 
청순하면서도 어려보이는 이미지를 더해주는것 같아요 
유행에 관계없이 꾸준하게 사랑받고 있는 애쉬브라운염색 애쉬계열의 컬러는 톤 자체가 유니크하지만 
다른컬러와의 조합이 워낙 조화롭기 때문에 대중적으로 많은 사랑을 받는 컬러인것 같아요^^ 
올 봄 단발머리 시스루뱅 으로 여성스럽고 사랑스러운 이미지 변신 해보시는것도 좋으실것 같아요^^',
'images/woman8.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '레이어드컷 긴머리 리즈펌', '2017-12-10', '롱 레이어 기장에 연출한 리즈펌과 리즈브라운, 라인브릿지 컬러로 포인트를 넣은 스타일 이에요 
보통 레이어드컷 스타일은 긴머리 기장에 진행되면 세련되고 스타일리시한 느낌을 연출해 주는데요. 
레이어드컷의 단점은 모발 끝이 부스스해 보이는 느낌이 다소 들 수 있다는 점이에요 
그래서 보통 끝라인을 단정하게 원하시는 분들은 레이어 스타일은 피하시는 편인데요 
그 문제를 해결하기 위해 웜톤의 리즈 브라운컬러를 전체적인 베이스 컬러로 진행하여 
라인브릿지 포인트 컬러로 통해 디자인의 장점인 세련미는 살리면서 
머릿결이 생기있어 보이도록 연출하여 자칫 부스스할 수 있는 점을 보완하였어요^^ 
전체적인 스타일이 단정하거나 심심한 스타일은 아니지만 컬러에서 오는 따뜻하고 안정적인 느낌이에요 
여성스럽고 세련된 이미지를 연출할수 있는 스타일이니 올 겨울 심플하면서도 여성스러움이 묻어나는 
레이어드컷 긴머리 리즈펌 연출하셔도 좋으실것 같아요^^',
'images/woman9.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '단발머리 리즈펌', '2017-12-10', '볼륨감은 줄이고 차분하고 시크한 단정한 스타일에 여성스러움보다는 
화사하고 발랄한 느낌을 줄수 있는 세련된 스타일의 단발머리 c컬펌이에요 
얼굴톤을 더욱 화사하게해주는 리즈브라운 컬러가 연출되어 
피부톤을 화사하게 해주며 동안 얼굴 어려보이는 개성을 연출해 주어요 
단발머리 스타일은 일자단발 비대칭 보브단발 다양하지만 
나한테 어울리는 단발머리를 찾는것이 가장 중요하다고 생각해요 
단발머리 리즈펌은 곱슬머리를 차분하게 또는 웨이브 스타일 보다는
단정한 세련됨을 원하는 분들께 추천하고 싶어요 
헤어스타일은 깨끗하지만 컬러로 포인트를 주어 개성있게 발랄하게 연출하셔도 좋으실것 같아요^^',
'images/woman10.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '라인브릿지 컬러', '2017-12-10', '긴머리 물결웨이브 스타일의 리즈펌과 라인브릿지컬러 로 포인트를 주었어요. 
기존의 물결웨이브는 층을 내지 않은 무거운 느낌의 일정한 간격으로 웨이브를 넣어 여성스러움을 표현 하였다면 
차분한 느낌을 연출하지만 다소 무겁고 둔탁해 보이는 단점이 있어요. 
이를 보완하여 가볍게 층을 내어 머리에일정한 컬을 넣어 여성스러우면서도 가볍고 손질이 쉬운 스타일이라, 
긴머리웨이브 스타일 추천하고싶어요. 
라인브릿지컬러 경우 지겨운헤어스타일에 포인트컬러로 들어가 더욱 스타일의 개성을 부여하고, 
포인트컬러가 주는 효과는 웨이브를 더욱 돋보이게 율동감있게 자연스럽게 표현해 주는데요, 
물결웨이브 리즈펌의 여성스러움과 개성있는 라인브릿지 포인트컬러로 
두가지 매력을 동시에 연출할수 있을것 같아 추천해 드리고 싶어요^^',
'images/woman11.PNG');

INSERT INTO trend (ttype, ttitle, tdate, tcontext, timage)
values ('W', '단발머리 볼륨펌 리즈 마호가니 포인트컬러', '2017-12-10', '풍성한 볼륨펌과 리즈 마호가니 컬러로 포인트를 연출한, 단발머리 스타일 인데요 
단정하고 깔끔하고 차분한 단발머리 스타일 이지만 , 
다소 나이가 들어 보이거나 심심할수 있는 커트 자체에 
앞머리 쪽에 리즈 마호가니 컬러로 포인트를 주어 컬러의 세련되고 유니크함과
펌 스타일 자체에 안정감 을 주기 때문에 
상큼하면서도 발랄하고 개성있는 스타일을 연출해 주는것 같아요^^ 
단발머리 볼륨펌은 쿠션감있는 스타일로 c컬펌이지만, 
볼륨감 있으면서도 손질법에 따라 율동감있는 컬링을 연출해 주어요 
꾸준하게 사랑받고 있는 단발머리 스타일중 하나인데요, 
리즈 마호가니 포인트 컬러로 좀 더 개성있고 세련된 스타일 연출 하셔도 좋으실것 같아요^^',
'images/woman12.PNG');

create table ranking(
	rid 		int(20)			NOT NULL AUTO_INCREMENT,
    sid			int(20)			NOT NULL,
    rdate		varchar(30)		NOT NULL,
    rsalse		int(30)			NOT NULL,
    PRIMARY KEY (rid),
    FOREIGN KEY (sid) REFERENCES shops (sid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;
  

INSERT INTO ranking (sid, rdate, rsalse)
values (3, '2017-12-10', 10470000);
INSERT INTO ranking (sid, rdate, rsalse)
values (1, '2017-12-10', 8780000);
INSERT INTO ranking (sid, rdate, rsalse)
values (2, '2017-12-10', 7624000);
INSERT INTO ranking (sid, rdate, rsalse)
values (4, '2017-12-10', 7420000);
INSERT INTO ranking (sid, rdate, rsalse)
values (5, '2017-12-10', 6732000);
INSERT INTO ranking (sid, rdate, rsalse)
values (8, '2017-12-10', 6660000);
INSERT INTO ranking (sid, rdate, rsalse)
values (10, '2017-12-10', 6178000);
INSERT INTO ranking (sid, rdate, rsalse)
values (7, '2017-12-10', 5970000);
INSERT INTO ranking (sid, rdate, rsalse)
values (9, '2017-12-10', 5628000);
INSERT INTO ranking (sid, rdate, rsalse)
values (6, '2017-12-10', 5124000);

create table best(
	bid 		int(20)			NOT NULL AUTO_INCREMENT,
    sid			int(20)			NOT NULL,
    bhairname	varchar(30)		NOT NULL,
    bhairimage	varchar(30)		NOT NULL,
    bdrama 		varchar(30)		NOT NULL,
    bactor		varchar(30)		NOT NULL,
    PRIMARY KEY (bid),
    FOREIGN KEY (sid) REFERENCES shops (sid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;

INSERT INTO best (sid, bhairname, bhairimage, bdrama, bactor)
values (1, '6:4 가르마펌', 'images/1.png', "SBS '당신이 잠든 사이에'", '이종석');

INSERT INTO best (sid, bhairname, bhairimage, bdrama, bactor)
values (2, '중단발 C컬펌', 'images/2.png', "KBS2 '마녀의 법정'", '정려원');

INSERT INTO best (sid, bhairname, bhairimage, bdrama, bactor)
values (3, '5:5 가르마펌', 'images/3.png', "tvN '이번생은 처음이라'", '이민기');

create table contactus(
	ctid		int(20)			NOT NULL AUTO_INCREMENT,
    ctname		varchar(30)		NOT NULL,
    ctemail		varchar(40)		NOT NULL,
    ctcontext 	varchar(1000)	NOT NULL,
    PRIMARY KEY (ctid)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8;
