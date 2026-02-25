import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"


Rectangle {

    property var themeP: PurpleTheme {}

    color: "transparent"
    anchors.fill: parent
    anchors.margins: 16

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        anchors.fill: parent
        anchors.margins: 0

        Label {
            text: "Dashboard"
            color: themeP.textWhite
            font.pixelSize: Math.max(20, width * 0.03)
        }
        RowLayout {
            CirProgressBarGAPCard {
                currentValue: 1544
                maxValue: 4000
                rangeAngle            :360
                theme: PurpleTheme { startColor: "#3ee8b5"; midleColor: "#4e0da8"; endColor: "#bdc559" }
                Layout.fillWidth: true
                Layout.fillHeight: true
                colorTitle : "#1be5ef"
                itemInformation: [
                    { title2:"DATA TEXT"  ,    description:"Shows ongoing tasks compared to the total number of tasks." },
                ]
            }
            CirProgressBarGAPCard {
                currentValue: 2478
                maxValue: 8000
                rangeAngle            :360
                theme: PurpleTheme { startColor: "#f3711b"; midleColor: "#0605ae"; endColor: "#23f31b" }
                Layout.fillWidth: true
                Layout.fillHeight: true
                colorTitle : "#1be5ef"
                itemInformation: [
                    { title2:"DATA TEXT"  ,    description:"Shows ongoing tasks compared to the total number of tasks." },
                ]
            }
            CirProgressBarGAPCard {
                currentValue: 1544
                maxValue: 2000
                rangeAngle            :360
                theme: PurpleTheme { startColor: "#deee0b"; midleColor: "#0bc6ee"; endColor: "#0bee68" }
                Layout.fillWidth: true
                Layout.fillHeight: true
                colorTitle : "#1be5ef"
                itemInformation: [
                    { title2:"DATA TEXT"  ,    description:"Shows ongoing tasks compared to the total number of tasks." },
                ]
            }

            EmployeeOnlineCard {
                title: "LOREM\nIPSUM"
                value: "64%"
                Layout.fillWidth: true
                Layout.fillHeight: true
                showComboBox : false
                theme: PurpleTheme {}
                itemInformation: [
                    { description:"Number of personnel connected to the system at this moment\nNumber of personnel connected to the system at this moment" },
                ]

            }

            RECProgressCard {
                title: "LOREM\nIPSUM"
                Layout.fillWidth: true
                Layout.fillHeight: true
                theme: PurpleTheme {}

                progressModel: [
                    { text: "LOREM IOSUM", value: 65, profile: theme.progressProfiles.default },
                    { text: "LOREM IOSUM", value: 85, profile: theme.progressProfiles.default },
                    { text: "LOREM IOSUM", value: 35, profile: theme.progressProfiles.default }
                ]
            }



        }

        RowLayout {
            Layout.fillWidth: true

            ChartCard1 {
                title: "Performance"
                persons: ["A", "S", "R", "N", "O", "M", "P", "R"]
                values:  [5  , 25 , 10 , 45 , 35 , 45 , 50 , 35 ]
                Layout.fillWidth: true
                Layout.fillHeight: true
                theme: PurpleTheme {}

            }

            RECProgressBarGAPCard {
                title: "LOREM\nIPSUM"
                description: "Number of uncompleted tasks in the project"
                Layout.fillWidth: true
                Layout.fillHeight: true
                theme: PurpleTheme {}

            }


        }

        RowLayout {

            EmployeeOnlineCard {
                title: "ACTIVITES"
                textLable: "#1a3050"
                Layout.fillWidth: true
                Layout.fillHeight: true
                showComboBox : false
                itemInformation: [
                    { title2:"LOREM\nIPSUM"  ,    description:"Number of personnel connected to the system at this moment\nNumber of personnel connected to the system at this moment" },
                    { title2:"LOREM\nIPSUM"  ,    description:"Number of personnel connected to the system at this moment\nNumber of personnel connected to the system at this moment" }
                ]

                theme: PurpleTheme {}

            }
            TodayCalendar {
                Layout.fillWidth: true
                Layout.fillHeight: true
                theme: PurpleTheme {}

            }

            CirProgressBarCard{
                theme: PurpleTheme {}
            }

        }

    }
}
