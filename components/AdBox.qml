import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: root

    property alias title: txtTitle.text
    property alias subTitle: txtSubTitle.text
    property alias image: adImage.source
    property color foregroundColor: "#000"
    property color backgroundColor: "#D7D7D7"
    property string actionUrl: ""
    property string actionTitle: ""
    property color actionColor: "#000"
    property color actionBackground: "#FFF"



    Rectangle {
        id: container
        anchors.fill: parent
        anchors.margins: 10
        radius: 15
        color: root.backgroundColor
        clip: true

        RowLayout {
            anchors.fill: parent
            layoutDirection: Qt.RightToLeft

            ColumnLayout {
                layoutDirection: Qt.RightToLeft
                Layout.alignment: Qt.AlignTop
                Layout.margins: 15

                TpLabel {
                    id: txtTitle
                    color: root.foregroundColor
                    font.weight: Font.DemiBold
                    font.pointSize: 12
                    lineHeight: 1.1
                }
                TpLabel {
                    id: txtSubTitle
                    color: root.foregroundColor
                    font.weight: Font.Normal
                }
                Rectangle {
                    visible: actionTitle !== ''
                    Text {
                        id: actTitle
                        text: actionTitle + ' \u2190'
                        anchors.centerIn: parent
                        font.weight: Font.DemiBold
                        color: actionColor
                    }

                    // Image {
                    //     id: actArrow
                    //     source: "data:iamge/svg+xml;utf8," +
                    //             "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' viewBox='0 0 20 20' fill='none'>" +
                    //             "  <path fill-rule='evenodd' clip-rule='evenodd'" +
                    //             "        d='M9.22587 4.10744L3.33331 9.99999L9.22587 15.8925L10.4044 14.714L6.52498 10.8333L17.5 10.8333V9.16666L6.52498 9.1666L10.4044 5.28595L9.22587 4.10744Z'" +
                    //             "        fill='#312E81'>" +
                    //             "  </path>" +
                    //             "</svg>"
                    // }

                    width: actTitle.width + 20
                    height: actTitle.height + 10
                    radius: width / 2
                    color: actionBackground
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Item {
                height: 150
                width: 150
                Layout.alignment: Qt.AlignBottom

                Image {
                    id: adImage
                    anchors.fill: parent
                    sourceSize: Qt.size(parent.width,
                                        parent.height)
                    visible: false
                }
                MultiEffect {
                    source: adImage
                    anchors.fill: adImage
                    maskEnabled: true
                    maskSource: adImageMask
                    maskThresholdMin: 0.5
                    maskSpreadAtMin: 1.0
                }
                Item {
                    id: adImageMask
                    width: adImage.width
                    height: adImage.height
                    layer.enabled: true
                    layer.smooth: true
                    visible: false

                    Rectangle {
                        width: adImage.width
                        height: adImage.height
                        radius: container.radius
                        color: "#000"
                    }
                }
            }

        }
    }



}
