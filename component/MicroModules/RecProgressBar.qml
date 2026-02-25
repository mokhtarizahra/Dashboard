import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../themes"

Item {
    id: root
    width: 200
    height: 8

    property int   value                     : 0
    property var   theme
    property var colorProfile: ({
        start:  theme._startColorRecProgressBar,
        middle: theme._midleColorRecProgressBar,
        end:    theme._endColorRecProgressBar,
        second: theme.secondSectionColor,
        third:  theme.thirdSectionColor,
        background: theme.progressBackgroundColor
    })

    RowLayout {
        anchors.fill: parent

        Canvas {
            id: progressCanvas
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height

            property real radius: 5

            function drawRoundedRect(ctx, x, y, w, h, r) {
                var minSize = Math.min(w, h)
                if (r > minSize / 2) r = minSize / 2
                ctx.beginPath()
                ctx.moveTo(x + r, y)
                ctx.lineTo(x + w - r, y)
                ctx.quadraticCurveTo(x + w, y, x + w, y + r)
                ctx.lineTo(x + w, y + h - r)
                ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h)
                ctx.lineTo(x + r, y + h)
                ctx.quadraticCurveTo(x, y + h, x, y + h - r)
                ctx.lineTo(x, y + r)
                ctx.quadraticCurveTo(x, y, x + r, y)
                ctx.closePath()
                ctx.fill()
            }

            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, width, height)  // ===== Making the background transparent

                // ===== background
                ctx.fillStyle = colorProfile.background
                drawRoundedRect(ctx, 0, 0, width, height, radius)

                var progressRatio = Math.max(0, Math.min(root.value / 100, 1))
                var filledWidth = width * progressRatio

                // ===== Divide the filled length into three parts
                var firstSectionWidth = filledWidth * 0.4
                var secondSectionWidth = filledWidth * 0.3
                var thirdSectionWidth = filledWidth * 0.3

                var x = 0

                //=====  Total filled: Draw a rounded rectangle with a clip for the radius
                ctx.save()
                ctx.beginPath()
                ctx.moveTo(0 + radius, 0)
                ctx.lineTo(filledWidth - radius, 0)
                ctx.quadraticCurveTo(filledWidth, 0, filledWidth, height / 2)
                ctx.quadraticCurveTo(filledWidth, height, filledWidth - radius, height)
                ctx.lineTo(0 + radius, height)
                ctx.quadraticCurveTo(0, height, 0, height / 2)
                ctx.quadraticCurveTo(0, 0, 0 + radius, 0)
                ctx.clip()

                // Part One: Gradient
                if (firstSectionWidth > 0) {
                    var gradient = ctx.createLinearGradient(0, 0, firstSectionWidth, 0)
                    gradient.addColorStop(0, colorProfile.start)
                    gradient.addColorStop(0.5, colorProfile.middle)
                    gradient.addColorStop(1,colorProfile.end)
                    ctx.fillStyle = gradient
                    ctx.fillRect(x, 0, firstSectionWidth, height)
                    x += firstSectionWidth
                }

                // ===== Part 2: Fixed color
                if (secondSectionWidth > 0) {
                    ctx.fillStyle = colorProfile.second
                    ctx.fillRect(x, 0, secondSectionWidth, height)
                    x += secondSectionWidth
                }

                // ===== Part Three: Fixed Color
                if (thirdSectionWidth > 0) {
                    ctx.fillStyle = colorProfile.third
                    ctx.fillRect(x, 0, thirdSectionWidth, height)
                }

                ctx.restore()
            }

            Component.onCompleted: requestPaint()
            onWidthChanged: requestPaint()
            onHeightChanged: requestPaint()

            Connections {
                target: root
                onValueChanged: progressCanvas.requestPaint()
            }
        }
    }
}
