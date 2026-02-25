import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "./component"
import "./themes"
import "./component/MicroModules"

Rectangle{
    anchors.fill: parent
    property var theme: GrOrTheme {}
    property string dashboard: "Dashboard_3"
    color : theme.cardBackground


    ColumnLayout {
        anchors.fill: parent
        Layout.topMargin: 10
        Layout.bottomMargin: 10
        spacing: 0

        // ==== Top ToolBar
//        TopBarModule {
//            Layout.fillWidth: true
//            sidebarWidth : window.width

//        }

        // ==== Main Area
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true

//            spacing: 0

            // ==== Sidebar
            SidebarModule {
                hostWidth: parent.width
                stackView: stackView
                showInformationCard : true
                showComboBox        : true
                modelIconIcon0: [
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-circleR.png",
                              hoverSource: "qrc:/Images/icons8-circleR.png",
                              size: 10 },
                            { type: "image", source: "qrc:/Images/icons8-circleY.png",
                              hoverSource: "qrc:/Images/icons8-circleY.png",
                              size: 10 },
                            { type: "image", source: "qrc:/Images/icons8-circleG.png",
                              hoverSource: "qrc:/Images/icons8-circleG.png",
                              size: 10 },
                            { type: "image", source: "qrc:/Images/icons8-fileb.png",
                              hoverSource: "qrc:/Images/icons8-fileb.png",
                              size: 20 },
                            { type: "image", source: "qrc:/Images/icons8-arrowLe.png",
                              hoverSource: "qrc:/Images/icons8-arrowLe.png",
                              size: 10 },
                            { type: "image", source: "qrc:/Images/icons8-arrowRi.png",
                              hoverSource: "qrc:/Images/icons8-arrowRi.png",
                              size: 10 },
                    ]},

                ]


                modelIconIcon1: [
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-name.png",
                              hoverSource: "qrc:/Images/icons8-name.png",
                              size: 80 },
                            { type: "text", text: "<b style= font size='2'>AR Shakir</font></b><br><font size='1'>Sr Visual Designer</font>"}
                    ]},

                ]
                modelIconIcon2: [
                    { items: [
                            { type: "text", text: "Teams"}
                    ]},

                ]

                modelIconIcon3: [
                    { items: [
                        { type: "text", text: "Menu"}
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-dashboard.png",
                              hoverSource: "qrc:/Images/icons8-dashboard2.png" ,size:15},
                            { type: "text", text: "Dashboard",size:15}
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/lm.png",
                              hoverSource: "qrc:/Images/lm2.png" ,size:15},
                            { type: "text", text: "Inbox"}
                    ]},

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-folder.png",
                              hoverSource: "qrc:/Images/icons8-folder2.png",size:15 },
                            { type: "text", text: "Accounts"}
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-trending.png",
                              hoverSource: "qrc:/Images/icons8-trending2.png",size:15 },
                            { type: "text", text: "Trendign"}
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-calendar.png",
                              hoverSource: "qrc:/Images/icons8-calendar2.png" ,size:15},
                            { type: "text", text: "Meetings"}
                    ]},
                ]

                modelIconIcon4: [
                    { items: [
                        { type: "text", text: "Settings & Beat"}
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-settings-3.png",
                              hoverSource: "qrc:/Images/icons8-settings-4.png" ,size:15},
                            { type: "text", text: "Settings"}
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-heart.png",
                              hoverSource: "qrc:/Images/icons8-heart.png",size:15 },
                            { type: "text", text: "Daily Beat"}
                    ]},

                ]
                modelIconIcon5: [
                    { items: [
                        { type: "text", text: "Quick Actions"}
                    ]},

                ]

                modelIconIcon6: [
                    { items: [
                        { type: "image", source: "qrc:/Images/icons8-pen2.png", hoverSource: "qrc:/Images/icons8-pen1.png",size:15 },
                        { type: "image", source: "qrc:/Images/icons8-rectangle2.png", hoverSource: "qrc:/Images/icons8-rectangle1.png" ,size:15},
                        { type: "image", source: "qrc:/Images/icons8-t.png", hoverSource: "qrc:/Images/icons8-t2.png",size:15 },
                        { type: "image", source: "qrc:/Images/icons8-lightning-bolt.png", hoverSource: "qrc:/Images/icons8-lightning-bolt2.png" ,size:15},
                        { type: "image", source: "qrc:/Images/icons8-star4.png", hoverSource: "qrc:/Images/icons8-star3.png",size:15 }
                    ]}
                ]

                modelIconIcon9: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-plus.png",
                              hoverSource: "qrc:/Images/icons8-plus.png" },                            ]},
                ]
                modelIconIcon7: [
                    { items: [
                            { type: "text", text: "Night"},
                            { type: "image", source: "qrc:/Images/moon.png",
                              hoverSource: "qrc:/Images/icons8-moon2.png" },
                    ]},
                    { items: [
                            { type: "text", text: "Light"},
                            { type: "image", source: "qrc:/Images/sun2.png",
                              hoverSource: "qrc:/Images/icons8-sun" },
                    ]},
                ]

                theme: GrOrTheme{}

                  }



            // ==== Main Content Area
            Rectangle {
                id: contentArea
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: "transparent"

                StackView {
                    id: stackView
                    anchors.fill: parent
                    initialItem: MainArea3 {}
                }


            }

            SidebarModule {
                hostWidth: parent.width
                stackView: stackView
                showCirProgressBarGAPCard : true
                modelIconIcon0: [
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-emails.png",
                              hoverSource: "qrc:/Images/icons8-emails.png",
                              size: 40 },
                            { type: "image", source: "qrc:/Images/icons8-bell2.png",
                              hoverSource: "qrc:/Images/icons8-bell2.png",
                              size: 40 },
                            { type: "image", source: "qrc:/Images/icons8-userw.png",
                              hoverSource: "qrc:/Images/icons8-userw.png",
                              size: 40 },
                    ]},

                ]

                modelIconIcon: [
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-user100_2.png",
                              hoverSource: "qrc:/Images/icons8-user100_2.png" ,size:100},
                         ]},
                    { items: [
                            { type: "text", text: "<b style= font size='2'>AR Shakir</font></b><br><font size='1'>Designer</font>"}
                               ]},

                ]


                modelIconIcon8: [
                    { items: [
                            { type: "text",  text: "<b style= font size='2'>457</font></b><br><font size='1'>Project</font>"},
                    ]},
                    { items: [
                            { type: "text", text: "<b style=  font size='2'>450</font></b><br><font size='1'>Completed</font>"},
                    ]},
                    { items: [
                            { type: "text", text: "<b style=  font size='2'>12</font></b><br><font size='1'>Awards</font>"},
                    ]},
                ]


                modelIconIcon3: [

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-target.png",hoverSource: "qrc:/Images/icons8-target.png" , size:30 },
                            { type: "text", text: "Goals"},
                            { type: "spacer"  },
                            { type: "image", source: "qrc:/Images/icons8-arrow5.png",hoverSource: "qrc:/Images/icons8-arrow5.png", size:10 },
                    ]},
                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-calendarP.png",hoverSource: "qrc:/Images/icons8-calendarP.png", size:30 },
                            { type: "text", text: "Monthly Plan"},
                            { type: "image", source: "qrc:/Images/icons8-arrow5.png",hoverSource: "qrc:/Images/icons8-arrow5.png", size:10 },
                    ]},

                    { items: [
                            { type: "image", source: "qrc:/Images/icons8-settingY.png",hoverSource: "qrc:/Images/icons8-settingY.png", size:30 },
                            { type: "text", text: "Settings"},
                            { type: "image", source: "qrc:/Images/icons8-arrow5.png",hoverSource: "qrc:/Images/icons8-arrow5.png" , size:10},
                    ]},

                ]


                modelIconIcon10: [
                    { items: [
                            {
                                type: "text",
                                text: "<b style='font-size:12px'>Project Status</b><br><b style='font-size:16px'>121143</b><br><span style='font-size:10px'>tasks Completed</span>"
                            }
                               ]},

                ]
                theme: GrOrTheme{}

                  }

        }
    }
}
