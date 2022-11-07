#!/bin/bash
# https://unix.stackexchange.com/questions/686274/ways-to-launch-a-desktop-application-with-environment-variable
source /opt/ros/kinetic/setup.bash
source /home/cultureid_user0/catkin_ws/devel/setup.bash

roslaunch cultureid_devel turtlebot_bringup_live.launch &
sleep 2
roslaunch cultureid_devel avanti_live.launch &
sleep 2
#rosrun rviz rviz
#sleep 2
roslaunch cultureid_games_tif22 avanti_a1.launch &
