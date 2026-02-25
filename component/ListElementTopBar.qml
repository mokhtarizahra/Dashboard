import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3
import "../themes"
import "./MicroModules"


RowLayout {
    id: root
    property var    theme         : PurpleTheme {}
    property string labelText1    : "Text1"
    property string labelText2    : "Text2"
    property url    iconSource1   : ""
    property url    iconSource2   : ""
    property url    iconSource3   : ""
    property url    iconSource4   : ""
    property url    iconSource5   : ""
    property url    iconSource6   : ""
    property int    contentMargin : 0
    signal clicked
    spacing: 0

    Layout.fillWidth: true

    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    // ===== Left Section
    Rectangle {
        id: leftRect
        Layout.preferredWidth: Math.max(180, ( parent.width) * 0.17)
        Layout.fillHeight: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: theme.darknavy  }
            GradientStop { position: 1.0; color: theme.darknavy2 }
        }

        RowLayout {
            spacing: 0
            anchors.centerIn: parent


            Hoverable {
                source: iconSource1
                visible: iconSource1 !== ""
                Layout.preferredWidth: root.height * 0.45
                Layout.preferredHeight: root.height * 0.45
            }

            Label {
                text: labelText1
                font.family: familjenFont.name
                font.bold: true
                font.pixelSize: Math.min(22, root.height * 0.45)
                color: "#15e4ef"
            }
        }
    }


    // ===== Right Section
    Rectangle {
        id: rightRect
        Layout.fillWidth: true
        Layout.fillHeight: true
        gradient: Gradient {
            orientation: Qt.Horizontal
            GradientStop { position: 0.0; color: theme.purple3 }
            GradientStop { position: 1.0; color: theme.purple4 }
        }
        RowLayout {
            spacing: 2
            anchors.fill: parent

            // === Search
            SearchModule {
                theme : PurpleTheme{}
                defualtText : "SEARCH"
            }

            Item { Layout.fillWidth: true }
            Item { Layout.fillWidth: true }
            Item { Layout.fillWidth: true }
            Item { Layout.fillWidth: true }
            Item { Layout.fillWidth: true }

            // === Hoverables
            RowLayout {
                spacing: 30
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                Hoverable {
                    source: iconSource2
                    visible: iconSource2 !== ""
                    Layout.preferredWidth: root.height * 0.4
                    Layout.preferredHeight: root.height * 0.4
                }

                Hoverable {
                    source: iconSource3
                    visible: iconSource3 !== ""
                    Layout.preferredWidth: root.height * 0.4
                    Layout.preferredHeight: root.height * 0.4
                }

                Hoverable {
                    source: iconSource4
                    visible: iconSource4 !== ""
                    Layout.preferredWidth: root.height * 0.4
                    Layout.preferredHeight: root.height * 0.4
                }
            }

            //  ===== Spacer
            Item { Layout.fillWidth: true }

            // === Login Section  ===
            RowLayout {
                spacing: 10
                Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
                //                  Layout.margins: 16

                Label {
                    text: root.labelText2
                    font.family: familjenFont.name
                    font.bold: true
                    font.pixelSize: Math.max(8, root.height * 0.20)
                    color: theme.textWhite
                }

                Hoverable {
                    source: iconSource5
                    visible: iconSource5 !== ""
                    Layout.preferredWidth: root.height * 0.7
                    Layout.preferredHeight: root.height * 0.7
                }
            }
        }
    }

}

