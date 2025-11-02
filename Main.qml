import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import "./components"

ApplicationWindow {
    width: 500
    height: 800
    visible: true
    font.family: vazirFont.name

    Material.theme: Material.Light
    Material.accent: '#FF5722'

    FontLoader {
        id: vazirFont
        source: "qrc:///assets/Vazirmatn-VariableFont_wght.ttf"
    }

    StackView {
        id: stack
        width: 400
        height: 800
        anchors.centerIn: parent
        // initialItem: loginPage
        initialItem: homePage
    }

    Component {
        id: loginPage
        Login {
            onLoggedIn: {
                stack.push(homePage)
            }
        }
    }

    Component { id: homePage; Home {} }
}
