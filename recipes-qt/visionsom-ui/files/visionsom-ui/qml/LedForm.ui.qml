import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 800
    height: 480

    title: qsTr("LED demo")
    property alias led1sw: ledSwitch1.checked
    property alias led2sw: ledSwitch2.checked

    Image {
        id: image
        x: -13
        y: 89
        width: 496
        height: 298
        source: "qrc:img/visionCB-std-2.jpg"
        fillMode: Image.PreserveAspectFit

        RadioButton {
            id: led1
            x: 164
            y: 242
            width: 35
            height: 32
            text: qsTr("")
            autoExclusive: false
            checkable: false
            checked: ledSwitch1.checked
        }

        RadioButton {
            id: led2
            x: 206
            y: 242
            width: 35
            height: 32
            text: qsTr("")
            autoExclusive: false
            checked: ledSwitch2.checked
            checkable: false
        }
    }

    Column {
        id: column
        width: 300
        spacing: 20
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0

        Label {
            width: 295
            height: 50
            text: qsTr("Use switches below to control LEDs")
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 15
            wrapMode: Text.WordWrap
        }

        Switch {
            id: ledSwitch1
            width: 200
            height: 46
            text: qsTr("LED GPIO13")
            topPadding: 5
            display: AbstractButton.TextBesideIcon
            autoExclusive: false
            font.pixelSize: 15
        }

        Switch {
            id: ledSwitch2
            width: 200
            height: 46
            text: qsTr("LED GPIO12")
            checked: false
            display: AbstractButton.TextBesideIcon
            topPadding: 5
            autoExclusive: false
            font.pixelSize: 15
        }
    }
}

/*##^##
Designer {
    D{i:0;height:480;width:800}
}
##^##*/

