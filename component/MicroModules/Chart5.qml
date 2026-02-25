import QtQuick 2.12
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import "../../themes"

Item {
    id: root
    width: 180
    height: 20

    FontLoader {
        id: gothamFont
        source: "qrc:/fonts/GothamNarrowOffice-Regular.ttf"
    }

    property var    theme
    property var    segments     : []
    property real   gap          : 0
    property real   radius       : height / 2
    property bool   roundStart   : true
    property bool   roundEnd     : true
    property real   minWidth     : 100
    property int    boxSize      : 6
    property int    spacing      : 10
    property bool   showLabel    : false
    property bool   showSideLabel: false

    ColumnLayout {
        anchors.fill: parent
        spacing: 5
        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Label {
                text: root.showSideLabel && root.segments.length > 0 ? root.segments[0].sideLabel : ""
                visible: root.showSideLabel
                font.pixelSize: 8
                font.family: gothamFont.name
                color: theme.textWhite
                Layout.alignment: Qt.AlignVCenter
            }

            Canvas {
                id: canvas
                Layout.fillWidth: true
                Layout.preferredHeight: 15

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.reset();

                    // ==== total
                    var total = 0;
                    for (var i = 0; i < root.segments.length; i++)
                        total += root.segments[i].value;

                    // ==== rounded clip
                    ctx.save();
                    customRoundedRect(
                                ctx,
                                0, 0,
                                width, height,
                                root.radius,
                                root.roundStart,
                                root.roundEnd
                                );
                    ctx.clip();

                    // ==== draw segments
                    var x = 0;
                    for (var i = 0; i < root.segments.length; i++) {
                        var w = (root.segments[i].value / total) * width;

                        ctx.fillStyle = root.segments[i].color;
                        var isLast = (i === root.segments.length - 1);
                        var drawWidth = isLast ? w : (w - root.gap);

                        ctx.fillRect(x, 0, drawWidth, height);

                        x += w;
                    }

                    ctx.restore();
                }

                // ==== helper function
                function customRoundedRect(ctx, x, y, w, h, r, roundStart, roundEnd) {
                    var rs = roundStart ? r : 0;
                    var re = roundEnd   ? r : 0;

                    ctx.beginPath();
                    ctx.moveTo(x + rs, y);
                    ctx.lineTo(x + w - re, y);
                    if (re > 0)
                        ctx.quadraticCurveTo(x + w, y, x + w, y + re);
                    else
                        ctx.lineTo(x + w, y);

                    ctx.lineTo(x + w, y + h - re);
                    if (re > 0)
                        ctx.quadraticCurveTo(x + w, y + h, x + w - re, y + h);
                    else
                        ctx.lineTo(x + w, y + h);

                    ctx.lineTo(x + rs, y + h);
                    if (rs > 0)
                        ctx.quadraticCurveTo(x, y + h, x, y + h - rs);
                    else
                        ctx.lineTo(x, y + h);

                    ctx.lineTo(x, y + rs);
                    if (rs > 0)
                        ctx.quadraticCurveTo(x, y, x + rs, y);
                    else
                        ctx.lineTo(x, y);

                    ctx.closePath();
                }
            }

        }
        RowLayout {
            Layout.fillWidth: true
            Layout.margins: 10
            spacing: 8
            visible: root.showLabel

            Repeater {
                model: root.segments

                RowLayout {
                    spacing: root.spacing

                    Rectangle {
                        width: root.boxSize
                        height: root.boxSize
                        color: modelData.color
                        radius: 1
                    }

                    Label {
                        text: modelData.label
                        font.pixelSize: 10
                        font.family: gothamFont.name
                        color: theme.textWhite
                    }
                }
            }
        }
    }
    onSegmentsChanged: canvas.requestPaint()
    onGapChanged: canvas.requestPaint()
    onRadiusChanged: canvas.requestPaint()
    onRoundStartChanged: canvas.requestPaint()
    onRoundEndChanged: canvas.requestPaint()

}
