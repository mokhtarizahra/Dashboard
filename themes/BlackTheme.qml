import QtQuick 2.12

QtObject {
    readonly property color cardBackgroundTop         : "#12171a"
    readonly property color sideBarHover              : "#12171a"
    readonly property color chartLinelightpurple      : "#08447d"
    readonly property color colorchart4_1             : "#f94a26"
    readonly property color titleTextOrange           : "#12171a"
    readonly property color axisLabel                 : "#12171a"
    readonly property color tooltipBackground         : "#12171a"
    readonly property color gridLine                  : "#12171a"
    readonly property color turquoise                 : "#12171a"
    readonly property color turquoise2                : "#12171a"
    readonly property color textWhite                 : "#ffffff"
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
    readonly property color purple6                   : "#070c0f"
    readonly property color yellow                    : "#eebf26"
    readonly property color crimson                   : "#541c1c"
    readonly property color darknavy                  : "#12171a"
    readonly property color darknavy2                 : "#12171a"
    readonly property color darknavy3                 : "#12171a"
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
