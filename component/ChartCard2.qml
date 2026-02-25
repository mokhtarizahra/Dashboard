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
    property var values1: [50, 80, 120, 70]
    property var values2: []

    gradient: Gradient {
        GradientStop { position: 0.0; color: theme.cardBackgroundTop }
        GradientStop { position: 1.0; color: theme.cardBackgroundTop }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        spacing: 8

        // ===== Title
        Label {
            text: root.title
            color: theme.titleTextOrange
            font.pixelSize: 16
            font.family: "Times New Roman"
        }

        // ===== Chart
        ChartView {
            id: chart
            Layout.fillWidth: true
            Layout.fillHeight: true
            antialiasing: true
            legend.visible: true
            legend.alignment: Qt.AlignTop
            backgroundColor: "transparent"

            ValueAxis {
                id: axisY
                min: 0
                max: {
                    if (values1.length > 0 && values2 !== undefined && values2.length > 0) {
                        return Math.max.apply(Math, values1.concat(values2)) * 1.2
                    } else if (values1.length > 0) {
                        return Math.max.apply(Math, values1) * 1.2
                    } else if (values2 !== undefined && values2.length > 0) {
                        return Math.max.apply(Math, values2) * 1.2
                    } else {
                        return 100
                    }
                }
                labelFormat: "%d"
                labelsColor: theme.axisLabel
                labelsFont.pixelSize: 12
                gridVisible: false
                lineVisible: true
            }

            ValueAxis {
                id: axisX
                min: 1
                max: Math.max(values1.length, values2.length)
                tickCount: Math.max(values1.length, values2.length)
                labelsVisible: false
                gridVisible: false
                lineVisible: true
            }

            // ===== The first series
            SplineSeries {
                id: series1
                name: "Dataset 1"
                axisX: axisX
                axisY: axisY
                color: "orange"
                width: 3
                Component.onCompleted: {
                    for(var i=0; i<values1.length; i++){
                        append(i+1, values1[i])
                    }
                }
            }

            // ===== The second series Only if values2 exists
            SplineSeries {
                id: series2
                visible: values2 !== undefined && values2.length > 0
                name: "Dataset 2"
                axisX: axisX
                axisY: axisY
                color: "lightblue"
                width: 3
                Component.onCompleted: {
                    if (values2 !== undefined) {
                        for(var i=0; i<values2.length; i++){
                            append(i+1, values2[i])
                        }
                    }
                }
            }

        }
    }
}
