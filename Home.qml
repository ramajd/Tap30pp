import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts


import "./components"

TpPage {
    id: root

    Component.onCompleted: {
        const xhr = new XMLHttpRequest();
        xhr.open("GET", "qrc:/data.json");
        xhr.send();
        xhr.onload = () => {
            const data = JSON.parse(xhr.responseText)
            const homeData = data["home"]
            topMenuModel.clear()
            homeData["top-menu"].forEach((itm) => {
                                             if (!itm.badge) itm.badge = ''
                                             topMenuModel.append(itm)
                                         })
            menuModel.clear()
            homeData["menu"].forEach(m => {
                                         if (!m.badge) m.badge = ''
                                         menuModel.append(m)
                                     })

        }
    }

    ListModel { id: topMenuModel }
    ListModel { id: menuModel }

    header: AdItemView {}


    ColumnLayout {
        layoutDirection: Qt.RightToLeft
        anchors.fill: parent

        GridLayout {
            width: parent.width
            layoutDirection: Qt.RightToLeft
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            Layout.margins: 10
            columns: 3

            Repeater {
                model: topMenuModel
                delegate: TpImageButton {
                    title: model.title
                    imageSource: model.src
                    badge: model.badge
                }
            }
        }

        GridLayout {
            width: parent.width
            layoutDirection: Qt.RightToLeft
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            columns: 4

            Repeater {
                model: menuModel
                delegate: TpImageButton {
                    title: model.title
                    imageSource: model.src
                    badge: model.badge ? model.badge : ""

                    Component.onCompleted: {
                        console.log(model.badge)
                    }
                }
            }
        }

        Item { Layout.fillHeight: true }
    }

}
