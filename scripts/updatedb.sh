#!/usr/bin/env bash
source /etc/birdnet/birdnet.conf
sqlite3 $HOME/BirdNET-Pi/scripts/birds.db << EOF

CREATE TABLE IF NOT EXISTS settings (
  setting VARCHAR(100) NOT NULL,
  value VARCHAR(100) NOT NULL);
CREATE UNIQUE INDEX IF NOT EXISTS "settings_setting" ON "settings" ("setting");
INSERT or IGNORE into settings values('theme', 'light');

EOF
