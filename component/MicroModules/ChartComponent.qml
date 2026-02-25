import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtCharts 2.12
import "../../themes"

Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true

    property var theme: PurpleTheme {}

    property string title: "Users Online"
    property int value: 120
    property var persons: []
    property var values: []

    property var dropLines: []

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.scale = 1.05
        onExited: root.scale = 1
        Behavior on scale { NumberAnimation { duration: 150 } }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        // ===== Chart
        ChartView {
            id: chart
            Layout.fillWidth: true
            Layout.fillHeight: true
            antialiasing: true
            legend.visible: false
            backgroundColor: "transparent"

            ValueAxis {
                id: axisY
                min: 0
                max: Math.max.apply(Math, values)*1.2
                labelFormat: "%d"
                labelsColor: theme.axisLabel
                labelsFont.pixelSize: 12
                lineVisible: false
                gridVisible: false
                gridLineColor: theme.gridLine
            }


            ValueAxis {
                id: axisX
                min: 1-0.5
                max: values.length+1
                tickCount: values.length
                labelsVisible: false
                lineVisible: true
                gridVisible: false
            }

            SplineSeries {
                id: series
                axisX: axisX
                axisY: axisY
                color: theme.chartLinelightpurple
                width: 3
            }

            ScatterSeries {
                id: pointSeries
                axisX: axisX
                axisY: axisY
                color: theme.cardBackgroundTop
                markerSize: 10
            }

            ScatterSeries {
                id: hoverSeries
                axisX: axisX
                axisY: axisY
                markerSize: 14
                color: "transparent"

                onHovered: function(point, state) {
                    if (state && point.x >= 1 && point.x <= persons.length) {
                        tooltip.text = "Person: " + persons[Math.round(point.x)-1] +
                                "\nValue: " + Math.round(point.y)
                        var pos = chart.mapToPosition(point, series)
                        tooltip.x = pos.x
                        tooltip.y = pos.y - 30
                        tooltip.visible = true
                    } else {
                        tooltip.visible = false
                    }
                }
            }

            Label {
                id: tooltip
                visible: false
                color: theme.textWhite
                font.pixelSize: 12
                background: Rectangle {color: "#333"; radius: 4 }
                z: 999
            }

            // Custom X
            Item {
                id: xLabelsContainer
                width: chart.width
                height: 30
                anchors.bottom: chart.bottom

                Repeater {
                    id: xLabelRepeater
                    model: persons.length
                    Text {
                        text: persons[index]
                        color: theme.axisLabel
                        font.pixelSize: 12
                        y: 0
                    }
                }

                function updateLabelsPosition() {
                    for (var i = 0; i < xLabelRepeater.count; i++) {
                        var lbl = xLabelRepeater.itemAt(i)
                        if (lbl) {
                            var pos = chart.mapToPosition(Qt.point(i+1, 0), series)
                            lbl.x = pos.x - lbl.width/2
                        }
                    }
                }

                Connections {
                    target: chart
                    onWidthChanged: xLabelsContainer.updateLabelsPosition()
                    onHeightChanged: xLabelsContainer.updateLabelsPosition()
                }
            }
        }
    }

    function rebuildSeries() {
        series.clear()
        pointSeries.clear()
        hoverSeries.clear()

        dropLines.forEach(function(line){ line.destroy() })
        dropLines = []

        for (var i = 0; i < values.length; i++) {
            var x = i + 1
            var y = values[i]
            series.append(x, y)
            pointSeries.append(x, y)
            hoverSeries.append(x, y)

            var posTop = chart.mapToPosition(Qt.point(x, y), pointSeries)
            var posBottom = chart.mapToPosition(Qt.point(x, 0), pointSeries)

            var line = Qt.createQmlObject(
                        'import QtQuick 2.12; Rectangle { width: 1; color: "#64748b"; }',
                        chart
                        )
            line.x = posTop.x - 0.5
            line.y = posTop.y
            line.height = posBottom.y - posTop.y
            dropLines.push(line)
        }

        axisY.max = values.length > 0 ? Math.max.apply(Math, values)*1.2 : 100
        xLabelsContainer.updateLabelsPosition()
    }

    Component.onCompleted: rebuildSeries()

    onValuesChanged: rebuildSeries()
    onPersonsChanged: rebuildSeries()
}
