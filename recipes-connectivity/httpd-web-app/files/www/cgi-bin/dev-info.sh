#!/bin/sh

. /etc/os-release #get os release info

if [ ! -z "$JENKINS_BUILD_NUMBER" ] && [ ! -z "$JENKINS_SVN_REVISION" ] 
then
    FW_VER=$(echo $PRETTY_NAME bulid $JENKINS_BUILD_NUMBER SVN rev $JENKINS_SVN_REVISION)
else
    FW_VER=$(echo "$PRETTY_NAME dev bulid" )
fi

KERNEL=$(uname -s)
KERNEL_VER=$(uname -r)

ETH0_MAC=$(ifconfig eth0 | grep 'HWaddr' | tr -s ' ' | cut -d ' ' -f5 | awk '{ print $1 }')
WLAN0_MAC=$(ifconfig wlan0 | grep 'HWaddr' | tr -s ' ' | cut -d ' ' -f5 | awk '{ print $1 }')

cat << EOF
Content-Type: application/json; charset=UTF-8

EOF

echo "{"
echo "\"kernel\":\"$KERNEL\","
echo "\"kernel_ver\":\"$KERNEL_VER\","
echo "\"fw_ver\":\"$FW_VER\","
echo "\"eth0_mac\":\"$ETH0_MAC\","
echo "\"wlan0_mac\":\"$WLAN0_MAC\""
echo "}"

