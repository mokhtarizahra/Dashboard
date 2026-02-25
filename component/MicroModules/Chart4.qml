import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../../themes"
Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    property var  theme
    property var  values: [30, 70]
    property var  colors: [theme.chartLinelightpurple,theme.colorchart4_1]
    property real lineWidth: 25
    property real gap: 0.02
    property real startAngleDeg: -90

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();

            var centerX = width / 2;
            var centerY = height / 2;
            var radius = Math.min(width, height)/2 - root.lineWidth/2;

            var total = 0;
            for(var i=0;i<root.values.length;i++) total += root.values[i];

            var startAngle = root.startAngleDeg * Math.PI / 180;

            ctx.lineWidth = root.lineWidth;
            ctx.lineCap = "butt";

            for(var i=0;i<root.values.length;i++){
                var sliceAngle = (root.values[i]/total)*2*Math.PI - root.gap;

                // ===== draw slice
                ctx.beginPath();
                ctx.arc(centerX, centerY, radius, startAngle, startAngle + sliceAngle);
                ctx.strokeStyle = root.colors[i % root.colors.length];
                ctx.stroke();

                // ===== draw percentage
                var midAngle = startAngle + sliceAngle/2;
                var textRadius = radius - root.lineWidth -10 ;
                var textX = centerX + Math.cos(midAngle) * textRadius;
                var textY = centerY + Math.sin(midAngle) * textRadius;

                ctx.fillStyle = root.colors[i % root.colors.length];
                ctx.font = "bold 18px Arial";
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";
                ctx.fillText(Math.round(root.values[i]*100/total) + "%", textX, textY);

                startAngle += sliceAngle + root.gap;
            }
        }
    }

    onValuesChanged: canvas.requestPaint()
    onColorsChanged: canvas.requestPaint()
    onLineWidthChanged: canvas.requestPaint()
    onGapChanged: canvas.requestPaint()
    onStartAngleDegChanged: canvas.requestPaint()
}
