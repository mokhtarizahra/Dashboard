
import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "../themes"
import "./MicroModules"

Rectangle {
    id: sidebar

    property var theme
        property real hostWidth
        property StackView stackView
        property real widthPercent: 0.17
        property real sidebarHeight: sidebar.height

        property bool   showInformationCard           : false
        property bool   showCirProgressBarGAPCard     : false
        property bool   showComboBox                  : false

        property var modelIconIcon  : []
        property var modelIconIcon0 : []
        property var modelIconIcon1 : []
        property var modelIconIcon2 : []
        property var modelIconIcon3 : []
        property var modelIconIcon4 : []
        property var modelIconIcon5 : []
        property var modelIconIcon6 : []
        property var modelIconIcon7 : []
        property var modelIconIcon8 : []
        property var modelIconIcon9 : []
        property var modelIconIcon10: []
//        property var modelIconIcon11: []
        property var comboModel     : ["Team", "A", "B", "C"]


        property var sections: [
            { model: modelIconIcon1, layout: "column", centerItems: false },
            { model: modelIconIcon2, layout: "column", centerItems: false },
            { model: modelIconIcon3, layout: "column", centerItems: false },
            { model: modelIconIcon4, layout: "column", centerItems: false },
            { model: modelIconIcon5, layout: "column", centerItems: false },
            { model: modelIconIcon6, layout: "column", centerItems: false },
            { model: modelIconIcon7, layout: "row"   , centerItems: false }
        ]

        Layout.preferredWidth: (hostWidth > 0 ? hostWidth : parent.width) * widthPercent
        Layout.maximumWidth: 260
        Layout.fillHeight: true

        color: theme.purple5



    ColumnLayout {
        id: rootLayout
        anchors.fill: parent
        anchors.margins: 12
        spacing: 20

        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon0 && sidebar.modelIconIcon0.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: sidebar.modelIconIcon0

                    IconIcon {
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                        extraSpacing: 5

                    }
                }
            }
        }
        Loader {
            Layout.alignment: Qt.AlignHCenter
               Layout.preferredWidth: implicitWidth
               active: sidebar.modelIconIcon && sidebar.modelIconIcon.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: sidebar.modelIconIcon

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                        extraSpacing: 5

                    }
                }
            }
        }
        Loader {
            Layout.fillWidth: true
             active: sidebar.modelIconIcon1 && sidebar.modelIconIcon1.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: sidebar.modelIconIcon1

                    IconIcon {
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                        extraSpacing: 5

                    }
                }
            }
        }
        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon8 && sidebar.modelIconIcon8.length > 0

            sourceComponent: RowLayout {
                spacing: 5

                Repeater {
                    model: sidebar.modelIconIcon8

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                        enablemargin:  true
                        textAlignment : Text.AlignHCenter


                    }
                }
            }
        }


        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon2 && sidebar.modelIconIcon2.length > 0

            sourceComponent: ColumnLayout {
                spacing: 15

                Repeater {
                    model: sidebar.modelIconIcon2

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                    }
                }
            }
        }

        PeriodCombo {
            visible: sidebar.showComboBox
            modelData: sidebar.comboModel
            theme: sidebar.theme
            Layout.maximumWidth: parent.width
            Layout.minimumWidth: 50
            radiusCombo  : 5
            Layout.fillWidth: true
        }

        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon3 && sidebar.modelIconIcon3.length > 0

            sourceComponent: ColumnLayout {
                spacing: 15

                Repeater {
                    model: sidebar.modelIconIcon3

                    IconIcon {
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                    }
                }
            }
        }
        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon4 && sidebar.modelIconIcon4.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: sidebar.modelIconIcon4

                    IconIcon {
//                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
//                        centerItems: false
                        modelItems: modelData.items
                    }
                }
            }
        }

        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon5 && sidebar.modelIconIcon5.length > 0

            sourceComponent: ColumnLayout {
                spacing: 12

                Repeater {
                    model: sidebar.modelIconIcon5

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                    }
                }
            }
        }
        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon6 && sidebar.modelIconIcon6.length > 0

            sourceComponent: ColumnLayout {
                spacing: 5

                Repeater {
                    model: sidebar.modelIconIcon6

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                        dropShadowEnabled: true

                    }
                }
            }
        }

        InformationCard{
            visible: sidebar.showInformationCard
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            Layout.maximumHeight: 100
            theme: GrOrTheme {}
            modelIconIcon2: sidebar.modelIconIcon9
        }
        CirProgressBarGAPCard {
            visible: sidebar.showCirProgressBarGAPCard
            Layout.preferredHeight: 200
            Layout.maximumHeight: 250
            currentValue: 70
            maxValue: 100
            progressGap : 0
            progressStartAngleDeg : -180
            rangeAngle            :180
            progressShowPercent   : true
            theme                 : GrOrTheme { }
            Layout.fillWidth      : true
            progressTrackColor    : "#eaeaea"
            buttonVisible         : false
            progressLineWidth:   20
            progressshowNeedle : true
            modelIconIcon1: sidebar.modelIconIcon10

        }

        Loader {
            Layout.fillWidth: true
            active: sidebar.modelIconIcon7 && sidebar.modelIconIcon7.length > 0

            sourceComponent: RowLayout {
                spacing: 5

                Repeater {
                    model: sidebar.modelIconIcon7

                    IconIcon {
                        Layout.fillWidth: true
                        buttonHeight: Math.max(50, sidebar.width * 0.2)
                        theme: sidebar.theme
                        modelItems: modelData.items
                        enablemargin:  true
                        dropShadowEnabled: true
                        extraSpacing: 5

                    }
                }
            }
        }


    }
}
