import QtQuick 2.12
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import "../Model"
import "../themes"

Rectangle {
    id: topBar
    property real  sidebarWidth

    Layout.fillWidth: true
    Layout.preferredHeight: Math.max(48, parent ? parent.height*0.07 : 48)
    Layout.maximumHeight: Layout.preferredHeight
    color: "transparent"
    FontLoader  { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }
    TopBarModel { id: topBarModel }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // ===== Left Section
        Repeater {
            model: topBarModel.model
            delegate: ListElementTopBar {
                labelText1 :       model.text1
                labelText2 :       model.text2
                iconSource1:      model.icon1
                iconSource2:      model.icon2
                iconSource3:      model.icon3
                iconSource4:      model.icon4
                iconSource5:      model.icon5
                //				onClicked: {
                //					if (stackView)
                //						stackView.replace(model.page)
                //				}
            }
        }

    }
}
