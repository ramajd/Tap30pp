import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    property string title: ''
    property var countDown: {
        "h": 0,
        "m": 0,
        "s": 0
    }
    property var model: ListModel {}

    implicitHeight: 256

    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: '#FFF'
            }
            GradientStop {
                position: 1.0
                color: '#ADDEC9'
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: anchors.rightMargin

        RowLayout {
            layoutDirection: Qt.RightToLeft
            Layout.margins: 16
            Layout.topMargin: 8
            Layout.bottomMargin: 8

            TpLabel {
                text: root.title
                font.weight: Font.Medium
                font.pointSize: 12
            }

            Item {
                Layout.fillWidth: true
            }

            TpCountDown {
                hour: offersPanel.countDown['h']
                minute: offersPanel.countDown['m']
                second: offersPanel.countDown['s']
                Layout.alignment: Qt.AlignVCenter
            }
        }

        // Rectangle {
        //     color: 'blue'
        //     Layout.fillWidth: true
        //     Layout.fillHeight: true
        // }

        TpHScrollView {
            Layout.fillWidth: true
            Layout.leftMargin: 16
            Layout.rightMargin: 16
            height: 200
            rtl: true

            model: root.model
            delegate: Rectangle {
                id: box
                color: '#FFF'
                width: 110
                height: parent.height
                radius: 12

                ColumnLayout {
                    Layout.margins: 8
                    anchors.margins: 8
                    Layout.alignment: Qt.AlignCenter

                    Image {
                        source: model.image
                        sourceSize: Qt.size(100, 100)
                        fillMode: Image.PreserveAspectFit
                        // width: parent.width
                    }

                    Item { Layout.fillHeight: true }
                }



            }

        }

        // RowLayout {
        //     Layout.fillWidth: true
        //     height: 200
        //     // Layout.fillHeight: true
        //     Layout.margins: 8
        //     spacing: 8

        //     Repeater {
        //         model: root.model
        //         Rect {}
        //     }

        //     component Rect: Rectangle {
        //         color: '#FFF'
        //         // Layout.fillWidth: true
        //         Layout.fillHeight: true
        //         // Layout.margins: 8
        //         width: 110
        //         radius: 12
        //     }
        // }
    }

    // ColumnLayout {
    //     // Layout.fillWidth: true
    //     anchors.fill: parent
    //     // anchors.margins: 16
    //     layoutDirection: Qt.RightToLeft

    //     RowLayout {
    //         layoutDirection: Qt.RightToLeft
    //         Layout.fillWidth: true

    //         Label {
    //             id: offersTitle
    //             text: "offers"
    //             font.weight: Font.Medium
    //             font.pointSize: 12
    //             Layout.alignment: Qt.AlignVCenter
    //         }
    //         Item {
    //             Layout.fillWidth: true
    //         }

    //         TpCountDown {
    //             hour: offersPanel.countDown['h']
    //             minute: offersPanel.countDown['m']
    //             second: offersPanel.countDown['s']
    //             Layout.alignment: Qt.AlignVCenter
    //         }
    //     }

    //     TpHScrollView {
    //         Layout.fillWidth: true
    //         Layout.fillHeight: true
    //         height: 200

    //         rtl: true
    //         model: ListModel {
    //             id: offersModel
    //         }

    //         delegate: ItemDelegate {
    //             width: 100
    //             height: parent.height
    //             hoverEnabled: false
    //             enabled: false

    //             Rectangle {
    //                 id: box
    //                 color: '#e3e3e3'
    //                 anchors.fill: parent
    //                 anchors.margins: 5
    //                 radius: 10

    //                 ColumnLayout {
    //                     anchors.fill: parent

    //                     Image {
    //                         Layout.topMargin: 8
    //                         source: model.image
    //                         sourceSize: Qt.size(box.width - 20, box.width - 20)
    //                         Layout.alignment: Qt.AlignHCenter
    //                     }

    //                     TpLabel {
    //                         text: model.title
    //                         font.pointSize: 8
    //                         Layout.alignment: Qt.AlignHCenter
    //                     }
    //                     TpLabel {
    //                         text: model.price + ' تومان'
    //                         font.pointSize: 8
    //                         Layout.alignment: Qt.AlignHCenter
    //                     }

    //                     Row {
    //                         layoutDirection: Qt.RightToLeft
    //                         spacing: 2
    //                         Rectangle {
    //                             color: '#048848'
    //                             width: childrenRect.width
    //                             height: childrenRect.height
    //                             radius: width/2
    //                             TpLabel {
    //                                 text: model.off
    //                                 color: '#fff'
    //                                 font.pointSize: 8
    //                             }
    //                         }
    //                         TpLabel {
    //                             text: model['old-price']
    //                             font.strikeout: true
    //                         }
    //                     }

    //                     Item { Layout.fillHeight: true }

    //                 }

    //             }
    //         }
    //     }
    // }
    // }
}
