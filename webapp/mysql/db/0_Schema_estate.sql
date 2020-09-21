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
    INDEX       idx_rent (rent),
    INDEX       idx_popularity (popularity),
    INDEX       idx_popularity_desc (popularity_desc),
    INDEX       idx_lat_long (latitude, longitude),
    INDEX       idx_door_width_height (door_width, door_height),
    SPATIAL INDEX idx_point (point)
);
