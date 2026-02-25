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
    implicitHeight: 180
    radius: 8
    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    property var theme

    property string title: ""
    property string description: ""

    color: theme.cardBackgroundTop

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: card.scale = 1.01
        onExited: card.scale = 1
    }
    RowLayout{
        anchors.fill: parent
        anchors.margins: 12
        spacing: 20

        ColumnLayout {
            spacing: 8
            Layout.fillWidth: true
            Layout.fillHeight: true


            RecProgressBarGAP {
                value: 85
                Layout.fillWidth: true
                theme:PurpleTheme {startColor: "#46065f"; midleColor: "#f5ad01" ; endColor: "#01f5ee"}
            }
            RecProgressBarGAP {
                value: 35
                Layout.fillWidth: true
                theme:PurpleTheme {startColor: "#01f5ee"; midleColor: "#f0f501" ; endColor: "#f91b45"}
            }
            RecProgressBarGAP {
                value: 60
                Layout.fillWidth: true
                theme:PurpleTheme {startColor: "#0f84ff"; midleColor: "#0fff75" ; endColor: "#dcdb5f"}
            }
            RecProgressBarGAP {
                value: 95
                Layout.fillWidth: true
                theme:PurpleTheme {startColor: "#3b5fec"; midleColor: "#e62280" ; endColor: "#f7ef40"}
            }
        }


        ColumnLayout{

            spacing: 8
            Layout.fillWidth: true
            Label {
                text: title
                font.family: familjenFont.name
                color: theme.turquoise2
                font.pixelSize: Math.max(20, parent.height * 0.1)
                horizontalAlignment: Text.AlignLeft
                font.bold: true
            }
            Label {
                text: description
                font.family: familjenFont.name
                color: theme.textWhite
                font.pixelSize: Math.max(10, parent.height * 0.03)
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignLeft
                Layout.fillWidth: true
            }

        }



    }
}
