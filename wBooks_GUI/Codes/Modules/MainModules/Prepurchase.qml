import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

import "./../../../Fonts/Icon.js" as Icons

Item {
    id: prepurchase_item
    property alias title: titletxt.text
    property var itemModel: []

    signal moreBtnClicked()

    RowLayout{
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        spacing: 0

        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.05
            Layout.topMargin: titleItem.height
            color: color0
            Label{
                anchors.fill: parent
                font.family: webfont.name
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Qt.application.font.pixelSize * 3
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
            //            anchors.rightMargin:
            clip: true
            Item{
                id: titleItem
                width: parent.width
                height: 100
                anchors.right: parent.right
                RowLayout{
                    anchors.fill: parent
                    layoutDirection: Qt.RightToLeft
                    Label{
                        id: titletxt
                        Layout.preferredWidth: titletxt.contentWidth + 20
                        Layout.fillHeight: true
                        text: ""
                        font.family: iranSans.name
                        color: color4
                        font.pixelSize: Qt.application.font.pixelSize * 1.7
                        verticalAlignment: Qt.AlignVCenter
                        elide: Text.ElideRight
                    }

                    Label{
                        id: moretxt
                        Layout.preferredWidth: moretxt.contentWidth
                        Layout.fillHeight: true
                        font.family: iranSans.name
                        color: color2
                        text: "(مشاهده بیشتر)"
                        font.pixelSize: Qt.application.font.pixelSize * 1.7
                        verticalAlignment: Qt.AlignVCenter
                        elide: Text.ElideRight
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
                clip: false
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
                    height: 220
                    color: "transparent"
                    property bool isClicked: false

                    Rectangle{
                        id: iconRec
                        width: parent.width
                        height: parent.height * 0.6

                        color: color8
                        Image {
                            id: image
                            anchors.fill: parent
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 8
                            anchors.topMargin: (itemRec.isClicked) ? -20:8
                            anchors.bottomMargin: (itemRec.isClicked) ? 30:8
                            Behavior on anchors.topMargin {
                                NumberAnimation{duration: 300}
                            }
                            Behavior on anchors.bottomMargin {
                                NumberAnimation{duration: 300}
                            }
                            source: itemModel.get(index).source
                            mipmap: true

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    itemRec.isClicked = !itemRec.isClicked
                                }
                            }
                        }
                        Item{
                            id: rating
                            width: parent.width
                            height: (itemRec.isClicked) ? 30:0
                            visible: (itemRec.isClicked)
                            Behavior on height {
                                NumberAnimation{duration: 300}
                            }

                            anchors.top: image.bottom
                            RowLayout{
                                width: parent.width * 0.9
                                height: parent.height
                                layoutDirection: Qt.RightToLeft

                                Rectangle{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: parent.width * 0.6
                                    color: "transparent"
                                    Rating{
                                        anchors.fill: parent
                                        selectable: true
                                        scale: 1.3
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
                            text: itemModel.get(index).text1
                            font.family: iranSans.name
                            color: color4
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
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
                            horizontalAlignment: Qt.AlignHCenter
                            font.pixelSize: Qt.application.font.pixelSize
                        }
                    }

                    Item{
                        id: spacer
                        width: parent.width
                        height: parent.height * 0.05
                        anchors.top: title3Rec.bottom
                    }

                    Rectangle{
                        id: btnpurchase
                        width: parent.width
                        height: parent.height * 0.15
                        anchors.top: spacer.bottom
                        color: color2
                        Label{
                            id: txt4
                            anchors.fill: parent
                            text: "پیش خرید"
                            font.family: iranSans.name
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.pixelSize: Qt.application.font.pixelSize
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

        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.05
            Layout.topMargin: titleItem.height
            color: color0
            Label{
                anchors.fill: parent
                font.family: webfont.name
                font.pixelSize: Qt.application.font.pixelSize * 3
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


