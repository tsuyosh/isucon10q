ALTER TABLE isuumo.estate ADD COLUMN `location`  GEOMETRY AFTER longitude;
UPDATE isuumo.estate SET location = ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326);
ALTER TABLE isuumo.estate MODIFY `location`  GEOMETRY NOT NULL;
CREATE SPATIAL INDEX estate_location ON isuumo.estate (location);
