import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "./../../../Fonts/Icon.js" as Icons

Rectangle{
    id: itemRec
    width: 170
    height: 250
    color: "transparent"

    property alias imageSource: img.source
    property alias text1: txt2.text
    property alias text2: txt3.text
    property alias text3: txt4.text

    Rectangle{
        id: iconRec
        width: parent.width
        height: parent.height * 0.5

        color: color8
        Image {
            id: img
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 8
            source: ""
            mipmap: true
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    mainPage.state = "Audio Book Page"
                }
            }
        }
    }

    Rectangle{
        id: title2Rec
        width: parent.width
        height: parent.height * 0.2
        anchors.top: iconRec.bottom
        color: "transparent"
        Label{
            id: txt2
            anchors.fill: parent
            text: ""
            font.family: mainFont.name
            color: color4
            verticalAlignment: Qt.AlignVCenter
            wrapMode: Text.WordWrap
        }
    }

    Rectangle{
        id: title3Rec
        width: parent.width
        height: parent.height * 0.1
        anchors.top: title2Rec.bottom
        color: "transparent"
        Label{
            id: txt3
            anchors.fill: parent
            text: ""
            font.family: mainFont.name
            color: color9
            verticalAlignment: Qt.AlignVCenter
            font.pixelSize: Qt.application.font.pixelSize
        }
    }

    Rectangle{
        id: title4Rec
        width: parent.width
        height: parent.height * 0.1
        anchors.top: title3Rec.bottom
        color: "transparent"
        Label{
            id: txt4
            anchors.fill: parent
            text: ""
            font.family: mainFont.name
            color: color9
            verticalAlignment: Qt.AlignVCenter
            font.pixelSize: Qt.application.font.pixelSize
        }
    }

    Item{
        id: purchaseItem
        width: parent.width
        height: parent.height * 0.1
        anchors.top: title4Rec.bottom
        RowLayout{
            anchors.fill: parent
            layoutDirection: Qt.RightToLeft

            //-- Button purchase --//
            ButtonShadow{
                id: purchase
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.8
                btnText: "مشاهده کتاب"
                textColor: color3
                fontSize: 1
                btnRadius: 0
                btnColor: color8
                onDashboard_btnClicked: {
                    mainPage.state = "Audio Book Page"
                }
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"
                Label{
                    anchors.fill: parent
                    text: Icons.trash_can
                    font.family: webfont.name
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * 2
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {

                    }
                }
            }
        }
    }
}
