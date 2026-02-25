import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "./component"
import "./themes"
Rectangle{
    anchors.fill: parent
    property string dashboard: "Dashboard_1"
            gradient: Gradient {
                orientation: Qt.Horizontal
                GradientStop { position: 0.0; color: theme.purple6 }
                GradientStop { position: 1.0; color: theme.darknavy3 }
            }


ColumnLayout {
    anchors.fill: parent
    spacing: 0

    // ==== Top ToolBar
    TopBarModule {
        Layout.fillWidth: true
        sidebarWidth : window.width

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
                        { type: "image", source: "qrc:/Images/icons8-home.svg",
                          hoverSource: "qrc:/Images/icons8-home.svg" },
                        { type: "text", text: "DASHBOARD"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-chart-30.png",
                          hoverSource: "qrc:/Images/chart-30.png" },
                        { type: "text", text: "CHART"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},

                { items: [
                        { type: "image", source: "qrc:/Images/icons8-star-32.png",
                          hoverSource: "qrc:/Images/icons8-star-32.png" },
                        { type: "text", text: "APPS"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-topic-48.png",
                          hoverSource: "qrc:/Images/icons8-topic-48.png" },
                        { type: "text", text: "FORUM"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-email-30.png",
                          hoverSource: "qrc:/Images/icons8-email-30.png" },
                        { type: "text", text: "EMAIL"},
                        { type: "image", source: "qrc:/Images/icons8-expand-arrow-64.png",
                          hoverSource: "qrc:/Images/icons8-expand-arrow-64.png" },
                ]},
                { items: [
                        { type: "image", source: "qrc:/Images/icons8-settings-50.png",
                          hoverSource: "qrc:/Images/icons8-settings-50.png" },
                        { type: "text", text: "SETTING"},
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
            theme: PurpleTheme{}
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
                initialItem: MainArea1 {}
            }


        }
    }
}
}
