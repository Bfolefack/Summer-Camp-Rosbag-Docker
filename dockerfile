FROM ros:noetic
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq --no-install-recommends
RUN apt-get install -y usbutils
RUN apt-get install -y ros-noetic-realsense2-*
RUN apt-get install -y curl

RUN mkdir -p /etc/apt/keyrings

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN apt-get -y install software-properties-common
RUN add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" -u
RUN apt-get update
RUN apt-get -y install librealsense2-utils

RUN mkdir -p /catkin_ws/src
ADD init.bash /
RUN mkdir -p /etc/udev/rules.d/
ADD 99-realsense-libusb.rules /etc/udev/rules.d/
WORKDIR /catkin_ws/src
RUN catkin_create_pkg collect_data_pkg std_msgs rospy roscpp sensor_msgs realsense2_camera
RUN mkdir -p /catkin_ws/src/collect_data_pkg/launch
ADD rs_camera.launch /opt/ros/noetic/share/realsense2_camera/launch
ADD record.bash /
# ADD collect_data.py /catkin_ws/src/collect_data_pkg/src
WORKDIR /
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc
RUN /init.bash
RUN mkdir -p /data
WORKDIR /data

