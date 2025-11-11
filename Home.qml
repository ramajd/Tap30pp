import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import QtQuick.Effects

import "./components"

TpPage {
    id: root

    Component.onCompleted: {
        const xhr = new XMLHttpRequest()
        xhr.open("GET", "qrc:/data.json")
        xhr.send()
        xhr.onload = () => {
            const data = JSON.parse(xhr.responseText)
            const homeData = data["home"]
            topMenuModel.clear()
            homeData["top-menu"].forEach(itm => {
                                             if (!itm.badge)
                                             itm.badge = ''
                                             topMenuModel.append(itm)
                                         })
            menuModel.clear()
            homeData["menu"].forEach(m => {
                                         if (!m.badge)
                                         m.badge = ''
                                         menuModel.append(m)
                                     })
            adsModel.clear()
            homeData["ads"].forEach(ad => adsModel.append(ad))

            offersPanel.title = homeData["offerbox"]["title"]
            offersPanel.countDown = {
                "h": homeData["offerbox"]["countdown"]["h"],
                "m": homeData["offerbox"]["countdown"]["m"],
                "s": homeData["offerbox"]["countdown"]["s"]
            }
            offersPanel.model.clear()
            homeData["offerbox"]["offers"].forEach(offer => offersPanel.model.append(offer))
            // offersModel.clear()
            // homeData["offerbox"]["offers"].forEach(offer => offersModel.append(offer))
        }
    }

    ListModel {
        id: topMenuModel
    }
    ListModel {
        id: menuModel
    }
    ListModel {
        id: adsModel
    }


    header: AdItemView {}

    ColumnLayout {
        layoutDirection: Qt.RightToLeft
        // anchors.fill: parent
        width: root.width
        spacing: 10

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
                }
            }
        }

        OfferPanel {
            id: offersPanel
            Layout.fillWidth: true
        }


        TpHScrollView {
            id: adScroll
            Layout.fillWidth: true
            Layout.maximumHeight: 180
            height: 180

            model: adsModel
            rtl: true
            delegate: ItemDelegate {
                width: 360
                height: adScroll.height
                hoverEnabled: false
                enabled: false

                AdBox {
                    anchors.fill: parent
                    title: model['title']
                    subTitle: model['sub-title']
                    foregroundColor: model["fg-color"]
                    backgroundColor: model["bg-color"]
                    image: model["image"]
                    actionUrl: model["action"]
                    actionTitle: model["action-title"]
                    actionColor: model["action-fg"] ?? model["fg-color"]
                    actionBackground: model["action-bg"]
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
