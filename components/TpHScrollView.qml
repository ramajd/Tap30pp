import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ScrollView {
    id: root

    property alias model: view.model
    property alias delegate: view.delegate
    property bool rtl: false

    clip: true

    // background: Rectangle {
    //     anchors.fill: parent
    //     color: 'yellow'
    // }

    ListView {
        id: view
        layoutDirection: rtl ? Qt.RightToLeft : Qt.LeftToRight
        orientation: Qt.Horizontal
        spacing: 8
    }

    WheelHandler {
        target: root
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        acceptedModifiers: Qt.ShiftModifier
        onWheel: function (e) {
            const loc = root.contentItem.contentX - e.angleDelta.y / 2

            // console.debug("cw=" + root.contentWidth + ' - '
            //               + "ix=" + root.contentItem.contentX + ' - '
            //               + "iw=" + root.contentItem.width + ' - '
            //               + "lo=" + loc)
            if (rtl) {
                root.contentItem.contentX = loc < -root.contentWidth
                        ? -root.contentWidth
                        : loc > -root.contentItem.width
                          ? -root.contentItem.width : loc
            } else {
                root.contentItem.contentX = loc < 0
                        ? 0
                        : loc > (root.contentWidth - root.contentItem.width)
                          ? root.contentWidth - root.contentItem.width : loc
            }
            e.accepted = true
        }
    }
}
