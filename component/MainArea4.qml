import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"


Rectangle {

    property var theme: BlackTheme {}

    color: "transparent"
    anchors.fill: parent
    anchors.margins: 16

    ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        anchors.fill: parent
        anchors.margins: 0
RowLayout{
    Layout.preferredHeight: parent.height * 1 / 10

        Label {
            text: "<b style= font size='2'>Analytics</font><br></b>< font size='1'>Welcome back, Let's get back to work.</font>"
            color: themeP.textWhite
            font.pixelSize: Math.max(20, width * 0.03)
        }

        SearchModule {
            Layout.fillWidth: true
            theme: BlackTheme {}
            widthRatio: 0.25
            heightRatio: 0.15
            marginsDash: 0
            searchIconBack: theme.chartLinelightpurple
        }

}
        RowLayout {

            Layout.preferredHeight: parent.height * 1 / 2

            ChartCard {
                Layout.preferredWidth:parent.width * 1 / 2
                Layout.fillHeight: true
                theme: BlackTheme {}
                showChart2: true
                title: "Sales Qverview"
                comboModel: comboModel3
                dataChart2values1: [7 , 20 , 13 , 12 ,17 , 7  , 11 ]
                dataChart2values2: [5 , 30 , 16 , 23 , 8 , 14 , 12 ]
                dataChart2persons: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
            }
            ChartCard {
                Layout.preferredWidth: parent.width * 1 / 2
                Layout.fillHeight: true
                theme: BlackTheme {}
                showComboText: false
                showComboBox: true
                showChart3: true
                title: "SOrder Status"
                widthRodChart3 : 10
                dataChart3values :  [9, 7, 14, 10, 12, 8]
                dataChart3persons: ["Jan","Feb","Mar","Apr","May","Jun"]
            }




        }

        RowLayout {
            Layout.preferredHeight: parent.height * 3 / 10


            InformationCard{
                Layout.preferredWidth: parent.width * 1 / 4
                Layout.fillHeight: true
                theme: BlackTheme {}
                modelIconIcon1: [

                    { items: [
                            { type: "text", text: "<font size='2'>Personal Loans</font><br><b style= font size='3'>$45,000</font></b>"},
                            ]},
                    { items: [
                            { type: "text", text: "<font size='2'>Subscription</font><br><b style= font size='3'>$495</font></b>"},
                            ]},
                    { items: [
                            { type: "text", text: "<font size='2'>Income</font><br><b style= font size='3'>$15,000</font></b>"},
                            ]},

                ]
            }


        }
        RowLayout {
            Layout.preferredHeight: parent.height * 3 / 10

            InformationCard{
                Layout.preferredWidth: parent.width * 2/ 4
                Layout.fillHeight: true
                theme: BlackTheme {}
                modelIconIcon1: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-nameG.png",
                                hoverSource: "qrc:/Images/icons8-nameG.png", size:40 },
                            { type: "text", text: "<b style= font size='2'>Harry Joe</font><br></b>< font size='1'>24 purch|123 Like</font>"},
                            { type: "image", source: "qrc:/Images/icons8-emails.png",
                                hoverSource: "qrc:/Images/icons8-emails.png", size:20 },
                               ]},

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-nameY.png",
                                hoverSource: "qrc:/Images/icons8-nameY.png", size:40 },
                            { type: "text", text: "<b style= font size='2'>Martha June</font><br></b>< font size='1'>24 purch|123 Like</font>"},
                            { type: "image", source: "qrc:/Images/icons8-emails.png",
                                hoverSource: "qrc:/Images/icons8-emails.png", size:20 },
                               ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-nameP.png",
                                hoverSource: "qrc:/Images/icons8-nameP.png", size:40 },
                            { type: "text", text: "<b style= font size='2'>Sarah Altman</font><br></b><font size='1'>24 purch|123 Like</font>"},
                            { type: "image", source: "qrc:/Images/icons8-emails.png",
                                hoverSource: "qrc:/Images/icons8-emails.png", size:20 },
                               ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-nameB.png",
                                hoverSource: "qrc:/Images/icons8-nameB.png", size:40 },
                            { type: "text", text: "<b style= font size='2'>Michael Clark</font><br></b><font size='1'>24 purch|123 Like</font>"},
                            { type: "image", source: "qrc:/Images/icons8-emails.png",
                                hoverSource: "qrc:/Images/icons8-emails.png", size:20 },
                               ]},
                ]
            }
        CirProgressBarGAPCard {
            Layout.preferredWidth: parent.width * 2/ 4
            multivalues: [75, 50, 80]
            multimaxValues: [100, 100, 100]
            progressGap : 0
            progressStartAngleDeg : -90
            rangeAngle            :360
            progressShowPercent   : true
            theme                 : BlackTheme { }
            Layout.fillWidth      : true
            Layout.preferredHeight: parent.height * 3 / 5
            progressTrackColor    : "#eaeaea"
            buttonVisible        : false
            progressLineWidth:   10
            modelIconIcon1: [
                { items: [
                        {
                            type: "text",
                            text: "<b style='font-size:12px'>Your Professional Statuse</b><br>"
                        }
                           ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-chartPC.png",
                            hoverSource: "qrc:/Images/SD (2).png", size:20 },
                           ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-menuPc.png",
                            hoverSource: "qrc:/Images/icons8-menuP.png", size:20 },
                           ]},

            ]
        }


}


    }
}
