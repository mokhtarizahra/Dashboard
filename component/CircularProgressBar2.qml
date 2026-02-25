import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"


Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true

    property var theme: PurpleTheme {}

    readonly property color   cardBgTop: theme ? theme.cardBackgroundTop : "#1e293b"
    property color           startColor: theme ? theme.startColor :        "red"
    property color           midleColor: theme ? theme.midleColor :        "yellow"
    property color             endColor: theme ? theme.endColor :          "green"
    readonly property color  textLable2: theme ? theme.textLable2:         "#df746e"
    readonly property color textPrimary: theme ? theme.textPrimary :       "#ffffff"
    readonly property color strokeStyle: theme ? theme.strokeStyle :       "#334155"


    property int currentValue: 0
    property int maxValue: 100

    Layout.alignment: Qt.AlignHCenter

    Canvas {
        id: canvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centerX = width / 2;
            var centerY = height / 2;
            var radius = Math.min(width, height) / 2 - 10;
            var lineWidth = 10;

            var startAngle = -Math.PI / 2;
            var totalSegments = 100;
            var gap = 0.02;

            for (var j = 0; j < totalSegments; j++) {
                var bgA1 = startAngle + (2 * Math.PI / totalSegments) * j;
                var bgA2 = bgA1 + (2 * Math.PI / totalSegments) - gap;

                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, bgA1, bgA2);
                ctx.lineWidth = lineWidth;
                ctx.strokeStyle = _strokeStyle;
                ctx.stroke();
            }

            var percentValue = currentValue / maxValue;
            var activeSegments = Math.floor(totalSegments * percentValue);

            for (var i = 0; i < activeSegments; i++) {
                var angle1 = startAngle + (2 * Math.PI / totalSegments) * i;
                var angle2 = angle1 + (2 * Math.PI / totalSegments) - gap;

                var percent = i / totalSegments;

                var r1 = root.startColor.r;
                var g1 = root.startColor.g;
                var b1 = root.startColor.b;

                var r2 = root.midleColor.r;
                var g2 = root.midleColor.g;
                var b2 = root.midleColor.b;

                var r3 = root.endColor.r;
                var g3 = root.endColor.g;
                var b3 = root.endColor.b;

                var r, g, b;

                //  start → middle
                if (percent <= 0.5) {
                    var p = percent / 0.5;

                    r = r1 + (r2 - r1) * p;
                    g = g1 + (g2 - g1) * p;
                    b = b1 + (b2 - b1) * p;
                }
                //  middle → end
                else {
                    var p2 = (percent - 0.5) / 0.5;

                    r = r2 + (r3 - r2) * p2;
                    g = g2 + (g3 - g2) * p2;
                    b = b2 + (b3 - b2) * p2;
                }
                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, angle1, angle2);
                ctx.lineWidth = lineWidth;
                ctx.strokeStyle = "rgb(" +
                        Math.round(r * 255) + "," +
                        Math.round(g * 255) + "," +
                        Math.round(b * 255) + ")";
                ctx.stroke();
            }
        }

    }
    onCurrentValueChanged: canvas.requestPaint()
    onMaxValueChanged: canvas.requestPaint()

    Label {
        text: root.currentValue /*+ " / " + root.maxValue*/
        color: textPrimary
        font.pixelSize: 20
        font.family: "Times New Roman"
        anchors.centerIn: parent
    }
}
