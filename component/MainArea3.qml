import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"


Rectangle {

    property var themeP: GrOrTheme {}

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
            theme: OrpTheme {}
            widthRatio: 0.25
            heightRatio: 0.15
            marginsDash: 0
            searchIconBack: theme.chartLinelightpurple
        }

}
        RowLayout {

            Layout.preferredHeight: parent.height * 2 / 10

            RECProgressCard {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 1 / 3
                theme: GrOrTheme {}
                modelIconIcon1: [

                    { items: [
                            { type: "image", source: "qrc:/Images/sa (3).png",
                                hoverSource: "qrc:/Images/sa (3).png" , size:60 },
                            { type: "text", text: "<font size='2'>Total Connection</font><br><b style= font size='4'>2104</font></b>", fontsize:20},
                        ]},

                ]
                progressModel: [
                    { text: "", value: 45, profile: theme.progressProfiles.default },
                ]

                modelIconIcon2: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-chartP.png",
                                hoverSource: "qrc:/Images/icons8-chartP.png", size:20 },
                            { type: "text", text: "+45%"},
                            { type: "image", source: "qrc:/Images/icons8-triangle.png",
                                hoverSource: "qrc:/Images/icons8-triangle.png", size:30 },
                        ]},

                ]
            }

            RECProgressCard {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 1 / 3
                theme: GrOrTheme {}
                modelIconIcon1: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-circle.png",
                                hoverSource: "qrc:/Images/icons8-circle.png" , size:60 },
                            { type: "text", text: "<font size='2'>Security</font><br><b style= font size='4'>100%</font></b>"},
                        ]},

                ]
                progressModel: [
                    { text: "", value: 100, profile: theme.progressProfiles.default },
                ]

                modelIconIcon2: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-chartP.png",
                                hoverSource: "qrc:/Images/icons8-chartP.png", size:20 },
                            { type: "text", text: "+55%"},
                            { type: "image", source: "qrc:/Images/icons8-triangle.png",
                                hoverSource: "qrc:/Images/icons8-triangle.png", size:30 },
                        ]},

                ]
            }

            RECProgressCard {
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 1 / 3
                theme: GrOrTheme {}
                modelIconIcon1: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-document.png",
                                hoverSource: "qrc:/Images/icons8-document.png" , size:60 },
                            { type: "text", text: "<font size='2'>Total Items</font><br><b style= font size='4'>140</font></b>"},
                        ]},

                ]
                progressModel: [
                    { text: "", value: 15, profile: theme.progressProfiles.default },
                ]

                modelIconIcon2: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-chartP.png",
                                hoverSource: "qrc:/Images/icons8-chartP.png", size:20 },
                            { type: "text", text: "+15%"},
                            { type: "image", source: "qrc:/Images/icons8-triangle.png",
                                hoverSource: "qrc:/Images/icons8-triangle.png", size:30 },
                        ]},

                ]
            }




        }

        RowLayout {
            Layout.preferredHeight: parent.height * 3 / 10

            ChartCard {
                Layout.preferredWidth: parent.width * 3 / 4
                Layout.fillHeight: true
                theme: GrOrTheme {}
                showComboText: false
                showComboBox: false
                showChart3: true
                modelIconIcon1: [

                    { items: [
                            { type: "text", text: "<font size='1'>Total Earnings</font><br><b style= font size='3'>500k</font></b>"},
                            ]},
                    { items: [
                            { type: "text", text: "<font size='1'>Period</font><br><b style= font size='3'>1 Month</font></b>"},
                            ]},
                    { items: [
                            { type: "text", text: "<font size='1'>Upcoming Project</font><br><b style= font size='3'>245</font></b>"},
                            ]},

                ]
            }

            InformationCard{
                Layout.preferredWidth: parent.width * 1 / 4
                Layout.fillHeight: true
                theme: GrOrTheme {}
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
                theme: GrOrTheme {}
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
            theme                 : GrOrTheme { }
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
