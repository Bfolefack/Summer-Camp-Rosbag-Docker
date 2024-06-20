# roscore >/dev/null 2>&1 &
rosparam set use_sim_time true
roslaunch realsense2_camera opensource_tracking.launch offline:=true > /dev/null 2>&1 &
rosbag play "$1" --clock
