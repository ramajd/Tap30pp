import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Page {
    id: root
    default property alias data: content.data

    anchors.fill: parent

    ScrollView {
        id: scroll
        anchors.fill: parent

        Column {
            id: content
            width: scroll.width
            spacing: 0
        }
    }
}
