import QtQuick 2.12
import QtQml.Models 2.2

QtObject {
    id: sidebarModel

    property ListModel model: ListModel {
		ListElement { text: "DASHBOARD"; icon1: "qrc:/Images/icons8-home.svg";        icon2: "qrc:/Images/icons8-expand-arrow-64.png";   page: "DashboardPage.qml" }
		ListElement { text: "CHART";     icon1: "qrc:/Images/icons8-chart-30.png";    icon2: "qrc:/Images/icons8-expand-arrow-64.png";   page: "ChartPage.qml"     }
		ListElement { text: "APPS";      icon1: "qrc:/Images/icons8-star-32.png";     icon2: "qrc:/Images/icons8-expand-arrow-64.png";   page: "AppsPage.qml"      }
		ListElement { text: "FORUM";     icon1: "qrc:/Images/icons8-topic-48.png";    icon2: "qrc:/Images/icons8-expand-arrow-64.png";   page: "ForumPage.qml"     }
		ListElement { text: "EMAIL";     icon1: "qrc:/Images/icons8-email-30.png";    icon2: "qrc:/Images/icons8-expand-arrow-64.png";   page: "EmailPage.qml"     }
		ListElement { text: "SETTING";   icon1: "qrc:/Images/icons8-settings-50.png"; icon2: "qrc:/Images/icons8-expand-arrow-64.png";   page: "Setting.qml"       }

	}

	property ListModel model2: ListModel {
		ListElement { text: "PROJECTS";  page: "ProjectsPage.qml" }
		ListElement { text: "OPTION";    page: "OptionPage.qml"   }
		ListElement { text: "CASE";      page: "CasePage.qml"     }
		ListElement { text: "LOCAL";     page: "LocalPage.qml"    }

	}
}
