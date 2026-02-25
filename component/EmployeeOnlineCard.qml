import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtCharts 2.2
import "../themes"
import "./MicroModules"


Rectangle {
    id: card
    Layout.fillWidth: true
    Layout.fillHeight: true
    implicitWidth: 300
    implicitHeight: 300
    radius: 8
    color: theme.cardBackgroundTop

    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }
    FontLoader { id: gothamFont;   source: "qrc:/fonts/GothamNarrowOffice-Regular.ttf" }

    property var    theme
    property color  textLable     : theme ? theme.textLable : "#ffffff"
    property string title
    property string value
    property bool   showChart5: false
    property var itemsIconText: [
        { iconSource: "", iconText: "", description2: "" },
        { iconSource: "", iconText: "", description2: "" }
    ]
    property var itemInformation: [
        { title2: "", description: "" },
        { title2: "", description: "" }
    ]
    // ==== ComboBox property
    property bool showComboBox: true
    property var  comboModel  : ["Week", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    property var  comboModel2  : ["Month","January","February","March","April","May","June","July","August","September","October","November","December"]
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: card.scale = 1.01
        onExited: card.scale = 1.0
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // ==== Title + ComboBox
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            spacing: 10

            // Title
            Label {
                text: card.title
                color: card.textLable
                font.family: familjenFont.name
                font.pixelSize: Math.max(18, parent.height * 0.07)
                font.bold: true
                wrapMode: Text.WordWrap

                Layout.fillWidth: true
                Layout.preferredWidth: 0
                Layout.maximumWidth: parent.width * 0.55
            }

            // ComboBox
            PeriodCombo {
                visible: card.showComboBox
                modelData: card.comboModel
                theme: card.theme
                Layout.maximumWidth: parent.width * 0.45
                Layout.minimumWidth: 50
            }
        }

        // ==== Value
        Loader {
            active: card.value.length > 0
            sourceComponent: Component {
                Label {
                    text: card.value
                    font.family: familjenFont.name
                    font.bold: true
                    font.pixelSize: Math.max(16, parent.height * 0.08)
                    color: theme.turquoise2
                    horizontalAlignment: Text.AlignLeft
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                    Layout.preferredWidth: 0
                    Layout.preferredHeight: 6

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
                Layout.preferredHeight: 6

            }
        }

        // ==== Icon + Text Item
        Repeater {
            model: card.itemsIconText
            delegate: IconText {
                theme: card.theme
                iconSource: modelData.iconSource
                iconText: modelData.iconText
                description2: modelData.description2
                Layout.fillWidth: true
                Layout.preferredHeight: 6
                Layout.alignment: Qt.AlignCenter
                visible: iconSource.length > 0 || iconText.length > 0 || description2.length > 0
            }
        }



    }
}
