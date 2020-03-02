import QtQuick  2.0
import Gpio_LED 1.0

LedForm {
    id: root
    Gpio_LED {
        devPath: "/sys/class/leds/usr2"
        ledState: led1sw
    }

    Gpio_LED {
        devPath: "/sys/class/leds/usr3"
        ledState: led2sw
    }
}
