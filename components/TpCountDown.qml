import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {
    id: root
    property int hour: 0
    property int minute: 0
    property int second: 0

    implicitWidth: content.width
    implicitHeight: content.height

    component Digit: Rectangle {
        property string value: ""
        width: 30
        height: 24
        color: '#d7d7d7'
        radius: 5
        Label {
            text: value.length === 1 ? (0).toLocaleString(Qt.locale('fa'), 'f', 0) + value : value
            anchors.centerIn: parent
            font.weight: Font.DemiBold
        }
    }
    component Seperator: Text {
        text : ":"
        font.weight: Font.DemiBold
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            if (hour === 0 && minute === 0 && second === 0) {
                running = false
                return
            }
            second--
            if (second < 0) {
                second = 59
                minute--
            }
            if (minute < 0) {
                minute = 59
                hour--
            }
            // console.debug(hour + ':' + minute + ':' + second)
        }
    }

    RowLayout {
        id: content
        spacing: 1

        Digit { value: hour.toLocaleString(Qt.locale('fa'), 'f', 0) }
        Seperator {}
        Digit { value: minute.toLocaleString(Qt.locale('fa'), 'f', 0) }
        Seperator {}
        Digit { value: second.toLocaleString(Qt.locale('fa'), 'f', 0) }
    }
}
