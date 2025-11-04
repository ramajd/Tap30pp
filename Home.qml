import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

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
        anchors.fill: parent
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

        ScrollView {
            id: adScroll
            Layout.fillWidth: true
            Layout.maximumHeight: 200
            height: 200
            // ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
            clip: true

            background: Rectangle {
                anchors.fill: parent
                color: 'yellow'
            }

            ListView {
                model: adsModel
                orientation: Qt.Horizontal
                layoutDirection: Qt.RightToLeft
                delegate:  ItemDelegate {
                    width: 360
                    height: 200
                    hoverEnabled: false
                    Rectangle {
                        id: adItem
                        anchors.fill: parent
                        anchors.margins: 10
                        radius: 15
                        color: model['bg-color']
                        clip: true

                        RowLayout {
                            anchors.fill: parent
                            layoutDirection: Qt.RightToLeft
                            clip: true
                            ColumnLayout {
                                layoutDirection: Qt.RightToLeft
                                Layout.alignment: Qt.AlignTop
                                Layout.margins: 15

                                TpLabel {
                                    text: model['title']
                                    color: model['fg-color']
                                    font.pointSize: 12
                                    font.weight: Font.DemiBold
                                    lineHeight: 1.1
                                }
                                TpLabel {
                                    text: model['sub-title']
                                    color: model['fg-color']
                                    font.weight: Font.Normal
                                }
                            }

                            Item { Layout.fillWidth: true }

                            Image {
                                source: model["image"]
                                sourceSize: Qt.size(adItem.height, adItem.height)
                                fillMode: Image.PreserveAspectCrop
                            }
                        }
                    }
                }
            }

            WheelHandler {
                target: adScroll
                acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                onWheel: function (e) {
                    const loc = adScroll.contentItem.contentX - e.angleDelta.y / 2

                    // console.debug("cw=" + adScroll.contentWidth + ' - ' +
                    //               "ix=" + adScroll.contentItem.contentX + ' - ' +
                    //               "iw=" + adScroll.contentItem.width + ' - ' +
                    //               "lo=" + loc)

                    // adScroll.contentItem.contentX = loc < 0 ?
                    //             0 :
                    //             loc > (adScroll.contentWidth - adScroll.contentItem.width) ?
                    //                 adScroll.contentWidth - adScroll.contentItem.width : loc

                    adScroll.contentItem.contentX = loc < - adScroll.contentWidth
                            ? - adScroll.contentWidth
                            : loc > -adScroll.contentItem.width ? -adScroll.contentItem.width : loc

                    e.accepted = true
                }
            }
        }

        // ScrollView {
        //     width: parent.width
        //     height: 100
        //     ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        //         ListView {
        //             model: 20
        //             delegate: ItemDelegate {
        //                 text: "Item " + index

        //                 required property int index
        //             }
        //         }

        //     // ListView {
        //     //     layoutDirection: Qt.RightToLeft
        //     //     // anchors.fill: parent
        //     //     model: adsModel
        //     //     delegate: ItemDelegate {
        //     //         Rectangle {
        //     //             width: 360
        //     //             height: 300
        //     //             // color: model.background
        //     //             // color: 'red'
        //     //             border.color: 'red'
        //     //             anchors.margins: 10
        //     //         }
        //     //     }
        //     // }
        // }
        Item {
            Layout.fillHeight: true
        }
    }
}
