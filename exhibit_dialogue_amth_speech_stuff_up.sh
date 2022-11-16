#!/bin/bash

source /opt/ros/kinetic/setup.bash
source /home/cultureid_user0/catkin_ws/devel/setup.bash

#docker-compose  -f /home/cultureid_user0/rasa-container/docker-compose.yml  up --build &
docker-compose  -f /home/cultureid_user0/rasa-container/docker-compose.yml  up &
sleep 1

roscd cultureid_exhibit_dialogue/src/speech_to_text_to_speech
python3 send_node.py &
