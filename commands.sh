#!/bin/sh

# build catkin packages, need `cd catkin_ws`
catkin_make 
# refreah env
source catkin_ws/devel/setup.bash

# create a new package
catkin_create_pkg <pkg_name> [<dependencies>...]
catkin_create_pkg test2 roscpp rospy std_msgs nav_msgs

# find package
rospack find <pkg_name>
# ls package
rosls <pkg_name>
# find a file in a certain package
rosed <pkg_name> <file_name>
# cd package
roscd <pkg_name>

# boot master
roscore
# run a node
rosrun <pkg_name> <node_name>
# rosnode
rosnode list
rosnode info <node_name>
rosnode kill <node_name>
# roslaunch: launch master and multiple nodes, "run by one key"
roslaunch <pkg_name> <file_name.launch>

# rostopic 
rostopic list
rostopic info /topic_name       # describe
rostopic echo /topic_name       # contents
rostopic pub /topic_name ...    # publish message

# rosmsg
rosmsg list
rosmsg show /msg_name

# rosservice
rosservice list
rosservice info /service_name           # describe
rosservice call /service_name args...   # call service

# rossrv (data type)
rossrv list
rossrv show /srv_name

# rosparam
# parameter server is a kind of communication method using dictionaries.
rosparam list
rosparam get <param_key>
rosparam set <param_key>
rosparam dump <file_name>       # dump params to file (YAML)
rosparam load <filename>        # load params from file (YAML)
rosparam delete <param_key>     # delete a key from parameter dictionary

# rosbag
# record and replay workflow, topic <-> bag
rosbag record <topic_names>...
rosbag record -a                # record all
rosbag play <bag-files>
