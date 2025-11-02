import QtQuick

Rectangle {
    id: logo
    property int size: 100
    property color color: '#ff5722'

    width: size
    height: size

    Rectangle {
        id: topRow
        color: logo.color
        width: logo.size * 3 / 5
        height: logo.size / 5
        x: logo.size - width
        y: 0 + 1 * height
    }

    Rectangle {
        id: bottomRow
        color: logo.color
        width: logo.size
        height: logo.size / 5
        x: logo.size - width
        y: 0 + 3 * height
    }
}
