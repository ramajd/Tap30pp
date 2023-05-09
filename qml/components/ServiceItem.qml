import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    property string title: ""
    property url image: ""
    property bool grayBackground: true
    property bool isVertical: true

    signal clicked(QtObject mouse)

    Layout.alignment: Qt.AlignCenter
    Layout.fillWidth: true
    height: isVertical ? 129 : 65

    Rectangle {
        anchors.fill: parent
        radius: 8
        gradient: Gradient {

            // Orange: #f7dad0, #fff4f0, #ffeeeb
            // Gray:   #eaeaea, #f7f7f7, #f5f5f5

            GradientStop {
                position: 0
                color: grayBackground ? '#f5f5f5' : '#ffeeeb'
            }
            GradientStop {
                position: 0.5
                color: grayBackground ? '#f7f7f7' : '#fff4f0'
            }
            GradientStop {
                position: 1
                color: grayBackground ? '#eaeaea' : '#f7dad0'
            }
        }

        Component {
            id: svcImage
            Image {
                source: root.image
                width: isVertical ? 77 : 56
                height: isVertical ? 77 : 56
            }
        }

        Component {
            id: svcTitle
            Label {
                text: root.title
                font.family: "vazirmatn"
                font.bold: true
                font.pointSize: 11
            }
        }

        Loader {
            sourceComponent: isVertical ? column : row
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.rightMargin: 16

            Component {
                id: column
                ColumnLayout {
                    anchors.horizontalCenter: parent.horizontalCenter
                    Row {
                        Layout.alignment: Qt.AlignCenter
                        Loader { sourceComponent: svcImage }
                    }
                    Row {
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                        Loader { sourceComponent: svcTitle }
                    }
                }
            }

            Component {
                id: row
                RowLayout {
                    layoutDirection: Qt.RightToLeft
                    anchors.fill: parent
                    Column {
                        Loader { sourceComponent: svcImage }
                    }
                    Column {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignLeft
                        Loader { sourceComponent: svcTitle }
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: (mouse) => root.clicked(mouse)
        }
    }
}
