import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

import "./../Items"

import "./../../../Fonts/Icon.js" as Icons

Item {
    anchors.fill: parent

    property var audioBookModel: []
    property var documentBookModel: []

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Item{Layout.preferredHeight: 25}

        // Tab Bar (Audio or Passages books) //
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: 46
            Rectangle{
                width: parent.width * 0.6
                height: parent.height
                radius: 10
                color: "#dddddd"
                anchors.horizontalCenter: parent.horizontalCenter

                //-- (Left) AudioBook --//
                Rectangle{
                    id: btn_AudioBook

                    property bool isSelected: false

                    width: (parent.width / 2)
                    height: parent.height
                    radius: 10
                    anchors.left: parent.left

                    color: (btn_AudioBook.isSelected) ? color11 : "#dddddd"

                    Rectangle{
                        width: parent.radius
                        height: parent.height
                        anchors.right: parent.right
                        color: parent.color
                    }


                    Label{
                        width: parent.width - 50
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "کتاب های صوتی"
                        color: (btn_AudioBook.isSelected) ? "#ffffff" : "#bbbbbb"

                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter

                        font.pixelSize: Qt.application.font.pixelSize * 1.9
                        font.family: setting.activeFont
                        minimumPixelSize: 1
                        fontSizeMode: Text.Fit
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if(btn_AudioBook.isSelected === false){
                                btn_AudioBook.isSelected = true
                                btn_documents.isSelected = false
                            }
                        }
                    }

                }

                //-- (Right) Document Books --//
                Rectangle{
                    id: btn_documents

                    property bool isSelected: true

                    width: (parent.width / 2)
                    height: parent.height
                    radius: 10
                    anchors.right: parent.right

                    color: (btn_documents.isSelected) ? color11 : "#dddddd"

                    Rectangle{
                        width: parent.radius
                        height: parent.height
                        anchors.left: parent.left
                        color: parent.color
                    }

                    Label{
                        width: parent.width - 50
                        height: parent.height
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "کتاب های متنی"
                        color: (btn_documents.isSelected) ? "#ffffff" : "#bbbbbb"
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter

                        font.pixelSize: Qt.application.font.pixelSize * 1.9
                        font.family: setting.activeFont
                        minimumPixelSize: 1
                        fontSizeMode: Text.Fit
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            if(btn_documents.isSelected === false){
                                btn_documents.isSelected = true
                                btn_AudioBook.isSelected = false

                            }
                        }
                    }

                }
            }

            HoverButton{
                width: 50
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 20
                btnRadius: 10
                borderWidth: 1
                borderColor: color4
                backgroundColor: "transparent"
                btnIcon: Icons.diamond_stone
                btnText: "بازگشت"
                textColor: color4

                onBtnClicked: {
                    memView.currentIndex = 0
                }
            }
        }

        Item{Layout.preferredHeight: 25}

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            Layout.rightMargin: 50
            Layout.leftMargin: 50
            color: color4
        }

        Item{Layout.preferredHeight: 25}

        //-- Results Section --//
        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "transparent"

            Flickable{
                id: flick_Result
                anchors.fill: parent
                contentHeight: (btn_AudioBook.isSelected) ? myFlowAudioBook.height : myFlowDocument.height
                clip: true

                //anchors.margins: 10

                ScrollBar.vertical: ScrollBar {
                    width: 10 * ratio
                    parent: flick_Result.parent
                    anchors.top: flick_Result.top
                    anchors.right: flick_Result.right
                    anchors.bottom: flick_Result.bottom
                }

                //-- AudioBook Result --//
                Flow {
                    id: myFlowAudioBook

                    visible: btn_AudioBook.isSelected
                    layoutDirection: Qt.RightToLeft
                    width: (flick_Result.width % 255 === 0) ? (255 * ((flick_Result.width / 255)) + ((Math.floor(flick_Result.width / 255) - 1) * spacing))
                                                            : ((255 * Math.floor(flick_Result.width / 255)) + ((Math.floor(flick_Result.width / 255) - 1) * spacing))
                    height: implicitHeight
                    spacing: 10

                    anchors.horizontalCenter: parent.horizontalCenter

                    Repeater {
                        model: audioBookModel

                        Rectangle{

                            width: 250
                            height: 385
                            color: "transparent"
                            clip: true

//                            DropShadow {
//                                anchors.fill: audioItem
//                                horizontalOffset: 0
//                                verticalOffset: 0
//                                radius: 6.0
//                                samples: 17
//                                color: "#b0000000"
//                                source: audioItem
//                            }

                            MembershipBookItem{
                                id: audioItem
                                anchors.centerIn: parent
                                imageSource: audioBookModel.get(index).source
                                text1: audioBookModel.get(index).text1
                                text2: audioBookModel.get(index).text2
                                price: audioBookModel.get(index).price
                                rate: audioBookModel.get(index).rate
                                date: audioBookModel.get(index).date
                                fileType: "Audio"
                            }
                        }
                    }
                }

                //-- Document Books Result --//
                Flow {
                    id: myFlowDocument
                    layoutDirection: Qt.RightToLeft
                    visible: !btn_AudioBook.isSelected

                    width: (flick_Result.width % 255 === 0) ? (255 * ((flick_Result.width / 255)) + ((Math.floor(flick_Result.width / 255) - 1) * spacing))
                                                            : ((255 * Math.floor(flick_Result.width / 255)) + ((Math.floor(flick_Result.width / 255) - 1) * spacing))
                    height: implicitHeight
                    spacing: 10

                    anchors.horizontalCenter: parent.horizontalCenter

                    Repeater {
                        model: documentBookModel


                        Rectangle{

                            width: 250
                            height: 385
                            color: "transparent"
                            clip: true

//                            DropShadow {
//                                anchors.fill: documentItem
//                                horizontalOffset: 0
//                                verticalOffset: 0
//                                radius: 6.0
//                                samples: 17
//                                color: "#b0000000"
//                                source: documentItem
//                            }

                            MembershipBookItem{
                                id: documentItem
                                anchors.centerIn: parent
                                imageSource: documentBookModel.get(index).source
                                text1: documentBookModel.get(index).text1
                                text2: documentBookModel.get(index).text2
                                price: documentBookModel.get(index).price
                                rate: documentBookModel.get(index).rate
                                date: documentBookModel.get(index).date
                                fileType: "Document"
                            }
                        }
                    }
                }
            }
        }

        Item{Layout.preferredHeight: 50}
    }
}
