import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "./component"
import "./themes"
Rectangle{
    anchors.fill: parent
    property string dashboard: "Dashboard_1"



ColumnLayout {
    anchors.fill: parent
    spacing: 0

    // ==== Top ToolBar
    TopBarModule {
        Layout.fillWidth: true
        sidebarWidth : parent.width

    }

    // ==== Main Area
    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 0

        // ==== Sidebar
        SidebarModule {
            hostWidth: parent.width
            stackView: stackView
            modelIconIcon1: [

                { items: [
                        { type: "image", source: "qrc:/Images/icons8-homeW.png",
                          hoverSource: "qrc:/Images/icons8-homeG.png" },
                        { type: "text", text: "Dashboard"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
//                { items: [
//                        { type: "image", source: "qrc:/Images/icons8-circleGr.png",
//                          hoverSource: "qrc:/Images/icons8-circleW.png" },
//                        { type: "text", text: "Default"},
//                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
//                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
//                ]},

//                { items: [
//                        { type: "image", source: "qrc:/Images/icons8-star-32.png",
//                          hoverSource: "qrc:/Images/icons8-star-32.png" },
//                        { type: "text", text: "Graphical"},
//                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
//                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
//                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-applicationG.png",
                          hoverSource: "qrc:/Images/icons8-applicationW.png" },
                        { type: "text", text: "Application"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
        ]
            modelIconIcon2: [
                { items: [
                        { type: "text", text: "UI ELEMENTS"},
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-bulleted-listW.png",
                          hoverSource: "qrc:/Images/icons8-bulleted-listW.png" },
                        { type: "text", text: "Widgets"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-bulleted-listG.png",
                          hoverSource: "qrc:/Images/icons8-bulleted-listW.png" },
                        { type: "text", text: "eCommerce"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-rectangleG.png",
                          hoverSource: "qrc:/Images/icons8-rectangleG.png" },
                        { type: "text", text: "Component"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-sort-by-follow-up-dateG.png",
                          hoverSource: "qrc:/Images/icons8-sort-by-follow-up-dateW.png" },
                        { type: "text", text: "Content"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-payG.png",
                          hoverSource: "qrc:/Images/icons8-payW.png" },
                        { type: "text", text: "Icons"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-htmlG.png",
                          hoverSource: "qrc:/Images/icons8-htmlW.png" },
                        { type: "text", text: "Froala Editor"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
            ]
            modelIconIcon3: [
                { items: [
                        { type: "text", text: "FORMS & TABLES"},
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-settings-50.png",
                          hoverSource: "qrc:/Images/icons8-settings-50.png" },
                        { type: "text", text: "Forms"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-settings-50.png",
                          hoverSource: "qrc:/Images/icons8-settings-50.png" },
                        { type: "text", text: "Tables"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
            ]
            modelIconIcon4: [
                { items: [
                        { type: "text", text: "PAGES"},
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-settings-50.png",
                          hoverSource: "qrc:/Images/icons8-settings-50.png" },
                        { type: "text", text: "Authentication"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-settings-50.png",
                          hoverSource: "qrc:/Images/icons8-settings-50.png" },
                        { type: "text", text: "User Profile"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
            ]

            modelIconIcon5: [

                { items: [
                        { type: "text", text: "PROJECTS"},
                ]},
                { items: [
                        { type: "text", text: "OPTION"},
                ]},
                { items: [
                        { type: "text", text: "CASE"},
                ]},
                { items: [
                        { type: "text", text: "LOCAL"},
                ]},

                   ]
            theme: BlackTheme{}
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
                initialItem: MainArea4 {}
            }


        }
    }
}
}
