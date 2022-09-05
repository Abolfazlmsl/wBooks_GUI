import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Functions/Funcs.js" as Functions

Rectangle{
    id: itemRec
    width: 130
    height: 320
    color: "transparent"

    property alias imageSource: img.source
    property alias text1: txt2.text
    property alias text2: txt3.text
    property string price: ""
    property string rate: "1"
    property alias date: dateTxt.text
    property string fileType: "Document"

    Rectangle{
        id: iconRec
        width: parent.width
        height: parent.height * 0.6

        color: color8
        Image {
            id: img
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 8
            source: ""
            mipmap: true
            Rectangle{
                anchors.left: parent.left
                anchors.top: parent.top
                width: 25
                height: width
                radius: width/2
                color: "#90990000"
                Label{
                    id: typeIcon
                    anchors.fill: parent
                    text: if (fileType === "Document"){
                              return Icons.file_document_box
                          }else if (fileType === "Audio"){
                              return Icons.headphones
                          }else if (fileType === "Video"){
                              return Icons.video
                          }
                    font.family: webfont.name
                    color: "#ffffff"
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize*1.5
                }
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if (fileType === "Document"){
                        mainPage.state = "Book Page"
                    }else if (fileType === "Audio"){
                        mainPage.state = "Audio Book Page"
                    }
                }
            }
        }
    }

    Rectangle{
        id: title2Rec
        width: parent.width
        height: parent.height * 0.075
        anchors.top: iconRec.bottom
        color: "transparent"
        Label{
            id: txt2
            anchors.fill: parent
            text: ""
            font.family: setting.activeFont
            color: color4
            verticalAlignment: Qt.AlignVCenter
        }
    }

    Rectangle{
        id: titlePrice
        width: parent.width
        height: parent.height * 0.075
        anchors.top: title2Rec.bottom
        color: "transparent"
        Label{
            id: txtPrice
            anchors.fill: parent
            text: (price === "0") ? "رایگان" : Functions.numberWithCommas(price) + " تومان"
            font.family: setting.activeNumFont
            color: color4
            verticalAlignment: Qt.AlignVCenter
        }
    }

    Rectangle{
        id: title3Rec
        width: parent.width
        height: parent.height * 0.05
        anchors.top: titlePrice.bottom
        color: "transparent"
        Label{
            id: txt3
            anchors.fill: parent
            text: ""
            font.family: setting.activeFont
            color: color9
            verticalAlignment: Qt.AlignVCenter
            font.pixelSize: Qt.application.font.pixelSize
        }
    }

    Item{
        id: rating
        width: parent.width
        height: parent.height * 0.1
        anchors.top: title3Rec.bottom
        RowLayout{
            anchors.fill: parent
            layoutDirection: Qt.RightToLeft

            Rectangle{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.7
                color: "transparent"
                Rating{
                    anchors.fill: parent
                    //                                anchors.right: parent.right

                    selectable: true

                }
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"
                Label{
                    anchors.fill: parent
                    text: "(" + rate + " رای)"
                    font.family: setting.activeNumFont
                    color: color9
                    verticalAlignment: Qt.AlignVCenter
                    font.pixelSize: Qt.application.font.pixelSize * 0.7
                    elide: Text.ElideRight
                }
            }
        }
    }

    Item{
        id: purchaseItem
        width: parent.width
        height: parent.height * 0.1
        anchors.top: rating.bottom
        RowLayout{
            anchors.fill: parent
            layoutDirection: Qt.RightToLeft

            //-- Button purchase --//
            ButtonShadow{
                id: purchase
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.5
                btnText: "مشاهده کتاب"
                textColor: color3
                fontSize: 1
                btnRadius: 0
                btnColor: color8
                onDashboard_btnClicked: {
                    if (fileType === "Document"){
                        mainPage.state = "Book Page"
                    }else if (fileType === "Audio"){
                        mainPage.state = "Audio Book Page"
                    }
                }
            }

            Rectangle{
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"
                Label{
                    id: txt4
                    width: parent.width
                    height: parent.height / 2
                    text: "تاریخ انتشار"
                    font.family: setting.activeFont
                    color: color9
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize
                }

                Rectangle{
                    id: recspacer
                    width: parent.width
                    anchors.top: txt4.bottom
                    height: 3
                    color: "transparent"
                }

                Label{
                    id: dateTxt
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: recspacer.bottom
                    text: ""
                    font.family: setting.activeNumFont
                    color: color9
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize
                }
            }
        }
    }
}

