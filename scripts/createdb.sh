#!/usr/bin/env bash
source /etc/birdnet/birdnet.conf
sqlite3 $HOME/BirdNET-Pi/scripts/birds.db << EOF
DROP TABLE IF EXISTS detections;
CREATE TABLE IF NOT EXISTS detections (
  Date DATE,
  Time TIME,
  Sci_Name VARCHAR(100) NOT NULL,
  Com_Name VARCHAR(100) NOT NULL,
  Confidence FLOAT,
  Lat FLOAT,
  Lon FLOAT,
  Cutoff FLOAT,
  Week INT,
  Sens FLOAT,
  Overlap FLOAT,
  File_Name VARCHAR(100) NOT NULL);
CREATE INDEX "detections_Com_Name" ON "detections" ("Com_Name");
CREATE INDEX "detections_Date_Time" ON "detections" ("Date" DESC, "Time" DESC);

DROP TABLE IF EXISTS settings;
CREATE TABLE IF NOT EXISTS settings (
  setting VARCHAR(100) NOT NULL,
  value VARCHAR(100) NOT NULL);
CREATE UNIQUE INDEX IF NOT EXISTS "settings_setting" ON "settings" ("setting");
INSERT or IGNORE into settings values('theme', 'light');

EOF
chown $USER:$USER $HOME/BirdNET-Pi/scripts/birds.db
chmod g+w $HOME/BirdNET-Pi/scripts/birds.db
