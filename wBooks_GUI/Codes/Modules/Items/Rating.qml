import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons

Item {

    property int selectedRate: 0
    property bool selectable: true
    property double scale: 1.5

//    Rectangle{
//        width: parent.width
//        height: 2
//        color: color19
//        anchors.top: parent.top

//        visible: selectable
//    }

    RowLayout{
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        spacing: 0

//        Item {
//            Layout.fillWidth: true
//            visible: selectable
//        }

        //-- 1 star --//
        Label{
            id: star1
            property bool isclicked: false
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
//            Layout.leftMargin: 20 * ratio
            Layout.alignment: Qt.AlignVCenter
            text: Icons.star_outline
            font.family: webfont.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * scale
            color: (isclicked) ? color10:color9

            MouseArea{
                anchors.fill: parent
                cursorShape: (selectable) ? Qt.PointingHandCursor : Qt.ArrowCursor

                enabled: selectable

                onClicked: {
                    star1.isclicked = true
                    star2.isclicked = false
                    star3.isclicked = false
                    star4.isclicked = false
                    star5.isclicked = false
                    star1.text = Icons.star
                    star2.text = Icons.star_outline
                    star3.text = Icons.star_outline
                    star4.text = Icons.star_outline
                    star5.text = Icons.star_outline
                    selectedRate = 1
                }
            }

        }

        //-- 2 star --//
        Label{
            id: star2
            property bool isclicked: false
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
            Layout.alignment: Qt.AlignVCenter
            text: Icons.star_outline
            font.family: webfont.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * scale
            color:(isclicked) ? color10:color9

            MouseArea{
                anchors.fill: parent
                cursorShape: (selectable) ? Qt.PointingHandCursor : Qt.ArrowCursor

                 enabled: selectable

                onClicked: {
                    star1.isclicked = true
                    star2.isclicked = true
                    star3.isclicked = false
                    star4.isclicked = false
                    star5.isclicked = false
                    star1.text = Icons.star
                    star2.text = Icons.star
                    star3.text = Icons.star_outline
                    star4.text = Icons.star_outline
                    star5.text = Icons.star_outline
                    selectedRate = 2
                }
            }

        }

        //-- 3 star --//
        Label{
            id: star3
            property bool isclicked: false
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
            Layout.alignment: Qt.AlignVCenter
            text: Icons.star_outline
            font.family: webfont.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * scale
            color: (isclicked) ? color10:color9

            MouseArea{
                anchors.fill: parent
                cursorShape: (selectable) ? Qt.PointingHandCursor : Qt.ArrowCursor

                 enabled: selectable

                onClicked: {
                    star1.isclicked = true
                    star2.isclicked = true
                    star3.isclicked = true
                    star4.isclicked = false
                    star5.isclicked = false
                    star1.text = Icons.star
                    star2.text = Icons.star
                    star3.text = Icons.star
                    star4.text = Icons.star_outline
                    star5.text = Icons.star_outline
                    selectedRate = 3
                }
            }

        }

        //-- 4 star --//
        Label{
            id: star4
            property bool isclicked: false
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
            Layout.alignment: Qt.AlignVCenter
            text: Icons.star_outline
            font.family: webfont.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * scale
            color: (isclicked) ? color10:color9

            MouseArea{
                anchors.fill: parent
                cursorShape: (selectable) ? Qt.PointingHandCursor : Qt.ArrowCursor

                 enabled: selectable

                onClicked: {
                    star1.isclicked = true
                    star2.isclicked = true
                    star3.isclicked = true
                    star4.isclicked = true
                    star5.isclicked = false
                    star1.text = Icons.star
                    star2.text = Icons.star
                    star3.text = Icons.star
                    star4.text = Icons.star
                    star5.text = Icons.star_outline
                    selectedRate = 4
                }
            }

        }

        //-- 5 star --//
        Label{
            id: star5
            property bool isclicked: false
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
            Layout.alignment: Qt.AlignVCenter
            text: Icons.star_outline
            font.family: webfont.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * scale
            color: (isclicked) ? color10:color9

            MouseArea{
                anchors.fill: parent
                cursorShape: (selectable) ? Qt.PointingHandCursor : Qt.ArrowCursor

                 enabled: selectable

                onClicked: {
                    star1.isclicked = true
                    star2.isclicked = true
                    star3.isclicked = true
                    star4.isclicked = true
                    star5.isclicked = true
                    star1.text = Icons.star
                    star2.text = Icons.star
                    star3.text = Icons.star
                    star4.text = Icons.star
                    star5.text = Icons.star
                    selectedRate = 5
                }
            }

        }

        Rectangle{
            Layout.preferredWidth: 2
            Layout.preferredHeight: parent.height - (parent.height * 0.2)
            Layout.leftMargin: 20 * ratio
            color: color19

            visible: !selectable
        }

        //-- Average Rate --//
        Label{
            id: lbl_AverageRate
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
            Layout.leftMargin: 20 * ratio
            Layout.alignment: Qt.AlignVCenter

            visible: !selectable

            text: selectedRate
            font.family: segoeUI.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
            font.bold: true
            color: color20
        }

        //-- Averages star --//
        Label{
            Layout.preferredWidth: implicitWidth
            Layout.preferredHeight: implicitHeight
            Layout.leftMargin: 10 * ratio
            Layout.alignment: Qt.AlignVCenter

            visible: !selectable

            text: Icons.star
            font.family: webfont.name
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.8
            color: color20
        }

        Item {
            Layout.fillWidth: true
            visible: !selectable
        }

    }

}
