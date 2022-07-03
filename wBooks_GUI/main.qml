import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.1

import com.desktopFunctions 1.0

import "./Fonts/Icon.js" as Icons
import "./Utils/Enum.js" as Enum
import "./Utils/Utils.js" as Util

import "./Codes/Modules"
import "./Codes/LocalDatabase"
import "./Codes"

Window {
    id: win
    width: 1000
    height: 600
    minimumWidth: 1000
    minimumHeight: 600
    visibility: Qt.WindowFullScreen
    visible: true
    title: qsTr("wBooks_GUI")

    property double ratio: 1

    // Theme props
    property bool lightTheme: true
    property bool accountPopEnabled: false
    property bool inHomeMode: true
    property int mainView: 0
    property int rightView: 0
    property bool homeClick: true
    property bool membershipClick: false
    property bool serialBookClick: false
    property bool audioBookClick: false
    property bool yourLibraryClick: false

    // Colors //
    property string color0: "#50d3d3d3"
    property string color1: "#d3d3d3"
    property string color2: "#990000"
    property string color3: "#ffffff"
    property string color4: "#000000"
    property string color5: "#0000ff"
    property string color6: "#E91E63"
    property string color7: "green"
    property string color8: "#211D1D"
    property string color9: "#778899"
    property string color10: "#E0EA65"
    property string color11: "darkblue"
    property string color12: "#444444"
    property string color13: "#f7f7f7"
    property string color14: "#3399ff"
    property string color15: "#a9a9a9"
    property string color16: "red"
    property string color17: "#0091f8"
    property string color18: "gray"
    property string color19: "#dddddd"
    property string color20: "#1777c4"
    property string color21: "#6d8517"
    property string color22: "lawngreen"
    property string color23: "#9F9F9F"
    property string color_input: "#ffffff"

    // Theme of the software //
    property var changeTheme: Item{
        id: theme
        visible: false

        state: setting.themeState
        states: [
            State{
                name: "Light"
                PropertyChanges {
                    target: win
                    color0: "#50d3d3d3"
                    color1: "#d3d3d3"
                    color2: "#990000"
                    color3: "#ffffff"
                    color4: "#000000"
                    color5: "#0000ff"
                    color6: "#E91E63"
                    color7: "green"
                    color8: "#211D1D"
                    color9: "#778899"
                    color10: "#E0EA65"
                    color11: "darkblue"
                    color12: "#444444"
                    color13: "#f7f7f7"
                    color14: "#3399ff"
                    color15: "#a9a9a9"
                    color16: "red"
                    color17: "#0091f8"
                    color18: "gray"
                    color19: "#dddddd"
                    color20: "#1777c4"
                    color21: "#6d8517"
                    color22: "lawngreen"
                    color23: "#9F9F9F"
                    color_input: "#ffffff"
                    Material.theme: Material.Light
                }
            },
            State{
                name: "SemiLight"
                PropertyChanges {
                    target: win
                    color0: "#50d3d3d3"
                    color1: "#d3d3d3"
                    color2: "#990000"
                    color3: "#ffffff"
                    color4: "#000000"
                    color5: "#0000ff"
                    color6: "#E91E63"
                    color7: "green"
                    color8: "#211D1D"
                    color9: "#778899"
                    color10: "#E0EA65"
                    color11: "darkblue"
                    color12: "#444444"
                    color13: "#f7f7f7"
                    color14: "#3399ff"
                    color15: "#a9a9a9"
                    color16: "red"
                    color17: "#0091f8"
                    color18: "gray"
                    color19: "#dddddd"
                    color20: "#1777c4"
                    color21: "#6d8517"
                    color22: "lawngreen"
                    color23: "#9F9F9F"
                    color_input: "#ffffff"
                    Material.theme: Material.Light
                }
            },
            State{
                name: "SemiDark"
                PropertyChanges {
                    target: win
                    color0: "#50d3d3d3"
                    color1: "#d3d3d3"
                    color2: "#990000"
                    color3: "#ffffff"
                    color4: "#000000"
                    color5: "#0000ff"
                    color6: "#E91E63"
                    color7: "green"
                    color8: "#211D1D"
                    color9: "#778899"
                    color10: "#E0EA65"
                    color11: "darkblue"
                    color12: "#444444"
                    color13: "#f7f7f7"
                    color14: "#3399ff"
                    color15: "#a9a9a9"
                    color16: "red"
                    color17: "#0091f8"
                    color18: "gray"
                    color19: "#dddddd"
                    color20: "#1777c4"
                    color21: "#6d8517"
                    color22: "lawngreen"
                    color23: "#9F9F9F"
                    color_input: "#ffffff"
                    Material.theme: Material.Light
                }
            },
            State{
                name: "Dark"
                PropertyChanges {
                    target: win
                    color0: "#0E0F10" //
                    color1: "#121315" //
                    color2: "#990000"
                    color3: "#000000" //
                    color4: "#ffffff" //
                    color5: "green" //
                    color6: "#E91E63"
                    color7: "green"
                    color8: "#C7C4B7" //
                    color9: "#778899"
                    color10: "#E0EA65"
                    color11: "green" //
                    color12: "green" //
                    color13: "#f7f7f7"
                    color14: "#3399ff"
                    color15: "#a9a9a9"
                    color16: "red"
                    color17: "#0091f8"
                    color18: "gray"
                    color19: "#000000" //
                    color20: "#1777c4"
                    color21: "#6d8517"
                    color22: "lawngreen"
                    color23: "#1B1B1B" //
                    color_input: "#211D1D" //
                    Material.theme: Material.Dark //
                }
            }
        ]

    }


    property var localdb: LocalDatabase{
        id: db
        visible: false
    }

    property var desktopfunctions: Desktopfunctions{
        id: desktopfunctions
    }

    Component.onCompleted: {
        db.initDatabase();
    }

    function resetSetting(){
        setting.isLogined = false
        setting.userName = ""
        setting.userEmail = ""
        setting.userPhone = ""
        setting.password = ""
        setting.user_id = 0
        setting.profile = ""
        setting.gender = ""
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
        property int user_id: 0
        property string password: ""
        property string profile: ""
        property string gender: ""
        property bool isLogined: false
        property string themeState: "Light"
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
                    rightView: 0
                    homeClick: true
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Registration"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 1
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Login"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 2
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Edit"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 3
                    rightView: 1
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Membership"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 4
                    rightView: 0
                    homeClick: false
                    membershipClick: true
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Serial Book"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 5
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: true
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Audio Book"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 6
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: true
                    yourLibraryClick: false
                    accountPopEnabled: false
                }
            },
            State{
                name: "Your Library"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 7
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: true
                    accountPopEnabled: false
                }
            }

        ]

        //-- HEADER --//
        header: Rectangle{
            id: mainHeader

            width: parent.width
            height: 60 //* ratio

            color: "#000000"

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

                    color: "#ffffff"

                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.015

                    color: "#000000"
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

                            color: color16
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

                            color: color16
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

                            color: color16
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
                                color: color22
                                width: parent.width
                                height: parent.height
                            }
                            color: "#000000"
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
                                color: color16
                                width: parent.width
                                height: parent.height
                            }
                            color: "#ffffff"
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

            color: "#444444"

            //-- Right Menu Items --//
            RowLayout{
                anchors.fill: parent

                spacing: 0
                layoutDirection: Qt.RightToLeft

                Item{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.15
                    RowLayout{
                        anchors.fill: parent
                        anchors.rightMargin: 50
                        anchors.leftMargin: 50
                        spacing: 0
                        layoutDirection: Qt.RightToLeft

                        Rectangle{
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: width
                            radius: width / 2
                            color: "black"
                            ToolTip.text: "تاریک"
                            ToolTip.visible: "تاریک" ? theme1.containsMouse : false
                            MouseArea{
                                id: theme1
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true
                                onClicked: {
                                    setting.themeState = "Dark"
                                }
                            }
                        }

                        Rectangle{
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: width
                            radius: width / 2
                            color: "#25252C"
                            ToolTip.text: "نیمه تاریک"
                            ToolTip.visible: "نیمه تاریک" ? theme2.containsMouse : false
                            MouseArea{
                                id: theme2
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true
                                onClicked: {
                                    setting.themeState = "SemiDark"
                                }
                            }
                        }

                        Rectangle{
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: width
                            radius: width / 2
                            ToolTip.text: "نیمه روشن"
                            ToolTip.visible: "نیمه روشن" ? theme3.containsMouse : false
                            color: "#B2B2B2"
                            MouseArea{
                                id: theme3
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true
                                onClicked: {
                                    setting.themeState = "SemiLight"
                                }
                            }
                        }

                        Rectangle{
                            Layout.preferredWidth: 20
                            Layout.preferredHeight: width
                            radius: width / 2
                            ToolTip.text: "روشن"
                            ToolTip.visible: "روشن" ? theme4.containsMouse : false
                            color: "white"
                            MouseArea{
                                id: theme4
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                hoverEnabled: true
                                onClicked: {
                                    setting.themeState = "Light"
                                }
                            }
                        }

                    }
                }

                Rectangle{
                    Layout.preferredWidth: 1
                    Layout.fillHeight: true
                    Layout.topMargin: 20
                    Layout.bottomMargin: 20
                    color: "#ffffff"
                }

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
                            color: "#ffffff"
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
                            color: "#ffffff"
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
                            color: "#ffffff"
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
                            color: "#ffffff"
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
                            color: "#ffffff"
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
