rosbag record -O "$1".bag --split --size=1024  -b 0  /camera/aligned_depth_to_color/camera_info  camera/aligned_depth_to_color/image_raw /camera/color/camera_info /camera/color/image_raw /camera/imu /camera/imu_info /tf_static &
rosbag play "$1" --clock
rosnode kill --all