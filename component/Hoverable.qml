import QtQuick 2.12
import QtQuick.Controls 2.12
import "../themes"

Item {
    id: root

    property var    theme          : PurpleTheme {}
    property alias source: image.source
    property alias text: label.text

    property real  imageHoverOpacity: 0.6

    width: 24
    height: 24

    Image {
        id: image
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        visible: source !== ""
    }

    Label {
        id: label
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: source === ""
        font.pixelSize: Math.max(10, root.height * 0.4)
        color: theme.textWhite
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onEntered: {
            if (image.visible) image.opacity = root.imageHoverOpacity
            if (label.visible) label.color   = theme.turquoise
        }
        onExited: {
            if (image.visible) image.opacity = 1.0
            if (label.visible) label.color = theme.textWhite
        }
    }
}
