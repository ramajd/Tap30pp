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
        color: adData.background
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.openUrlExternally("https://google.com")
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
                color: adData.foreground
            }
            TpLabel {
                text: adData.subTitle
                font.weight: Font.Normal
                color: adData.foreground
            }

            Rectangle {
                Text {
                    id: actionTitle
                    text: adData.actionTitle + " \u2190"
                    color: adData.foreground
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
