#!/bin/bash
set -e
#set -v

source $SETTINGS

ip link add link $dev name ${dev}.${ROBOT_ID} type vlan id ${ROBOT_ID}
ip link set dev ${dev}.${ROBOT_ID} up
ip link set dev ${dev}.${ROBOT_ID} mtu 1420

ip addr add dev ${dev}.${ROBOT_ID} 192.168.186.10/24

#ros2 daemon stop
#ping -q -c 1 -w 10 192.168.186.3 > /dev/null && echo "Raspberry Pi reachable" || (echo "Failed to ping Raspberry Pi"; exit -1)
#ping -q -c 1 -w 10 192.168.186.2 > /dev/null && echo "Base reachable" || (echo "Failed to ping Base"; exit -1)
echo "Tunnel ready"
echo "Stopping this process will terminate the VPN"
echo "Restarting the ros2 daemon ..."
su - robohub -c "source $SETTINGS && ros2 daemon stop && ros2 daemon start"
echo "Done"
echo "To work with the robots ROS topics in other shells, enter the command ros_robot"

