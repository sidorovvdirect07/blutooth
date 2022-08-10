
import QtQuick 2.1

Image {
    id: root
    width: 600; height: 800
    property string remoteDevice;
    property string fileName;
    onRemoteDeviceChanged: {
        loader.source = "PictureSelector.qml"
    }
    onFileNameChanged: {
        fileTransfer.initTransfer(remoteDevice, fileName);
        loader.source = "FileSending.qml"
    }

    Loader {
        id: loader
        anchors.fill: parent
        source: "DeviceDiscovery.qml"
    }

}

