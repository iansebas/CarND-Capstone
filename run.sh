#!/bin/bash

set +e

rosnode kill -a
killall -9 roscore
killall -9 rosmaster

set -e

CAPSTONE_HOME=$('pwd')

function finish_trap {
	cd $CAPSTONE_HOME
}
trap finish_trap EXIT


cd $CAPSTONE_HOME/ros
catkin_make
source devel/setup.sh
roslaunch launch/styx.launch

