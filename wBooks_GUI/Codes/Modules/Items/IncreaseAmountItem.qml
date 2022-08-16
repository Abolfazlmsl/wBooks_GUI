import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "./../../../Functions/Funcs.js" as Functions

Rectangle {

    property int amount: 100000
    property bool isClick: false

    signal btnClicked()

    width: 200
    height: 100
    color: (isClick) ? "#25B767":color1
    border.color: "#F7F5F5"
    radius: 20

    Label{
        id: txt
        anchors.fill: parent
        text: Functions.numberWithCommas(amount) + " تومان"
        font.family: mainFaNumFont.name
        font.pixelSize: 23 //* widthRatio
        font.bold: true
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter
        color: color4
    }

    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            btnClicked()
        }
    }

}
