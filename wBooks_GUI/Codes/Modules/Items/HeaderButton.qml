import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle{

    property alias icon: rightMenu_DashboardIcon.text
    property alias text: rightMenu_DashboardLabel.text
    property string iconFont: webfont.name

    property bool isClick: false

    property real iconWidth: rightMenu_DashboardIcon.width + (24 * ratio)

    property bool iconAsImage: false
    property alias imgIcon: iconTxt.source
    property int imageSize: 20
    property bool flip: false
    property int iconRotation: 0
    property string iconColor: color15

    signal btnClicked

    color: "transparent"
    Layout.fillHeight: true
    Layout.preferredWidth: (iconAsImage)?
                               5 + rightMenu_DashboardLabel.contentWidth + iconImage.width:
                               5 + rightMenu_DashboardLabel.contentWidth + rightMenu_DashboardIcon.contentWidth

    //-- Dashboard Label --//
    Label{
        id: rightMenu_DashboardLabel
        anchors.verticalCenter: parent.verticalCenter
        width: Text.width
        text: "عنوان"
        minimumPointSize: 10
        font.family: setting.activeFont
        fontSizeMode: Text.Fit
        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
        font.bold: isClick

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
        color: (isClick) ? "#ffffff":iconColor
        visible: !iconAsImage

        font.family: iconFont
        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2 * ratio

    }

    Rectangle{
        id: iconImage
        anchors.left: spacer.right
        anchors.verticalCenter: parent.verticalCenter
        width: imageSize
        height: parent.height
        rotation: iconRotation
        visible: iconAsImage
        color: "transparent"
        Image{
            id: iconTxt
            anchors.fill: parent
            source: ""
            mipmap: true
            fillMode: Image.PreserveAspectFit
//            transform: Matrix4x4 {
//                  matrix: (flip)?Qt.matrix4x4( -1, 0, 0, iconTxt.width, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1):""
//                }
            mirror: flip
            visible: false
        }
        ColorOverlay {
            anchors.fill: iconTxt
            source: iconTxt
            color: (isClick) ? "#ffffff":iconColor
        }
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
