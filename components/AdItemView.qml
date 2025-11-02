import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

import Tap30pp

Item {
    id: adItem

    AdItem { id: adData }
    height: 160

    Rectangle {
        anchors.fill: parent
        color: "#DDD6FE"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log(adData.action)
            Qt.openUrlExternally(adData.action)
        }
    }

    RowLayout {
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        Layout.alignment: Qt.AlignTop


        ColumnLayout {
            layoutDirection: Qt.RightToLeft
            Layout.alignment: Qt.AlignTop
            Layout.margins: 15


            TpLabel {
                text: adData.title
                font.weight: Font.DemiBold
                font.pointSize: 12
                color: "#4C1D95"
            }
            TpLabel {
                text: adData.subTitle
                font.weight: Font.Medium
                color: "#704BAF"
            }

            Rectangle {
                Text {
                    id: actionTitle
                    text: adData.actionTitle + " \u2190"
                    color: "#4C1D95"
                    font.weight: Font.DemiBold
                    Layout.margins: 20
                    anchors.centerIn: parent
                    anchors.margins: 20
                }
                width: actionTitle.width + 20
                height: actionTitle.height + 10
                radius: 25
            }
        }

        Item { Layout.fillWidth: true }

        Image {
            source: adData.image
            sourceSize: Qt.size(adItem.height, adItem.height)
            cache: true
        }
    }
}
