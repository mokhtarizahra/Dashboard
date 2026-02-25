import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtCharts 2.12
import "../themes"

Rectangle {
    id: root
    width: 520
    height: 300
    radius: 12
    property var theme: PurpleTheme {}

    property string title: "Users Online"
    property var persons: ["Ali","Sara","Reza","Lara"]
    property var values: [50, 80, 120, 70]

    property var dropLines: []

    gradient: Gradient {
        GradientStop { position: 0.0; color: theme.cardBackgroundTop }
        GradientStop { position: 1.0; color: theme.cardBackgroundTop }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.scale = 1.01
        onExited: root.scale = 1.0
    }
    function rebuildDropLines() {

        dropLines.forEach(function(line){ line.destroy() });
        dropLines = [];

        for (var i = 0; i < values.length; i++) {
            var xPos = chart.mapToPosition(Qt.point(i+1, 0), series).x;
            var yPos = chart.mapToPosition(Qt.point(i+1, values[i]), series).y;

            var line = Qt.createQmlObject(
                'import QtQuick 2.12; Rectangle { width: 1; color: "#64748b"; }',
                chart
            )
            line.x = xPos - 0.5
            line.y = yPos
            line.height = chart.mapToPosition(Qt.point(i+1, 0), series).y - yPos
            dropLines.push(line)
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        Label {
            text: root.title
            color: theme.titleTextOrange
            font.pixelSize: 16
            font.family: "Times New Roman"
        }

        ChartView {
            id: chart
            Layout.fillWidth: true
            Layout.fillHeight: true
            antialiasing: true
            legend.visible: false
            backgroundColor: "transparent"

            ValueAxis { id: axisY; min:0; max: values.length>0?Math.max.apply(Math,values)*1.2:100; labelFormat:"%d"; labelsColor: theme.axisLabel; labelsFont.pixelSize:12; gridVisible:false; lineVisible:true }
            ValueAxis { id: axisX; min:1; max: values.length; tickCount: values.length; labelsVisible:false; gridVisible:false; lineVisible:true }

            SplineSeries {
                id: series
                axisX: axisX
                axisY: axisY
                color: theme.purple6
                width: 4
                Component.onCompleted: {
                    for(var i=0; i<values.length; i++){
                        append(i+1, values[i])
                    }
                    root.rebuildDropLines()
                }
            }

            Component.onCompleted: root.rebuildDropLines()

            Connections {
                target: chart
                onWidthChanged: root.rebuildDropLines()
                onHeightChanged: root.rebuildDropLines()
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onPositionChanged: {
                    tooltip.visible = false
                    var closestIndex = 0
                    var minDist = Math.abs(mouse.x - chart.mapToPosition(Qt.point(1, values[0]), series).x)
                    for(var i=1; i<values.length; i++){
                        var dist = Math.abs(mouse.x - chart.mapToPosition(Qt.point(i+1, values[i]), series).x)
                        if(dist < minDist){ minDist = dist; closestIndex = i; }
                    }
                    if(minDist < 20){
                        var pos = chart.mapToPosition(Qt.point(closestIndex+1, values[closestIndex]), series)
                        tooltip.text = persons[closestIndex] + ": " + values[closestIndex]
                        tooltip.x = pos.x
                        tooltip.y = pos.y - 30
                        tooltip.visible = true
                    }
                }
            }

            Label {
                id: tooltip
                visible: false
                color: theme.textWhite
                font.pixelSize: 12
                background: Rectangle { color: theme.tooltipBackground; radius: 4 }
                z: 999
            }

            Row {
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: (chart.width - 32) / (persons.length - 1)
                Repeater {
                    model: persons.length
                    Text {
                        text: persons[index]
                        color: theme.axisLabel
                        font.pixelSize: 12
                    }
                }
            }
        }
    }
}
