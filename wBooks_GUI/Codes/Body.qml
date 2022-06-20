import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../Fonts/Icon.js" as Icons
import "./Utils/Enum.js" as Enum
import "./Utils/Utils.js" as Util

import "./Modules"

//-- Body --//
Rectangle{
    id: mainBody
    anchors.fill: parent

    ListModel{
        id: categoryModel
        ListElement{
            text: "ادبیات"
        }
        ListElement{
            text: "علوم پزشکی"
        }
        ListElement{
            text: "کمک درسی"
        }
        ListElement{
            text: "فلسفه و منطق"
        }
        ListElement{
            text: "هنر"
        }
    }

    ListModel{
        id: certificateModel
        ListElement{
            text: "همه"
        }
        ListElement{
            text: "اشتراکی"
        }
        ListElement{
            text: "رایگان"
        }
    }

    ListModel{
        id: ageModel
        ListElement{
            text: "همه"
        }
        ListElement{
            text: "زیر 12"
        }
        ListElement{
            text: "بین 12 تا 18"
        }
        ListElement{
            text: "بین 18 تا 26"
        }
        ListElement{
            text: "بالای 26"
        }
    }

    ListModel{
        id: dateModel
        ListElement{
            text: "همه"
        }
        ListElement{
            text: "5 سال پیش"
        }
        ListElement{
            text: "3 سال پیش"
        }
        ListElement{
            text: "1 سال پیش"
        }
        ListElement{
            text: "6 ماه پیش"
        }
    }

    ListModel{
        id: bookTypeModel
        ListElement{
            text: "کتاب صوتی"
        }
        ListElement{
            text: "کتاب متنی"
        }
    }


    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: Qt.RightToLeft

        RightPanel{
            Layout.preferredWidth: parent.width * 0.15
            Layout.fillHeight: true
        }

        Item{
            Layout.preferredWidth: parent.width * 0.85
            Layout.fillHeight: true
            ColumnLayout{
                anchors.fill: parent
                spacing: 0

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    color: "#50d3d3d3"
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        layoutDirection: Qt.RightToLeft

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.1
                            color: "transparent"
                            clip: true
                            Label {
                                id: lbl_book_number
                                height: parent.height - 1
                                text: "1000 کتاب موجود"
                                font.family: iranSansFAnum.name
                                font.pixelSize: Qt.application.font.pixelSize * 1.3
                                verticalAlignment: Qt.AlignVCenter
                                color: "blue"
                            }

                            Rectangle{
                                width: lbl_book_number.width
                                anchors.top: lbl_book_number.bottom
                                anchors.bottomMargin: 2
                                height: 2
                                color: "blue"
                            }
                        }

                        Rectangle {
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.65
                            color: "transparent"
                        }

                        ComboBox{
                            id: cbox
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.2
                            Layout.topMargin: 2
                            Layout.bottomMargin: 2
                            LayoutMirroring.enabled: true
                            font.family: iranSans.name
                            background: Rectangle {
                                color: "#d3d3d3"
                            }
                            model: ListModel {
                                id: model
                                ListElement { text: "فیلتر بر اساس گران ترین" }
                                ListElement { text: "فیلتر بر اساس ارزان ترین" }
                                ListElement { text: "فیلتر بر اساس محبوب ترین" }
                                ListElement { text: "فیلتر بر اساس پرفروش ترین" }
                            }
                            onActivated: {

                            }
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 2
                            color: "transparent"
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    color: "#d3d3d3"
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "#50d3d3d3"
                    //-- Pages --//
                    StackLayout {
                        id: sView

                        currentIndex: 0

                        Item {
                            Layout.fillWidth: true
                            Layout.fillHeight: true


                        }

                    }
                }
                //-- FOOTER --//
                Rectangle{
                    id: mainFooter

                    visible: false
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40 * ratio
                    Layout.bottomMargin: -2

                    //                color: Util.color_StatusBar

                    //-- Footer Items --//
                    RowLayout{

                        anchors.fill: parent
                        spacing: 0
                        anchors.leftMargin: 12 * ratio
                        layoutDirection: Qt.RightToLeft

                        //-- Filler --//
                        Item {
                            Layout.fillWidth: true
                        }


                        //-- exit text --//
                        Label{
                            id:footerLogoText

                            Layout.leftMargin: 5 * ratio

                            text: "خروج از نرم افزار"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 0.9
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignBottom

                            color: "#ffffff"

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    exitProgram.open()
                                }
                            }
                        }

                        //-- Icon  --//
                        Label{
                            id: lbl_exit

                            text: Icons.logout_variant
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.5
                            color: Util.color_white

                            verticalAlignment: Qt.AlignVCenter

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    exitProgram.open()
                                }
                            }

                        }

                    }

                }

            }
        }
    }

}

