#!/usr/bin/env bash
NOW=$( date '+%F_%H:%M:%S' )
# roscore >/dev/null 2>&1 &
rosparam set use_sim_time false
roslaunch realsense2_camera opensource_tracking.launch > /dev/null 2>&1 &
rosbag record -O SLAM_"$NOW".bag -b 0  /camera/aligned_depth_to_color/camera_info  camera/aligned_depth_to_color/image_raw /camera/color/camera_info /camera/color/image_raw /camera/imu /camera/imu_info /tf_static