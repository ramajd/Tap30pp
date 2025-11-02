import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import "./components"

TpPage {
    id: root
    signal loggedIn()

    ColumnLayout {
        layoutDirection: Qt.RightToLeft
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 10
        spacing: 40

        RowLayout {
            layoutDirection: Qt.RightToLeft
            Logo { size: 50 }
            TpLabel {
                text: qsTr("tapsi")
                font.pointSize: 12
                font.weight: Font.Medium
            }
        }

        ColumnLayout {
            Layout.fillHeight: false
            layoutDirection: Qt.RightToLeft

            TpLabel {
                text: qsTr("Enter your mobile number")
                font.weight: Font.DemiBold
                font.pointSize: 10
            }

            TpInput {
                placeholderText: qsTr("phone number")
            }

            TpButton {
                text: qsTr("get code")
                highlighted: true
                onClicked: {
                    root.loggedIn()
                }
            }
        }
    }
}

