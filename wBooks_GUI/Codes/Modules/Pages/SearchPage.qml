import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Functions/Funcs.js" as Functions

import "./../Items"
import "./../MainModules/SearchModule"

Rectangle {
    color: "transparent"
    property var itemModel: []

    property int currentPage: 0

    property int columnItemCount: Math.floor((flick.width-120)/190)
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
        id: searchAnim
        NumberAnimation { target: flick; property: "contentY"; to: 350; duration: 300 }
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.rightMargin: 50
        anchors.leftMargin: 50
        spacing: 0

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: 45 * ratio
            Layout.rightMargin: 150
            Layout.leftMargin: 150
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                spacing: 0
                M_inputText{
                    id: input_phone
                    Layout.fillWidth: true
                    Layout.rightMargin: 0
                    label: "جستجو بر اساس کتاب، ناشر، نویسنده و ..."
                    icon: Icons.magnify
                    placeholder: "جستجو بر اساس کتاب، ناشر، نویسنده و ..."
                    inputText.text: ""
                    bgColor: color1
                    borderColor: color1

                }

                Item{Layout.preferredWidth: 15}

                ButtonShadow{
                    Layout.fillHeight: true
                    Layout.preferredWidth: 100
                    btnText: "جستجو"
                    textColor: "#ffffff"
                    btnRadius: 10
                    btnColor: "#d43460"
                    shadowColor: "#d43460"
                    onDashboard_btnClicked: {

                    }
                }
            }
        }


        Item{
            Layout.preferredHeight: 20
        }

        Flickable{
            id: flick
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.rightMargin: 150
            Layout.leftMargin: 150
            contentHeight: homeItem.height - 20 - input_phone.height
            contentWidth: parent.width - 300
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

                    ListView{
                        visible: false
                        Layout.fillWidth: true
                        Layout.preferredHeight: 20 + searchModelTop.count*25
                        Layout.rightMargin: 50
                        spacing: 10
                        clip: true
                        model: (searchModelTop.count<7) ? searchModelTop.count:7
                        header: Rectangle{
                            id: header
                            width: headertxt.contentWidth
                            height: headertxt.contentHeight
                            anchors.right: parent.right
                            color: "transparent"
                            Label{
                                id: headertxt
                                anchors.fill: parent
                                text: "نتایج جستجو به دنبال: سلام"
                                font.family: setting.activeFont
                                color: color2
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                            }
                        }
                        delegate: Rectangle{
                            width: txt.contentWidth + icon.contentWidth
                            height: txt.contentHeight
                            anchors.right: parent.right
                            color: "transparent"
                            Label{
                                id: icon
                                text: Icons.chevron_left
                                font.family: webfont.name
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio
                                color: color9
                            }
                            Label{
                                id: txt
                                text: searchModelTop.get(index).text
                                anchors.left: icon.right
                                font.family: setting.activeNumFont
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio
                                color: color9
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
                            }
                        }
                    }

                    SearchTopItem{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 300
                        visible: true
                    }

                    Item{Layout.preferredHeight: 20}

                    Rectangle{
                        Layout.preferredHeight: 1
                        Layout.fillWidth: true
                        Layout.rightMargin: 50
                        Layout.leftMargin: 50
                        color: color1
                    }

                    Item{Layout.preferredHeight: 20}

                    Rectangle{
                        id: result
                        Layout.fillWidth: true
                        Layout.preferredHeight: resulttxt.contentHeight
                        color: "transparent"
                        Label{
                            id: resulttxt
                            anchors.fill: parent
                            text: "تعداد نتایج جستجو: " + itemModel.count
                            font.family: setting.activeNumFont
                            color: color2
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                        }
                    }

                    Item{Layout.preferredHeight: 20}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        visible: (itemModel.count===0) ? true:false
                        color: color1

                        Label{
                            anchors.fill: parent
                            text: "موردی برای نمایش موجود نیست"
                            font.family: setting.activeFont
                            color: color9
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                        }
                    }

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
                        visible: (itemModel.count===0) ? true:false
                        color: "transparent"
                    }

                    GridView{
                        id: lview
                        Layout.fillWidth: true
                        Layout.preferredHeight: rowItemCount * cellHeight + 20
                        Layout.rightMargin: 70
                        Layout.leftMargin: 50
                        clip: true
                        focus: true
                        cellWidth: 190
                        cellHeight: 380
                        interactive: true
                        layoutDirection: Qt.RightToLeft
                        model: (itemModel.count >= (currentPage+1)*pageItemCount) ? pageItemCount:itemModel.count-currentPage*pageItemCount
                        visible: (itemModel.count===0) ? false:true

                        delegate: Rectangle{
                            id: itemRec
                            width: 140
                            height: 330
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
                                    text:itemModel.get(index+currentPage*pageItemCount).text1
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
                                            text: "(" + itemModel.get(index+currentPage*pageItemCount).rate + " رای)"
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
                                            text: itemModel.get(index+currentPage*pageItemCount).date
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
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3.5
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
                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
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
                                                searchAnim.restart()
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
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3.5
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
                }
            }
        }
    }
}
