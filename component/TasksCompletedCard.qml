import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 1.4

Rectangle {
    id: root
    width: 250
    height: 120
    radius: 8
    color: theme.success

    property alias title: titleLabel.text
    property alias value: valueLabel.text

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 8

        Label {
            id: titleLabel
            text: "Completed Today"
            color: theme.textPrimary
            font.pixelSize: 16
        }

        Label {
            id: valueLabel
            text: "0"
            color: theme.textPrimary
            font.pixelSize: 28
            Layout.alignment: Qt.AlignHCenter
        }
    }
}
