
import QtQuick 2.1
import Qt.labs.folderlistmodel 1.0

Item {
    Rectangle {
        id: title
        opacity: 0.7
        height: titleLabel.height + 90
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 70

        color: "#5c9fba"
        Text {
            id: titleLabel
            text: "Select picture"
            color: "white"
            font.bold: true
            font.pointSize: 15
            anchors.centerIn: parent
        }
    }

    ListView {
        id: listView
        clip: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: title.bottom
        anchors.topMargin: 0
        anchors.margins: 70
        spacing: 5
        add: Transition {
            NumberAnimation { properties: "x"; from: 1000; duration: 500 }
        }


        model: FolderListModel {
            folder: "file://"+SystemPictureFolder
            showDirs: false
        }

        delegate: Rectangle {

            opacity: 0.7
            height: label.height + 130
            width: listView.width + 2
            x: -1
            border.color: Qt.lighter("#67b0d1")
            border.width: 1
            color: mArea.pressed ? "#5c9fba" : "#67b0d1"
            Image {
                id: picture
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height-10
                 fillMode: Image.PreserveAspectFit
                asynchronous: true
                source: "file://" + model.filePath
            }


            Text {

                id: label
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.margins: 20
                anchors.left: picture.right

                text: model.fileName

                font.bold: true
                font.pointSize: 10
                color: "white"
                wrapMode: Text.WordWrap

            }
            MouseArea {
                id: mArea
                anchors.fill: parent
                onClicked: {
                    print ("path: " + model.filePath + " " + model.fileName)
                    root.fileName = model.filePath
                }
            }
        }

    }
}
