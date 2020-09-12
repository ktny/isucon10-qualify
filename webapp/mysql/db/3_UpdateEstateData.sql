UPDATE isuumo.estate SET loc = ST_GEOMFROMTEXT(Concat('POINT(',isuumo.estate.latitude,' ',isuumo.estate.longitude,')'));

ALTER TABLE isuumo.estate MODIFY loc POINT NOT NULL;
ALTER TABLE isuumo.estate ADD SPATIAL INDEX idx_loc (loc);
