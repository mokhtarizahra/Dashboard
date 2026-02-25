import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import "../../themes"
import "../"

Rectangle {
    id: searchModule
    radius: height / 2

    property var theme
    color: theme.backSearsh
    property real   widthRatio      : 0.6
    property real   heightRatio     : 0.5
    property real   marginsDash    : 10
    property string defualtText     : "Search"
    property color  searchIconBack  : "transparent"

    Layout.preferredWidth: parent.width * widthRatio
    Layout.preferredHeight: parent.height * heightRatio
    Layout.margins: marginsDash

    RowLayout {
        anchors.fill: parent
        Layout.alignment: Qt.AlignVCenter


        // === TextField
        TextField {
            id: searchField
            Layout.fillWidth: true
            Layout.fillHeight: true
            leftPadding: 30
            placeholderText: defualtText
            color: theme.textWhite
            font.pixelSize: Math.max(12, parent.height * 0.4)

            background: Rectangle {
                color: "transparent"
                radius: 8
            }
        }


        // === Search Icon
        Rectangle {
            width: 30
            height: 30
            color: searchIconBack
            radius: height / 2
        Hoverable {
            source: "qrc:/Images/icons8-search-48.png"
            anchors.fill: parent

        }
        }
    }
}
