import QtQuick 2.12
import QtQml.Models 2.2

QtObject {
	id: topBarModel

	property ListModel model: ListModel {
		ListElement { icon1: "qrc:/Images/icons8-menu-24.svg";    text1: "Dashboard"
					  icon2: "qrc:/Images/icons8-topic-48.png";
					  icon3: "qrc:/Images/icons8-settings-50.png";
					  icon4: "qrc:/Images/icons8-email-30.png";
                      icon5: "qrc:/Images/icons8-profile-48.png";     text2: "LOGIN"     }
	}
}
