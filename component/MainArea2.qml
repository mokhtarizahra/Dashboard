import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"
import "../Images"


Rectangle {

    property var theme: OrpTheme {}

    color: "transparent"
    anchors.fill: parent
    anchors.margins: 16


    GridLayout {
        id: mainGrid
        anchors.fill: parent
        rowSpacing: 20
        columnSpacing: 20
        columns: 4
        Layout.fillWidth: true
        Layout.fillHeight: true

        // ==== Calculating column widths
        property int cardWidth: (mainGrid.width - (columns - 1) * columnSpacing) / columns

        // ==== Card 1
        EmployeeOnlineCard {
            title: "LOREM"
            Layout.row: 0
            Layout.column: 0
            Layout.preferredWidth: mainGrid.cardWidth
            Layout.fillHeight: true
            textLable: "black"
            itemsIconText: [
                { iconSource: "qrc:/Images/icons8-arrow-Up.png"  ,   iconText: "1974"   , description2: "Dolor sit amet, consectetuer adipiscing elit" },
                { iconSource: "qrc:/Images/icons8-arrow-down.png",   iconText: " 287"   , description2: "Vel illum dolare eu feugiat nulla facilisis at vero" }
            ]
            theme: OrpTheme {}
        }

        // ==== Card 2
        TodayCalendar {
            Layout.row: 0
            Layout.column: 1
            Layout.preferredWidth: mainGrid.cardWidth
            Layout.fillHeight: true
            theme: OrpTheme {}
        }

        // ==== Row 2

        ChartCard {
            Layout.row: 1
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.preferredWidth: mainGrid.cardWidth * 2 + mainGrid.columnSpacing
            Layout.fillHeight: true
            theme: OrpTheme {}
            showChart5: false
            showChart6: false
            showChart2: true
            title: "Dolor sit amet"
            comboModel: comboModel3
        }

        // ==== Row 3
        RowLayout {
            Layout.row: 2
            Layout.column: 0
            Layout.columnSpan: 3
            spacing: 10
            Layout.fillWidth: true
            Layout.fillHeight: true

            ChartCard {
                Layout.fillWidth: true
                Layout.fillHeight: true
                theme: OrpTheme {}
                showComboBox: false
                showChart5: true
                showComboText: false
            }

            ChartCard {
                Layout.fillWidth: true
                Layout.fillHeight: true
                theme: OrpTheme {}
                showChart6: true
                showComboBox: false
                title: "Adipiscing"
            }
        }

        // ==== Column 3
        ColumnLayout {
            Layout.row: 0
            Layout.column: 2
            Layout.rowSpan: 2
            spacing: 10
            Layout.preferredWidth: mainGrid.cardWidth
            Layout.fillHeight: true

            RECProgressCard {
                title: "LOREM IPSUM"
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 2 / 5
                theme: OrpTheme {}
                progressModel: [
                    { text: "Consecteture", value: 65, profile: theme.progressProfiles.default },
                    { text: "Adipiscing", value: 85, profile: theme.progressProfiles.warning },
                    { text: "Sit amet", value: 35, profile: theme.progressProfiles.default }
                ]
            }

            CirProgressBarGAPCard {
                currentValue: 75
                maxValue: 100
                progressGap : 0
                progressStartAngleDeg : 90
                rangeAngle            :360
                progressShowPercent   : true
                progressLineWidth     :10
                theme                 : OrpTheme { }
                Layout.fillWidth      : true
                Layout.preferredHeight: parent.height * 3 / 5
                progressTrackColor    : "transparent"
                buttonVisible         : true
                itemInformation: [
                    { title2:""  ,    description:"Lorem ipsum dolor sit amet,\n consectetuer adiplscing" },
                ]
            }
        }

        // ==== Column 4
        ColumnLayout {
            Layout.row: 0
            Layout.column: 3
            Layout.rowSpan: 3
            spacing: 10
            Layout.preferredWidth: mainGrid.cardWidth
            Layout.fillHeight: true


            SearchModule {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 1 / 15
                theme: OrpTheme {}
                widthRatio: 0.25
                heightRatio: 0.15
                marginsDash: 0
                searchIconBack: theme.chartLinelightpurple
            }

            ChartCard {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 6 / 15
                theme: OrpTheme {}
                showChart4: true

                title: "Dolor sit amet"
                comboModel: comboModel3
            }

            ChartCard {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 3 / 15
                theme: OrpTheme {}
                showChart5_1: true
                title: "Delenit augue"
                showComboBox: false
            }
            ChartCard {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 5 / 15
                theme: OrpTheme {}
                showChart4: true
                title: "Consectetuer"
                comboModel: comboModel2
            }
        }
    }

}
