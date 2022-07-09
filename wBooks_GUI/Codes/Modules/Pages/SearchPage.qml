import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../Items"
import "./../MainModules"

Rectangle {
    color: "transparent"
    property var itemModel: []

    property int totalPages: 2000
    property int maxPages: 9
    property int currentPage: 0

    ColumnLayout{
        anchors.fill: parent
        anchors.rightMargin: 50
        anchors.leftMargin: 50
        spacing: 0

        M_inputText{
            id: input_phone
            label: "جستجو بر اساس کتاب، ناشر، نویسنده و ..."
            icon: Icons.magnify
            placeholder: "جستجو بر اساس کتاب، ناشر، نویسنده و ..."
            inputText.text: ""
        }


        Item{
            Layout.preferredHeight: 20
        }

        Flickable{
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: homeItem.height - 20 - input_phone.height
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
                                font.family: iranSans.name
                                color: color2
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * 1.5
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
                                font.pixelSize: Qt.application.font.pixelSize
                                color: color9
                            }
                            Label{
                                id: txt
                                text: searchModelTop.get(index).text
                                anchors.left: icon.right
                                font.family: iranSansFAnum.name
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize
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
                            text: "تعداد نتایج جستجو: " + totalPages
                            font.family: iranSansFAnum.name
                            color: color2
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.pixelSize: Qt.application.font.pixelSize * 1.5
                        }
                    }

                    Item{Layout.preferredHeight: 20}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        visible: (totalPages===0) ? true:false
                        color: color1

                        Label{
                            anchors.fill: parent
                            text: "موردی برای نمایش موجود نیست"
                            font.family: iranSans.name
                            color: color9
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                        }
                    }

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
                        visible: (totalPages===0) ? true:false
                        color: "transparent"
                    }

                    GridView{
                        id: lview
                        Layout.fillWidth: true
                        Layout.preferredHeight: Math.floor((itemModel.count * cellWidth)/(parent.width-220)) * cellHeight + 20
                        Layout.rightMargin: 70
                        Layout.leftMargin: 50
                        clip: true
                        focus: true
                        cellWidth: 160
                        cellHeight: 250
                        interactive: true
                        layoutDirection: Qt.RightToLeft
                        model: itemModel.count
                        visible: (totalPages===0) ? false:true

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
                                    source: itemModel.get(index).source
                                    mipmap: true
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
                                    text:itemModel.get(index).text1
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
                                    text: itemModel.get(index).text2
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
                                            text: "(" + itemModel.get(index).rate + " رای)"
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
                                            text: itemModel.get(index).date
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

                    Item{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 150
                        Layout.rightMargin: 70
                        Layout.leftMargin: 50
                        visible: (totalPages===0) ? false:true
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
                                        font.family: iranSansFAnum.name
                                        color: color2
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            nView.currentIndex = index
                                            currentPage = index
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
