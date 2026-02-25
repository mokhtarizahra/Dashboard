import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"

Rectangle {
    id: card
    Layout.fillWidth: true
    Layout.fillHeight: true
    implicitWidth: 300
    implicitHeight: 300
    radius: 8

    FontLoader {
        id: familjenFont
        source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf"
    }

    property var theme
    property string title: ""

    // ==== ProgressBar
    property var progressModel: [
        { text: "LOREM IPSUM", value: 65, profile: theme.progressProfiles.default },
        { text: "LOREM IPSUM", value: 85, profile: theme.progressProfiles.warning },
        { text: "LOREM IPSUM", value: 35, profile: theme.progressProfiles.default }
    ]
    property var modelIconIcon1: []
    property var modelIconIcon2: []

    color: theme.cardBackgroundTop

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: card.scale = 1.01
        onExited: card.scale = 1.0
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 8

        Label {
            text: card.title
            color: theme.textLable2
            font.family: familjenFont.name
            font.pixelSize: Math.max(18, parent.height * 0.07)
            font.bold: true
            Layout.fillWidth: true
            Layout.preferredWidth: 0
            Layout.maximumWidth: parent.width * 0.55        }

        Loader {
            Layout.fillWidth: true
            active: card.modelIconIcon1 && card.modelIconIcon1.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: card.modelIconIcon1

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, card.width * 0.2)
                        theme: card.theme
                        centerItems: false
                        modelItems: modelData.items
                        extraSpacing: 5
                    }
                }
            }
        }

        Repeater {
            model: card.progressModel

            delegate: ColumnLayout {
                Layout.fillWidth: true
                spacing: 4

                Label {
                    text: modelData.text
                    font.family: familjenFont.name
                    color: theme.textLable2
                    font.pixelSize: Math.max(10, parent.height * 0.05)
                    wrapMode: Text.WordWrap
                }

                RecProgressBar {
                    value: modelData.value
                    colorProfile: modelData.profile
                    theme: card.theme
                    Layout.fillWidth: true
                }
            }
        }

        Loader {
            Layout.fillWidth: true
            active: card.modelIconIcon2 && card.modelIconIcon2.length > 0

            sourceComponent: RowLayout {
                spacing: 5

                Repeater {
                    model: card.modelIconIcon2

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, card.width * 0.2)
                        theme: card.theme
                        centerItems: false
                        modelItems: modelData.items
                        enablemargin:  true
                        extraSpacing: 5

                    }
                }
            }
        }
    }
}
