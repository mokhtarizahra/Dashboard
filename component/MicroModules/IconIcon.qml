import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    color: "transparent"
    // ===== Public API
    property var modelItems
    property var theme
    property string fontFamily: ""

    property bool   rounded          : false
    property int    cornerRadius     : 8
    property real   buttonHeight     : 50
    property bool   dropShadowEnabled: false
    property int    extraSpacing     : 0
    property bool   enablemargin     : false
    property int    cornerMargin     : 15
    property bool   centerItems      : true
    property int    textAlignment    : Text.AlignLeft
    property string iconSource


    // internal state
    property bool hovered: false

    implicitHeight: contentRow.implicitHeight
                    + extraSpacing
                    + (enablemargin ? cornerMargin * 2 : 0)

    height: implicitHeight
    implicitWidth: contentRow.implicitWidth
                 + (enablemargin ? cornerMargin * 2 : 0)

    radius: rounded ? cornerRadius : 0

    // ===== Shadow Wrapper
    Item {
        id: shadowWrapper
        anchors.fill: parent

        Rectangle {
            id: innerRect
            anchors.fill: shadowWrapper
            color: root.dropShadowEnabled ? "#fbfbfd" : "transparent"
            radius: root.rounded ? root.cornerRadius : 0
        }

        DropShadow {
            anchors.fill: innerRect
            source: innerRect
            transparentBorder: true
            color: "#20000000"
            radius: 8
            verticalOffset: 5
            horizontalOffset: 2
            samples: 17
            visible: root.dropShadowEnabled
            z: -1
        }

    }

    // ===== Hover Area
    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onEntered: root.hovered = true
        onExited:  root.hovered = false
    }

    // ===== Content Row
    RowLayout {
        id: contentRow
           anchors {
               fill: parent
               margins: enablemargin ? cornerMargin : 0
           }

           spacing: 10
//           Layout.alignment: centerItems
//               ? Qt.AlignHCenter | Qt.AlignVCenter
//               : Qt.AlignVCenter

        Repeater {
            model: modelItems

            Loader {
                property var itemData: modelData

                sourceComponent: {
                    if (itemData.type === "image")
                        return imageDelegate
                    else if (itemData.type === "spacer")
                            return spacerDelegate
                    else if (itemData.type === "text")
                        return textDelegate
                    else
                        return null
                }
            }
        }


    }

    // ===== Image Delegate
    Component {
        id: imageDelegate

        Item {
            width: itemData.size || 20
            height: width

            Image {
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                source: mouseArea.containsMouse && itemData.hoverSource
                        ? itemData.hoverSource
                        : itemData.source
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
            }
        }
    }

    // ===== Text Delegate
    Component {
        id: textDelegate

        Label {
            id: textLabel
            text: itemData.text
            font.pixelSize: itemData.fontSize || 14
            minimumPixelSize: 10
            fontSizeMode: Text.Fit
            Layout.fillWidth: true
            horizontalAlignment: textAlignment
            color: root.hovered ? theme.textHoverColor : theme.textWhite
            textFormat: Text.RichText
            verticalAlignment: Text.AlignVCenter
        }

    }

    // ==== spacer
   Component {
       id: spacerDelegate
       Item { width: 30 }

}
}
