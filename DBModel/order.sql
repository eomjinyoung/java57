-- Order
DROP TABLE IF EXISTS ORDS RESTRICT;

-- Product Photo
DROP TABLE IF EXISTS PRO_PHOS RESTRICT;

-- Maker
DROP TABLE IF EXISTS MAKS RESTRICT;

-- Customer
DROP TABLE IF EXISTS CUSTS RESTRICT;

-- Product
DROP TABLE IF EXISTS PRODS RESTRICT;

-- Address
DROP TABLE IF EXISTS ADDRS RESTRICT;

-- Order
CREATE TABLE ORDS (
  ONO   INTEGER  NOT NULL COMMENT '주문번호', -- 주문번호
  CNO   INTEGER  NOT NULL COMMENT '주문자번호', -- 주문자번호
  PNO   INTEGER  NOT NULL COMMENT '제품번호', -- 제품번호
  QTY   INTEGER  NOT NULL COMMENT '주문수량', -- 주문수량
  ODATE DATETIME NOT NULL COMMENT '주문일' -- 주문일
)
COMMENT 'Order';

-- Order
ALTER TABLE ORDS
  ADD CONSTRAINT PK_ORDS -- Order 기본키
    PRIMARY KEY (
      ONO -- 주문번호
    );

-- Product Photo
CREATE TABLE PRO_PHOS (
  PHNO INTEGER      NOT NULL COMMENT '사진번호', -- 사진번호
  PNO  INTEGER      NOT NULL COMMENT '제품번호', -- 제품번호
  PATH VARCHAR(255) NOT NULL COMMENT '제품사진' -- 제품사진
)
COMMENT 'Product Photo';

-- Product Photo
ALTER TABLE PRO_PHOS
  ADD CONSTRAINT PK_PRO_PHOS -- Product Photo 기본키
    PRIMARY KEY (
      PHNO -- 사진번호
    );

-- Maker
CREATE TABLE MAKS (
  MNO   INTEGER      NOT NULL COMMENT '제조사번호', -- 제조사번호
  MNAME VARCHAR(100) NOT NULL COMMENT '제조사', -- 제조사
  TEL   VARCHAR(30)  NOT NULL COMMENT '제조사전화', -- 제조사전화
  URL   VARCHAR(255) NULL     COMMENT '제조사홈페이지' -- 제조사홈페이지
)
COMMENT 'Maker';

-- Maker
ALTER TABLE MAKS
  ADD CONSTRAINT PK_MAKS -- Maker 기본키
    PRIMARY KEY (
      MNO -- 제조사번호
    );

-- Maker 인덱스
CREATE INDEX IX_MAKS
  ON MAKS( -- Maker
    MNAME ASC -- 제조사
  );

-- Customer
CREATE TABLE CUSTS (
  CNO      INTEGER      NOT NULL COMMENT '주문자번호', -- 주문자번호
  CNAME    VARCHAR(100) NOT NULL COMMENT '주문자명', -- 주문자명
  EMAIL    VARCHAR(40)  NOT NULL COMMENT '주문자이메일', -- 주문자이메일
  TEL      VARCHAR(30)  NOT NULL COMMENT '주문자전화번호', -- 주문자전화번호
  ADDR_DET VARCHAR(255) NULL     COMMENT '주문자상세주소', -- 주문자상세주소
  ANO      INTEGER      NULL     COMMENT '주소번호' -- 주소번호
)
COMMENT 'Customer';

-- Customer
ALTER TABLE CUSTS
  ADD CONSTRAINT PK_CUSTS -- Customer 기본키
    PRIMARY KEY (
      CNO -- 주문자번호
    );

-- Customer 유니크 인덱스
CREATE UNIQUE INDEX UIX_CUSTS
  ON CUSTS ( -- Customer
    EMAIL ASC -- 주문자이메일
  );

-- Customer 인덱스
CREATE INDEX IX_CUSTS
  ON CUSTS( -- Customer
    CNAME ASC -- 주문자명
  );

-- Product
CREATE TABLE PRODS (
  PNO   INTEGER      NOT NULL COMMENT '제품번호', -- 제품번호
  MNO   INTEGER      NOT NULL COMMENT '제조사번호', -- 제조사번호
  TITLE VARCHAR(100) NOT NULL COMMENT '제품명', -- 제품명
  QTY   INTEGER      NOT NULL COMMENT '잔여수량' -- 잔여수량
)
COMMENT 'Product';

-- Product
ALTER TABLE PRODS
  ADD CONSTRAINT PK_PRODS -- Product 기본키
    PRIMARY KEY (
      PNO -- 제품번호
    );

-- Product 인덱스
CREATE INDEX IX_PRODS
  ON PRODS( -- Product
    TITLE ASC -- 제품명
  );

-- Address
CREATE TABLE ADDRS (
  ANO      INTEGER      NOT NULL COMMENT '주소번호', -- 주소번호
  POSTNO   VARCHAR(10)  NOT NULL COMMENT '주문자우편번호', -- 주문자우편번호
  ADDR_BAS VARCHAR(255) NOT NULL COMMENT '주문자기본주소' -- 주문자기본주소
)
COMMENT 'Address';

-- Address
ALTER TABLE ADDRS
  ADD CONSTRAINT PK_ADDRS -- Address 기본키
    PRIMARY KEY (
      ANO -- 주소번호
    );

-- Order
ALTER TABLE ORDS
  ADD CONSTRAINT FK_CUSTS_TO_ORDS -- Customer -> Order
    FOREIGN KEY (
      CNO -- 주문자번호
    )
    REFERENCES CUSTS ( -- Customer
      CNO -- 주문자번호
    );

-- Order
ALTER TABLE ORDS
  ADD CONSTRAINT FK_PRODS_TO_ORDS -- Product -> Order
    FOREIGN KEY (
      PNO -- 제품번호
    )
    REFERENCES PRODS ( -- Product
      PNO -- 제품번호
    );

-- Product Photo
ALTER TABLE PRO_PHOS
  ADD CONSTRAINT FK_PRODS_TO_PRO_PHOS -- Product -> Product Photo
    FOREIGN KEY (
      PNO -- 제품번호
    )
    REFERENCES PRODS ( -- Product
      PNO -- 제품번호
    );

-- Customer
ALTER TABLE CUSTS
  ADD CONSTRAINT FK_ADDRS_TO_CUSTS -- Address -> Customer
    FOREIGN KEY (
      ANO -- 주소번호
    )
    REFERENCES ADDRS ( -- Address
      ANO -- 주소번호
    );

-- Product
ALTER TABLE PRODS
  ADD CONSTRAINT FK_MAKS_TO_PRODS -- Maker -> Product
    FOREIGN KEY (
      MNO -- 제조사번호
    )
    REFERENCES MAKS ( -- Maker
      MNO -- 제조사번호
    );