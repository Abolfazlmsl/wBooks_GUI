import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../Fonts/Icon.js" as Icons

Rectangle{
    id: iconReturn
    property bool isHover: false
    property int borderWidth: 0
    property int btnRadius: 10
    property string borderColor: "#000000"
    property string backgroundColor: "#000000"
    property alias btnIcon: icon.text
    property alias btnText: icon2.text
    property string textColor: "#000000"

    signal btnClicked()

    Behavior on width {
        NumberAnimation{duration: 300}
    }

    radius: btnRadius
    border.width: borderWidth
    border.color: borderColor
    color: backgroundColor
    Label{
        id: icon
        anchors.fill: parent
        visible: !iconReturn.isHover
        text: ""
        font.family: webfont.name
        font.pixelSize: Qt.application.font.pixelSize * 2
        color: color4
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }
    Label{
        id: icon2
        anchors.fill: parent
        visible: iconReturn.isHover
        text: ""
        font.family: setting.activeFont
        font.pixelSize: Qt.application.font.pixelSize*1.5
        color: color4
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
        onClicked: {
            btnClicked()
        }
        onEntered: {
            iconReturn.width = 100
            iconReturn.isHover = true
        }
        onExited: {
            iconReturn.width = 50
            iconReturn.isHover = false
        }
    }
}
