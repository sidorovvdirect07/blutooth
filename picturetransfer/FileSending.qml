import QtQuick 2.1

Item {
    Button {
        x: 40
        y: 40
        text: "Back"
        onClicked: loader.source = "DeviceDiscovery.qml"
    }

    Text {
        anchors.bottom: theProgress.top
        anchors.left: theProgress.left
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.bottomMargin: 40
        wrapMode: Text.Wrap
        color: "white"
        text: "Sending file: " + root.fileName + "<br>" + "Remote-Device:" + root.remoteDevice
    }

    Rectangle {
        id: theProgress
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 100
        width: (parent.width - 200) * fileTransfer.progress
        height: 50
        color: "black"
        opacity: 0.7
        Behavior on width {
            NumberAnimation {duration: 300}
        }
    }
    Text {
        text: "0%"
        anchors.horizontalCenter: theProgress.left
        anchors.top: theProgress.bottom
        anchors.topMargin: 10
        color: "white"
    }

    Text {
        text: "100%"
        anchors.right: parent.right
        anchors.rightMargin: 100 - width/2
        anchors.top: theProgress.bottom
        anchors.topMargin: 10
        color: "white"
    }

    Image {
        anchors.top: theProgress.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 60
        fillMode: Image.PreserveAspectFit
        source: "file:" + root.fileName
    }
}
