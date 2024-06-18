docker build -t "ros_realsense" %~dp0../docker/
docker kill ros_container
docker run -dit --privileged --rm -e DISPLAY=host.docker.internal:0 -v %~dp0../data:/data --name ros_container ros_realsense