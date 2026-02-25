import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../themes"

Rectangle {
    id: calendar
    Layout.fillWidth: true
    Layout.fillHeight: true
    implicitWidth: 200
    implicitHeight: 250
    radius: 8

    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    property var  theme      : PurpleTheme {}
    property date currentDate: new Date()
    property date today      : new Date()
    property var  monthNames : ["January","February","March","April","May","June","July","August","September","October","November","December"]
    property var  weekDays   : ["S","M","T","W","T","F","S"]

    property real cellSize: Math.floor(Math.min(width, height) / 8)
    property real headerFontSize: Math.max(14, width * 0.08)
    property real dayFontSize: Math.max(6, cellSize * 0.45)
    property real weekFontSize: Math.max(9, cellSize * 0.45)

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: calendar.scale = 1.01
        onExited: calendar.scale = 1.0
    }

    color: theme.cardBackgroundTop

    function getCalendarData() {
        var year = currentDate.getFullYear();
        var month = currentDate.getMonth();
        var firstDay = new Date(year, month, 1).getDay();
        var daysInMonth = new Date(year, month + 1, 0).getDate();
        var days = [];

        for (var i = 0; i < firstDay; i++) {
            days.push({ day: "", other: true });
        }

        for (var d = 1; d <= daysInMonth; d++) {
            days.push({ day: d, other: false });
        }

        while (days.length % 7 !== 0) {
            days.push({ day: "", other: true });
        }

        return days;
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 8

        // ===== Header Month
        RowLayout {
            spacing: 6
            Layout.alignment: Qt.AlignHCenter

            Button {
                width: cellSize
                height: cellSize
                onClicked: {
                    var d = new Date(currentDate);
                    d.setMonth(d.getMonth() - 1);
                    currentDate = d;
                }
                contentItem: Text { text: "‹"; color : theme.yellow; font.pixelSize: 18; anchors.centerIn: parent }
                background: Rectangle { color: "transparent"; radius: 4 }
            }

            Label {
                text: monthNames[currentDate.getMonth()] /*+ " " + currentDate.getFullYear()*/
                color: theme.textWhite
                font.family: familjenFont.name
                font.bold: true
                font.pixelSize: headerFontSize
                horizontalAlignment: Text.AlignHCenter            }

            Button {
                width: cellSize
                height: cellSize
                onClicked: {
                    var d = new Date(currentDate);
                    d.setMonth(d.getMonth() + 1);
                    currentDate = d;
                }
                contentItem: Text { text: "›"; color: theme.yellow; font.pixelSize: 18; anchors.centerIn: parent }
                background: Rectangle { color: "transparent"; radius: 4 }
            }
        }

        GridLayout {
            id: calendarGrid
            columns: 7
            rowSpacing: 4
            columnSpacing: 4
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter

            // ===== Weekday
            Repeater {
                model: weekDays
                Label {
                    text: modelData
                    color: theme.textWhite
                    font.family: familjenFont.name
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    Layout.preferredWidth: cellSize
                    Layout.preferredHeight: cellSize * 0.7
                    font.pixelSize: weekFontSize

                }
            }

            // ===== Days
            Repeater {
                model: getCalendarData()
                Rectangle {
                    Layout.preferredWidth: cellSize
                    Layout.preferredHeight: cellSize
                    radius: cellSize * 0.25
                    color: {
                        if (!modelData.other && modelData.day == today.getDate() &&
                            currentDate.getMonth() === today.getMonth() &&
                            currentDate.getFullYear() === today.getFullYear())
                            return theme.chartPoint;
//                        else if (index % 7 === 0)
//                                return "#451619";
                        return "transparent";
                    }
                    border.color: "transparent"

                    Label {
                        anchors.centerIn: parent
                        text: modelData.day
                        font.family: familjenFont.name
                        color: { if (modelData.other)
                                return theme.turquoise2;
                            else if (index % 7 === 0)
                                return theme.crimson;
                                return theme.textWhite}
                        font.pixelSize: dayFontSize
                    }
                }
            }
        }
    }
}
