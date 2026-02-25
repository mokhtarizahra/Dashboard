import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "./component/MicroModules"
import "./component"
import "./themes"
Rectangle{
    anchors.fill: parent
    anchors.margins: 10
    radius: 10
    property string dashboard: "Dashboard_2"
    property var theme: OrpTheme {}

    color: theme.cardBackground

ColumnLayout {
    anchors.fill: parent
    spacing: 0

    // ==== Top ToolBar
//    TopBarModule {
//        Layout.fillWidth: true
//        sidebarWidth : window.width

//    }

    // ==== Main Area
    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 0

        // ==== Sidebar
        SidebarModule {
            hostWidth: parent.width
            stackView: stackView
            widthPercent: 0.07
            modelIconIcon1: [
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-user-96.png", hoverSource: "qrc:/Images/icons8-user-96.png", size:50 }
                ]},
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-hut-24.png", hoverSource: "qrc:/Images/icons8-hut-24.png", size:50 }
                ]},
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-communication-50.png", hoverSource: "qrc:/Images/icons8-communication-50.png", size:50 }
                ]},
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-star-50.png", hoverSource: "qrc:/Images/icons8-star-50.png", size:50 }
                ]},
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-setting.png", hoverSource: "qrc:/Images/icons8-setting.png", size:50 }
                ]},
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-menu-50.png", hoverSource: "qrc:/Images/icons8-menu-50.png", size:50 }
                ]}
            ]

            modelIconIcon5: [
                { items: [
                    { type: "image", source: "qrc:/Images/icons8-logout-48.png", hoverSource: "qrc:/Images/icons8-logout-48.png", size:50 }
                ]}
            ]

            theme: OrpTheme {}
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
                initialItem: MainArea2 {}
            }


        }
    }
}
}
