============================
		ROS notes
============================

===== Commands
Get on another ROS-network
http://inertia.ed.ntnu.no:8090/display/DRIV/How+to+set+up+and+use+SSH+on+Jetson+TX1
1.
export ROS_IP=192.168.1.<your-own-ip>
2. export ros master uri
export ROS_MASTER_URI=http://192.168.1.10:11311



======== General notes
All nodes listen to all topics
All nodes can publish on all topics
All topics are of a particular type

==== Catkin
=== Create workspace
'''
source /opt/ros/kinetic/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
source ~/catkin_ws/devel/setup.bash
'''
http://wiki.ros.org/catkin/Tutorials/create_a_workspace



==== CUDA
Jeg slettet nppi fra denne listen i CMakelist.txt
  ${CUDA_LIBRARIES} ${CUDA_npps_LIBRARY}
1. Slettet
${CUDA_nppi_LIBRARY}
2. Da ble den bygget. Fikk noe error om io.

===== Turtlebot
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

======== Commands
1. printe alle noder
rosnode list
2. PROFIT!
------
1. printe alle topics
rostopic list
2. PROFIT!
------
1. Detaljert info om en node
rosnode info /some_node
2. PROFIT!
------
1. Se alle noder som publisher og subscriber til en node
rostopic info /some_topic
2. PROFIT!
------
1. Printe ut data som blir published på et topic
rostopic echo /some_topic
2. PROFIT!
-----
1. Sende data på en topic
rostopic pub /some_topic msg/MessageType "data: value"
2. PROFIT
(formated by yamel. Use tab completion)



==== Notes

Message
	Allows nodes written i c++ and python to communicate with each other
	Defined in a .msg file - special format
	Must be compiled into C++ / Python classes before using them

ROS master
	Need one ROS master to make it work

	Keep track of all nodes,
	which node is publishing to which topics
	which node is subscribed to which topics

	ROS is just keeping track of meta information
		What they are publishing
		IP-adresses

	running in known IP-address - ROS_MASTER_URI - localhost:11311 - default port number

	All other nodes port number random

	Start two ways
	roscore - just ros master
	roslaunch and isn't roscore running will start roscore automaticly

	roscore - recommended


==== turtlebot tutorial
	Robot published the name and distance to the closest landmark
	Zones are circles with 1 meter diameter -> "I'm near the cube"

==== Environment
Ensure tha environment variables are set:
1.
printenv | grep ROS
2. PROFIT!

----
rosrun rosserial_python serial_node.py /dev/ttyACM0
