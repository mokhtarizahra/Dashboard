import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12


Button {
    id: root

    property int   radius       : 10
    property int   fontSize     : 14
    property color baseColor    : "#1976D2"
    property color hoverColor   : "#2196F3"
    property color disabledColor: "#B0BEC5"
    property color textColor    : "white"

    implicitHeight: 30
    implicitWidth: 100

    font.pixelSize: fontSize
    property bool disabled: false
    enabled: !disabled

    background: Rectangle {
        radius: root.radius
        color : !root.enabled ? root.disabledColor
              : root.down     ? Qt.darker(root.baseColor, 1.2)
              : root.hovered  ? root.hoverColor
                              : root.baseColor
    }

    contentItem             : Text {
        text                : root.text
        color               : root.enabled ? root.textColor : "#666"
        horizontalAlignment : Text.AlignHCenter
        verticalAlignment   : Text.AlignVCenter
        anchors.fill        : parent
    }

}
