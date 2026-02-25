import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

ComboBox {
    id: root
    property var theme
    property alias modelData    : root.model
    property int   radiusCombo  : 10
    property color borderCombo  : theme.borderCombo

    Layout.fillWidth: true
    Layout.preferredHeight: 20
    Layout.minimumHeight: 15

    currentIndex: {
        const i = model.indexOf(root.displayText)
        return i >= 0 ? i : 0
    }

    // ===== Background
    background: Rectangle {
        radius: root.radiusCombo
        color: "transparent"
        border.color: root.borderCombo
        border.width: 1
    }

    // ===== Text
    contentItem: Text {
        anchors.fill: parent
        anchors.margins: 0
        text: root.displayText
        color: "#333"
        verticalAlignment  : Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        leftPadding: 10
        rightPadding: 10
        font.pixelSize: Math.min(14, parent.height * 0.5)
        wrapMode: Text.NoWrap
    }

    // ===== Arrow
    indicator: Item {
        width: 20
        height: parent.height
        anchors.right: parent.right

        Canvas {
            anchors.centerIn: parent
            width: 8
            height: 6
            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, width, height)

                ctx.strokeStyle = "#555"
                ctx.lineWidth = 1.8
                ctx.lineCap = "round"
                ctx.lineJoin = "round"

                ctx.beginPath()
                ctx.moveTo(0, 0)
                ctx.lineTo(width / 2, height)
                ctx.lineTo(width, 0)
                ctx.stroke()
            }
        }
    }
}
