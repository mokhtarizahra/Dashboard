import QtQuick 2.12

QtObject {
    readonly property color cardBackgroundTop         : "#090015"
    readonly property color sideBarHover              : "#2b0055"
    readonly property color chartLinelightpurple      : "#8b5cf6"
    readonly property color titleTextOrange           : "#F4A460"
    readonly property color axisLabel                 : "#a5b4fc"
    readonly property color tooltipBackground         : "#333333"
    readonly property color gridLine                  : "#374151"
    readonly property color turquoise                 : "mediumturquoise"
    readonly property color turquoise2                : "#1be5ef"
    readonly property color textWhite                 : "#fdfdfd"
    readonly property color textLable                 : "#e6d27d"
    readonly property color textLable2                : "#df746e"
    readonly property color textLable3                : "#421317"
    property color startColor                         : "red"
    property color midleColor                         : "yellow"
    property color endColor                           : "green"
    readonly property color strokeStyle               : "#334155"
    readonly property color backSearsh                : "#4b0065"
    readonly property color purple3                   : "#1f003b"
    readonly property color purple4                   : "#0a0116"
    readonly property color purple5                   : "#1c0033"
    readonly property color purple6                   : "#4a0361"
    readonly property color yellow                    : "#eebf26"
    readonly property color crimson                   : "#541c1c"
    readonly property color darknavy                  : "#070019"
    readonly property color darknavy2                 : "#0a001d"
    readonly property color darknavy3                 : "#16061b"
    readonly property color chartPoint                : "#643e7a"
    readonly property color chartLine                 : "#38bdf8"

    // =====  ProgressBar
    property color _startColorRecProgressBar : "#e99270"
    property color _midleColorRecProgressBar : "#f06881"
    property color _endColorRecProgressBar   : "#693490"
    property color secondSectionColor        : "#396ad8"
    property color thirdSectionColor         : "#1cf7e9"
    property color progressBackgroundColor   : "transparent"

    readonly property var progressProfiles: ({
        default: {
            start: _startColorRecProgressBar,
            middle: _midleColorRecProgressBar,
            end: _endColorRecProgressBar,
            second: secondSectionColor,
            third: thirdSectionColor,
            background: progressBackgroundColor
        }
    })
}
