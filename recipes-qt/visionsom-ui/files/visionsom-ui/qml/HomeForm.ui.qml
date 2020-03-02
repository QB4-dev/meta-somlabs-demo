import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 800
    height: 480

    title: qsTr("Home")

    Column {
        id: column
        x: 345
        width: 400
        spacing: 10
        anchors.topMargin: 10
        anchors.bottom: parent.bottom
        anchors.top: parent.top
        anchors.right: parent.right

        Label {
            width: parent.width
            height: 30
            text: qsTr("VisionSOM-6ULL YOCTO Project Demo")
            font.pixelSize: 15
            wrapMode: Text.WordWrap
        }

        Image {
            id: logoSOMLabs
            width: 188
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "qrc:img/somlabs_logo.png"
        }

        Image {
            id: logoYocto
            width: 188
            height: 100
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:img/yocto.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: logoQt
            width: 188
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "qrc:img/Qt_logo.svg"
        }
    }

    Image {
        id: boardImage
        x: 15
        y: 30
        width: 379
        height: 330
        source: "qrc:img/visionCB-std-1.jpg"
        fillMode: Image.PreserveAspectFit
    }

    ProgressBar {
        id: progressBar
        x: 36
        y: 366
        width: 379
        height: 17
        indeterminate: true
        value: 0.5
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:400;anchors_y:73}
}
##^##*/

