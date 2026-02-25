import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"

Rectangle {
    id: card
    Layout.fillWidth: true
    Layout.fillHeight: true
    implicitWidth: 200
    implicitHeight: 250
    radius: 8

    property int   circleCount            : 7
    property real circleDiameter          : Math.min(width, height) * 0.04
    property real horizontalMargin        : width * 0.08
    property var   values                 : [40       , 75       , 20       , 80       , 60       ]
    property var   startColor             : ["#eff331", "#3bec0b", "#0bec47", "#00ffef", "#eeabe6"]
    property var   midleColor             : ["#f331d9", "#0bd6ec", "#280661", "#d265d8", "#3d9ae6"]
    property var   endColor               : ["#671eb9", "#caec0b", "#062761", "#ff00e4", "#0023fd"]
    property real spacing: {
        if (circleCount <= 1) return 0
        return (width - 2*horizontalMargin - circleCount * circleDiameter)
               / (circleCount - 1)
    }
    property var   theme                  : PurpleTheme {}

    color: theme.cardBackgroundTop

    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: card.scale = 1.01
        onExited: card.scale = 1.0
    }
    Rectangle {

        anchors.verticalCenter: parent.verticalCenter
        x: horizontalMargin
        width: card.width - 2*horizontalMargin
        height: 5
        color: theme.strokeStyle
        radius: circleDiameter / 2

        Repeater {
            model: circleCount
            delegate: Rectangle {
                width: circleDiameter
                height: circleDiameter
                radius: circleDiameter / 2
                color: theme.textWhite
                y: (parent.height - height) / 2
                x: index * (circleDiameter + spacing)

                Rectangle {
                    id: redBar
                    width: circleDiameter / 3
                    height: 15
                    radius: circleDiameter / 2
                    color: theme.strokeStyle
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: -height - 5
                    visible: index > 0 && index < circleCount - 1
                }
                CircularProgressBarGAP {
                    gap: 0
                    lineWidth: 2
                    width: 65
                    height: 65
                    anchors.horizontalCenter: redBar.horizontalCenter
                    y: -height - 10
                    property bool hasData: index > 0 && index < circleCount - 1
                    property int realIndex: index - 1
                    showPercent : true
                    currentValue: hasData ? card.values[realIndex] : 0
                    startColor:  hasData ? card.startColor[realIndex] : "transparent"
                    midleColor:  hasData ? card.midleColor[realIndex] : "transparent"
                    endColor:    hasData ? card.endColor[realIndex]   : "transparent"

                    visible: hasData

                }
                Label {
                    text: "Data title"
                    font.family: familjenFont.name
                    color: theme.textWhite
                    font.pixelSize: 8
                    horizontalAlignment: Text.AlignHCenter
                    visible: index > 0 && index < circleCount - 1
                    y: height +10

                }

            }
        }


    }
}
