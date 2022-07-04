import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

import "./../MainModules"

Item {
    id: more_item
    property alias title: titletxt.text
    property alias itemModel: lview.model

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Label{
            id: titletxt
            width: parent.width
            height: 50
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.05
            text: "برترین کتاب های ماه"
            font.family: iranSans.name
            color: color2

            font.pixelSize: Qt.application.font.pixelSize * 1.7
            verticalAlignment: Qt.AlignVCenter
            elide: Text.ElideRight
        }

        GridView{
            id: lview
            width: parent.width
            height: parent.height - titletxt.height
            anchors.top: titletxt.bottom
            anchors.topMargin: 30
            anchors.right: parent.right
            clip: true
            focus: true
            cellWidth: 170
            cellHeight: 250
            interactive: true
            layoutDirection: Qt.RightToLeft
            model: itemModel
            footer: Footer{
                id: footer
                width: parent.width
                height: 270
            }
            ScrollBar.vertical: ScrollBar {}

            delegate: Rectangle{
                id: itemRec
                width: 130
                height: 220
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
                        source: model.source
                        mipmap: true
                        //                        sourceSize.width: width /2
                        //                        sourceSize.height: height
                        //                        fillMode: Image.PreserveAspectFit
                        Canvas{
                            anchors.fill:parent
                            property string nameFont: iranSansFAnum.name

                            onPaint:{
                                var context = getContext("2d")

                                // the triangle
                                context.beginPath()
                                context.moveTo(parent.width * 0.6, 3 * parent.height / 20)
                                context.lineTo(parent.width, 3 * parent.height / 20)
                                context.lineTo(parent.width, 3 * parent.height / 20+parent.height * 0.15)
                                context.lineTo(parent.width* 0.6 + 10, 3 * parent.height / 20+parent.height * 0.15)
                                context.closePath()

                                // the fill color
                                context.fillStyle = "#90990000"
                                context.fill()
                                context.font='12px ' + nameFont
                                context.textAlign = "center";
                                context.fillStyle="#ffffff"
                                var centerX = parent.width * 0.8;
                                var centerY = 3*parent.height / 20+parent.height * 0.08;
                                context.save()
                                context.fillText("رتبه " + (index+1), centerX, centerY)
                                context.restore()

                            }
//                            Label{
//                                id: text1
//                                anchors.fill: parent
//                                text: "رتبه " + (index+1)
//                                font.family: iranSansFAnum.name
//                                color: "#ffffff"
//                                verticalAlignment: Qt.AlignVCenter
//                                horizontalAlignment: Qt.AlignHCenter
//                                font.pixelSize: Qt.application.font.pixelSize
//                            }
                        }
                    }
                }

                Rectangle{
                    id: title2Rec
                    width: parent.width
                    height: parent.height * 0.1
                    anchors.top: iconRec.bottom
                    color: "transparent"
                    Label{
                        id: txt2
                        anchors.fill: parent
                        text: model.text1
                        font.family: iranSans.name
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
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
                        text: model.text2
                        font.family: iranSans.name
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
                                text: "(" + model.rate + " رای)"
                                font.family: iranSansFAnum.name
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
                        Rectangle{
                            id: purchase
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.5

                            color: color8

                            Label{
                                anchors.centerIn: parent
                                anchors.margins: 5
                                text: "خرید کتاب"
                                font.family: iranSans.name
                                font.pixelSize: Qt.application.font.pixelSize * 1
                                color: color3
                            }

                            MouseArea{
                                id: btn_purchase
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor

                                onClicked: {

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
                                font.family: iranSans.name
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
                                width: parent.width
                                height: parent.height / 2
                                anchors.top: recspacer.bottom
                                text: model.date
                                font.family: iranSansFAnum.name
                                color: color9
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize
                            }
                        }
                    }
                }
            }

        }
    }
}
