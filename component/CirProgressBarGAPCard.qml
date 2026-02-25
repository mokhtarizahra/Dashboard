import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"
import "../"

Rectangle {
    id: card
    Layout.fillWidth: true
    Layout.fillHeight: true
    implicitWidth: 180
    implicitHeight: 200
    radius: 8

    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    property var theme

    property int    currentValue         : 0
    property int    maxValue             : 100
    property string title                : ""
    property real   progressGap          : 0.1
    property real   progressStartAngleDeg: -90
    property real   rangeAngle
    property bool   progressShowPercent  : false
    property bool   progressshowNeedle   : false
    property real   progressLineWidth    : 16
    property color  progressTrackColor   :"#3f0159"
    property string buttonText           : "Suscripit"
    property bool   buttonVisible        : false
    property var    modelIconIcon1: []
    property var    multivalues: []
    property var    multimaxValues: []
    property var    itemInformation: [
        { title2: "", description: "" },
        { title2: "", description: "" }
    ]
    property color  colorTitle           : theme.textLable3
    color: theme.cardBackgroundTop

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: card.scale = 1.01
        onExited: card.scale = 1
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10

        Loader {
            Layout.fillWidth: true
            active: card.modelIconIcon1 && card.modelIconIcon1.length > 0

            sourceComponent: RowLayout {
                spacing: 5

                Repeater {
                    model: card.modelIconIcon1

                    IconIcon {
                       Layout.fillWidth: true
                        buttonHeight: Math.max(50, card.width * 0.2)
                        theme: card.theme
                        modelItems: modelData.items
                        enablemargin:  true
                        textAlignment : Text.AlignHCenter


                    }
                }
            }
        }
RowLayout{
        CircularProgressBarGAP{
        currentValue          :card.currentValue
        maxValue              :card.maxValue
         theme                : card.theme
         showPercent          : card.progressShowPercent
         Layout.fillWidth     : true
         Layout.fillHeight    : true
         Layout.preferredWidth: 4
         gap                  : card.progressGap
         startAngleDeg        : card.progressStartAngleDeg
         lineWidth            : card.progressLineWidth
         strokeStyle          : card.progressTrackColor
         rangeAngleDeg        : card.rangeAngle
         showNeedle           : card.progressshowNeedle
         values               : card.multivalues
         maxValues            : card.multimaxValues

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
                        modelItems: modelData.items
                        enablemargin:  true
                        textAlignment : Text.AlignHCenter


                    }
                }
            }
        }
}
        // ==== Information Text
        Repeater {
            model: card.itemInformation
            delegate: InformationText {
                theme: card.theme
                title2: modelData.title2
                description: modelData.description
                visible: title2.length > 0 || description.length > 0
                Layout.fillWidth: true
                Layout.preferredWidth: 0
                textAlignment: Qt.AlignHCenter
                textLable3 : card.colorTitle
            }
        }

        ButtonStyle { text            : card.buttonText
                      visible         : card.buttonVisible
                      Layout.alignment: Qt.AlignHCenter
                      baseColor       : theme.chartLinelightpurple
        }
    }
}
