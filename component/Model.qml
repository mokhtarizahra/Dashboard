import QtQuick 2.12
import QtQml.Models 2.2

QtObject {
    id: sidebarModel

    property ListModel model: ListModel {
        ListElement { text: "DASHBOARD"; icon1: "qrc:/Images/icons8-home.svg";     page: "DashboardPage.qml" }
        ListElement { text: "CHART";     icon1: "qrc:/Images/icons8-chart-30.png"; page: "ChartPage.qml" }
        ListElement { text: "APPS";      icon1: "qrc:/Images/icons8-star-32.png";  page: "AppsPage.qml" }
    }
}
