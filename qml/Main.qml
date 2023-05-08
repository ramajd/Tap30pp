import QtQuick
import QtQuick.Window
import QtQuick.Controls

ApplicationWindow {
    width: 489
    height: 640
    visible: true
    title: qsTr("Hello World!!!")

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: splash
    }

    Component {
        id: splash
        Splash {
            timeout: 1000
            onFinished: stack.replace(app)
        }
    }

    Component {
        id: app
        App {}
    }
}
