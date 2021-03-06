/* DOMAIN */
CREATE TABLE lillian.TB_DOMAIN_INFO(
    DOMAIN_NO BIGINT AUTO_INCREMENT PRIMARY KEY
  , DOMAIN_NM VARCHAR(200) NOT NULL
  , URL VARCHAR(200) NOT NULL
  , USE_YN VARCHAR(1) NOT NULL
  , MEMBER_NO BIGINT NOT NULL
  , UPD_MEMBER_NO BIGINT NOT NULL
  , UPD_DT DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , REG_DT DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE lillian.TB_DOMAIN_STATIC_DAY(
    SEQ BIGINT AUTO_INCREMENT PRIMARY KEY
  , DOMAIN_NO BIGINT NOT NULL
  , STATUS VARCHAR(1) NOT NULL
  , MEMBER_NO BIGINT NOT NULL
  , REG_DT DATETIME DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE lillian.TB_DOMAIN_INFO;
DROP TABLE lillian.TB_DOMAIN_STATIC_DAY;

/* MEMO */
CREATE TABLE lillian.TB_MEMO_CATEGORY(
    CATEGORY_NO BIGINT AUTO_INCREMENT PRIMARY KEY
  , CATEGORY_NM VARCHAR(60) NOT NULL
  , DISPLAY_YN VARCHAR(1) NOT NULL
  , MEMBER_NO BIGINT NOT NULL
  , UPD_MEMBER_NO BIGINT NOT NULL
  , UPD_DT DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , REG_DT DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lillian.TB_MEMO	(
    MEMO_NO BIGINT AUTO_INCREMENT PRIMARY KEY
  , TITLE VARCHAR(100) NOT NULL
  , CONTENT LONGTEXT NOT NULL
  , CATEGORY_NO BIGINT NOT NULL
  , MEMBER_NO BIGINT NOT NULL
  , UPD_MEMBER_NO BIGINT NOT NULL
  , UPD_DT DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  , REG_DT DATETIME DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE lillian.TB_MEMO_CATEGORY;
DROP TABLE lillian.TB_MEMO;