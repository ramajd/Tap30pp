import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Rectangle {
    id: root
    property alias imageSource: img.source
    property alias title: txt.text
    property alias badge: badgeText.text

    Layout.fillWidth: true
    height: box.height > box.width ? box.height : box.width
    radius: 8
    color: '#f5f7f7'

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
    }

    ColumnLayout {
        id: box
        anchors.centerIn: parent

        Image {
            id: img
            Layout.alignment: Qt.AlignHCenter
            sourceSize: Qt.size(50, 50) // TODO: fix static sizing
        }
        Text {
            id: txt
            Layout.alignment: Qt.AlignHCenter
        }
    }

    Rectangle {
        id: badge
        visible: badgeText.text !== ''
        color: '#276EF1'
        width: badgeText.width + 10
        height: badgeText.height
        radius: 20

        Text {
            id: badgeText
            color: "#FFF"
            font.weight: Font.Medium
            font.pointSize: 7
            anchors.centerIn: parent
        }
    }
}


