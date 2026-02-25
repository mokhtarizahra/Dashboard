import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtCharts 2.12
import "../../themes"

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"

    property var theme

    property var persons: []
    property var values1: []
    property var values2: []

    FontLoader { id: gothamFont;   source: "qrc:/fonts/GothamNarrowOffice-Regular.ttf" }


    ColumnLayout {
        anchors.fill: parent
        spacing: 8

        // ===== Chart
        ChartView {
            id: chart
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout. margins: 0

            legend.visible: true
            legend.alignment: Qt.AlignBottom
            legend.font.pixelSize: 10
            backgroundColor: "transparent"

            ValueAxis {
                id: axisY

                property real dataMin: 0
                property real dataMax: 40
                property int  step: 10

                Component.onCompleted: {
                    var allValues = []

                    if (values1 && values1.length > 0)
                        allValues = allValues.concat(values1)

                    if (values2 && values2.length > 0)
                        allValues = allValues.concat(values2)

                    if (allValues.length > 0) {
                        dataMin = Math.min.apply(Math, allValues)
                        dataMax = Math.max.apply(Math, allValues)
                    } else {
                        dataMin = 0
                        dataMax = 50
                    }
                }

                // ===== axis range aligned to 10
                min: Math.floor(dataMin / step) * step
                max: Math.ceil(dataMax / step) * step+ step

                tickCount: (max - min) / step + 1

                // ===== grid lines
                gridVisible: true
                 gridLineColor: Qt.rgba(0.5, 0.5, 0.5, 0.3)

                // ===== labels
                labelFormat: "%d"
                labelsColor: theme.axisLabel
                labelsFont.pixelSize: 10

                lineVisible: false
            }


            ValueAxis {
                id: axisX
                min: 1
                max: Math.max(values1.length, values2.length)
                tickCount: Math.max(values1.length, values2.length)
                labelsVisible: false
                lineVisible: false
                gridVisible: false
            }

            // ===== The first series
            SplineSeries {
                id: series1
                name: "Ipsum"
                axisX: axisX
                axisY: axisY
                color: theme.colorchart4_1
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
                name: "Lorem"
                axisX: axisX
                axisY: axisY
                color: theme.chartLinelightpurple
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
