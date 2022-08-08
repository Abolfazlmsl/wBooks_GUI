import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtMultimedia 5.15
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import Qt.labs.settings 1.1

import com.desktopFunctions 1.0

import "./Fonts/Icon.js" as Icons
import "./Utils/Enum.js" as Enum
import "./Utils/Utils.js" as Util

import "./Codes/Modules/Account/Popups"
import "./Codes/Modules/Items"
import "./Codes/LocalDatabase"
import "./Codes"
import "./Codes/Modules/Pages"
import "./Codes/Modules/MainModules/Player"

Window {
    id: win
    width: 1000
    height: 600
    minimumWidth: 1000
    minimumHeight: 600
    visibility: Qt.WindowFullScreen
    title: qsTr("wBooks_GUI")

    property double ratio: 1

    // Theme props
    property bool lightTheme: true
    property bool accountPopEnabled: false
    property bool inHomeMode: true
    property bool smallPlayerVis: true
    property int mainView: 8 // Home page
    property int myBooksView: 0
    property int rightView: 0
    property bool homeClick: true
    property bool membershipClick: false
    property bool serialBookClick: false
    property bool audioBookClick: false
    property bool yourLibraryClick: false
    property bool searchClick: false
    property string theme: "Light"
    property string playerSource: ""
    property string playerMediaType: "Video"

    onThemeChanged: {
        bookreader.changeReaderTheme(win.theme)
    }

    // Colors //
    property string color0: "#50d3d3d3" //main page color
    property string color1: "#d3d3d3" //Right panel color
    property string color2: "#990000" //Red colors
    property string color3: "#ffffff" //White color
    property string color4: "#000000" //Black color
    property string color5: "#0000ff" //Blue color
    property string color6: "#E91E63" //Pink
    property string color7: "green"
    property string color8: "#211D1D" //light black
    property string color9: "#778899" //blue-gray
    property string color10: "#E0EA65" //yellow
    property string color11: "darkblue"
    property string color12: "#444444" //light gray
    property string color13: "#f7f7f7" //white
    property string color14: "#3399ff" //light blue
    property string color15: "#a9a9a9" //very light gray
    property string color16: "red"
    property string color17: "#0091f8" //light blue
    property string color18: "gray"
    property string color19: "#dddddd"
    property string color20: "#1777c4"
    property string color21: "#6d8517"
    property string color22: "lawngreen"
    property string color23: "#9F9F9F"
    property string color_input: "#ffffff"

    function addOpacity(color, opacity){
        var color2 = color.split("#")
        var oColor = "#" + opacity + color2[1]
        return oColor
    }

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
                    theme: "Light"
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
                    theme: "SemiLight"
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
                    theme: "SemiDark"
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
                    theme: "Dark"
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

        // Read My Audio Books
        var obj = db.readAllData("myAudioBooks")
        var data
        for(var i=0 ; i< obj.length ; i++){
            data = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
            if (data.id === setting.user_id){
                myAudioBooksModel.append({
                                         "path": data.path,
                                             // Other props will be read from the database (api)
                                         "title": "",
                                         "author": "",
                                         "speaker": ""
                                         })
            }
        }

        // Read My Audio Books
        obj = db.readAllData("myBooks")
        for(i=0 ; i< obj.length ; i++){
            data = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
            if (data.id === setting.user_id){
                myAudioBooksModel.append({
                                         "path": data.path,
                                         "title": "",
                                         "author": "",
                                         "speaker": ""
                                         })
            }
        }


        // Read My Audio Books
        db.readAllData("myVideos")
        for(i=0 ; i< obj.length ; i++){
            data = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
            if (data.id === setting.user_id){
                myAudioBooksModel.append({
                                         "path": data.path,
                                         "title": "",
                                         "author": "",
                                         "speaker": ""
                                         })
            }
        }
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

        //reader properties
        property string cPath: ""
        property string openFileName: ""
        property bool lightMode: true
        property string font: "Times New Roman"
        property int fontCurrentIndex: 0
        property int fontSize: 15
        property real sliderValue: 1
        property int onepageHeight: 1
        property real stepSize: 1
        property bool isEpubViewer: true

        //-- information of user in profile page --//
        property var userInfo: []
        property string userName: ""
        property string userPhone: ""
        property string userEmail: ""
        property int user_id: 0
        property string password: ""
        property string profile: ""
        property string gender: ""
//        property string mybooks: ""
//        property string myaudiobooks: ""
//        property string myvideos: ""
//        property string mywallet: ""
//        property string mylicense: ""
//        property string profile: ""
//        property string user_id: ""
//        property string basket: ""
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

    BookReader{
        id: bookreader
        visible: false
    }


    //Player props
    property string lblTimeSpendmain: "00:00"
    property string lblTimeLackmain: "00:00"
    property bool topVisibility: true
    property bool toolsVisibility: true
    property int playerVolume: 100
    property int playerSpeed: 1
    property bool mutePlayer: false

    MediaPlayer {
        id: player
        //notifyInterval: 100
        source: playerSource
        onSourceChanged: player.play()

        onPositionChanged: {
            var min = Math.floor(player.position/60000)
            var sec = ((player.position - (min*60000))/1000).toFixed(0)

            var total_min = Math.floor(player.duration/60000)
            var total_sec = ((player.duration - (total_min*60000))/1000).toFixed(0)

            lblTimeSpendmain = (min<10 ? "0"+min : min) + ":" + (sec<10 ? "0"+sec : sec) + " / " + (total_min<10 ? "0"+total_min : total_min) + ":" + (total_sec<10 ? "0"+total_sec : total_sec)

            var lackTime = player.duration - player.position
            min = Math.floor(lackTime/60000)
            sec = ((lackTime - (min*60000))/1000).toFixed(0)

            lblTimeLackmain = (min<10 ? "0"+min : min) + ":" + (sec<10 ? "0"+sec : sec)
            if (player.position === player.duration){
                topVisibility = true
                toolsVisibility = true
            }
        }
    }

    VideoOutput{
        id: vidOutmain
        anchors.fill: parent
        visible: false
        source: player
    }

    Page{
        id: mainPage

        anchors.fill: parent

        state: "Home"
        states: [
            State{
                name: "Login"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 11
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Registration"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 12
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Edit"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 13
                    rightView: 1
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Home"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 10
                    rightView: 0
                    homeClick: true
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Membership"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 9
                    rightView: 0
                    homeClick: false
                    membershipClick: true
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Serial Book"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 8
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: true
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Audio Book"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 7
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: true
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "My Library"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 6
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: true
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "More Books"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 4
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Book Page"
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
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Audio Book Page"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 3
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
                }
            },
            State{
                name: "Search Page"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 5
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: true
                    smallPlayerVis: true
                }
            },
            State{
                name: "Media Page"
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
                    searchClick: false
                    smallPlayerVis: false
                }
            },
            State{
                name: "Basket"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 0
                    rightView: 0
                    homeClick: false
                    membershipClick: false
                    serialBookClick: false
                    audioBookClick: false
                    yourLibraryClick: false
                    accountPopEnabled: false
                    searchClick: false
                    smallPlayerVis: true
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
                    Layout.preferredWidth: parent.width * 0.07
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    source: "qrc:/Images/Wbooks1.png"
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
                    Layout.preferredWidth: parent.width * 0.015

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
                    Layout.preferredWidth: parent.width * 0.015

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
                    Layout.preferredWidth: parent.width * 0.015

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
                    Layout.preferredWidth: parent.width * 0.015

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.library
                    text: "کتابخانه ی شما"
                    isClick: yourLibraryClick
                    onBtnClicked: {
                        myBooksView = 0
                        mainPage.state = "My Library"
                    }
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.015

                    color: "transparent"
                }

                HeaderButton{
                    icon: Icons.magnify
                    text: "جستجو"
                    isClick: searchClick
                    onBtnClicked: {
                        mainPage.state = "Search Page"
                    }
                }

//                //-- Vertical Line After Profile Name --//
//                Rectangle{
//                    Layout.fillHeight: true
//                    Layout.preferredWidth: (setting.isLogined)? parent.width * 0.28 * ratio:parent.width * 0.1 * ratio

//                    color: "transparent"

//                    Layout.alignment: Qt.AlignVCenter
//                }

                Item { Layout.fillWidth: true }

                //-- account / login/ register --//
                Item{
                    id: accountItemHeader
                    Layout.preferredWidth: (setting.isLogined)?implicitWidth: parent.width * 0.2
                    Layout.fillHeight: true
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

                        //-- chevron Icon --//
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

                        Item { Layout.preferredWidth: 10 } //-- filler --//

                        Rectangle{
                            visible: (setting.isLogined)
                            Layout.preferredWidth: 40
                            Layout.fillHeight: true
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            color: "transparent"
                            Label{
                                id: header_basket
                                anchors.fill: parent
                                text: Icons.basket
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize *3 //Qt.application.font.pixelSize

                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter

                                color: color16
                                clip: true

                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {

                                    }
                                }
                            }

                            Rectangle{
                                visible: (basketModel.count > 0)
                                width: 22
                                height: width
                                radius: width / 2
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.topMargin: -3
                                anchors.rightMargin: -3
                                color: color15
                                Label{
                                    anchors.fill: parent
                                    text: basketModel.count
                                    font.family: iranSansFAnum.name
                                    font.pixelSize: Qt.application.font.pixelSize * 1.2 //Qt.application.font.pixelSize

                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter

                                    color: "#ffffff"
                                    clip: true
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    mainPage.state = "Basket"
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

                Item { Layout.preferredWidth: parent.width * 0.05 } //-- filler --//

            }
        }

        //-- Body --//
        Body{
            id: mainBody
            anchors.fill: parent

            PlayerSmallPanel{
                id: smallPlayer
                visible: (smallPlayerVis && player.playbackState!=0)
                width: parent.width
                height: 100
                clip: true
                anchors.bottom: mainBody.bottom
            }

            // Test open reader
            Rectangle{
                visible: false
                width: 50
                height: 50
                color: color12

                Label{
                    anchors.fill: parent
                    text: "Reader"
                    color: "white"
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        bookreader.visible = true
                    }
                }
            }
        }

        //-- Right Menu --//
        footer: Rectangle{
            id: mainFooter

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

        ListModel{
            id: myMembershipModel
            ListElement{
                time: 3
                remaining: 32
            }
        }

        ListModel{
            id: membershipModel
            ListElement{
                time: 1
                price: 100000
                color: "#00adb3"
            }
            ListElement{
                time: 3
                price: 300000
                color: "#D5D739"
            }
            ListElement{
                time: 6
                price: 600000
                color: "#25B767"
            }
            ListElement{
                time: 12
                price: 1200000
                color: "#D65524"
            }
        }

        ListModel{
            id: basketModel
            ListElement{
                book: 1 //the id of book in database
            }
            ListElement{
                book: 1
            }
        }

        ListModel{
            id: myBooksModel
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
            }
        }

        ListModel{
            id: myAudioBooksModel
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
                speaker: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
                speaker: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
                speaker: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
                speaker: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
                speaker: "عادل فردوسی پور"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
                author: "عادل فردوسی پور"
                speaker: "عادل فردوسی پور"
            }
        }

        ListModel{
            id: myVideosModel
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
            }
            ListElement{
                title: "مشاهده کتاب های سلامت و بهداشت"
            }
        }

        ListModel{
            id: searchModelTop
            ListElement{
                text: "مشاهده کتاب های سلامت و بهداشت"
            }
            ListElement{
                text: "کتاب های انتشارات دهکده سلامت"
            }
        }

        ListModel{
            id: searchModelBottom
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "تلاش در مسیر"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "مروری بر خاطرات"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/mebeforeyou.jpg"
                text1: "رمان حکومت نظامی"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "خوشه های خشم"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                rate: 37
                date: "1399/02/14"
            }
        }
    }
}
