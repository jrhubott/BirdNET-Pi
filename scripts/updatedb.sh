#!/usr/bin/env bash
source /etc/birdnet/birdnet.conf
sqlite3 $HOME/BirdNET-Pi/scripts/birds.db << EOF
ALTER TABLE detections ADD COLUMN Microphone VARCHAR(20) DEFAULT "Unknown"
EOF
