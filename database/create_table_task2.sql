DROP TABLE IF EXISTS pw_pokemon_detail;

CREATE TABLE IF NOT EXISTS pw_pokemon_detail (
  id          INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `index`     INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '全国图鉴编号',
  imgUrl      VARCHAR(128) NOT NULL DEFAULT '' COMMENT '图片链接',
  type        VARCHAR(16)  NOT NULL DEFAULT '' COMMENT '属性',
  category    VARCHAR(16)  NOT NULL DEFAULT '' COMMENT '分类',
  ability     VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '特性',
  height      VARCHAR(8)   NOT NULL DEFAULT '' COMMENT '身高',
  weight      VARCHAR(8)   NOT NULL DEFAULT '' COMMENT '体重',
  bodyStyle   VARCHAR(64)  NOT NULL DEFAULT '' COMMENT '体形',
  catchRate   VARCHAR(8)   NOT NULL DEFAULT '' COMMENT '捕获率',
  genderRatio VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '性别比例',
  eggGroup1   VARCHAR(16)  NOT NULL DEFAULT '' COMMENT '第一生蛋分组',
  eggGroup2   VARCHAR(16)  NOT NULL DEFAULT '' COMMENT '第二生蛋分组',
  hatchTime   VARCHAR(8)   NOT NULL DEFAULT '' COMMENT '孵化时间',
  effortValue VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '基础点数',
  createTime  DATETIME     NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  modifyTime  DATETIME     NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE InnoDB
  DEFAULT CHARSET 'utf8mb4' COMMENT '宝可梦详情';

## ----------------------------------------------------------

DROP TABLE IF EXISTS pw_pokemon_detail_learn_set_by_leveling_up;

CREATE TABLE IF NOT EXISTS pw_pokemon_detail_learn_set_by_leveling_up (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `index`    INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '全国图鉴编号',
  level1     CHAR(4)      NOT NULL DEFAULT '' COMMENT '等级（太阳/月亮）',
  level2     CHAR(4)      NOT NULL DEFAULT '' COMMENT '等级（究极之日/究极之月）',
  move       VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '招式名称',
  type       VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '属性',
  category   VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '分类',
  power      VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '威力',
  accuracy   VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '命中',
  pp         VARCHAR(32)  NOT NULL DEFAULT '' COMMENT 'PP',
  createTime DATETIME     NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  modifyTime DATETIME     NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE InnoDB
  DEFAULT CHARSET 'utf8mb4' COMMENT '宝可梦可学会的招式';

## ----------------------------------------------------------

DROP TABLE IF EXISTS pw_pokemon_detail_learn_set_by_technical_machine;

CREATE TABLE IF NOT EXISTS pw_pokemon_detail_learn_set_by_technical_machine (
  id               INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `index`          INT UNSIGNED NOT NULL DEFAULT 0 COMMENT '全国图鉴编号',
  imgUrl           VARCHAR(128) NOT NULL DEFAULT '' COMMENT '招式学习器图片链接',
  technicalMachine VARCHAR(16)  NOT NULL DEFAULT '' COMMENT '招式学习器名称',
  move             VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '招式名称',
  type             VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '属性',
  category         VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '分类',
  power            VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '威力',
  accuracy         VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '命中',
  pp               VARCHAR(32)  NOT NULL DEFAULT '' COMMENT 'PP',
  createTime       DATETIME     NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  modifyTime       DATETIME     NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE InnoDB
  DEFAULT CHARSET 'utf8mb4' COMMENT '宝可梦能使用的招式学习器';

## ----------------------------------------------------------

DROP TABLE IF EXISTS pw_pokemon_detail_learn_set_by_breeding;

CREATE TABLE IF NOT EXISTS pw_pokemon_detail_learn_set_by_breeding (
  id         INT UNSIGNED  NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `index`    INT UNSIGNED  NOT NULL DEFAULT 0 COMMENT '全国图鉴编号',
  parent     VARCHAR(2048) NOT NULL DEFAULT '' COMMENT '亲代',
  move       VARCHAR(32)   NOT NULL DEFAULT '' COMMENT '招式名称',
  type       VARCHAR(32)   NOT NULL DEFAULT '' COMMENT '属性',
  category   VARCHAR(32)   NOT NULL DEFAULT '' COMMENT '分类',
  power      VARCHAR(32)   NOT NULL DEFAULT '' COMMENT '威力',
  accuracy   VARCHAR(32)   NOT NULL DEFAULT '' COMMENT '命中',
  pp         VARCHAR(32)   NOT NULL DEFAULT '' COMMENT 'PP',
  createTime DATETIME      NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  modifyTime DATETIME      NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE InnoDB
  DEFAULT CHARSET 'utf8mb4' COMMENT '宝可梦蛋招式';

## ----------------------------------------------------------

DROP TABLE IF EXISTS pw_ability_detail;

CREATE TABLE IF NOT EXISTS pw_ability_detail (
  id         INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  nameZh     VARCHAR(32)  NOT NULL DEFAULT '' COMMENT '特性名称',
  `desc`     VARCHAR(256) NOT NULL DEFAULT '' COMMENT '特性描述',
  effect     VARCHAR(512) NOT NULL DEFAULT '' COMMENT '特性效果',
  pokemons   VARCHAR(256) NOT NULL DEFAULT '' COMMENT '拥有此特性的宝可梦',
  createTime DATETIME     NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  modifyTime DATETIME     NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE InnoDB
  DEFAULT CHARSET 'utf8mb4' COMMENT '特性详情';

## ----------------------------------------------------------

DROP TABLE IF EXISTS pw_move_detail;

CREATE TABLE IF NOT EXISTS pw_move_detail (
  id         INT UNSIGNED  NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  nameZh     VARCHAR(32)   NOT NULL DEFAULT '' COMMENT '招式名称',
  `desc`     VARCHAR(256)  NOT NULL DEFAULT '' COMMENT '招式描述',
  imgUrl     VARCHAR(256)  NOT NULL DEFAULT '' COMMENT '图片链接',
  notes      VARCHAR(256)  NOT NULL DEFAULT '' COMMENT '注意事项',
  scope      VARCHAR(256)  NOT NULL DEFAULT '' COMMENT '作用范围',
  effect     VARCHAR(1024) NOT NULL DEFAULT '' COMMENT '附加效果',
  createTime DATETIME      NOT NULL DEFAULT current_timestamp COMMENT '创建时间',
  modifyTime DATETIME      NOT NULL DEFAULT current_timestamp ON UPDATE current_timestamp COMMENT '修改时间',
  PRIMARY KEY (id)
) ENGINE InnoDB
  DEFAULT CHARSET 'utf8mb4' COMMENT '招式详情';