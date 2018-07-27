# ROS Notes

# Tricks
### Get on another ROS-network
http://inertia.ed.ntnu.no:8090/display/DRIV/How+to+set+up+and+use+SSH+on+Jetson+TX1
```bash
export ROS_IP=192.168.1.<your-own-ip>
export ROS_MASTER_URI=http://192.168.1.10:11311
```

# Testing
## Running .test launch file
```bash
rostest --text rosaria_client yaw_controller_test.test
```

## Compiling tests for only one package
```bash
catkin_make run_tests_packageName
```
NB: This will not compile the node under test.

## Print results of latest test
```bash
cd ~/catkin_ws
catkin_test_results
```
or
```bash
catkin_test_results --verbose ~/catkin_ws
```

```bash
mkdir -p ~/tx_catkin_ws && sshfs nvidia@192.168.1.10:/home/nvidia/catkin_ws/src ~/tx_catkin_ws
```

## Unmount
```bash
fusermount -u <mountpoint>
```
Sometimes you need to unmount the tx_catkin_ws folder because shit happens

## See frequence of topic publish
```bash
rostopic hz <topic>
```


## Catkin
#### Create workspace

```bash
source /opt/ros/kinetic/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
source ~/catkin_ws/devel/setup.bash
```
http://wiki.ros.org/catkin/Tutorials/create_a_workspace

#### Build only one package
```bash
# First option
catkin_make --pkg ros_comm
# Second option. Packages seperated with ";"
catkin_make -DCATKIN_WHITELIST_PACKAGES="foo;bar"
# Be awere you have to erase the list
catkin_make -DCATKIN_WHITELIST_PACKAGES=""
```
#### Build all packages except one
```bash
catkin_make -DCATKIN_BLACKLIST_PACKAGES="r18dv_isam2;bar"
# Clean the list afterwards
catkin_make -DCATKIN_BLACKLIST_PACKAGES=""
```

### Problems with catkin build
Problem:
```bash
Errors     << catkin_tools_prebuild:cmake /home/harald/catkin_ws/logs/catkin_tools_prebuild/build.cmake.009.log
ImportError: "from catkin_pkg.package import parse_package" failed: No module named 'catkin_pkg'
Make sure that you have installed "catkin_pkg", it is up to date and on the PYTHONPATH.
```


```bash
pip install catkin_pkg
```
I think catkin uses python3 and not 2 which It should

### CUDA
Jeg slettet nppi fra denne listen i CMakelist.txt
  ${CUDA_LIBRARIES} ${CUDA_npps_LIBRARY}
1. Slettet
${CUDA_nppi_LIBRARY}
2. Da ble den bygget. Fikk noe error om io.

### Turtlebot
1. Open Gazebo with turtlebot
roslaunch turtlebot_gazebo turtlebot_world.launch
2. PROFIT!
----
1. Open control window for turtlebot
roslaunch turtlebot_teleop keyboard_teleop.launch
2. PROFIT!
------
1. Info
rostopic info /odom
Output:
Type: nav_msgs/Odometry
nav_msgs is package which defines Odometry this message type
	Can be overwritten by launch file

ros::NodeHandle nh; //Object represents your node. Way to subscribe and publish
nh.subscribe('odom', 10, OdomCallback)
//10 er buffer/queue. New messages after that will be dropped
//OdomCallback ->callback function

#include "nav_msgs/Odemetry"
void OdomCallback(const nav_msgs::Odometry::ConstPtr& msg){
	ROS_INFO('
}

....
rosmsgs show nav_msgs/Odometry

# Bagging
#### Crop a bag
```bash
rosbag filter input.bag output.bag "t.secs <= 1284703931.86"
```
#### Record all topics
```bash
rosbag record -a
```

## Environment
Ensure tha environment variables are set:
1.
printenv | grep ROS
2. PROFIT!

----
rosrun rosserial_python serial_node.py /dev/ttyACM0

# Questions
1) 
target_link_libraries(
  r18dv_isam2
  ${catkin_LIBRARIES}
  ${Boost_LIBRARIES}
)
Hva er Boost_LIBRARIES?


2) 
find_package(Boost REQUIRED COMPONENTS)
find_package, er det dependencies til nodene?
3)

add_definitions(-std=c++11)
Er ette på en måte et alias?