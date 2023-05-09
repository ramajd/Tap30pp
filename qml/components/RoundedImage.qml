import QtQuick 2.15


Item {
    property int radius: 8
    property color backgroundColor: '#fff'
    property alias source: image.source

    Image {
        id: image
        anchors.fill: parent
        sourceSize: Qt.size(width, height)
        asynchronous: true
    }

    Canvas {
        anchors.fill: parent
        antialiasing: true
        onPaint: {
            var ctx = getContext("2d")
            ctx.fillStyle = backgroundColor
            ctx.beginPath()
            ctx.rect(0, 0, width, height)
            ctx.fill()

            ctx.beginPath()
            ctx.globalCompositeOperation = 'source-out'
            ctx.roundedRect(0, 0, width, height, radius, radius)
            ctx.fill()
        }
    }
}
