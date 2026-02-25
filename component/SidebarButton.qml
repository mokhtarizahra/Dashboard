import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.3
import "../themes"

Item {
    id: root

    property var    theme     : PurpleTheme {}
    property string buttonText: "BUTTON"
    property url iconSource: ""
    property url rightIconSource: ""
    property real buttonHeight: 40
    signal clicked()

    Layout.fillWidth: true
    Layout.preferredHeight: buttonHeight

    FontLoader {
        id: familjenFont
        source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf"
    }

    Rectangle {
        anchors.fill: parent
        radius: 8
        color: ma.containsMouse ? "#2b0055" : "transparent"
    }

    MouseArea {
        id: ma
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 12
        spacing: 12

        // ===== Left icon
        Image {
            visible: iconSource !== ""
            source: iconSource
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: visible ? Math.min(28, root.height * 0.6) : 0
            Layout.preferredHeight: Layout.preferredWidth
        }

        Text {
            text: root.buttonText
            font.family: familjenFont.status === FontLoader.Ready
                          ? familjenFont.name
                          : "Sans Serif"

            font.pixelSize: Math.max(12, Math.min(16, root.height * 0.4))
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            color: theme.textWhite

            Layout.fillWidth: true
        }

        // ===== Right icon
        Image {
            visible: rightIconSource !== ""
            source: rightIconSource
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: visible ? Math.min(22, root.height * 0.5) : 0
            Layout.preferredHeight: Layout.preferredWidth
        }
    }
}
