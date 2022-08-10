import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../Fonts/Icon.js" as Icons

Rectangle{
    property alias btnText: lbl_btn.text
    property string btnColor: color12
    property int btnRadius: 20
    property double fontSize: 1.3
    property real btn_ShadowSpread: 0.0
    property real btn_ShadowRadius: 9

    signal dashboard_btnClicked
    color: "transparent"

    radius: btnRadius

    //-- Shadow of btnPurchase --//
    DropShadow {
        anchors.fill: sendBtnInner
        transparentBorder: true
        horizontalOffset: 0
        verticalOffset: 3
        spread: btn_ShadowSpread
        radius: btn_ShadowRadius
        samples: 14
        color: addOpacity(color4, 40)
        source: sendBtnInner
    }

    Rectangle{
        id: sendBtnInner
        anchors.fill: parent

        color: btnColor

        radius: btnRadius

        //-- Title of Square --//
        Label{
            id:lbl_btn
            anchors.centerIn: parent
            text: "ارسال پیام"
            font.family: iranSans.name
            font.pixelSize: Qt.application.font.pixelSize * fontSize //* widthRatio
            font.bold: true

            color: "#ffffff"

        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: {
                btn_ShadowSpread = 0.5
                btn_ShadowRadius = 12
            }

            onExited: {
                btn_ShadowSpread = 0.0
                btn_ShadowRadius = 9
            }

            onClicked: {
                dashboard_btnClicked()
            }
        }
    }
}
