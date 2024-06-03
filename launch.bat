docker build --tag "ros_realsense" .
docker kill container
docker run -dit --privileged --rm --name "container" "ros_realsense"