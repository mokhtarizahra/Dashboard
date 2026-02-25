import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../themes"

Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    property bool showPercent: false
    property real startAngleDeg: -90
    property real rangeAngleDeg: 360

    property var theme: PurpleTheme {}
    FontLoader { id: familjenFont; source: "qrc:/fonts/FamiljenGrotesk-Variable.ttf" }

    property color  startColor  : theme.startColor
    property color  midleColor  : theme.midleColor
    property color  endColor    : theme.endColor

    property var startColors: theme.startColors
    property var midleColors: theme.midleColors
    property var endColors  : theme.endColors

    property int    currentValue: 0
    property int    maxValue    : 100
    property var values: []
    property var maxValues: []
    //    property int ringCount: values.length

    property real ringSpacing: 10

    property real   gap         : 0.1
    property real   lineWidth   : 16
    property color  strokeStyle : theme ? theme.strokeStyle : "#334155"

    property bool showNeedle: false
    property color needleColor: "#fdc451"
    property real needleWidth: 3
    property real needleLength: 0.7

    Layout.alignment: Qt.AlignHCenter



    readonly property bool multiMode: values && values.length > 0
    readonly property int ringCount: multiMode ? values.length : 1


    property int totalSegments: 30




    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d")
            ctx.reset()

            var cx = width / 2
            var cy = height / 2
            var baseRadius = Math.min(width, height) / 2 - 10

            var startRad = root.startAngleDeg * Math.PI / 180
            var totalRad = root.rangeAngleDeg * Math.PI / 180
            var segRad = totalRad / root.totalSegments

            var hasGap = root.gap > 0
            ctx.lineCap = hasGap ? "butt" : "round"
            var overlap = hasGap ? 0 : 0.001

            function valueAt(i) {
                return root.multiMode ? root.values[i] : root.currentValue
            }

            function maxAt(i) {
                return root.multiMode
                        ? (root.maxValues[i] !== undefined ? root.maxValues[i] : root.maxValue)
                        : root.maxValue
            }

            function hexToRgb(hex) {
                if (typeof hex !== "string") return hex
                var c
                if(/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)){
                    c= hex.substring(1).split('')
                    if(c.length==3) c= [c[0],c[0],c[1],c[1],c[2],c[2]]
                    c= '0x'+c.join('')
                    return {r: ((c>>16)&255)/255, g: ((c>>8)&255)/255, b: (c&255)/255}
                }
                return {r:1,g:1,b:1}
            }

            for (var r = 0; r < root.ringCount; r++) {

                var radius = baseRadius - r * (root.lineWidth + root.ringSpacing)
                if (radius <= 0) break

                var percentValue = Math.max(0, Math.min(1, valueAt(r) / maxAt(r)))
                var activeSegs = Math.floor(root.totalSegments * percentValue)

                var sC = root.multiMode
                           ? (root.startColors[r] !== undefined ? root.startColors[r] : root.startColor)
                           : root.startColor

                var mC = root.multiMode
                           ? (root.midleColors[r] !== undefined ? root.midleColors[r] : root.midleColor)
                           : root.midleColor

                var eC = root.multiMode
                           ? (root.endColors[r] !== undefined ? root.endColors[r] : root.endColor)
                           : root.endColor

                sC = hexToRgb(sC)
                mC = hexToRgb(mC)
                eC = hexToRgb(eC)

                // ==== Background =
                for (var j = 0; j < root.totalSegments; j++) {
                    var a1 = startRad + segRad * j
                    var a2 = a1 + segRad - (hasGap ? root.gap : 0)

                    ctx.beginPath()
                    ctx.arc(cx, cy, radius, a1, a2)
                    ctx.lineWidth = root.lineWidth
                    ctx.strokeStyle = root.strokeStyle
                    ctx.stroke()
                }

                // ==== Active
                for (var i = 0; i < activeSegs; i++) {
                    var a1a = startRad + segRad * i
                    var a2a = a1a + segRad - (hasGap ? root.gap : 0) + overlap
                    var p = i / root.totalSegments
                    var rC, gC, bC

                    if (p <= 0.5) {
                        var t = p/0.5
                        rC = sC.r + (mC.r - sC.r)*t
                        gC = sC.g + (mC.g - sC.g)*t
                        bC = sC.b + (mC.b - sC.b)*t
                    } else {
                        var t2 = (p-0.5)/0.5
                        rC = mC.r + (eC.r - mC.r)*t2
                        gC = mC.g + (eC.g - mC.g)*t2
                        bC = mC.b + (eC.b - mC.b)*t2
                    }
                    ctx.beginPath()
                    ctx.arc(cx, cy, radius, a1a, a2a)
                    ctx.lineWidth = root.lineWidth
                    ctx.strokeStyle = "rgb("+Math.round(rC*255)+","+Math.round(gC*255)+","+Math.round(bC*255)+")"
                    ctx.stroke()
                }
            }
        }
    }

    // ===== Repaint triggers
    onCurrentValueChanged: canvas.requestPaint()
        onMaxValueChanged: canvas.requestPaint()
        onValuesChanged: canvas.requestPaint()
        onMaxValuesChanged: canvas.requestPaint()
        onRangeAngleDegChanged: canvas.requestPaint()

    // ===== Needle (outer ring)
    Item {
        anchors.centerIn: parent
        width: 0
        height: 0
        visible: root.showNeedle

        rotation: {
            var v = root.multiMode ? root.values[0] : root.currentValue
            var m = root.multiMode ? root.maxValues[0] : root.maxValue
            var p = Math.max(0, Math.min(1, v / m))
            return root.startAngleDeg + root.rangeAngleDeg * p + 90
        }

        Behavior on rotation {
            NumberAnimation { duration: 300; easing.type: Easing.OutCubic }
        }

        Rectangle {
            width: root.needleWidth
            height: Math.min(parent.parent.width, parent.parent.height) / 2 * root.needleLength
            color: root.needleColor
            x: -width / 2
            y: -height

            Rectangle {
                width: root.needleWidth * 3
                height: width
                radius: width / 2
                color: root.needleColor
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
        }
    }

    // ===== Center Label
    Label {
        visible: !root.showNeedle
        anchors.centerIn: parent
        text: showPercent
              ? (root.multiMode ? root.values[0] + "%" : root.currentValue + "%")
              : (root.multiMode ? root.values[0] : root.currentValue)
        color: theme.textWhite
        font.pixelSize: 18
        font.family: familjenFont.name
    }
}
