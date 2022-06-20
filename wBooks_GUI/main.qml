import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import "./Fonts/Icon.js" as Icons
import "./Codes/Utils/Enum.js" as Enum
import "./Codes/Utils/Utils.js" as Util

import "./Codes/Modules"
import "./Codes"

Window {
    id: win
    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600
    visibility: Qt.WindowFullScreen
    visible: true
    title: qsTr("wBooks")

    property double ratio: 1

    // Theme props
    property bool lightTheme: true
    property string lightColor: "#f0ffff"
    property string darkColor: "#444444"


    //-- information of user in profile page --//
    property var userInfo: []
    property bool isLogined: false

    //-- right panel buttons states --//
    property string _BTN_DOSHBOARD:     "DOSHBOARD"
    property string _BTN_LEARN:         "LEARN"
    property string _BTN_PRACTICE:      "PRACTICE"
    property string _BTN_ACTIVITY:      "ACTIVITY"
    property string _BTN_SETTING:       "SETTING"
    property string _BTN_HELP:          "HELP"
    property string _BTN_ABOUTUS:       "ABOUTUS"
    property string _BTN_DICTIONARY:    "DICTIONARY"


    //flags: Qt.WindowCloseButtonHint
    FontLoader{ id: segoeUI; source: "qrc:/Fonts/segoeui.ttf"}                          // segoeUI FONT
    FontLoader{ id: iranSans; source: "qrc:/Fonts/IRANSansMobile.ttf"}                  // iransans FONT
    FontLoader{ id: iranSansFAnum; source: "qrc:/Fonts/IRANSansMobile(FaNum).ttf"}                  // iranSans FARSI number FONT
    FontLoader{ id: iranSansMedium; source: "qrc:/Fonts/IRANSans_Medium.ttf"}           // iransans Medium FONT
    FontLoader{ id: webfont; source: "qrc:/Fonts/materialdesignicons-webfont.ttf"}      //ICONS FONT
    FontLoader{ id: nunito; source: "qrc:/Fonts/Nunito/Nunito-Regular.ttf"}      //ICONS FONT
    FontLoader{ id: nunito_italic; source: "qrc:/Fonts/Nunito/Nunito-Italic.ttf"}      //ICONS FONT

    //-- font metric for size porpose --//
    FontMetrics{
        id: fontMetric
        font.family: iranSans.name
        font.pixelSize: Qt.application.font.pixelSize
    }

    Page{
        id: mainPage

        anchors.fill: parent

        //-- HEADER --//
        header: Rectangle{
            id: mainHeader

            width: parent.width
            height: 60 //* ratio

            color: "black"

            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                spacing: 0

                Image {
                    Layout.margins: 10
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.1
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    source: "qrc:/Images/logo1.jpg"
                    fillMode: Image.PreserveAspectFit
                    mipmap: true
                }

                //-- Vertical Line After Profile Name --//
                Rectangle{
                    Layout.preferredHeight: parent.height * 0.7
                    Layout.preferredWidth: 1

                    color: "white"

                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.015

                    color: "black"
                }

                //- navbar --//
                HeaderButton{
                    icon: Icons.home_outline
                    isClick: true
                    text: "خانه"
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.02

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.diamond_stone
                    text: "اشتراک"
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.02

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.bookshelf
                    text: "کتاب های سریالی"
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.02

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.headphones
                    text: "کتاب های صوتی"
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.02

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.magnify
                    text: "جستجو"
                }

                //-- Vertical Line After Profile Name --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.2

                    color: "transparent"

                    Layout.alignment: Qt.AlignVCenter
                }


                //-- account / login/ register --//
                Item{
                    Layout.preferredWidth: parent.width * 0.2
                    Layout.fillHeight: parent.height

                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        //-- Account Profile Name --//
                        Label{
                            visible: (isLogined)
                            id: header_AccountName

                            text: userInfo.name
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize //Qt.application.font.pixelSize
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignVCenter

                            color: "white"
                            clip: true
                            elide: Text.ElideRight
                        }

                        //-- Account login --//
                        Label{
                            id: header_AccountLogin
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.35
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10

                            visible: !isLogined
                            text: "ورود کاربر"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.4 //Qt.application.font.pixelSize
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            background: Rectangle{
                                radius: 20
                                color: "lawngreen"
                                width: parent.width
                                height: parent.height
                            }
                            color: "black"
                            clip: true
                            elide: Text.ElideRight

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked:{
                                }
                            }
                        }

                        //-- Vertical Line After Profile Name --//
                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: 5

                            color: "transparent"

                            Layout.alignment: Qt.AlignVCenter
                        }

                        //-- Account register --//
                        Label{
                            id: header_AccountRegister
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.6
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            visible: !isLogined
                            text: "همین حالا ثبت نام کنید"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.4 //Qt.application.font.pixelSize
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            background: Rectangle{
                                radius: 20
                                color: "red"
                                width: parent.width
                                height: parent.height
                            }
                            color: "white"
                            clip: true
                            elide: Text.ElideRight

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked:{
                                }
                            }
                        }

                    }

                }

                Item { Layout.fillWidth: true } //-- filler --//

            }
        }

        //-- Body --//
        Body{
            id: mainBody
            anchors.fill: parent
        }

        //-- Right Menu --//
        footer: Rectangle{
            id: rightMenu

            width: parent.width
            height: 80

            color: darkColor

            //-- Right Menu Items --//
            RowLayout{
                anchors.fill: parent

                spacing: 0
                layoutDirection: Qt.RightToLeft

                Item{Layout.preferredWidth: parent.width * 0.15}

                //-- social media icons --//
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.rightMargin: 10 * ratio

                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: -5

                        Label{
                            id:nasheran
                            text: "ورود ناشران"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Label{
                            text: "|"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Label{
                            id:conditions

                            text: "شرایط استفاده"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Label{
                            text: "|"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Label{
                            id:questions

                            text: "سوالات متداول"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Label{
                            text: "|"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Label{
                            id:contantus

                            text: "تماس با پشتیبانی"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.1

                            color: "#ffffff"
                        }

                        Item{Layout.fillWidth: true} //-- filler --//

                        Rectangle{
                            radius: width * 0.5
                            color: "white"
                            Layout.preferredWidth: parent.height * 0.75
                            Layout.preferredHeight: width

                            Label{
                                id:lbl_youtube
                                anchors.fill: parent
                                text: Icons.youtube
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                color: "#000000"
                            }
                        }
                        Rectangle{
                            radius: width * 0.5
                            color: "white"
                            Layout.preferredWidth: parent.height * 0.75
                            Layout.preferredHeight: width

                            Label{
                                id:lbl_linkedin
                                anchors.fill: parent
                                text: Icons.linkedin
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                color: "#000000"
                            }
                        }

                        Rectangle{
                            radius: width * 0.5
                            color: "white"
                            Layout.preferredWidth: parent.height * 0.75
                            Layout.preferredHeight: width

                            Label{
                                id:lbl_facebook
                                anchors.fill: parent
                                text: Icons.facebook
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                color: "#000000"
                            }
                        }

                        Rectangle{
                            radius: width * 0.5
                            color: "white"
                            Layout.preferredWidth: parent.height * 0.75
                            Layout.preferredHeight: width

                            Label{
                                id:lbl_twitter
                                anchors.fill: parent
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                text: Icons.twitter

                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                color: "#000000"
                            }
                        }

                        Rectangle{
                            radius: width * 0.5
                            color: "white"
                            Layout.preferredWidth: parent.height * 0.75
                            Layout.preferredHeight: width

                            Label{
                                id:lbl_telegram
                                anchors.fill: parent
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                text: Icons.telegram

                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                color: "#000000"
                            }
                        }

                        Item{Layout.preferredWidth: 20}

                    }
                }


            }
        }
    }
}
