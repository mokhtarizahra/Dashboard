import QtQuick 2.12

QtObject {
    readonly property color cardBackgroundTop         : "#ffffff"
    readonly property color sideBarHover              : "#99979B"
    readonly property color chartLinelightpurple      : "#8b5cf6"
    readonly property color titleTextOrange           : "#F4A460"
    readonly property color axisLabel                 : "#a5b4fc"
    readonly property color tooltipBackground         : "#333333"
    readonly property color gridLine                  : "#374151"
    readonly property color turquoise                 : "mediumturquoise"
    readonly property color turquoise2                : "#1be5ef"
    readonly property color textWhite                 : "#333333"
    readonly property color textLable                 : "#e6d27d"
    readonly property color textLable2                : "#df746e"
    readonly property color textLable3                : "#421317"
    readonly property color strokeStyle               : "#eaeaea"
    readonly property color backSearsh                : "#4b0065"
    readonly property color purple3                   : "#1f003b"
    readonly property color purple4                   : "#0a0116"
    readonly property color purple5                   : "#faf9fe"
    readonly property color purple6                   : "#4a0361"
    readonly property color yellow                    : "#eebf26"
    readonly property color crimson                   : "#541c1c"
    readonly property color darknavy                  : "#070019"
    readonly property color darknavy2                 : "#0a001d"
    readonly property color darknavy3                 : "#16061b"
    readonly property color chartPoint                : "#643e7a"
    readonly property color chartLine                 : "#38bdf8"
    property color startColor                         : "#ff7800"
    property color midleColor                         : "#ff7800"
    property color endColor                           : "#ff7800"
    property var startColors                          : ["#5245a0", "#fe84a0", "#34b16d"]
    property var midleColors                          : ["#5245a0", "#fe84a0", "#34b16d"]
    property var endColors                            : ["#5245a0", "#fe84a0", "#34b16d"]

    property color textHoverColor            : "#f77809"


    property color _startColorRecProgressBar : "#5446a3"
    property color _midleColorRecProgressBar : "#5446a3"
    property color _endColorRecProgressBar   : "#5446a3"
    property color secondSectionColor        : "#5446a3"
    property color thirdSectionColor         : "#5446a3"
    property color progressBackgroundColor   : "#d7d3f3"
    property color borderCombo               : "#afaeb3"

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
}
