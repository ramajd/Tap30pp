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
                h: homeData["offerbox"]["countdown"]["h"],
                m: homeData["offerbox"]["countdown"]["m"],
                s: homeData["offerbox"]["countdown"]["s"],
            }
            offersModel.clear()
            homeData["offerbox"]["offers"].forEach(offer => offersModel.append(offer))
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
    ListModel {
        id: offersModel
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


        Rectangle {
            id: offersPanel

            property alias title: offersTitle.text
            property var countDown: {'h': 0, 'm': 0, 's': 0}

            Layout.fillWidth: true
            Layout.maximumHeight: 200
            height: 200
            // clip: true

            gradient: Gradient {
                GradientStop { position: 0.0; color: '#FFF' }
                GradientStop { position: 1.0; color: '#ADDEC9' }
            }

            ColumnLayout {
                Layout.fillWidth: true
                anchors.fill: parent
                anchors.margins: 16
                layoutDirection: Qt.RightToLeft

                RowLayout {
                    layoutDirection: Qt.RightToLeft
                    Layout.fillWidth: true


                    Label {
                        id: offersTitle
                        text: "offers"
                        font.weight: Font.Medium
                        font.pointSize: 12
                        Layout.alignment: Qt.AlignVCenter
                    }
                    Item { Layout.fillWidth: true }

                    TpCountDown {
                        hour: offersPanel.countDown['h']
                        minute: offersPanel.countDown['m']
                        second: offersPanel.countDown['s']
                        Layout.alignment: Qt.AlignVCenter
                    }
                }

                TpHScrollView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ListView {
                        model: offersModel
                        orientation: Qt.Horizontal
                        layoutDirection: Qt.RightToLeft
                        anchors.fill: parent
                        spacing: 2
                        delegate: ItemDelegate {
                            width: 100
                            height: 100
                            Rectangle {
                                color: '#FFF'
                                anchors.fill: parent
                                anchors.margins: 10
                                Text { text: index }
                            }
                        }
                    }

                }

                // ScrollView {
                //     Layout.fillWidth: true
                //     Layout.fillHeight: true
                //     clip: true
                //     background: Rectangle {
                //         anchors.fill: parent
                //         color: 'yellow'
                //     }
                //     ListView {
                //         model: offersModel
                //         orientation: Qt.Horizontal
                //         layoutDirection: Qt.RightToLeft
                //         anchors.fill: parent
                //         spacing: 2
                //         delegate: ItemDelegate {
                //             width: 100
                //             height: 100
                //             Rectangle {
                //                 color: '#FFF'
                //                 anchors.fill: parent
                //                 anchors.margins: 10
                //                 Text { text: index }
                //             }
                //         }
                //     }
                // }


                // Item { Layout.fillHeight: true }
            }



        }

        ScrollView {
            id: adScroll
            Layout.fillWidth: true
            Layout.maximumHeight: 180
            height: 180
            // ScrollBar.horizontal.policy: ScrollBar.AlwaysOn
            clip: true

            // background: Rectangle {
            //     anchors.fill: parent
            //     color: 'yellow'
            // }

            ListView {
                model: adsModel
                orientation: Qt.Horizontal
                layoutDirection: Qt.RightToLeft
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
                    adScroll.contentItem.contentX = loc < -adScroll.contentWidth
                            ? -adScroll.contentWidth
                            : loc > -adScroll.contentItem.width
                              ? -adScroll.contentItem.width : loc

                    e.accepted = true
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }

    }

}
