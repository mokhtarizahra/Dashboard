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
    property string title
    property bool   showChart2       : false
    property bool   showChart3       : false
    property bool   showChart4       : false
    property bool   showChart5       : false
    property bool   showChart5_1     : false
    property bool   showChart6       : false
    property bool   showComboText    : true
    property int    circleCount      : 4
    property var    modelIconIcon1   : []
    property var    dataChart2values1: [10 , 16 , 7 , 12 , 22 , 17 , 25 , 30 , 12, 15, 0 ]
    property var    dataChart2values2: [18 , 25 , 20, 12 , 5  , 15 , 2  , 15 , 25, 20, 10]
    property var    dataChart2persons: ["A", "S", "R", "N", "O", "M", "P"]
    property var    dataChart3values : [60, 60, 24, 50, 30, 70, 20, 60, 30, 30, 70, 36]
    property var    dataChart3persons: ["01","02","03","04","05","06","07","08","09","010","011","012"]
    property var    widthRodChart3   :30



    // ==== ComboBox property
    property bool showComboBox : true
    property var  comboModel   : ["Week", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    property var  comboModel2  : ["Month","January","February","March","April","May","June","July","August","September","October","November","December"]
    property var  comboModel3  : ["All time","time1","time2","time3","time4","time5"]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: card.scale = 1.01
        onExited: card.scale = 1.0
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        // ==== Title + ComboBox
        RowLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: Math.max(30, parent.height * 0.08)
            spacing: 10

            // Title
            Label {
                text: card.title
                color: theme.textWhite
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

        Loader {
            Layout.fillWidth: true
            active: card.modelIconIcon1 && card.modelIconIcon1.length > 0

            sourceComponent: RowLayout {
                spacing: 12

                Repeater {
                    model: card.modelIconIcon1

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, card.width * 0.2)
                        theme: card.theme
                        modelItems: modelData.items
                        centerItems : true
                    }
                }
            }
        }

        Chart2 {
            visible: card.showChart2
            persons: card.dataChart2persons
            values1: card.dataChart2values1
            values2: card.dataChart2values2
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.3
            theme: card.theme

        }

        Chart3 {
            visible: card.showChart3
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.3
            theme: card.theme
            values : card.dataChart3values
            persons: card.dataChart3persons
            widthRod: card.widthRodChart3

        }


        Chart4 {
            visible: card.showChart4
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.3
            startAngleDeg : -120
            theme:card.theme
        }

        Column  {
            visible: card.showChart5
            spacing: 10
            Repeater {
                model: circleCount
                delegate:Chart5{
                    Layout.fillWidth: true
                    theme:card.theme
                    roundStart: false
                    roundEnd: true
                    width: index === 0 ? 300 :
                                         index === 1 ? 100 :
                                                       index === 2 ? 280 : 180
                    showLabel: index === 3
                    showSideLabel: true
                    segments: [
                        { value: 20, label: "Lorem"  , color: theme.colorchart4_4,        sideLabel: "OCT" },
                        { value: 45, label: "Ipsurn" , color: theme.colorchart4_3,        sideLabel: "NAV" },
                        { value: 20, label: "Dolar"  , color: theme.colorchart4_2,        sideLabel: "DEC" },
                        { value: 15, label: "Nonummy", color: theme.chartLinelightpurple, sideLabel: "JAN" }
                    ]

                }
            }
        }


        Chart5 {
            Layout.fillWidth: true
            theme:card.theme
            visible: card.showChart5_1
            roundStart: true
            roundEnd: true
            showLabel: true
            segments: [
                { value: 60, label: "Lorem", color: theme.chartLinelightpurple },
                { value: 15, label: "Ipsurn", color: theme.colorchart4_2 },
                { value: 25, label: "Dolar", color: theme.colorchart4_1 }
            ]
        }


        Chart6 {
            visible: card.showChart6
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.3
            theme: card.theme

        }




    }
}
