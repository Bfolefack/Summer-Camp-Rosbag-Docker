# Summer Camp Rosbag Docker

## Installation Instructions
1. Install and run Docker Desktop from [here](https://www.docker.com/products/docker-desktop)
2. Clone this repository
3. Go into `docker` folder and double click to run `build.bat` to build the docker image (this will take a while)
4. Run usbipd-win_4.2.0 from the repository to install the USB driver

## How to Launch the Docker Container
1. First run command prompt as administrator
2. Run the following commands in this terminal to start the usbipd service
   1. Run `usbpid list` to list the USB devices. You should see a list of USB devices. The realsense camera should be listed as `Intel(R) RealSense(TM) Depth Camera 435i`
   2. Run `usbpid bind --busid <busid>` to bind the realsense camera to the usbipd service. Replace `<busid>` with the busid of the realsense camera.
   3. Run `usbipd attach --wsl --busid <busid>` to attach the realsense camera to the WSL. Replace `<busid>` with the busid of the realsense camera.
   4. Congrats! You have successfully attached the realsense camera to the WSL.
3. Make sure Docker Desktop is running
4. Run `launch.bat` to start the docker container
5. Run `connect.bat` this will open a new terminal in the docker container, whenever you need a new terminal in the docker container, run this command
6. When you are done, run `kill.bat` to stop the docker container. This will also save any rosbag files that were recorded during the session.

## How to Record a Rosbag
1. Open a terminal in the docker container by running `connect.bat` in the `src` folder in this terminal run the command `roscore`
2. In another terminal in the docker container run the command `roslaunch realsense2_camera rs_camera.launch` to turn on the realsense camera
3. In another terminal in the docker container run the command `../record.sh` to start recording a rosbag file
4. To stop recording the rosbag file, press `Ctrl+C` in the terminal where you ran the `../record.sh` command
**Important**: rosbag files take up a lot of space, so make sure not to record for too long