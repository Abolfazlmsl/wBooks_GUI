import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.1

import "./Fonts/Icon.js" as Icons
import "./Utils/Enum.js" as Enum
import "./Utils/Utils.js" as Util

import "./Codes/Modules"
import "./Codes/LocalDatabase"
import "./Codes"

Window {
    id: win
    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600
    visibility: Qt.WindowFullScreen
    visible: true
    title: qsTr("wBooks_GUI")

    property double ratio: 1

    // Theme props
    property bool lightTheme: true
    property string lightColor: "#f0ffff"
    property string darkColor: "#444444"

    property bool accountPopEnabled: false
    property bool inHomeMode: true
    property int mainView: 0
    property bool homeClick: true
    property bool membershipClick: false
    property bool serialBookClick: false
    property bool audioBookClick: false
    property bool yourLibraryClick: false

    property var localdb: LocalDatabase{
        id: db
        visible: false
    }

    Component.onCompleted: {
        db.initDatabase();
    }

    //-- save app setting --//
    Settings{
        id: setting

        fileName: "setting"

        //-- information of user in profile page --//
        property var userInfo: []
        property string userName: ""
        property string userPhone: ""
        property string userEmail: ""
        property bool isLogined: false
    }

    //flags: Qt.WindowCloseButtonHint
    FontLoader{ id: segoeUI; source: "qrc:/Fonts/segoeui.ttf"}                          // segoeUI FONT
    FontLoader{ id: iranSans; source: "qrc:/Fonts/IRANSansMobile.ttf"}                  // iransans FONT
    FontLoader{ id: iranSansFAnum; source: "qrc:/Fonts/IRANSansMobile(FaNum).ttf"}                  // iranSans FARSI number FONT
    FontLoader{ id: iranSansMedium; source: "qrc:/Fonts/IRANSans_Medium.ttf"}           // iransans Medium FONT
    FontLoader{ id: webfont; source: "qrc:/Fonts/materialdesignicons-webfont.ttf"}      //ICONS FONT
    FontLoader{ id: nunito; source: "qrc:/Fonts/Nunito/Nunito-Regular.ttf"}      //ICONS FONT
    FontLoader{ id: nunito_italic; source: "qrc:/Fonts/Nunito/Nunito-Italic.ttf"}      //ICONS FONT
    FontLoader{ id: awesome; source: "qrc:/Fonts/fontawesome-webfont.ttf"}

    //-- font metric for size porpose --//
    FontMetrics{
        id: fontMetric
        font.family: iranSans.name
        font.pixelSize: Qt.application.font.pixelSize
    }

    Page{
        id: mainPage

        anchors.fill: parent

        state: "Home"
        states: [
            State{
                name: "Home"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 0
                    homeClick: true
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                }
            },
            State{
                name: "Registration"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 1
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                }
            },
            State{
                name: "Login"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 2
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                }
            },
            State{
                name: "Edit"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 3
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                }
            },
            State{
                name: "Membership"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 4
                    homeClick: false
                    membershipClick: true
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                }
            },
            State{
                name: "Serial Book"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 5
                    homeClick: false
                    membershipClick: false
                    serialBookClick: true
                    audioBookClick: false
                    yourLibraryClick: false
                }
            },
            State{
                name: "Audio Book"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 6
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: true
                    yourLibraryClick: false
                }
            },
            State{
                name: "Your Library"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 7
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: true
                }
            }

        ]

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
                    isClick: homeClick
                    text: "خانه"

                    onBtnClicked: {
                        mainPage.state = "Home"
                    }
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.02

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.diamond_stone
                    isClick: membershipClick
                    text: "اشتراک"
                    onBtnClicked: {
                        mainPage.state = "Membership"
                    }
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
                    isClick: serialBookClick
                    onBtnClicked: {
                        mainPage.state = "Serial Book"
                    }
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
                    isClick: audioBookClick
                    onBtnClicked: {
                        mainPage.state = "Audio Book"
                    }
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.02

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.library
                    text: "کتابخانه ی شما"
                    isClick: yourLibraryClick
                    onBtnClicked: {
                        mainPage.state = "Your Library"
                    }
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
                    Layout.preferredWidth: (setting.isLogined)? parent.width * 0.28 * ratio:parent.width * 0.1 * ratio

                    color: "transparent"

                    Layout.alignment: Qt.AlignVCenter
                }


                //-- account / login/ register --//
                Item{
                    id: accountItemHeader
                    Layout.preferredWidth: (setting.isLogined)?implicitWidth: parent.width * 0.2
                    Layout.fillHeight: parent.height
                    MouseArea{
                        id: accountPop
                        width: 300
                        height: accountPopEnabled * 400
                        Behavior on height {
                            NumberAnimation{duration: 300}
                        }

                        anchors.top: accountItemHeader.bottom
                        clip: true
                        visible: setting.isLogined
                        AccountPopup{
                            anchors.fill: parent
                        }
                    }

                    RowLayout{
                        anchors.fill: parent
                        spacing: 0

                        //-- Account Icon --//
                        Label{
                            visible: (setting.isLogined)
                            id: header_AccountICONArrow
                            Layout.fillHeight: true
                            Layout.preferredWidth: contentWidth
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            rotation: accountPopEnabled * 180

                            text: Icons.chevron_down
                            Behavior on rotation {
                                NumberAnimation{duration: 300}
                            }
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize *3 //Qt.application.font.pixelSize
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter

                            color: "red"
                            clip: true
                            elide: Text.ElideRight

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    accountPopEnabled = !accountPopEnabled
                                }
                            }
                        }

                        //-- Account Profile Name --//
                        Label{
                            visible: (setting.isLogined)
                            id: header_AccountName
                            Layout.fillHeight: true
                            Layout.preferredWidth: contentWidth
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10

//                            text: userInfo.name
                            text: setting.userName
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.5 //Qt.application.font.pixelSize
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignVCenter

                            color: "red"
                            clip: true
                            elide: Text.ElideRight
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    accountPopEnabled = !accountPopEnabled
                                }
                            }
                        }

                        //-- Account Icon --//
                        Label{
                            visible: (setting.isLogined)
                            id: header_AccountICON
                            Layout.fillHeight: true
                            Layout.preferredWidth: contentWidth
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10

                            text: Icons.account_circle_outline
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize *3 //Qt.application.font.pixelSize
                            renderType: Text.NativeRendering

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter

                            color: "red"
                            clip: true
                            elide: Text.ElideRight
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    accountPopEnabled = !accountPopEnabled
                                }
                            }
                        }

                        //-- Account login --//
                        Label{
                            id: header_AccountLogin
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.35
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10

                            visible: !setting.isLogined
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
                                    mainPage.state = "Login"
                                }
                            }
                        }

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: 5
                            visible: !setting.isLogined
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
                            visible: !setting.isLogined
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
                                    mainPage.state = "Registration"
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

//            MouseArea {
//                id: mainArea
//                anchors.fill: parent
//                hoverEnabled: true
//                propagateComposedEvents: true
//                onClicked: {
//                    accountPopEnabled = false
//                }
//            }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
                            }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
                            }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
                            }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
                            }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
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
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {

                                }
                            }
                        }

                        Item{Layout.preferredWidth: 20}

                    }
                }


            }
        }
    }
}
