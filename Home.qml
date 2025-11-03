import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts


import "./components"

TpPage {
    id: root

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

            TpImageButton { title: 'درخواست تپسی'; imageSource: 'qrc:/assets/ride-request.png'; badge: 'جایزه آیفون' }
            TpImageButton { title: 'سفارش غذا'; imageSource: 'qrc:/assets/superapp-food.png' }
            TpImageButton { title: 'فروشگاه'; imageSource: 'qrc:/assets/dartil.png' }
        }

        GridLayout {
            width: parent.width
            layoutDirection: Qt.RightToLeft
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignTop
            columns: 4

            TpImageButton { title: 'ارسال بسته'; imageSource: 'qrc:/assets/delivery.png' }
            TpImageButton { title: 'سوپر مارکت'; imageSource: 'qrc:/assets/supermarket.png' }
            TpImageButton { title: 'پزشک و دارو'; imageSource: 'qrc:/assets/tapsi_doctor_fv.png' }
            TpImageButton { title: 'بیمه'; imageSource: 'qrc:/assets/insurance.png' }
            TpImageButton { title: 'اینترنت و شارژ'; imageSource: 'qrc:/assets/netandcharge.png' }
            TpImageButton { title: 'خدمات خودرو'; imageSource: 'qrc:/assets/garage_tile.png'; badge: 'خرید قسطی' }
            TpImageButton { title: 'بین شهری'; imageSource: 'qrc:/assets/intercity.png' }
            TpImageButton { title: 'ثبت نام راننده'; imageSource: 'qrc:/assets/become-a-driver.png' }
            // TpImageButton { title: ''; imageSource: '' }



        }

        Item { Layout.fillHeight: true }

    }

}
