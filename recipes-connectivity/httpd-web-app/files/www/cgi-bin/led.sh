#!/bin/sh

LED1="/sys/devices/soc0/leds/leds/usr2"
LED2="/sys/devices/soc0/leds/leds/usr3"

read QUERY_STRING

[ -z $QUERY_STRING ] && exit


QUERY=$QUERY_STRING"&"
while true
do
	ARG=${QUERY%%&*}
	[ "$ARG" = "" ] && break;

	ARG_VALUE=${ARG#*=}
	ARG_NAME=${ARG%=*}

	if [ "$ARG_NAME" == "led1" ]; then
	   LED1_ST=$ARG_VALUE
	fi

	if [ "$ARG_NAME" == "led2" ]; then
	   LED2_ST=$ARG_VALUE
	fi

	QUERY=${QUERY#*&}
done

[ ! -z $LED1_ST ] && echo $LED1_ST > $LED1/brightness
[ ! -z $LED2_ST ] && echo $LED2_ST > $LED2/brightness

cat << EOF
Content-Type: application/json; charset=UTF-8

EOF

echo "{"
echo "\"status\":\"led state updated\""
echo "}"
exit
fi
