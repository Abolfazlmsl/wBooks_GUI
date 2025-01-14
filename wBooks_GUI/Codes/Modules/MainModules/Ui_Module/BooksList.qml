import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

import "./../../Items"

Item {
    id: list_item
    property alias title: titletxt.text
    property string fileType: "Document"
    property var itemModel: []

    signal moreBtnClicked()

    RowLayout{
        anchors.fill: parent
        anchors.rightMargin: parent.width * 0.05
        anchors.leftMargin: parent.width * 0.05
        layoutDirection: Qt.RightToLeft
        spacing: 0

        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.05
            Layout.topMargin: titleItem.height
            color: "transparent"
            Label{
                anchors.fill: parent
                font.family: webfont.name
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3
                text: Icons.chevron_right
                color: color4
            }
            MouseArea{
                id: rightChevron
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                SmoothedAnimation {
                    target: lview
                    property: "contentX"
                    running: rightChevron.pressed
                    velocity: 1000
                    to: -lview.width
                }
            }
        }

        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.9
            color: "transparent"
            clip: true
            //        anchors.rightMargin: 15
            Item{
                id: titleItem
                width: parent.width
                height: 70
                anchors.right: parent.right
                RowLayout{
                    anchors.fill: parent
                    layoutDirection: Qt.RightToLeft
                    Label{
                        id: titletxt
                        Layout.preferredWidth: titletxt.contentWidth + 20
                        Layout.fillHeight: true
                        text: ""
                        font.family: setting.activeFont
                        color: color4
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.7
                        verticalAlignment: Qt.AlignVCenter
                    }

                    Label{
                        id: moretxt
                        Layout.preferredWidth: moretxt.contentWidth
                        Layout.fillHeight: true
                        font.family: setting.activeFont
                        color: color2
                        text: "(مشاهده بیشتر)"
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.7
                        verticalAlignment: Qt.AlignVCenter
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                moreBtnClicked()

                            }
                        }
                    }

                    Item{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }

            ListView{
                id: lview
                width: parent.width
                height: parent.height - titleItem.height
                anchors.top: titleItem.bottom
                anchors.right: parent.right
                clip: true
                focus: true
                cacheBuffer: 1000
                spacing: 50
                interactive: true
                layoutDirection: Qt.RightToLeft
                orientation: ListView.Horizontal
                model: (itemModel.count > 10) ? 10:itemModel.count

                delegate: Rectangle{
                    id: itemRec
                    width: 130
                    height: 320
                    color: "transparent"
                    Rectangle{
                        id: iconRec
                        width: parent.width
                        height: parent.height * 0.6

                        color: color8
                        Image {
                            anchors.fill: parent
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 8
                            source: itemModel.get(index).source
                            mipmap: true
                            //                        sourceSize.width: width /2
                            //                        sourceSize.height: height
                            //                        fillMode: Image.PreserveAspectFit

                            //                        Rectangle{

                            //                        }

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
                                          }else if (fileType === "Document"){
                                              return Icons.video
                                          }
                                    font.family: webfont.name
                                    color: "#ffffff"
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio*1.5
                                }
                            }

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    if (fileType === "Document"){
                                        commander.changePage(mainPage.state)
                                        mainPage.state = "Book Page"
                                    }else if (fileType === "Audio"){
                                        commander.changePage(mainPage.state)
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
                            text: itemModel.get(index).text1
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
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
                            text: (itemModel.get(index).price === "0") ? "رایگان" : Functions.numberWithCommas(itemModel.get(index).price) + " تومان"
                            font.family: setting.activeNumFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
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
                            text: itemModel.get(index).text2
                            font.family: setting.activeFont
                            color: color9
                            verticalAlignment: Qt.AlignVCenter
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio
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
                                    text: "(" + itemModel.get(index).rate + " رای)"
                                    font.family: setting.activeNumFont
                                    color: color9
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 0.7
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
                                btnText: "خرید کتاب"
                                textColor: color3
                                fontSize: 1
                                btnRadius: 0
                                btnColor: color8
                                onDashboard_btnClicked: {
                                    if (fileType === "Document"){
                                        commander.changePage(mainPage.state)
                                        mainPage.state = "Book Page"
                                    }else if (fileType === "Audio"){
                                        commander.changePage(mainPage.state)
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
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio
                                }

                                Rectangle{
                                    id: recspacer
                                    width: parent.width
                                    anchors.top: txt4.bottom
                                    height: 3
                                    color: "transparent"
                                }

                                Label{
                                    width: parent.width
                                    height: parent.height / 2
                                    anchors.top: recspacer.bottom
                                    text: itemModel.get(index).date
                                    font.family: setting.activeNumFont
                                    color: color9
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio
                                }
                            }
                        }
                    }
                }

            }

        }
        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.05
            Layout.topMargin: titleItem.height
            color: "transparent"
            Label{
                anchors.fill: parent
                font.family: webfont.name
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                text: Icons.chevron_left
                color: color4

            }
            MouseArea{
                id: leftChevron
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                SmoothedAnimation {
                    target: lview
                    property: "contentX"
                    running: leftChevron.pressed
                    velocity: 1000
                    to: -lview.contentWidth
                }

            }
        }
    }

}
