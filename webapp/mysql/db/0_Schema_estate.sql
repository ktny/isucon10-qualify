DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(512)        NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    popularity_desc INTEGER AS (-popularity) NOT NULL,
    point       POINT AS (POINT(latitude, longitude)) STORED NOT NULL,
    door_min    INTEGER AS (LEAST(door_height, door_width)) NOT NULL,
    door_max    INTEGER AS (GREATEST(door_height, door_width)) NOT NULL,
    door_width_range INTEGER AS (
case
when door_width < 80 then 0
when door_width < 110 then 1
when door_width < 150 then 2
else 3
end) NOT NULL,
    door_height_range INTEGER AS (
case
when door_height < 80 then 0
when door_height < 110 then 1
when door_height < 150 then 2
else 3
end) NOT NULL,
    rent_range INTEGER AS (
case
when rent < 50000 then 0
when rent < 100000 then 1
when rent < 150000 then 2
else 3
end) NOT NULL,
    INDEX       idx_rent (rent),
    INDEX       idx_popularity (popularity),
    INDEX       idx_popularity_desc (popularity_desc),
    INDEX       idx_lat_long (latitude, longitude),
    INDEX       idx_door_width_height (door_width, door_height),
    SPATIAL INDEX idx_point (point)
);
