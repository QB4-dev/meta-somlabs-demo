import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.5

ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Stack")
    font: appFont.name

    FontLoader {
        id: appFont;
        source: "qrc:/fonts/Roboto/Roboto-Light.ttf"
    }

    Shortcut {
         sequences: ["1"]
         enabled: stackView.depth == 1
         onActivated:  stackView.push("qml/LedDemo.qml")
    }

    Shortcut {
         sequences: ["2"]
         enabled: stackView.depth > 1
         onActivated: stackView.pop()
     }

    header: ToolBar {
        contentHeight: 15
        RowLayout {
            anchors.fill: parent
            ToolButton {
                id: toolButton
                icon.name: "menu"
                icon.source: stackView.depth > 1 ? "qrc:/img/icons/iconmonstr-arrow-back-48.png" : "qrc:/img/icons/iconmonstr-menu-48.png"
                font.pixelSize: Qt.application.font.pixelSize

                onClicked: {
                    if (stackView.depth > 1) {
                        stackView.pop()
                    } else {
                        drawer.open()
                    }
                }
            }

            Label {
                Layout.fillWidth: true
                text: stackView.currentItem.title
            }

            ToolButton {
                id: aboutButton
                text:"?"
                font.bold: true
                onClicked: aboutDialog.open()
            }
        }
    }


    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        interactive: stackView.depth === 1

        ListView {
            id: listView
            currentIndex: -1
            anchors.fill: parent
            focus: true

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "LED demo";  source: "qml/LedDemo.qml" }
                ListElement { title: "WiFi demo"; source: "qml/WifiForm.ui.qml" }
                ListElement { title: "SSH demo";  source: "qml/SSHForm.ui.qml" }
                ListElement { title: "WWW demo";  source: "qml/WWWForm.ui.qml" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        initialItem: "qml/HomeForm.ui.qml"
        anchors.fill: parent
    }

    Dialog {
           id: aboutDialog
           modal: true
           focus: true
           title: "About"
           x: (window.width - width) / 2
           y: window.height / 6
           width: Math.min(window.width, window.height) / 3 * 2
           contentHeight: aboutColumn.height

           Column {
               id: aboutColumn
               spacing: 20

               Label {
                   width: aboutDialog.availableWidth
                   text: "The Qt Quick Controls 2 module delivers the next generation user interface controls based on Qt Quick."
                   wrapMode: Label.Wrap
                   font.pixelSize: 12
               }

               Label {
                   width: aboutDialog.availableWidth
                   text: "In comparison to the desktop-oriented Qt Quick Controls 1, Qt Quick Controls 2 "
                       + "are an order of magnitude simpler, lighter and faster, and are primarily targeted "
                       + "towards embedded and mobile platforms."
                   wrapMode: Label.Wrap
                   font.pixelSize: 12
               }
          }
    }
}
