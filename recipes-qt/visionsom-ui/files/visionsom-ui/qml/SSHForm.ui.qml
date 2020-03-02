import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    title: qsTr("SSH info")

    Image {
        id: image
        x: 0
        y: 163
        width: 321
        height: 155
        source: "qrc:img/visionCB-std-2.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        x: 402
        y: 184
        width: 229
        height: 112
        source: "qrc:img/icons/iconmonstr-laptop-72.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 293
        y: 218
        width: 113
        height: 46
        source: "qrc:img/icons/iconmonstr-wireless-48.png"
        fillMode: Image.PreserveAspectFit
        rotation: 45
    }

    Column {
        id: column
        width: 430
        spacing: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 10

        Label {
            width: parent.width
            height: 30
            text: qsTr("To connect with board using SSH use command below:")
            font.pixelSize: 12
            wrapMode: Text.WordWrap
        }

        Label {
            width: parent.width
            height: 30
            text: qsTr("ssh root@192.168.4.1\nor\nssh root@visionsom6ull-wifi-cb-std.local")
            font.italic: true
            wrapMode: Text.WordWrap
            font.pixelSize: 11
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:4;anchors_height:400;anchors_x:37;anchors_y:86}
}
##^##*/

