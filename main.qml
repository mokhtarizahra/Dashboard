import QtQuick 2.12
import QtQuick.Window 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "./component"
import "./themes"

ApplicationWindow {
    id: window
    visible: true
    width: 1280
    height: 800
    minimumWidth: 1280
    minimumHeight: 800
    title: "Dashboard App"

    property var theme: PurpleTheme {}

    FontLoader { id: familjenFont; source: "fonts/FamiljenGrotesk-Variable.ttf" }

    Rectangle {
            anchors.fill: parent


            RowLayout {
                anchors.fill: parent
                spacing: 0

                // ==== Sidebar
                Rectangle {
                    id: sidebar
                    width: 150
                    Layout.fillHeight: true
                    color: "transparent"

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        Label {
                            text: "My App"
                            color: "black"
                            font.pixelSize: 20
                            Layout.bottomMargin: 24
                        }
                        ButtonStyle { text: "Dashboard_1"; Layout.fillWidth: true; onClicked: stackView.replace("Dashboard1.qml") }
                        ButtonStyle { text: "Dashboard_2"; Layout.fillWidth: true; onClicked: stackView.replace("Dashboard2.qml") }
                        ButtonStyle { text: "Dashboard_3"; Layout.fillWidth: true; onClicked: stackView.replace("Dashboard3.qml") }
                        ButtonStyle { text: "Dashboard_4"; Layout.fillWidth: true; onClicked: stackView.replace("Dashboard4.qml") }
                        ButtonStyle { text: "Dashboard_5"; Layout.fillWidth: true; onClicked: stackView.replace("Dashboard5.qml") }
                        ButtonStyle { text: "Reports";  Layout.fillWidth: true; onClicked: stackView.replace("ReportsPage.qml") }
                        ButtonStyle { text: "Settings";  Layout.fillWidth: true; onClicked: stackView.replace("SettingsPage.qml") }

                        Item { Layout.fillHeight: true }
                    }
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
                        initialItem: Dashboard4 {}
                    }


                }
            }
    }

}
