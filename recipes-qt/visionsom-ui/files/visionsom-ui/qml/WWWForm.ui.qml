import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    title: qsTr("Web APP")

    Label {
        x: 37
        y: 23
        width: 384
        height: 85
        text: qsTr("Type board IP address into web browser address bar to use device web interface")
        font.pixelSize: 13
        wrapMode: Text.WordWrap
    }

    Image {
        id: image
        x: -10
        y: 114
        width: 397
        height: 167
        source: "qrc:img/visionCB-std-2.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 308
        y: 66
        width: 527
        height: 318
        source: "qrc:img/web-browser.png"
        fillMode: Image.PreserveAspectFit
    }

    Label {
        x: 37
        y: 75
        width: 339
        height: 40
        text: "You can also type: http://visionsom6ull-wifi-cb-std.local/ to let the system find  the board"
        font.pixelSize: 10
        wrapMode: Text.WordWrap
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/

