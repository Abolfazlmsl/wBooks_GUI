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
import "./Codes/Modules/MainModules/Popup"
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

    property double ratio: win.width / 1366

    //Account Page props
    property int editFormIndex: 0 //Edit Page
    property string editAccountColor: ""
    property string walletColor: ""
    property string myBookColor: ""
    property string audioBookColor: ""
    property string changePassColor: ""
    property string commentsColor: ""
    property string aboutUsColor: ""
    property string supportColor: ""

    // Theme props
    property bool lightTheme: true
    property bool accountPopEnabled: false
    property bool inHomeMode: true
    property bool smallPlayerVis: true
    property bool secondHeaderVis: true
    property bool topFilterVis: false
    property string secondHeaderTitle: "خانه"
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
                    color0: "#B6B6B6"
                    color1: "#797E87"
                    color2: "#990000"
                    color3: "#ffffff"
                    color4: "#000000"
                    color5: "#0000ff"
                    color6: "#E91E63"
                    color7: "#16781D"
                    color8: "#434343"
                    color9: "#555555"
                    color10: "#E0EA65"
                    color11: "darkblue"
                    color12: "#5F5F5F"
                    color13: "#f7f7f7"
                    color14: "#3399ff"
                    color15: "#a9a9a9"
                    color16: "red"
                    color17: "#0091f8"
                    color18: "gray"
                    color19: "#989898"
                    color20: "#1777c4"
                    color21: "#6d8517"
                    color22: "lawngreen"
                    color23: "#9F9F9F"
                    color_input: "#B3B3B3"
                    Material.theme: Material.LightBlue
                }
            },
            State{
                name: "SemiDark"
                PropertyChanges {
                    target: win
                    theme: "SemiDark"
                    color0: "#323334"
                    color1: "#2E3137"
                    color2: "#990000"
                    color3: "#000000"
                    color4: "#ffffff"
                    color5: "#3CCE43"
                    color6: "#E91E63"
                    color7: "green"
                    color8: "#D8D5C7"
                    color9: "#778899"
                    color10: "#E0EA65"
                    color11: "#3CCE43"
                    color12: "#3CCE43"
                    color13: "#f7f7f7"
                    color14: "#3399ff"
                    color15: "#a9a9a9"
                    color16: "red"
                    color17: "#0091f8"
                    color18: "gray"
                    color19: "#686868"
                    color20: "#1777c4"
                    color21: "#6d8517"
                    color22: "lawngreen"
                    color23: "#4B4B4B"
                    color_input: "#5B5555"
                    Material.theme: Material.Grey
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

    property var accountpage: Item{
        id: accountObj
        visible: false

        state: "Account"
        states: [
            State{
                name: "Account"
                PropertyChanges {
                    target: win
                    editFormIndex: 0
                    editAccountColor: color7
                    walletColor: color4
                    myBookColor: color4
                    audioBookColor: color4
                    changePassColor: color4
                    commentsColor: color4
                    aboutUsColor: color4
                    supportColor: color4
                }
            },
            State{
                name: "Wallet"
                PropertyChanges {
                    target: win
                    editFormIndex: 1
                    editAccountColor: color4
                    walletColor: color7
                    myBookColor: color4
                    audioBookColor: color4
                    changePassColor: color4
                    commentsColor: color4
                    aboutUsColor: color4
                    supportColor: color4
                }
            },
            State{
                name: "My Books"
                PropertyChanges {
                    target: win
                    editFormIndex: 2
                    editAccountColor: color4
                    walletColor: color4
                    myBookColor: color7
                    audioBookColor: color4
                    changePassColor: color4
                    commentsColor: color4
                    aboutUsColor: color4
                    supportColor: color4
                }
            },
            State{
                name: "Audio Books"
                PropertyChanges {
                    target: win
                    editFormIndex: 3
                    editAccountColor: color4
                    walletColor: color4
                    myBookColor: color4
                    audioBookColor: color7
                    changePassColor: color4
                    commentsColor: color4
                    aboutUsColor: color4
                    supportColor: color4
                }
            },
            State{
                name: "Change Password"
                PropertyChanges {
                    target: win
                    editFormIndex: 4
                    editAccountColor: color4
                    walletColor: color4
                    myBookColor: color4
                    audioBookColor: color4
                    changePassColor: color7
                    commentsColor: color4
                    aboutUsColor: color4
                    supportColor: color4
                }
            },
            State{
                name: "Comments"
                PropertyChanges {
                    target: win
                    editFormIndex: 5
                    editAccountColor: color4
                    walletColor: color4
                    myBookColor: color4
                    audioBookColor: color4
                    changePassColor: color4
                    commentsColor: color7
                    aboutUsColor: color4
                    supportColor: color4
                }
            },
            State{
                name: "About us"
                PropertyChanges {
                    target: win
                    editFormIndex: 6
                    editAccountColor: color4
                    walletColor: color4
                    myBookColor: color4
                    audioBookColor: color4
                    changePassColor: color4
                    commentsColor: color4
                    aboutUsColor: color7
                    supportColor: color4
                }
            },
            State{
                name: "Support"
                PropertyChanges {
                    target: win
                    editFormIndex: 7
                    editAccountColor: color4
                    walletColor: color4
                    myBookColor: color4
                    audioBookColor: color4
                    changePassColor: color4
                    commentsColor: color4
                    aboutUsColor: color4
                    supportColor: color7
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
        setting.user_number = 0
        setting.mywallet = 0
        setting.licenseExpiredTime = ""
        setting.licenseTime = 0
        setting.licensePurchaseNumber = 0
        setting.licenseImage = ""
        setting.isLicense = false
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
        property int mywallet: 0
        property bool isLicense: false
        property string licenseExpiredTime: ""
        property int licenseTime: 0
        property int licensePurchaseNumber: 0
        property string licenseImage: ""
        property int user_number: 0
//        property string basket: ""
        property bool isLogined: false
        property string themeState: "Light"

        property string activeFont: kalameh_Regular.name
        property string activeNumFont: kalameh_Regular_Fa_Num.name

        property double fontRatio: 1
    }

    // mainFont ----> Font of Farsi
    // mainFaNumFont ----> Font of Farsi Numbers

    //flags: Qt.WindowCloseButtonHint
    FontLoader{ id: segoeUI; source: "qrc:/Fonts/segoeui.ttf"}                          // segoeUI FONT
    FontLoader{ id: iransans; source: "qrc:/Fonts/IRANSansMobile.ttf"}                  // iranSans FONT
    FontLoader{ id: iransansFaNum; source: "qrc:/Fonts/IRANSansMobile(FaNum).ttf"}                  // iranSans FARSI number FONT
    FontLoader{ id: mainFontMedium; source: "qrc:/Fonts/IRANSans_Medium.ttf"}           // iranSans Medium FONT
    FontLoader{ id: webfont; source: "qrc:/Fonts/materialdesignicons-webfont.ttf"}      //ICONS FONT
    FontLoader{ id: nunito; source: "qrc:/Fonts/Nunito/Nunito-Regular.ttf"}      //ICONS FONT
    FontLoader{ id: nunito_italic; source: "qrc:/Fonts/Nunito/Nunito-Italic.ttf"}      //ICONS FONT
//    FontLoader{ id: awesome; source: "qrc:/Fonts/fontawesome-webfont.ttf"}
    FontLoader{ id: awesome; source: "qrc:/Fonts/fa-regular-400.ttf"}
    FontLoader{ id: flaticon; source: "qrc:/Fonts/Flaticon.ttf"}
//    FontLoader{ id: mainFont; source: "qrc:/Fonts/Kalameh-Black.ttf"}                //Kalameh Black Font
    FontLoader{ id: kalameh_Bold; source: "qrc:/Fonts/Kalameh-Bold.ttf"}               //Kalameh Bold Font
    FontLoader{ id: kalameh_Regular; source: "qrc:/Fonts/Kalameh-Regular.ttf"}            //Kalameh Regular Font
    FontLoader{ id: kalameh_Thin; source: "qrc:/Fonts/Kalameh-Thin.ttf"}               //Kalameh Thin Font
//    FontLoader{ id: mainFaNumFont; source: "qrc:/Fonts/Kalameh(FaNum)-Black.ttf"}        //Kalameh Farsi Number Thin Font
    FontLoader{ id: kalameh_Bold_Fa_Num; source: "qrc:/Fonts/Kalameh(FaNum)-Bold.ttf"}       //Kalameh Farsi Number Thin Font
    FontLoader{ id: kalameh_Regular_Fa_Num; source: "qrc:/Fonts/Kalameh(FaNum)-Regular.ttf"}    //Kalameh Farsi Number Thin Font
    FontLoader{ id: kalameh_Thin_Fa_Num; source: "qrc:/Fonts/Kalameh(FaNum)-Thin.ttf"}       //Kalameh Farsi Number Thin Font

    //-- font metric for size porpose --//
    FontMetrics{
        id: fontMetric
        font.family: setting.activeFont
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
                name: "Category"
                PropertyChanges {
                    target: win
                    inHomeMode: true
                    mainView: 14
                    rightView: 0
                    homeClick: false
                    topFilterVis: false
                    secondHeaderVis: true
                    secondHeaderTitle: "دسته بندی"
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
                name: "Login"
                PropertyChanges {
                    target: win
                    inHomeMode: false
                    mainView: 11
                    rightView: 0
                    homeClick: false
                    topFilterVis: false
                    secondHeaderVis: false
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
                    topFilterVis: false
                    secondHeaderVis: false
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
                    secondHeaderVis: true
                    secondHeaderTitle: "پنل کاربری"
                    topFilterVis: false
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
                    topFilterVis: false
                    secondHeaderVis: true
                    secondHeaderTitle: "خانه"
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
                    topFilterVis: false
                    secondHeaderVis: true
                    secondHeaderTitle: "اشتراک"
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
                    topFilterVis: false
                    secondHeaderVis: true
                    secondHeaderTitle: "کتاب های سریالی"
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
                    topFilterVis: false
                    secondHeaderVis: true
                    secondHeaderTitle: "کتاب های صوتی"
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
                    secondHeaderVis: true
                    secondHeaderTitle: "کتابخانه"
                    topFilterVis: false
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
                    topFilterVis: true
                    secondHeaderVis: true
                    secondHeaderTitle: "کتاب های بیشتر"
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
                    topFilterVis: false
                    secondHeaderVis: false
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
                    topFilterVis: false
                    secondHeaderVis: false
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
                    topFilterVis: true
                    secondHeaderVis: true
                    secondHeaderTitle: "جستجو"
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
                    topFilterVis: false
                    secondHeaderVis: false
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
                    topFilterVis: false
                    secondHeaderVis: false
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

            color: "#292929"

            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                spacing: 0

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.01

                    color: "transparent"
                }

                Rectangle{
                    Layout.topMargin: 10
                    Layout.bottomMargin: 10
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.1
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
                    color: "transparent"
                    Image {
                        id: mainLogo
                        anchors.fill: parent
                        source: "qrc:/Images/Logo Footer2.png"
                        fillMode: Image.PreserveAspectFit
                        mipmap: true
                        visible: false
                    }

                    ColorOverlay {
                        anchors.fill: mainLogo
                        source: mainLogo
                        color: "#d43460"
                    }
                }

                //-- spacer --//
                Rectangle{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.04

                    color: "transparent"
                }

                //- navbar --//
                HeaderButton{

                    isClick: homeClick
                    text: "خانه"
                    iconAsImage: true
                    imgIcon: "qrc:/Icons/home.png"

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
                    iconAsImage: true
                    imgIcon: "qrc:/Icons/subscribe.png"
                    isClick: membershipClick
                    imageSize: 30
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
                    iconAsImage: true
                    imgIcon: "qrc:/Icons/education.png"
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
                    iconAsImage: true
                    imgIcon: "qrc:/Icons/audio-book.png"
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
                    iconAsImage: true
                    imgIcon: "qrc:/Icons/education.png"
                    text: "کتابخانه ی شما"
                    isClick: yourLibraryClick
                    onBtnClicked: {
                        myBooksView = 0
                        mainPage.state = "My Library"
                    }
                }

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

                        Rectangle{
                            Layout.preferredHeight: width
                            Layout.preferredWidth: 40
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            radius: width / 2
                            color: "#d43460"
                            Label{
                                anchors.centerIn: parent
                                text: Icons.power
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2 //* widthRatio

                                color: "#ffffff"
                            }

//                            SoundEffect{
//                                id: powerplaysound
//                                source: "soundeffect.wav"
//                            }

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
//                                    powerplaysound.play()
                                    quitPop.visible = true
                                }
                            }
                        }

                        Item{Layout.preferredWidth: 15*ratio}

                        //-- chevron Icon --//
                        Label{
                            visible: (setting.isLogined)
                            id: header_AccountICONArrow
                            Layout.fillHeight: true
                            Layout.preferredWidth: 40
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            rotation: accountPopEnabled * 180

                            text: Icons.chevron_down
                            Behavior on rotation {
                                NumberAnimation{duration: 300}
                            }
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize *3 * ratio //Qt.application.font.pixelSize
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
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio//Qt.application.font.pixelSize

                            verticalAlignment: Qt.AlignVCenter

                            color: color16
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
                            Layout.preferredWidth: 40
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10

                            text: Icons.account_circle_outline
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize *3 * ratio  //Qt.application.font.pixelSize
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

                        Item { Layout.preferredWidth: 10 * ratio} //-- filler --//

                        //-- Basket Icon --//
                        Rectangle{
                            visible: (setting.isLogined)
                            Layout.preferredWidth: 40 * ratio
                            Layout.fillHeight: true
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            color: "transparent"
                            Label{
                                id: header_basket
                                anchors.fill: parent
                                text: Icons.basket
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize *3 * ratio //Qt.application.font.pixelSize

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
                                width: 22 * ratio
                                height: width
                                radius: width / 2
                                anchors.right: parent.right
                                anchors.top: parent.top
                                anchors.topMargin: -3 * ratio
                                anchors.rightMargin: -3
                                color: color15
                                Label{
                                    anchors.fill: parent
                                    text: basketModel.count
                                    font.family: setting.activeNumFont
                                    font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //Qt.application.font.pixelSize

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

                        //-- Account register --//
                        ButtonImageIcon{
                            id: header_AccountRegister
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.85
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            visible: !setting.isLogined
                            radius: 15
                            textSize: 1.2 * ratio
                            color: "#ffffff"
                            icon: "qrc:/Icons/login.png"
                            iconSize: 30
                            iconColor: "#000000"
                            text: "همین حالا ثبت نام کن"
                            textColor: "#000000"
                            onBtnClicked: {
                                mainPage.state = "Registration"
                            }
                        }

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: 5
                            visible: !setting.isLogined
                            color: "transparent"

                            Layout.alignment: Qt.AlignVCenter
                        }

                        //-- Account login --//
                        ButtonImageIcon{
                            id: header_AccountLogin
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.5
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            visible: !setting.isLogined
                            radius: 15
                            textSize: 1.2 * ratio
                            color: "#d43460"
                            icon: "qrc:/Icons/user.png"
                            flip: true
                            iconColor: "#ffffff"
                            text: "ورود کاربر"
                            textColor: "#ffffff"
                            onBtnClicked: {
                                mainPage.state = "Login"
                            }
                        }

                        Item { Layout.preferredWidth: 20 }

                        //-- Search Icon --//
                        Rectangle{
                            Layout.preferredWidth: 40 * ratio
                            Layout.fillHeight: true
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            color: "transparent"
                            Label{
                                id: searchHeaderIcon
                                anchors.centerIn: parent
                                text: Icons.magnify
                                rotation: 90
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize *2.5*ratio //Qt.application.font.pixelSize

                                color: "#ffffff"
                                clip: true
                            }

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    mainPage.state = "Search Page"
                                }
                            }
                        }
                    }
                }

                Item { Layout.preferredWidth: 10 } //-- filler --//

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
            height: 40

            color: "#292929"

            //-- Right Menu Items --//
            RowLayout{
                anchors.fill: parent

                spacing: 0
                layoutDirection: Qt.RightToLeft

                Item{Layout.preferredWidth: 70}

                Rectangle{
                    Layout.preferredWidth: 130 * ratio
                    Layout.topMargin: 5
                    Layout.bottomMargin: 5
                    Layout.fillHeight: true
                    color: "transparent"
                    Image{
                        id: image
                        anchors.fill: parent
                        source: "qrc:/Images/Logo Footer2.png"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                        visible: false
                    }
                    ColorOverlay {
                        anchors.fill: image
                        source: image
                        color: "#d43460"
                    }
                }

                Item{Layout.preferredWidth: 25}

                Rectangle{
                    id: btn_theme
                    Layout.topMargin: 5
                    Layout.bottomMargin: 5
                    Layout.preferredWidth: 50 * ratio
                    Layout.preferredHeight: 20 * ratio
                    radius: 10
                    border.width: 3
                    border.color: if (setting.themeState === "Light"){
                                      return "white"
                                  }else if (setting.themeState === "SemiLight"){
                                      return "#B2B2B2"
                                  }else if (setting.themeState === "SemiDark"){
                                      return "white"
                                  }else if (setting.themeState === "Dark"){
                                      return "#B2B2B2"
                                  }

                    color: if (setting.themeState === "Light"){
                               return "white"
                           }else if (setting.themeState === "SemiLight"){
                               return "#B2B2B2"
                           }else if (setting.themeState === "SemiDark"){
                               return "transparent"
                           }else if (setting.themeState === "Dark"){
                               return "transparent"
                           }

                    Popup{
                        id: popuptheme
                        width: 150
                        height: 250
//                        padding: 0
                        y: -height
                        x: -width*0.35

                        background: Rectangle{
                            color: "#292929"
                        }

                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                        property bool state: false

                        Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 0
                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.themeState === "Light") ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Rectangle{
                                            Layout.preferredWidth: 20 * ratio
                                            Layout.preferredHeight: width
                                            radius: width / 2
                                            border.width: 3
                                            border.color: "white"
                                            color: "white"
                                        }

                                        Item{Layout.preferredWidth: 10}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "روشن"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}

                                    }
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

                                Item{Layout.preferredHeight: 5}
                                Rectangle{
                                    Layout.preferredHeight: 1
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    Layout.leftMargin: 5
                                    color: "white"
                                }
                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.themeState === "SemiLight") ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Rectangle{
                                            Layout.preferredWidth: 20* ratio
                                            Layout.preferredHeight: width
                                            radius: width / 2
                                            border.width: 3
                                            border.color: "#B2B2B2"
                                            color: "#B2B2B2"
                                        }

                                        Item{Layout.preferredWidth: 10}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "نیمه روشن"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}

                                    }
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

                                Item{Layout.preferredHeight: 5}
                                Rectangle{
                                    Layout.preferredHeight: 1
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    Layout.leftMargin: 5
                                    color: "white"
                                }
                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.themeState === "SemiDark") ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Rectangle{
                                            Layout.preferredWidth: 20* ratio
                                            Layout.preferredHeight: width
                                            radius: width / 2
                                            border.width: 3
                                            border.color: "white"
                        //                    color: "#25252C"
                                            color: "transparent"
                                        }

                                        Item{Layout.preferredWidth: 10}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "نیمه تاریک"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}

                                    }
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

                                Item{Layout.preferredHeight: 5}
                                Rectangle{
                                    Layout.preferredHeight: 1
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    Layout.leftMargin: 5
                                    color: "white"
                                }
                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.themeState === "Dark") ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Rectangle{
                                            Layout.preferredWidth: 20* ratio
                                            Layout.preferredHeight: width
                                            radius: width / 2
                                            border.width: 3
                                            border.color: "#B2B2B2"
                                            color: "transparent"
                        //                    color: "black"
                                        }

                                        Item{Layout.preferredWidth: 10}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "تاریک"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}
                                    }
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
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onClicked: {
                            if (popuptheme.state === false){
                                popuptheme.open()
                                popuptheme.state = true
                            }
                            else {
                                popuptheme.close()
                                popuptheme.state = false
                            }
                        }

                        onEntered: {
                            popupfont.close()
                            popuptheme.open()
                        }
                    }

                }

                Item{Layout.preferredWidth: 25}

                Rectangle{
                    id: btn_font
                    Layout.topMargin: 5
                    Layout.bottomMargin: 5
                    Layout.preferredWidth: 20 * ratio
                    Layout.preferredHeight: width
                    radius: width/2
                    border.width: 3
                    border.color: "white"

                    color: "transparent"
                    Label{
                        anchors.centerIn: parent
                        text: "F"
                        font.family: setting.activeFont
                        color: "white"
                        font.pixelSize: Qt.application.font.pixelSize * 1 * ratio
                    }

                    Popup{
                        id: popupfont
                        width: 150
                        height: 250
//                        padding: 0
                        y: -height
                        x: -width*0.5 + btn_changefont.implicitWidth*0.5

                        background: Rectangle{
                            color: "#292929"
                        }

                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                        property bool state: false

                        Rectangle{
                            id: btn_changefont
                            anchors.fill: parent
                            color: "transparent"
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 0
                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.activeFont === iransans.name) ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "ایران سانس"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}

                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {
                                            setting.activeFont = iransans.name
                                            setting.activeNumFont = iransansFaNum.name
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 5}
                                Rectangle{
                                    Layout.preferredHeight: 1
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    Layout.leftMargin: 5
                                    color: "white"
                                }
                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.activeFont === kalameh_Regular.name) ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "کلمه (عادی)"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}

                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {
                                            setting.activeFont = kalameh_Regular.name
                                            setting.activeNumFont = kalameh_Regular_Fa_Num.name
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 5}
                                Rectangle{
                                    Layout.preferredHeight: 1
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    Layout.leftMargin: 5
                                    color: "white"
                                }
                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.activeFont === kalameh_Bold.name) ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "کلمه (بولد)"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}

                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {
                                            setting.activeFont = kalameh_Bold.name
                                            setting.activeNumFont = kalameh_Bold_Fa_Num.name
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 5}
                                Rectangle{
                                    Layout.preferredHeight: 1
                                    Layout.fillWidth: true
                                    Layout.rightMargin: 5
                                    Layout.leftMargin: 5
                                    color: "white"
                                }
                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.preferredWidth: 5
                                            Layout.fillHeight: true
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * 1.2 * ratio //* widthRatio
                                            font.bold: true
                                            text: Icons.check
                                            color: "#d43460"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            visible: (setting.activeFont === kalameh_Thin.name) ? true:false
                                        }


                                        Item{Layout.preferredWidth: 5}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                                            text: "کلمه (نازک)"
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                        }

                                        Item{Layout.preferredWidth: 5}
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        hoverEnabled: true
                                        onClicked: {
                                            setting.activeFont = kalameh_Thin.name
                                            setting.activeNumFont = kalameh_Thin_Fa_Num.name
                                        }
                                    }
                                }
                            }
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onClicked: {
                            if (popupfont.state === false){
                                popupfont.open()
                                popupfont.state = true
                            }
                            else {
                                popupfont.close()
                                popupfont.state = false
                            }
                        }

                        onEntered: {
                            popuptheme.close()
                            popupfont.open()
                        }
                    }

                }


                Item{Layout.fillWidth: true}

                Rectangle{
                    Layout.preferredWidth: footertxt.contentWidth
                    Layout.fillHeight: true
                    color: "transparent"
                    Label{
                        id: footertxt
                        anchors.centerIn: parent
                        text: "تمامی حقوق این وبسایت متعلق به کمپانی وی بوکس می باشد"
                        font.family: setting.activeFont
                        font.pixelSize: Qt.application.font.pixelSize * 1.2  * ratio
                        color: "white"
                    }
                }

                Item{Layout.preferredWidth: 50}
            }
        }

        ListModel{
            id: membershipModel
            ListElement{
                time: 15
                price: 15000
                source: "qrc:/Images/bronze-medal.png"
                text1: "دسترسی به پنج میلیون نسخه"
                text2: "مشاهده و دانلود بر روی کامپیوتر"
                text3: "امکان دانلود کتاب های صوتی"
                text4: "مشاهده و دانلود بدون محدودیت"
                text5: "پشتیبانی 7 روزه و 24 ساعته"
            }
            ListElement{
                time: 30
                price: 30000
                source: "qrc:/Images/silver-medal.png"
                text1: "دسترسی به پنج میلیون نسخه"
                text2: "مشاهده و دانلود بر روی موبایل و کامپیوتر"
                text3: "امکان دانلود کتاب های صوتی"
                text4: "مشاهده و دانلود بدون محدودیت"
                text5: "پشتیبانی 7 روزه و 24 ساعته"
            }
            ListElement{
                time: 60
                price: 55000
                source: "qrc:/Images/gold-medal.png"
                text1: "دسترسی به پنج میلیون نسخه"
                text2: "مشاهده و دانلود بر روی موبایل و کامپیوتر"
                text3: "امکان دانلود کتاب های صوتی"
                text4: "مشاهده و دانلود بدون محدودیت"
                text5: "پشتیبانی 7 روزه و 24 ساعته"
            }
            ListElement{
                time: 180
                price: 95000
                source: "qrc:/Images/shield.png"
                text1: "دسترسی به پنج میلیون نسخه"
                text2: "مشاهده و دانلود بر روی موبایل و کامپیوتر"
                text3: "امکان دانلود کتاب های صوتی"
                text4: "مشاهده و دانلود بدون محدودیت"
                text5: "پشتیبانی 7 روزه و 24 ساعته"
            }
        }

        ListModel{
            id: basketModel
            ListElement{
                book: 1 //the id of book in database
                type: "Audio Book"
            }
            ListElement{
                book: 1
                type: "Document Book"
            }
            ListElement{
                book: 1
                type: "Membership"
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
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "مروری بر خاطرات"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/mebeforeyou.jpg"
                text1: "رمان حکومت نظامی"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "خوشه های خشم"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }

        }

        ListModel{
            id: membershipDocumentBookModel
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "تلاش در مسیر"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "مروری بر خاطرات"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/mebeforeyou.jpg"
                text1: "رمان حکومت نظامی"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "خوشه های خشم"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
        }

        ListModel{
            id: membershipAudioBookModel
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "تلاش در مسیر"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "مروری بر خاطرات"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/mebeforeyou.jpg"
                text1: "رمان حکومت نظامی"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "خوشه های خشم"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "سفرهای گالیور"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "0"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/warriorqueen.jpg"
                text1: "ولورانت گیمز"
                text2: "نوشته کیگو هیکاشینو"
                price: "25000"
                rate: 37
                date: "1399/02/14"
            }
        }

        ListModel{
            id:bestSellCatModel
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/mebeforeyou.jpg"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/time.jpg"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
        }

        ListModel{
            id: newBooksCatModel
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/mebeforeyou.jpg"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/time.jpg"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
            ListElement{
                source: "qrc:/Images/book.png"
                text1: "داستان و رمان"
                text2: "داستان و رمان"
                rate: 37
                date: "1399/02/14"
            }
        }

        ListModel{
            id: bestCollectionCatModel
            ListElement{
                source: "qrc:/Images/lordofrings.jpg"
                text1: "ارباب حلقه ها"
                booksNumber: 15
                rate: 37
                off: "off35"
            }
            ListElement{
                source: "qrc:/Images/finalfantasy.jpg"
                text1: "تصور نهایی"
                booksNumber: 17
                rate: 25
                off: "T6032"
            }
        }

    }

    onClosing: {
        close.accepted = false
        quitPop.visible = true
    }

    Quit_Popup{
        id: quitPop
        visible: false
        width: 350 * ratio
        height: 181 * ratio

        bodyText_Dialog: "آیا مطمئن هستید که می خواهید خارج شوید؟"

        x: (win.width / 2) -(width / 2) - 10
        y: (win.height / 2) - (height / 2) - 30
        onAccept: {
            quitPop.visible = false
            Qt.quit()
        }
        onCancel: {
            quitPop.visible = false
        }
    }
}
