import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../REST/apiService.js" as Service

import "./../../Items"

Item {
    signal topBtnClicked()
    signal bottomBtnClicked()

    Flickable{
        anchors.fill: parent
        contentHeight: homeItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}

        Item{
            id: homeItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
                    color: "transparent"
                    Image{
                        id: image
                        anchors.fill: parent
                        source: "qrc:/Images/Logo2.png"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                        ColorOverlay {
                            anchors.fill: image
                            source: image
                            color: color4
                        }
                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 15}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
                    color: "#474749"
                    Label{
                        anchors.centerIn: parent
                        text: "خوش آمدید"
                        font.family: mainFont.name
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                        color: "#ffffff"
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 360
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
                    color: "#e2e2e2"
                    ColumnLayout{
                        anchors.fill: parent
                        anchors.rightMargin: 50
                        anchors.leftMargin: 50

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            RowLayout{
                                anchors.fill: parent
                                spacing: 0
                                layoutDirection: Qt.RightToLeft

                                Item{Layout.fillWidth: true}
                                Label{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: contentWidth
                                    text: "کاربر گرامی "
                                    font.family: mainFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    color: "#000000"
                                }
                                Label{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: contentWidth
                                    text: setting.userName
                                    font.family: mainFaNumFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    color: "#d43460"
                                }
                                Label{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: contentWidth
                                    text: " ثبت نام شما با موفقیت انجام شد"
                                    font.family: mainFont.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    color: "#000000"
                                }
                                Item{Layout.fillWidth: true}
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        //-- Button regist --//
                        ButtonImageIcon{
                            id: btn_Confirm
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            icon: "qrc:/Icons/user(1).png"
                            iconColor: "#ffffff"
                            text: "برو به پروفایل من"
                            textColor: "#ffffff"
                            color: "#d43460"
                            textSize: 1
                            onBtnClicked: {
                                topBtnClicked()
                            }
                        }

                        Item{Layout.preferredHeight: 5}

                        //-- Button regist --//
                        ButtonImageIcon{
                            id: btn_Confirm_2
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            icon: "qrc:/Icons/ticket.png"
                            iconColor: "#d43460"
                            text: "همین حالا شروع کن! تهیه اشتراک با 15 درصد تخفیف"
                            textColor: "#d43460"
                            color: "#d6d6d6"
                            textSize: 1
                            onBtnClicked: {
                                bottomBtnClicked()
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.preferredHeight: 70
                            Layout.fillWidth: true
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            RowLayout{
                                anchors.fill: parent
                                spacing: 0
                                layoutDirection: Qt.RightToLeft
                                Rectangle{
                                    Layout.preferredWidth: 200
                                    Layout.fillHeight: true
                                    color: "blue"
                                }
                                Item{Layout.preferredWidth: 15}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    ColumnLayout{
                                        anchors.fill: parent
                                        spacing: 0
                                        Item{Layout.fillHeight: true}
                                        Label{
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: contentHeight
                                            text: "برای تهیه اشتراک های ویژه"
                                            font.family: mainFaNumFont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1 //* widthRatio
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                            color: "#a7a7a7"
                                        }

                                        Item{Layout.preferredHeight: 5}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: contentHeight
                                            text: "اعتبار کد هدیه: تا 1401/06/15"
                                            font.family: mainFaNumFont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1 //* widthRatio
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                            color: "#a7a7a7"
                                        }

                                        Item{Layout.preferredHeight: 5}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: contentHeight
                                            text: "برای یک بار استفاده"
                                            font.family: mainFaNumFont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1 //* widthRatio
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                            color: "#a7a7a7"
                                        }

                                        Item{Layout.fillHeight: true}
                                    }
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 30}
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
                    color: "#d43460"
                }

                //-- filler --//
                Item{Layout.preferredHeight: 100}
            }
        }
    }
}