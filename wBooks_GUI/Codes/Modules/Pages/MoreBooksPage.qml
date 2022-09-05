import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Functions/Funcs.js" as Functions

import "./../MainModules/Ui_Module"
import "./../Items"

Item {
    id: more_item
    property alias title: titletxt.text
    property var itemModel: []

    property int currentPage: 0

    property int columnItemCount: Math.floor((flick.width)/190)
    property int maxInPage: columnItemCount * 5
    property int rowItemCount: if ((itemModel.count-currentPage*maxInPage) >= maxInPage){
                                   return 5
                               }else{
                                   return (Math.floor((itemModel.count-currentPage*maxInPage)/columnItemCount) + 1)
                               }

    property int pageItemCount: columnItemCount * rowItemCount

    property int maxPages: if (Math.floor(itemModel.count / maxInPage) === (itemModel.count / maxInPage)){
                               return Math.floor(itemModel.count / maxInPage)
                           }else{
                               return Math.floor(itemModel.count / maxInPage) + 1
                           }

    ParallelAnimation {
        id: moreBookAnim
        NumberAnimation { target: flick; property: "contentY"; to: 0; duration: 300 }
    }

    Flickable{
        id: flick
        anchors.fill: parent
        contentHeight: homeItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}
        clip: true

        Item{
            id: homeItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0

                Item{Layout.preferredHeight: 30}

                Label{
                    id: titletxt
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
//                    anchors.right: parent.right
                    Layout.rightMargin: 70
                    text: "برترین کتاب های ماه"
                    font.family: setting.activeFont
                    color: color2

                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    LayoutMirroring.enabled: true
                }

                Item{Layout.preferredHeight: 30}

                GridView{
                    id: lview
                    Layout.fillWidth: true
                    Layout.preferredHeight:  rowItemCount * cellHeight + 20
//                    anchors.top: titletxt.bottom
//                    anchors.topMargin: 30
//                    anchors.right: parent.right
                    clip: true
                    focus: true
                    cellWidth: 190
                    cellHeight: 380
                    interactive: true
                    layoutDirection: Qt.RightToLeft
                    model: (itemModel.count >= (currentPage+1)*pageItemCount) ? pageItemCount:itemModel.count-currentPage*pageItemCount
        //            footer: Footer{
        //                id: footer
        //                width: parent.width
        //                height: 270
        //            }
                    ScrollBar.vertical: ScrollBar {}

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
                                source: itemModel.get(index+currentPage*pageItemCount).source
                                mipmap: true
                                //                        sourceSize.width: width /2
                                //                        sourceSize.height: height
                                //                        fillMode: Image.PreserveAspectFit
                                Canvas{
                                    anchors.fill:parent
                                    property string nameFont: setting.activeNumFont

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
                                        context.fillText("رتبه " + (index+currentPage*pageItemCount+1), centerX, centerY)
                                        context.restore()

                                    }
        //                            Label{
        //                                id: text1
        //                                anchors.fill: parent
        //                                text: "رتبه " + (index+1)
        //                                font.family: setting.activeNumFont
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
                            height: parent.height * 0.075
                            anchors.top: iconRec.bottom
                            color: "transparent"
                            Label{
                                id: txt2
                                anchors.fill: parent
                                text: itemModel.get(index+currentPage*pageItemCount).text1
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
                                text: (itemModel.get(index).price === "0") ? "رایگان" : Functions.numberWithCommas(itemModel.get(index).price) + " تومان"
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
                                text: itemModel.get(index+currentPage*pageItemCount).text2
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
                                        text: "(" + itemModel.get(index+currentPage*pageItemCount).rate + " رای)"
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
                                    btnText: "خرید کتاب"
                                    textColor: color3
                                    fontSize: 1
                                    btnRadius: 0
                                    btnColor: color8
                                    onDashboard_btnClicked: {

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
                                        width: parent.width
                                        height: parent.height / 2
                                        anchors.top: recspacer.bottom
                                        text: itemModel.get(index+currentPage*pageItemCount).date
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
                }

                Item{Layout.preferredHeight: 30}

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    Layout.rightMargin: 70
                    Layout.leftMargin: 50
                    visible: (itemModel.count===0) ? false:true
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        Item{Layout.fillWidth: true}
                        Rectangle{
                            Layout.preferredWidth: icon2.contentWidth
                            Layout.fillHeight: true
                            enabled: (currentPage===0)?false:true
                            color: "transparent"
                            Label{
                                id: icon2
                                text: Icons.chevron_left
                                font.family: webfont.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * 3.5
                                color: (currentPage===0)?color9:color2
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    currentPage -= 1
                                    nView.decrementCurrentIndex()
                                    searchAnim.restart()
                                }
                            }
                        }
                        ListView{
                            id: nView
                            Layout.fillHeight: true
                            Layout.preferredWidth: 50 * 5
                            spacing: 10
                            clip: true
                            orientation: ListView.Horizontal
                            interactive: true
                            model: maxPages
                            delegate: Rectangle{
                                width: 40
                                height: 40
                                radius: 8
                                color: (index===currentPage) ? color8:"transparent"
                                Label{
                                    anchors.fill: parent
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    text: index+1
                                    font.family: setting.activeNumFont
                                    color: color2
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        if (currentPage !== index){
                                            nView.currentIndex = index
                                            currentPage = index
                                            moreBookAnim.restart()
                                        }
                                    }
                                }
                            }
                        }
                        Rectangle{
                            Layout.preferredWidth: icon3.contentWidth
                            Layout.fillHeight: true
                            enabled: (currentPage===maxPages-1)?false:true
                            color: "transparent"
                            Label{
                                id: icon3
                                text: Icons.chevron_right
                                font.family: webfont.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * 3.5
                                color: (currentPage===maxPages-1)?color9:color2
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    currentPage += 1
                                    nView.incrementCurrentIndex()
                                    searchAnim.restart()
                                }
                            }
                        }
                        Item{Layout.fillWidth: true}
                    }
                }

                Item{Layout.preferredHeight: 30}

                Footer{
                    id: footer
                    Layout.fillWidth: true
                    Layout.preferredHeight: 270
                }
            }
        }
    }
}
