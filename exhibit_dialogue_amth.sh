#!/bin/bash
source /opt/ros/kinetic/setup.bash
source /home/cultureid_user0/catkin_ws/devel/setup.bash
export ROBOT_TYPE=turtlebot
export NUM_CAMERAS=0


roslaunch cultureid_devel turtlebot_bringup_live.launch &
sleep 10

rosrun rviz rviz &
sleep 1

#roslaunch cultureid_devel avanti_live.launch map_file:=amth &
roslaunch cultureid_devel avanti_live.launch map_file:=amth_offices_wunknown &
sleep 40

################################################################################
# Deprecated: the initial pose is set within the code (select a game for the
# first time and the robot's starting pose will automatically be loaded)
# large map hack (does not load move_base otherwise)
#com1="header:
  #seq: 1
  #stamp:
    #secs: "
#printf -v unix_time_now '%(%s)T'
#com2="
    #nsecs: 0
  #frame_id: 'map'
#pose:
  #pose:
    #position: {x: 11.7, y: 14.16, z: 0.0}
    #orientation: {x: 0.0, y: 0.0, z: -0.951671116771, w: 0.307119008699}
  #covariance: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    #0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
    #0.0, 0.0, 0.0, 0.0, 0.0, 0.0]"

#rostopic pub /initialpose geometry_msgs/PoseWithCovarianceStamped "$com1$unix_time_now$com2" &
################################################################################


roslaunch cultureid_exhibit_dialogue avanti_dialogue.launch &
