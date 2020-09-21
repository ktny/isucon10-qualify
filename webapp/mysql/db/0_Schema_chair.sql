DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(512)    NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    popularity_desc INTEGER AS (-popularity) NOT NULL,
    c0          INTEGER AS (LEAST(height, width, depth)) NOT NULL,
    c1          INTEGER AS (height + width + depth - GREATEST(height, width, depth) - LEAST(height, width, depth)) NOT NULL,
    INDEX       idx_popularity_desc (popularity_desc),
    INDEX       idx_price (price),
    INDEX       idx_color (color),
    INDEX       idx_kind  (kind)
);
