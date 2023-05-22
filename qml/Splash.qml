import QtQuick
import QtQuick.Controls

Item {
    id: splashScreen
    property alias timeout: splashTimer.interval
    signal finished()

    Rectangle {
        anchors.fill: parent

        Image {
            id: logo
            source: Qt.resolvedUrl("qrc:/assets/tap30.png")
            anchors.centerIn: parent
        }

        Timer {
            id: splashTimer
            interval: 2000
            repeat: false
            running: true
            onTriggered:  {
                splashScreen.finished()
            }
        }
    }
}
