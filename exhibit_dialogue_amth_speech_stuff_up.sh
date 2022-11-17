#!/bin/bash

source /opt/ros/kinetic/setup.bash
source /home/cultureid_user0/catkin_ws/devel/setup.bash

rasa_output_dirc=$PWD
rasa_output_filename='edassu_docker.txt'
rasa_output_file="${rasa_output_dirc}/${rasa_output_filename}"

echo '[BASH cultureid_exhibit_dialogue] with rasa output file:' $rasa_output_file
echo '[BASH cultureid_exhibit_dialogue] FIRING UP RASA'

# If there exists this `rasa_output_file` then delete it; we want a clean file
ls $rasa_output_dirc | grep $rasa_output_filename
o1=$?
if [ $o1 -ne 0 ]
then
  echo '[BASH cultureid_exhibit_dialogue] rasa output file does not exist'
else
  echo '[BASH cultureid_exhibit_dialogue] rasa output file exists'
  rm $rasa_output_file
fi

# Execute docker and redirect output to `rasa_output_file`
#docker-compose -f /home/cultureid_user0/rasa-container/docker-compose.yml up --build> $rasa_output_file 2>&1 &
docker-compose -f /home/cultureid_user0/rasa-container/docker-compose.yml up > $rasa_output_file 2>&1 &

# Block here until rasa is actually up and running
while :
do
  cat $rasa_output_file | grep 'Rasa server is up and running.'

  if [ $? -ne 0 ]
  then
    sleep 1
  else
    break
  fi
done

echo '[BASH cultureid_exhibit_dialogue] RASA FIRED UP'
echo '[BASH cultureid_exhibit_dialogue] executing S2S'

# S2S cannot exist without rasa. S2S may now be executed
roscd cultureid_exhibit_dialogue/src/speech_to_text_to_speech
python3 send_node.py &
