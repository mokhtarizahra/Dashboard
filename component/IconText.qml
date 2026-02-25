import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import "../themes"

ColumnLayout {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 8

    FontLoader {
        id: gothamFont
        source: "qrc:/fonts/GothamNarrowOffice-Regular.ttf"
    }

    property var theme
    property string iconSource
    property string iconText
    property string description4

    // ===== Icon + Text Row
    RowLayout {
        Layout.fillWidth: true
        spacing: 8
        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

        Rectangle {
            width: 30
            height: 30
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
            font.pixelSize: 30
            color: theme.textWhite
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignVCenter
        }
    }

    // ===== Description
    Label {
        text: root.description4
        font.family: gothamFont.name
        font.pixelSize: 12
        color: theme.textWhite
        wrapMode: Text.WordWrap
        Layout.alignment: Qt.AlignHCenter
        horizontalAlignment: Text.AlignHCenter
    }

    // ===== Divider
    Rectangle {
        Layout.fillWidth: true
        Layout.topMargin: 4
        height: 1
        color: theme.chartLinelightpurple
        opacity: 0.3
    }
}
