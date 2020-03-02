import QtQuick 2.12
import QtQuick.Controls 2.5
import WifiAP 1.0

Page {
    id: page

    title: qsTr("WiFi demo")

    Column {
        id: column
        width: 380
        anchors.topMargin: 20
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.right: parent.right
        spacing: 5

        Label {
            width: parent.width
            height: 80
            text: qsTr("To connect with board using WiFi use following parameters:")
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 13
            wrapMode: Text.WordWrap
        }

        Label {
            id: connDetails
            width: parent.width
            height: 50
            text: "network: " + wifi.ssid + "\n" + "password: " + wifi.passwd
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap
            font.pixelSize: 12
        }
    }

    WifiAP {
        id: wifi
    }

    Image {
        id: image
        x: 0
        y: 200
        width: 357
        height: 176
        source: "qrc:img/visionCB-std-2.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 302
        y: 174
        width: 113
        height: 46
        rotation: 45
        source: "qrc:img/icons/iconmonstr-wireless-48.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        x: 391
        y: 217
        width: 229
        height: 112
        source: "qrc:img/icons/iconmonstr-laptop-72.png"
        fillMode: Image.PreserveAspectFit
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:460;width:800}
}
##^##*/

