import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../../themes"

ColumnLayout {
    id: root
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignCenter
    Layout.margins: 2


    FontLoader {
        id: gothamFont
        source: "qrc:/fonts/GothamNarrowOffice-Regular.ttf"
    }

    property var theme
    property string iconSource
    property string iconText
    property string description2
    property bool showDivider: true

    // ===== Icon + Text Row
    RowLayout {
        Layout.fillWidth: true
        Layout.preferredHeight: 40
        Layout.topMargin: 8
        spacing: 2
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        Rectangle {
            width: 24
            height: 24
            color: "transparent"

            Image {
                anchors.fill: parent
                source: root.iconSource
                fillMode: Image.PreserveAspectFit
            }
        }

        Label {
            text: root.iconText
            font.family: gothamFont.name
            font.pixelSize: 24
            color: theme.textWhite
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
            Layout.fillWidth: true
            Layout.preferredHeight: 24

        }
    }

    // ===== Description
    Label {
        text: root.description2
        font.family: gothamFont.name
        font.pixelSize: 12
        color: theme.textWhite
        wrapMode: Text.WordWrap
        Layout.alignment: Qt.AlignHCenter
        horizontalAlignment: Text.AlignHCenter
        Layout.fillWidth: true
        Layout.preferredWidth: 0
    }

    // ===== Divider
    Rectangle {
        visible: root.showDivider
        Layout.fillWidth: true
        height: 1
        color: theme.chartLinelightpurple
        opacity: 0.3
    }
}
