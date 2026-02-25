import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import "../../themes"

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"

    property var theme
    property var widthRod
    property var persons: []
    property var values: []

    ColumnLayout {
        anchors.fill: parent

            // ==== y
            Column {
                id: yAxis
                width: 30
                spacing: 5
                anchors.bottom: xAxis.top

                property int ticks: 12
                property real maxValue: values.reduce((a,b)=>Math.max(a,b),0)

                Repeater {
                    model: ticks
                    delegate: Row {
                        spacing: 5
                        Rectangle { width: 2; height: 10; color: "green" }
                        Label {
                            text: ((maxValue / (ticks-1)) * model.index).toFixed(0)
                            font.pixelSize: 10
                        }
                    }
                }
            }

            // ==== x
            Rectangle {
                id: xAxis
                height: 2
                color: "red"
                anchors.bottom: parent.bottom
                anchors.left: yAxis.width
                anchors.right: parent.right
            }


            Row {
                id: barsRow
                spacing: 10
                anchors.bottom: xAxis.top
                anchors.left: yAxis.right
                anchors.right: parent.right

                Repeater {
                    model: values.length
                    Column {
                        spacing: 5
                        anchors.bottom: parent.bottom

                        Rectangle {
                            width: root.widthRod
                            height: values[index]*10
                            color: "#fc7a00"
                            radius: 8
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Label {
                            text: persons[index]
                            font.pixelSize: 12
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "black"
                        }
                    }
                }
            }


            Canvas {
                id: parabolaCanvas
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.clearRect(0, 0, width, height)
                    ctx.strokeStyle = "blue"
                    ctx.lineWidth = 2

                    var points = []
                    var spacing = 10
                    var barWidth = 40
                    var scale = 2.5
                    var shift = 20

                    for (var i=0; i<values.length; i++) {
                        var x = yAxis.width + i*(barWidth + spacing) + barWidth/2
                        var y = height - values[i]*scale - 10 - shift
                        points.push({x:x, y:y})
                    }

                    ctx.beginPath()
                    ctx.moveTo(points[0].x, points[0].y)
                    for (var i=1; i<points.length; i++) {
                        var cpX = (points[i-1].x + points[i].x)/2
                        ctx.bezierCurveTo(cpX, points[i-1].y, cpX, points[i].y, points[i].x, points[i].y)
                    }
                    ctx.stroke()
                }
            }

        }
    }
//}
