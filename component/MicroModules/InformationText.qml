import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import "../../themes"

ColumnLayout {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 8
    property color  textLable3   : theme? theme.textLable3 : "#421317"
    property var    theme
    property string title2
    property string description
    property int    textAlignment: Qt.AlignLeft
    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    // ==== Title2
    Label {
        text: root.title2
        font.pixelSize: Math.max(16, parent.height * 0.1)
        color: root.textLable3
        font.family: familjenFont.name
        font.bold: true
        horizontalAlignment: root.textAlignment
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
    }

    // ==== Description
    Text {
        text: root.description
        color: theme.textWhite
        font.family: familjenFont.name
        font.pixelSize: Math.max(12, parent.height * 0.08)
        wrapMode: Text.WordWrap
        horizontalAlignment: root.textAlignment
        Layout.fillWidth: true
    }
}
