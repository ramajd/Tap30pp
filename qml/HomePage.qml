import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "components/"

Item {
    id: home
    Rectangle {
        id: container
        width: 420
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        ColumnLayout {
            width: container.width
            layoutDirection: Qt.RightToLeft

            Row {
                id: header
                width: parent.width
                layoutDirection: Qt.RightToLeft
                topPadding: 16
                bottomPadding: 24
                Image {
                    width: 92; height: 24
                    source: Qt.resolvedUrl("qrc:/assets/tap30.png")
                }
            }

            Row {
                id: announcement
                width: parent.width
                ImageButton {
                    source: Qt.resolvedUrl("qrc:/assets/announcement.jpg")
                    width: container.width
                    height: 40
                    radius: 8
                    onClicked: console.log('announcement clicked')
                }
            }

            Row {

                width: container.width
                topPadding: 24
                bottomPadding: 16

                Label {
                    text: qsTr("سرویس ها")
                    width: container.width
                    font.family: "vazirmatn"
                    font.bold: true
                    font.pointSize: 12

                }
            }

            GridLayout {
                id: services
                width: container.width
                columns: 2
                columnSpacing: 16
                rowSpacing: 16
                layoutDirection: Qt.RightToLeft


                ServiceItem {
                    title: qsTr("درخواست تپسی")
                    image: Qt.resolvedUrl("qrc:/assets/cars.png")
                    grayBackground: false
                    onClicked: console.log(title + ' clicked')
                }
                ServiceItem {
                    title: qsTr("پیک فوری")
                    image: Qt.resolvedUrl("qrc:/assets/bike.png")
                    onClicked: console.log(title + ' clicked')
                }
                ServiceItem {
                    title: qsTr("بین شهری")
                    image: Qt.resolvedUrl("qrc:/assets/travel.png")
                    onClicked: console.log(title + ' clicked')
                }
                ServiceItem {
                    title: qsTr("پیک اقتصادی")
                    image: Qt.resolvedUrl("qrc:/assets/box.png")
                    onClicked: console.log(title + ' clicked')
                }
                ServiceItem {
                    title: qsTr("از من بپرس!")
                    image: Qt.resolvedUrl("qrc:/assets/ask-me.png")
                    isVertical: false
                    Layout.columnSpan: 2
                    onClicked: console.log(title + ' clicked')
                }
            }
        }
    }
}
