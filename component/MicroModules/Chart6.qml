import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
import QtCharts 2.14
import "../../themes"

Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true

    FontLoader { id: gothamFont; source: "qrc:/fonts/GothamNarrowOffice-Regular.ttf" }

    property var theme


    ChartView {
        anchors.fill: parent
        backgroundColor: "transparent"
        antialiasing: true
        legend.visible: false

        ValueAxis {
            id: axisY
            labelsFont.pixelSize: 6
            labelsFont.family: gothamFont.name
        }

        BarSeries {
            axisY: axisY
            axisX: BarCategoryAxis {
                categories: ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
                labelsFont.pixelSize: 6
                labelsFont.family: gothamFont.name
                gridVisible: false
            }

            BarSet { label: "Bob";   values: [200,100,250,50,300,180,220]; color: theme.colorchart4_1 }
            BarSet { label: "Susan"; values: [100,200,150,80,220,50,200]; color: theme.colorchart6_1 }
            BarSet { label: "James"; values: [300,50,220,50,150,100,300]; color: theme.colorchart6_2 }
        }
    }
}
