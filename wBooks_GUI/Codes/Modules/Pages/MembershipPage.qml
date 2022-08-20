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
                            Layout.preferredHeight: 80
                            Layout.leftMargin: 50
                            Layout.rightMargin: 50
                            Layout.topMargin: 50
                            color: "transparent"

                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 0
                                Rectangle{
                                    Layout.preferredWidth: parent.width * 0.1
                                    Layout.fillHeight: true
                                    color: "#474749"
                                    Label{
                                        anchors.fill: parent
                                        font.family: mainFont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 1.5 //* widthRatio
                                        font.bold: true
                                        text: "اشتراک من"
                                        color: "#ffffff"
                                        verticalAlignment: Qt.AlignVCenter
                                        horizontalAlignment: Qt.AlignHCenter
                                    }
                                }

                                Rectangle{
                                    Layout.preferredWidth: parent.width * 0.65
                                    Layout.fillHeight: true
                                    color: "#e2e2e2"
                                    RowLayout{
                                        anchors.fill: parent
                                        spacing: 0
                                        layoutDirection: Qt.RightToLeft

                                        Item{Layout.preferredWidth: 20}

                                        Image{
                                            id: image
                                            Layout.preferredWidth: 50
                                            Layout.fillHeight: true
                                            source: myMembershipModel.get(0).source
                                            mipmap: true
                                            fillMode: Image.PreserveAspectFit
                                        }

                                        Item{Layout.preferredWidth: 20}

                                        Rectangle{
                                            Layout.preferredWidth: modelTxt.contentWidth
                                            Layout.fillHeight: true
                                            color: "transparent"
                                            Label{
                                                id: modelTxt
                                                anchors.centerIn: parent
                                                font.family: mainFaNumFont.name
                                                color: "black"
                                                text: (myMembershipModel.count > 0)? "اشتراک ویژه " + myMembershipModel.get(0).time + " روزه":"اشتراک ویژه ی شما به پایان رسیده است"
                                                font.pixelSize: Qt.application.font.pixelSize * 1.7
                                                verticalAlignment: Qt.AlignVCenter
                                            }
                                        }

                                        Item{Layout.preferredWidth: 20}

                                        Rectangle{
                                            Layout.preferredWidth: 150
                                            Layout.fillHeight: true
                                            visible: (myMembershipModel.count > 0)?true:false
                                            color: "transparent"
                                            Label{
                                                anchors.centerIn: parent
                                                font.family: mainFaNumFont.name
                                                color: "#a0a0a0"
                                                text: "(صورتحساب 935756)"
                                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                                verticalAlignment: Qt.AlignVCenter
                                            }
                                        }

                                        Item{Layout.fillWidth: true}

                                        Rectangle{
                                            Layout.preferredWidth: parent.width * 0.05
                                            Layout.preferredHeight: width
                                            enabled: (myMembershipModel.count > 0)? true:false
                                            color: "transparent"
                                            ToolTip.text: "مشاهده کتاب ها"
                                            ToolTip.visible: "مشاهده کتاب ها" ? watchArea.containsMouse : false
                                            Label{
                                                anchors.centerIn: parent
                                                enabled: (myMembershipModel.count > 0)? true:false
                                                font.family: webfont.name
//                                                color: color4
                                                text: Icons.eye
                                                font.pixelSize: Qt.application.font.pixelSize * 2.5
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
                                            enabled: (myMembershipModel.count > 0)? true:false
                                            color: "transparent"
                                            ToolTip.text: "تمدید"
                                            ToolTip.visible: "تمدید" ? extensionArea.containsMouse : false
                                            Label{
                                                anchors.centerIn: parent
                                                enabled: (myMembershipModel.count > 0)? true:false
                                                font.family: webfont.name
//                                                color: color4
                                                text: Icons.repeat
                                                font.pixelSize: Qt.application.font.pixelSize * 2.5
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
                                            enabled: (myMembershipModel.count > 0)? true:false
                                            color: "transparent"
                                            ToolTip.text: "حذف"
                                            ToolTip.visible: "حذف" ? deleteArea.containsMouse : false
                                            Label{
                                                anchors.centerIn: parent
                                                font.family: webfont.name
                                                enabled: (myMembershipModel.count > 0)? true:false
//                                                color: color4
                                                text: Icons.trash_can
                                                font.pixelSize: Qt.application.font.pixelSize * 2.5
                                            }
                                            MouseArea{
                                                id: deleteArea
                                                anchors.fill: parent
                                                cursorShape: Qt.PointingHandCursor
                                                hoverEnabled: true
                                                onClicked: {
                                                    myMembershipModel.clear()
                                                }
                                            }
                                        }

                                        Item{Layout.preferredWidth: 20}
                                    }
                                }

                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    color: "#d43460"
                                    Label{
                                        anchors.fill: parent
                                        font.family: mainFaNumFont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 1.5 //* widthRatio
                                        font.bold: true
                                        text: (myMembershipModel.count > 0)? myMembershipModel.get(0).remaining + " روز باقی مانده است":"-"
                                        color: "#ffffff"
                                        verticalAlignment: Qt.AlignVCenter
                                        horizontalAlignment: Qt.AlignHCenter
                                    }
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Rectangle{
                            id: title
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 50
                            color: "transparent"
                            Label{
                                anchors.fill: parent
                                font.family: mainFont.name
                                color: "#d43460"
                                text: "خرید اشتراک ویژه ی وی بوکس"
                                font.pixelSize: Qt.application.font.pixelSize * 2
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                LayoutMirroring.enabled: true
                            }
                        }

                        Item{Layout.preferredHeight: 10}

                        Rectangle{
                            id: introItem
                            Layout.fillWidth: true
                //            Layout.preferredHeight: parent.height * 0.05
                            Layout.preferredHeight: intoTxt.contentHeight
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            color: "transparent"

                            Label{
                                id: intoTxt
                                anchors.fill: parent
                                text: "این روزها به ندرت رمان عاشقانه‌ای خواهید یافت که درس زندگی دهد، یا اینکه قهرمانان کتاب در پایان با قلب مخاطب همراه شوند. اثر پرفروش من پیش از تو نوشته رمان‌نویس مشهور انگلیسی جوجو مویز از این دست کتاب‌ها است.

                کتاب با لوئیزا کلارک که دختری جوان و 26 ساله است شروع می‌شود. او که جاه طلب و موفق نیست، مدام در داشتن شغلی پایدار و همیشگی شکست می‌خورد. لوئیزا با سمت پیشخدمت در کافه‌ای محلی مشغول به کار است و شغلش به عنوان کمک درآمدی برای خانواده‌ فقیرش است. در ادامه داستان، دیری نمی‌گذرد که کارش را از دست می‌دهد."
                                font.family: mainFaNumFont.name
                                color: color4
                                wrapMode: Text.WordWrap
                            }
                        }

                        Item{Layout.preferredHeight: 30}

                        GridView{
                            id: lview
                            Layout.fillWidth: true
                            Layout.preferredHeight: Math.ceil(lview.count/Math.floor((parent.width-120)/cellWidth)) * cellHeight + 20
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            clip: true
                            focus: true
                            cellWidth: 300
                            cellHeight: 430
                            interactive: true
                            layoutDirection: Qt.RightToLeft
                            model: membershipModel
                            ScrollBar.vertical: ScrollBar {}
                            delegate: MembershipItem{
                                width: 260 //* widthRatio
                                height: 400
                                time: model.time
                                imgSource: model.source
                                price: model.price
                                text1: model.text1
                                text2: model.text2
                                text3: model.text3
                                text4: model.text4
                                text5: model.text5

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
