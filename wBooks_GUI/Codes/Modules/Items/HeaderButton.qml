import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle{

    property alias icon: rightMenu_DashboardIcon.text
    property alias text: rightMenu_DashboardLabel.text
    property string iconFont: webfont.name

    property bool isClick: false
    property string itemColor: color15

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
        font.family: mainFont.name
        fontSizeMode: Text.Fit
        font.pixelSize: Qt.application.font.pixelSize * 1.3 * ratio

        color: "#ffffff"
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
        color: color15

        font.family: iconFont
        font.pixelSize: Qt.application.font.pixelSize * 2 * ratio

    }

    //-- on Click Dashboard --//
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
//            isClick = !isClick
            btnClicked()
        }
    }

    Rectangle{
        width: parent.width
        height: 2
        color: "#d43460"
        anchors.bottom: parent.bottom
        visible: isClick
    }
}
