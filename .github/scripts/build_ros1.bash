#!/bin/bash

package=event_array_viewer

# set up ROS
distros=('melodic' 'noetic')

#
# probe for the ROS1 distro
#
for distro in "${distros[@]}"
do
    echo "probing for ${distro}"
    if [[ -f "/opt/ros/${distro}/setup.bash" ]]; then
	source /opt/ros/${distro}/setup.bash
	echo "found distro: ${distro}"
	break
    fi
done

# run wstool to bring in the additional repositories required
wstool init src ./src/${package}/${package}.rosinstall

# build
catkin config -DCMAKE_BUILD_TYPE=RelWithDebInfo
catkin build

