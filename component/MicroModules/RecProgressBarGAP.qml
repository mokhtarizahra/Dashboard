import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../themes"

Item {
    id: root
    width: 300
    height: 20

    property int value: 0
    property var theme: PurpleTheme {}
    property string description: ""

    property color _startColor    : theme ? theme.startColor  : "red"
    property color _midleColor    : theme ? theme.midleColor  : "yellow"
    property color _endColor      : theme ? theme.endColor    : "green"

    RowLayout {
        anchors.fill: parent
        spacing: 4

        Canvas {
            id: progressCanvas
            Layout.fillWidth: true
            Layout.fillHeight: true
            property int segments: 32
            property int gap: 2

            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, width, height)

                var progressRatio = value / 100
                var segWidth = (width - (segments - 1) * gap) / segments
                var filledSegments = Math.round(segments * progressRatio)

                ctx.fillStyle = theme.strokeStyle
                for (var i = 0; i < segments; i++) {
                    var x = i * (segWidth + gap)
                    ctx.fillRect(x, 0, segWidth, height)
                }

                for (var i = 0; i < filledSegments; i++) {
                    var x = i * (segWidth + gap)
                    var t = i / (segments - 1)

                    var r, g, b
                    if (t < 0.5) {
                        var k = t / 0.5
                        r = _startColor.r * (1-k) + _midleColor.r * k
                        g = _startColor.g * (1-k) + _midleColor.g * k
                        b = _startColor.b * (1-k) + _midleColor.b * k
                    } else {
                        var k2 = (t - 0.5) / 0.5
                        r = _midleColor.r * (1-k2) + _endColor.r * k2
                        g = _midleColor.g * (1-k2) + _endColor.g * k2
                        b = _midleColor.b * (1-k2) + _endColor.b * k2
                    }

                    ctx.fillStyle =
                            "rgb(" +
                            Math.round(r * 255) + "," +
                            Math.round(g * 255) + "," +
                            Math.round(b * 255) + ")"

                    ctx.fillRect(x, 0, segWidth, height)
                }
            }


            Component.onCompleted: requestPaint()
            onWidthChanged: requestPaint()
            onHeightChanged: requestPaint()
        }
    }
}
