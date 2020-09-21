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
    height_range INTEGER AS (
case
when height < 80 then 0
when height < 110 then 1
when height < 150 then 2
else 3
end) NOT NULL,
    width_range INTEGER AS (
case
when width < 80 then 0
when width < 110 then 1
when width < 150 then 2
else 3
end) NOT NULL,
    depth_range INTEGER AS (
case
when depth < 80 then 0
when depth < 110 then 1
when depth < 150 then 2
else 3
end) NOT NULL,
    price_range INTEGER AS (
case
when price < 3000 then 0
when price < 6000 then 1
when price < 9000 then 2
when price < 12000 then 3
when price < 15000 then 4
else 5
end) NOT NULL,
    INDEX       idx_popularity_desc (popularity_desc),
    INDEX       idx_price (price),
    INDEX       idx_color (color),
    INDEX       idx_kind  (kind)
);
