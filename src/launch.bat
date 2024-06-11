docker build --tag "ros_realsense" ../docker/dockerfile
docker kill ros_container
docker run -dit --privileged --rm --name "ros_container" "ros_realsense"