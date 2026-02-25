import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import "../themes"

ColumnLayout {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.margins: 10
    spacing: 8

    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    property var theme
    property string title2
    property string description2

    // ==== Title2
    Label {
        text: root.title2
        font.pixelSize: Math.max(8, parent.height * 0.08)
        color: theme.textLable3
        font.family: familjenFont.name
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        Layout.fillWidth: true
    }

    // ==== Description2
    Text {
        text: root.description2
        color: theme.textWhite
        font.family: familjenFont.name
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignLeft
        Layout.fillWidth: true
    }
}
