import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

ScrollView {
    id: adScroll
    clip: true

    background: Rectangle {
        anchors.fill: parent
        color: 'yellow'
    }


    WheelHandler {
        target: adScroll
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        onWheel: function (e) {
            const loc = adScroll.contentItem.contentX - e.angleDelta.y / 2

            console.debug("cw=" + adScroll.contentWidth + ' - ' +
                          "ix=" + adScroll.contentItem.contentX + ' - ' +
                          "iw=" + adScroll.contentItem.width + ' - ' +
                          "lo=" + loc)

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
