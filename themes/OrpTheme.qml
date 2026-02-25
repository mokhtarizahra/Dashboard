import QtQuick 2.12

QtObject {
    readonly property color cardBackground            : "#ecedff"
    readonly property color sideBarHover              : "#249bc5"
    readonly property color cardBackgroundTop         : "#fefefc"
    readonly property color chartLinelightpurple      : "#5153c4"
    readonly property color colorchart6_1             : "#f1ac86"
    readonly property color colorchart6_2             : "#f2cabd"
    readonly property color colorchart4_1             : "#f68d5a"
    readonly property color colorchart4_2             : "#b6b7f1"
    readonly property color colorchart4_3             : "#646dee"
    readonly property color colorchart4_4             : "#979cf4"
    readonly property color titleTextOrange           : "#F4A460"
    readonly property color axisLabel                 : "#9d9f97"
    readonly property color tooltipBackground         : "#333333"
    readonly property color gridLine                  : "#374151"
    readonly property color turquoise                 : "mediumturquoise"
    readonly property color turquoise2                : "#1be5ef"
    readonly property color textWhite                 : "#000000"
    readonly property color textLable                 : "#e6d27d"
    readonly property color textLable2                : "black"
    readonly property color textLable3                : "#421317"
             property color startColor                : "#b1b0fd"
             property color midleColor                : "#7c7aed"
             property color endColor                  : "#4f55c3"
    readonly property color strokeStyle               : "#334155"
    readonly property color backSearsh                : "#ffffff"
    readonly property color purple3                   : "#1f003b"
    readonly property color purple4                   : "#0a0116"
    readonly property color purple5                   : "#4e55c4"
    readonly property color purple6                   : "#4a0361"
    readonly property color yellow                    : "#eebf26"
    readonly property color crimson                   : "#541c1c"
    readonly property color darknavy                  : "#070019"
    readonly property color darknavy2                 : "#0a001d"
    readonly property color darknavy3                 : "#16061b"
    readonly property color chartPoint                : "#643e7a"
    readonly property color chartLine                 : "#38bdf8"

             property color _startColorRecProgressBar : "#c8d1f1"
             property color _midleColorRecProgressBar : "#9e9bee"
             property color _endColorRecProgressBar   : "#8581ed"
             property color secondSectionColor        : "#7d78e8"
             property color thirdSectionColor         : "#7d78e8"
             property color progressBackgroundColor   : "#d7d3f3"


    readonly property var progressProfiles: ({
        default: {
            start: _startColorRecProgressBar,
            middle: _midleColorRecProgressBar,
            end: _endColorRecProgressBar,
            second: secondSectionColor,
            third: thirdSectionColor,
            background: progressBackgroundColor
        },

        warning: {
            start     : "#f4d0be",
            middle    : "#f5bca0",
            end       : "#ec9573",
            second    : "#ec9573",
            third     : "#ec9573",
            background: "#d7d3f3"
        }
    })

           property color borderCombo                 : "#9497d9"


}
