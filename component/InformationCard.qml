
import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"

Rectangle {
    id: card

    property var theme
        property real hostWidth
        property StackView stackView
        property real widthPercent: 0.17

        property var modelIconIcon1: []
        property var modelIconIcon2: []
        property var modelIconIcon7: []


        Layout.preferredWidth: (hostWidth > 0 ? hostWidth : parent.width) * widthPercent
        Layout.maximumWidth: 260
        Layout.fillHeight: true

        color: theme.purple5


    ColumnLayout {
        id: rootLayout
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        Loader {
            Layout.fillWidth: true
            active: card.modelIconIcon1 && card.modelIconIcon1.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: card.modelIconIcon1

                    IconIcon {
                        enablemargin: true
                        Layout.fillWidth: true
                        buttonHeight: Math.max(80, card.width * 0.3)
                        theme: card.theme
                        modelItems: modelData.items
                        dropShadowEnabled: true
                        extraSpacing: 5
                    }
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
                        buttonHeight: Math.max(50, card.width * 0.2)
                        theme: card.theme
                        modelItems: modelData.items
                        enablemargin:  true
                        extraSpacing: 5

                    }
                }
            }
        }


    }
}
