
import QtQuick 2.1
import QtBluetooth 5.2

Item {
    Rectangle {
        id: title
        opacity: 1
        height: titleLabel.height + 90
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 100

        color: "skyblue"
        Text {
            id: titleLabel
            text: "выбрать устройство"
            color: "black"
            font.pointSize: 25
            anchors.centerIn: parent
        }
    }


    ListView {

        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: title.bottom
        anchors.topMargin: 0
        anchors.margins: 100
        clip: true
        add: Transition {
            NumberAnimation { properties: "x"; from: 1000; duration: 500 }
        }

        model: BluetoothDiscoveryModel {
            discoveryMode: BluetoothDiscoveryModel.DeviceDiscovery
            onErrorChanged: {
                if (error == BluetoothDiscoveryModel.NoError)
                    return;
                if (error == BluetoothDiscoveryModel.PoweredOffError)
                    titleLabel.text = "Bluetooth turned off";
                else
                    titleLabel.text = "Cannot find devices";
            }
        }

        delegate: Button {
            width: listView.width + 2
            text: model.name
            onClicked: root.remoteDevice = model.remoteAddress
        }
    }
}
