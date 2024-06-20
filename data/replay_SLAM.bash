# roscore >/dev/null 2>&1 &
rosparam set use_sim_time true
roslaunch realsense2_camera opensource_tracking.launch offline:=true > /dev/null 2>&1 &
trap 'rosnode kill --all' SIGINT
rosbag play "$1" --clock
sleep 3000h