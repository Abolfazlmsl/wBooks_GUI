import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "./../../../Functions/Funcs.js" as Functions

Rectangle {

    property int amount: 100000
    property bool isClick: false

    signal btnClicked()

    width: 420
    height: 50
    color: color1
    border.color: "#d8d9d7"
    radius: 20

    RowLayout{
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        spacing: 0
        Item{Layout.preferredWidth: 15}

        Label{
            id: txt
            Layout.preferredWidth: contentWidth
            Layout.fillHeight: true
            text: Functions.numberWithCommas(amount) + " تومان"
            font.family: setting.activeNumFont
            font.pixelSize: 15 //* widthRatio
            horizontalAlignment: Text.AlignLeft
            LayoutMirroring.enabled: true
            verticalAlignment: Qt.AlignVCenter
            color: (isClick) ? "#d43460":"#14a085"
        }

        Item{Layout.fillWidth: true}

        Rectangle{
            Layout.preferredWidth: 150
            Layout.fillHeight: true
            color: "#14a085"
            radius: 20
            Label{
                anchors.centerIn: parent
                text: "انتخاب"
                font.family: setting.activeNumFont
                font.pixelSize: 15 //* widthRatio
                color: "#ffffff"
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    btnClicked()
                }
            }
        }
    }

}
