import QtQuick 2.14
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle{

    property alias icon: rightMenu_DashboardIcon.text
    property alias text: rightMenu_DashboardLabel.text

    property bool isClick: false
    property string itemColor: "#a9a9a9"

    property real iconWidth: rightMenu_DashboardIcon.width + (24 * ratio)

    signal btnClicked

    color: "transparent"
    Layout.fillHeight: true
    Layout.preferredWidth: 5 + rightMenu_DashboardLabel.contentWidth + rightMenu_DashboardIcon.contentWidth

    //-- Dashboard Label --//
    Label{
        id: rightMenu_DashboardLabel
        anchors.verticalCenter: parent.verticalCenter
        width: Text.width
        text: "عنوان"
        minimumPointSize: 10
        font.family: iranSans.name
        fontSizeMode: Text.Fit
        font.pixelSize: Qt.application.font.pixelSize * 1.3

        color: (isClick) ? "white" : "#a9a9a9"
        clip: true
        elide: Text.ElideRight
    }

    //-- spacer --//
    Rectangle{
        id: spacer
        height: parent.height
        width: 5
        anchors.left: rightMenu_DashboardLabel.right

        color: "transparent"
    }

    Label{
        id:rightMenu_DashboardIcon
        anchors.left: spacer.right
        anchors.verticalCenter: parent.verticalCenter
        width: Text.width
        color: (isClick) ? "white" : "#a9a9a9"

        font.family: webfont.name
        font.pixelSize: Qt.application.font.pixelSize * 2

    }

    //-- on Click Dashboard --//
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            isClick = !isClick
            btnClicked()
        }
    }

}
