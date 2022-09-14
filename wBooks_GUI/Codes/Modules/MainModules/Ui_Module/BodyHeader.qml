import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../../Fonts/Icon.js" as Icons

Item {

    signal itemClicked(var pos)
    signal indexChanged(var index)

    property bool topFilterVis: true
    property bool listHeaderVis: true
    property string bgColor: color0

    onIndexChanged: {
        for (var i=0; i<topHeaderModel.count;i++){
            topHeaderModel.setProperty(i, "isClicked", false)
        }
        topHeaderModel.setProperty(index, "isClicked", true)
        hView.positionViewAtIndex(index, ListView.Center)
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        Rectangle{
            id: header2
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            color: bgColor
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft

                Item{Layout.preferredWidth: 15}

                Rectangle{
                    Layout.preferredHeight: width
                    Layout.preferredWidth: 30
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    radius: width / 2
                    border.width: 1
                    border.color: color4
                    color: "#ffffff"
                    visible: (inHomeMode) ? !showRightPop:false
                    Label{
                        anchors.centerIn: parent
                        text: Icons.arrow_left
                        font.family: webfont.name
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio

                        color: "#d43460"
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            rightFilterShowAnim.restart()
                        }
                    }
                }

                Item{
                    Layout.preferredWidth: 15
                    visible: (inHomeMode) ? !showRightPop:false
                }

                ListView{
                    id: hView
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    layoutDirection: Qt.RightToLeft
                    interactive: true
                    orientation: ListView.Horizontal
                    spacing: 5
                    clip: true
                    model: topHeaderModel
                    visible: listHeaderVis
                    delegate: Rectangle{
                        width: titletxt.contentWidth + 40
                        height: 30
                        anchors.verticalCenter: parent.verticalCenter
                        color: "transparent"
                        radius: 5
                        border.width: 1
                        border.color: (model.isClicked)? "#d43460":color4
                        Label{
                            id: titletxt
                            anchors.centerIn: parent
                            color: (model.isClicked)? "#d43460":color4
                            text: model.title
                            font.family: setting.activeNumFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1 //* widthRatio
                            horizontalAlignment: Text.AlignLeft
                            LayoutMirroring.enabled: true
                            elide: Text.ElideRight
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                for (var i=0; i<topHeaderModel.count;i++){
                                    topHeaderModel.setProperty(i, "isClicked", false)
                                }
                                topHeaderModel.setProperty(index, "isClicked", true)
                                itemClicked(index)
                            }
                        }
                    }
                }

                Item {
                    Layout.fillWidth: true
                    visible: !listHeaderVis
                }

                ComboBox{
                    id: cbox
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.15
                    Layout.topMargin: 2
                    Layout.bottomMargin: 2
                    LayoutMirroring.enabled: true
                    font.family: setting.activeFont
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
                    visible: topFilterVis
                    background: Rectangle {
                        color: color1
                    }
                    model: ListModel {
                        id: model
                        ListElement { text: "فیلتر بر اساس گران ترین" }
                        ListElement { text: "فیلتر بر اساس ارزان ترین" }
                        ListElement { text: "فیلتر بر اساس محبوب ترین" }
                        ListElement { text: "فیلتر بر اساس پرفروش ترین" }
                    }
                    delegate: ItemDelegate {
                        id:itemDlgt
                        width: cbox.width
                        height:40
                        padding:0

                        contentItem: Text {
                            id:textItem
                            text: model.text
                            color: itemDlgt.hovered?color1:color4
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
                            LayoutMirroring.enabled: true
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            rightPadding: 20
                        }

                        background: Rectangle {
                            color:itemDlgt.hovered?color4:color1;
                            anchors.left: itemDlgt.left
                            anchors.leftMargin: 0
                            width:itemDlgt.width
                        }

                    }

                    onActivated: {

                    }
                }

    //                        Rectangle{
    //                            Layout.fillHeight: true
    //                            Layout.preferredWidth: lbl_book_number.contentWidth
    //                            color: "transparent"
    //                            clip: true
    //                            Label {
    //                                id: lbl_book_number
    //                                height: parent.height - 1
    //                                width: parent.width
    //                                anchors.right: parent.right
    //                                text: secondHeaderTitle
    //                                font.family: setting.activeNumFont
    //                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
    //                                verticalAlignment: Qt.AlignVCenter
    //                                color: color5
    //                            }

    //                            Rectangle{
    //                                width: lbl_book_number.width
    //                                anchors.top: lbl_book_number.bottom
    //                                anchors.right: parent.right
    //                                anchors.bottomMargin: 2
    //                                height: 2
    //                                color: color5
    //                            }

    //                            Rectangle {
    //                                width: parent.width * 0.8
    //                                anchors.right: lbl_book_number.left
    //                                anchors.bottomMargin: 2
    //                                color: "transparent"
    //                            }
    //                        }

    //                        Item{Layout.fillWidth: true}

    //                        ComboBox{
    //                            id: cbox
    //                            Layout.fillHeight: true
    //                            Layout.preferredWidth: parent.width * 0.18
    //                            Layout.topMargin: 2
    //                            Layout.bottomMargin: 2
    //                            LayoutMirroring.enabled: true
    //                            font.family: setting.activeFont
    //                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
    //                            visible: topFilterVis
    //                            background: Rectangle {
    //                                color: color1
    //                            }
    //                            model: ListModel {
    //                                id: model
    //                                ListElement { text: "فیلتر بر اساس گران ترین" }
    //                                ListElement { text: "فیلتر بر اساس ارزان ترین" }
    //                                ListElement { text: "فیلتر بر اساس محبوب ترین" }
    //                                ListElement { text: "فیلتر بر اساس پرفروش ترین" }
    //                            }
    //                            delegate: ItemDelegate {
    //                                id:itemDlgt
    //                                width: cbox.width
    //                                height:40
    //                                padding:0

    //                                contentItem: Text {
    //                                    id:textItem
    //                                    text: model.text
    //                                    color: itemDlgt.hovered?color1:color4
    //                                    font.family: setting.activeFont
    //                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
    //                                    LayoutMirroring.enabled: true
    //                                    verticalAlignment: Text.AlignVCenter
    //                                    horizontalAlignment: Text.AlignLeft
    //                                    rightPadding: 20
    //                                }

    //                                background: Rectangle {
    //                                  color:itemDlgt.hovered?color4:color1;
    //                                  anchors.left: itemDlgt.left
    //                                  anchors.leftMargin: 0
    //                                  width:itemDlgt.width
    //                                }

    //                              }

    //                            onActivated: {

    //                            }
    //                        }

                Item {
                    Layout.preferredWidth: 30
                }
            }
        }
    }
}
