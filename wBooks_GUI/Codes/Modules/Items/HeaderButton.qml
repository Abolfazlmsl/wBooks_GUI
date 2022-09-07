import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

import "./../../../Fonts/Icon.js" as Icons

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
    property bool closeIconVis: false

    signal btnClicked
    signal closeBtnClicked

    color: "transparent"
    Layout.fillHeight: true
    Layout.preferredWidth: (iconAsImage)?
                               (closeIconVis)?
                                   5 + rightMenu_DashboardLabel.contentWidth + iconImage.width + 5 + closeIcon.contentWidth:
                                   5 + rightMenu_DashboardLabel.contentWidth + iconImage.width:
                                   (closeIconVis)?
                                       5 + rightMenu_DashboardLabel.contentWidth + rightMenu_DashboardIcon.contentWidth + 5 + closeIcon.contentWidth:
                                       5 + rightMenu_DashboardLabel.contentWidth + rightMenu_DashboardIcon.contentWidth


    //-- on Click Dashboard --//
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        propagateComposedEvents: true

        RowLayout{
            anchors.fill: parent
            spacing: 0

            Label{
                id:closeIcon
                verticalAlignment: Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.preferredWidth: contentWidth
                color: "#ffffff"
                visible: closeIconVis
                text: Icons.close
                font.family: webfont.name
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        closeBtnClicked()
                    }
                }
            }

            //-- spacer --//
            Rectangle{
                id: spacer2
                Layout.fillHeight: true
                Layout.preferredWidth: 5
                color: "transparent"
                visible: closeIconVis
            }

            //-- Dashboard Label --//
            Label{
                id: rightMenu_DashboardLabel
                verticalAlignment: Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.preferredWidth: contentWidth
                text: "عنوان"
                minimumPointSize: 10
                font.family: setting.activeFont
//                fontSizeMode: Text.Fit
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                font.bold: isClick
                color: "#ffffff"
                clip: true
            }

            //-- spacer --//
            Rectangle{
                id: spacer
                Layout.fillHeight: true
                Layout.preferredWidth: 5

                color: "transparent"
            }

            Label{
                id:rightMenu_DashboardIcon
                verticalAlignment: Qt.AlignVCenter
                Layout.fillHeight: true
                Layout.preferredWidth: contentWidth
                color: (isClick) ? "#ffffff":iconColor
                visible: !iconAsImage

                font.family: iconFont
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2 * ratio

            }

            Rectangle{
                id: iconImage
                Layout.fillHeight: true
                Layout.preferredWidth: imageSize
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
        }

        onClicked: {
            btnClicked()
        }

        Rectangle{
            width: parent.width
            height: 2
            color: "#d43460"
            anchors.bottom: parent.bottom
            visible: isClick
        }
    }
}
