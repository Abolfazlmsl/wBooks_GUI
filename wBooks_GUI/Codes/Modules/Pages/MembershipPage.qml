import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

import "./../../Modules/Items"
import "./../MainModules/Ui_Module"

Item{
    anchors.fill: parent

    SwipeView{
        id: memView
        anchors.fill: parent
        interactive: false
        clip: true
        currentIndex: 0

        Item{
            Flickable{
                anchors.fill: parent
                contentHeight: membershipItem.height
                contentWidth: parent.width
                boundsBehavior: Flickable.StopAtBounds
                ScrollBar.vertical: ScrollBar {}
                clip: true

                Item{
                    id: membershipItem
                    implicitHeight: childrenRect.height
                    implicitWidth: parent.width
                    ColumnLayout{
                        width: parent.width
                        spacing: 0

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 250
                            Layout.leftMargin: 50
                            Layout.rightMargin: 50
                            Layout.topMargin: 50
                            color: "transparent"
                            Rectangle{
                                id: title
                                width: parent.width
                                height: 50
                                color: "transparent"
                                Label{
                                    anchors.fill: parent
                                    font.family: mainFont.name
                                    color: color4
                                    text: "اشتراک من"
                                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Text.AlignLeft
                                    LayoutMirroring.enabled: true
                                }
                            }

                            Rectangle{
                                width: parent.width
                                height: 50
                                anchors.topMargin: 50
                                anchors.top: title.bottom
                                visible: (myMembershipModel.count > 0)?false:true
                                color: "transparent"
                                Label{
                                    anchors.fill: parent
                                    font.family: mainFont.name
                                    color: color4
                                    text: "شما اشتراک فعالی ندارید."
                                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Text.AlignLeft
                                    LayoutMirroring.enabled: true
                                }
                            }

                            RowLayout{
                                width: parent.width
                                height: parent.height - 100
                                anchors.top: title.bottom
                                visible: (myMembershipModel.count > 0)?true:false
                                layoutDirection: Qt.RightToLeft
                                spacing: 10

                                Rectangle{
                                    Layout.preferredWidth: 100
                                    Layout.preferredHeight: width
                                    radius: 5
                                    color: "green"
                                    Label{
                                        anchors.centerIn: parent
                                        font.family: mainFaNumFont.name
                                        color: "white"
                                        text: myMembershipModel.get(0).time + " ماهه"
                                        font.pixelSize: Qt.application.font.pixelSize * 1.7
                                        horizontalAlignment: Text.AlignLeft
                                        LayoutMirroring.enabled: true
                                    }
                                }

                                Rectangle{
                                    Layout.preferredWidth: parent.width * 0.2
                                    Layout.fillHeight: true
                                    color: "transparent"
                                    Label{
                                        anchors.centerIn: parent
                                        font.family: mainFaNumFont.name
                                        color: color4
                                        text: myMembershipModel.get(0).remaining + " روز باقی مانده است"
                                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    }
                                }

                                Item{Layout.fillWidth: true}

                                Rectangle{
                                    Layout.preferredWidth: parent.width * 0.05
                                    Layout.preferredHeight: width
                                    color: "transparent"
                                    ToolTip.text: "مشاهده کتاب ها"
                                    ToolTip.visible: "مشاهده کتاب ها" ? watchArea.containsMouse : false
                                    Label{
                                        anchors.centerIn: parent
                                        font.family: webfont.name
                                        color: color4
                                        text: Icons.eye
                                        font.pixelSize: Qt.application.font.pixelSize * 3
                                    }
                                    MouseArea{
                                        id: watchArea
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {
                                            memView.currentIndex = 1
                                        }
                                    }
                                }

                                Rectangle{
                                    Layout.preferredWidth: parent.width * 0.05
                                    Layout.preferredHeight: width
                                    color: "transparent"
                                    ToolTip.text: "تمدید"
                                    ToolTip.visible: "تمدید" ? extensionArea.containsMouse : false
                                    Label{
                                        anchors.centerIn: parent
                                        font.family: webfont.name
                                        color: color4
                                        text: Icons.repeat
                                        font.pixelSize: Qt.application.font.pixelSize * 3
                                    }
                                    MouseArea{
                                        id: extensionArea
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {

                                        }
                                    }
                                }

                                Rectangle{
                                    Layout.preferredWidth: parent.width * 0.05
                                    Layout.preferredHeight: width
                                    color: "transparent"
                                    ToolTip.text: "حذف"
                                    ToolTip.visible: "حذف" ? deleteArea.containsMouse : false
                                    Label{
                                        anchors.centerIn: parent
                                        font.family: webfont.name
                                        color: color4
                                        text: Icons.trash_can
                                        font.pixelSize: Qt.application.font.pixelSize * 3
                                    }
                                    MouseArea{
                                        id: deleteArea
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {

                                        }
                                    }
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 50}

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                            Layout.leftMargin: 50
                            Layout.rightMargin: 50
                            color: color4
                        }

                        Item{Layout.preferredHeight: 50}

                        GridView{
                            id: lview
                            Layout.fillWidth: true
                            Layout.preferredHeight: Math.ceil(lview.count/Math.floor((parent.width-120)/cellWidth)) * cellHeight + 20
                            Layout.rightMargin: 70
                            Layout.leftMargin: 50
                            clip: true
                            focus: true
                            cellWidth: 320
                            cellHeight: 380
                            interactive: true
                            layoutDirection: Qt.RightToLeft
                            model: membershipModel
                            ScrollBar.vertical: ScrollBar {}
                            delegate: MembershipItem{
                                width: 280 //* widthRatio
                                height: 350
                                title: "اشتراک " + model.time + " ماهه"
                                price: model.price
                                bgColor: model.color

                                onDashboard_btnClicked: {

                                }
                            }

                        }

                        Item{Layout.preferredHeight: 50}
                    }
                }
            }
        }

        Item{
            MembershipBooksPage{
                anchors.fill: parent
                audioBookModel: membershipAudioBookModel
                documentBookModel: membershipDocumentBookModel
            }
        }
    }
}
