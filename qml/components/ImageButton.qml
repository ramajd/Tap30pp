import QtQuick 2.15

RoundedImage {
    id: root
    signal clicked(QtObject mouse)

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: (mouse) => root.clicked(mouse)
    }
}
