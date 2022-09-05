import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../../Fonts/Icon.js" as Icons

Item {
    id: cat_item
    property alias title: titletxt.text
//    property alias itemModel: lview.model

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Label{
            id: titletxt
            width: parent.width
            height: 50
            anchors.right: parent.right
            anchors.rightMargin: 15
            text: ""
            font.family: setting.activeFont
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
            anchors.right: parent.right
            clip: false
            focus: true
            cellWidth: 150
            cellHeight: 200
            interactive: false
            layoutDirection: Qt.RightToLeft
            model: specialCatModel

            delegate: Rectangle{
                id: itemRec
                width: 130
                height: 180
                color: "transparent"
//                property bool isClicked: false
                Rectangle{
                    id: iconRec
                    width: parent.width
                    height: (model.isClicked) ? parent.height * 0.5:parent.height * 0.8
                    Behavior on height {
                        NumberAnimation{duration:300}
                    }

                    color: (model.isClicked) ? color2:color1
                    Rectangle{
                        anchors.fill: parent
                        anchors.margins: 8
                        color: "#211D1D"
                        Label{
                            anchors.fill: parent
                            text: Icons.book_open_page_variant
                            color: "#ffffff"

                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * 3
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            for (var i=0; i<specialCatModel.count; i++){
                                if (i !== index){
                                    specialCatModel.setProperty(i, "isClicked", false)
                                }
                            }
                            if (model.isClicked){
                                specialCatModel.setProperty(index, "isClicked", false)
                            }else{
                                specialCatModel.setProperty(index, "isClicked", true)
                            }
//                            itemRec.isClicked = !itemRec.isClicked
                        }
                    }
                }

                Rectangle{
                    id: title2Rec
                    width: parent.width
                    height: parent.height - iconRec.height - title3Rec.height
                    anchors.top: iconRec.bottom
                    color: "transparent"
                    Label{
                        anchors.fill: parent
                        text: model.text
                        font.family: setting.activeFont
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Category"
                        }
                    }
                }

                Rectangle{
                    id: title3Rec
                    property var itemArray: model.items.split(",")

                    width: parent.width
                    visible: (model.isClicked) ? true :false
                    height: (model.isClicked) ? parent.height * 0.3:0
                    anchors.top: title2Rec.bottom
                    color: "transparent"
                    Behavior on height {
                        NumberAnimation{duration: 300}
                    }

                    Column{
                        anchors.right: parent.right
                        Repeater{
                            anchors.fill: parent
                            clip: true
                            model: (title3Rec.itemArray.length >= 3) ? 4:title3Rec.itemArray.length
                            delegate: Label{
                                width: 50
                                height: Text.contentHeight
                                text: (index===3)? "...":title3Rec.itemArray[index]
                                color: color9
                                font.family: setting.activeFont
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                LayoutMirroring.enabled: true
                                font.pixelSize: Qt.application.font.pixelSize
                            }

                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Category"
                        }
                    }
                }

            }

        }
    }

}
