import QtQuick
import QtQuick.Window
import QtQuick.Controls

ApplicationWindow {
    width: 489
    minimumWidth: 420
    height: 800
    visible: true
    title: qsTr("Hello World!!!")

    Rectangle {
        anchors.fill: parent
        color: '#fff'
        StackView {
            id: stack
            anchors.fill: parent
            initialItem: splash
        }
    }

    Component {
        id: splash
        Splash {
            timeout: 1000
            onFinished: stack.replace(home)
        }
    }

    Component {
        id: home
        HomePage {}
    }
}
