import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12

import "./../Fonts/Icon.js" as Icons
import "./../Utils/Enum.js" as Enum
import "./../Utils/Utils.js" as Util
import "./../REST/apiService.js" as Service
import "./../Functions/Funcs.js" as Functions

import "./Modules/Account/Forms"
import "./Modules/Account/Panels"
import "./Modules/MainModules/BookModule"
import "./Modules/MainModules/Ui_Module"
import "./Modules/MainModules/AudioBookModule"
import "./Modules/Pages"
import "./Modules/FilterPanel"

//-- Body --//
Rectangle{
    id: mainBody
    anchors.fill: parent

    property bool showRightPop: true

    signal bookReaderChangeTheme()
    onBookReaderChangeTheme: {
        readerpage.changeReaderTheme(win.theme)
    }

    SequentialAnimation{
        id: rightFilterHideAnim
        NumberAnimation{
            target: rightFilters; property: "Layout.preferredWidth"; to: 0; duration: 300
        }
        PropertyAnimation{
            target: mainBody; property: "showRightPop"; to: false; duration: 100
        }
    }

    SequentialAnimation{
        id: rightFilterShowAnim
        PropertyAnimation{
            target: mainBody; property: "showRightPop"; to: true; duration: 100
        }
        NumberAnimation{
            target: rightFilters; property: "Layout.preferredWidth"; to: parent.width * 0.15; duration: 300
        }
    }

    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: Qt.RightToLeft

        Item{
            id: rightFilters
            Layout.preferredWidth: parent.width * 0.15
            Layout.fillHeight: true
            visible: (inHomeMode) ? showRightPop:false

            StackLayout {
                id: barMainStack
                anchors.fill: parent
                currentIndex: rightView

                RightPanel{
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    onBtnClicked: {
                        rightFilterHideAnim.restart()
                    }
                }

                EditRightPanel{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    onBtnClicked: {
                        rightFilterHideAnim.restart()
                    }
                }
            }
        }

//        RightEditPanel{
//            Layout.preferredWidth: inHomeMode * parent.width * 0.15
//            Layout.fillHeight: true
//        }

        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            ColumnLayout{
                anchors.fill: parent
                spacing: 0

                Rectangle{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: color0

                    //-- Pages --//
                    StackLayout {
                        id: sView
                        anchors.fill: parent
//                        interactive: false
                        clip: true
                        currentIndex: mainView

                        Item{
                            BasketPage{
                                id: basketpage
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 10
                                anchors.topMargin: 10
                            }
                        }

                        Item{
                            MediaPlayerPage{
                                id: mediapage
                                anchors.fill: parent
                                anchors.leftMargin: 10
                                anchors.rightMargin: 10
                                anchors.topMargin: 10
                            }
                        }

                        Item {
                            Book{
                                id: bookpage
                                anchors.fill: parent
                            }
                        }

                        Item {
                            AudioBookPage{
                                id: audiobookpage
                                anchors.fill: parent
                            }
                        }

                        Item {
                            MoreBooksPage{
                                id: morebooks
                                anchors.fill: parent
                                anchors.topMargin: 20
                            }
                        }

                        Item {
                            SearchPage{
                                id: searchpage
                                anchors.fill: parent
                                anchors.topMargin: 20
                                itemModel: searchModelBottom
                            }
                        }


                        Item {
                            MyLibrary{
                                anchors.fill: parent
                            }
                        }

                        Item {
                            AudioBook{
                                anchors.fill: parent
                                newBooksModel: newAudioBooksModel
                                mostSellModel: mostSellAudioBooksModel
                                speakerModel: speakerAudioBooksModel
                            }

                        }


                        Item {
                            SerialBook{
                                anchors.fill: parent
                                specialBooksModel: specialBooksModel
                                writersModel: writersModel
                                prepurchaseModel: prepurchaseModel
                            }
                        }

                        Item {
                            MembershipPage{
                                anchors.fill: parent
                            }
                        }

                        Item {
                            Home{
                                anchors.fill: parent
//                                specialCatModel: specialCatModel
//                                bestCatModel: bestCatModel
//                                bestCollectionModel: bestCollectionModel
//                                offerBooksModel: offerBooksModel
                            }
                        }

                        Item {
                            LoginForm{
                                anchors.fill: parent
//                                anchors.topMargin: parent.height * 0.05
                                rMargin: parent.width * 0.25
                                lMargin: parent.width * 0.25

                                onGetMessage: {
                                    alarmLoginWin.msg = signalmsg
                                }
                            }
                            //-- Alarm --//
                            Rectangle{
                                id: alarmLoginWin

                                property string msg: ""

                                width: parent.width
                                height: lblAlarm3.implicitHeight * 2.5
                                anchors.bottom: parent.bottom

                                color: msg === "" ? "transparent" : color6

                                Label{
                                    id: lblAlarm3
                                    text: alarmLoginWin.msg
                                    anchors.centerIn: parent
                                    color: "#ffffff"

                                }
                            }

                        }

                        Item {
                            RegistrationForm{
                                anchors.fill: parent
//                                anchors.topMargin: parent.height * 0.05
                                rMargin: parent.width * 0.25
                                lMargin: parent.width * 0.25

                                onGetMessage: {
                                    alarmRegisteWin.msg = signalmsg
                                }
                            }
                            //-- Alarm --//
                            Rectangle{
                                id: alarmRegisteWin

                                property string msg: ""

                                width: parent.width
                                height: lblAlarm2.implicitHeight * 2.5
                                anchors.bottom: parent.bottom

                                color: msg === "" ? "transparent" : color6

                                Label{
                                    id: lblAlarm2
                                    text: alarmRegisteWin.msg
                                    anchors.centerIn: parent
                                    color: "#ffffff"

                                }
                            }

                        }

                        Item {
                            EditForm{
                                anchors.fill: parent

                                onGetMessage: {
                                    alarmEditWin.msg = signalmsg
                                }
                            }
                            //-- Alarm --//
                            Rectangle{
                                id: alarmEditWin

                                property string msg: ""

                                width: parent.width
                                height: lblAlarm4.implicitHeight * 2.5
                                anchors.bottom: parent.bottom

                                color: msg === "" ? "transparent" : color6

                                Label{
                                    id: lblAlarm4
                                    text: alarmEditWin.msg
                                    anchors.centerIn: parent
                                    color: "#ffffff"

                                }
                            }

                        }

                        Item {
                            CategoryPage{
                                id: categorypage
                                anchors.fill: parent
                                bestCollectionModel: bestCollectionCatModel
                                bestSellModel: bestSellCatModel
                                newBooksModel: newBooksCatModel
                            }
                        }

                        Item {
                            BookReader{
                                id: readerpage
                                anchors.fill: parent
                            }
                        }
                    }
                }
                //-- FOOTER --//
                Rectangle{
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
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 0.9
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
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                            color: "#ffffff"

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
            text: "همه"
        }
        ListElement{
            text: "کتاب صوتی"
        }
        ListElement{
            text: "کتاب متنی"
        }
    }

    ListModel{
        id: specialCatModel
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "داستان و رمان"
            isClicked: false
//            icon: "Icons.book_open_page_variant"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "سبک زندگی"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "مدیریت بازاریابی"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "روانشناسی"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "هنر"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "علوم تجربی"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "دین و عرفان"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "فلسفه و هنر"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "علم و فناوری"
            isClicked: false
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "کودک و نوجوان"
            isClicked: false
//            icon: "Icons.heart_box"
        }

    }

    ListModel{
        id: bestCatModel
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/callofduty.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/time.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
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
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
    }

    ListModel{
        id: bestCollectionModel
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

    ListModel{
        id: offerBooksModel
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/time.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
    }

    ListModel{
        id: newAudioBooksModel
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/time.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
    }

    ListModel{
        id: mostSellAudioBooksModel
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/time.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
    }

    ListModel{
        id: speakerAudioBooksModel
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "25000"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/time.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
    }

    ListModel{
        id: specialBooksModel
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
            price: "0"
            rate: 37
            date: "1399/02/14"
        }
    }

    ListModel{
        id: writersModel
        ListElement{
            source: "qrc:/Images/Adel.jpg"
            text1: "عادل فردوسی پور"
        }
        ListElement{
            source: "qrc:/Images/Adel.jpg"
            text1: "امیر قاسمی"
        }
        ListElement{
            source: "qrc:/Images/Adel.jpg"
            text1: "متین کریم زاده"
        }
        ListElement{
            source: "qrc:/Images/Adel.jpg"
            text1: "علی نظری زاده"
        }
        ListElement{
            source: "qrc:/Images/Adel.jpg"
            text1: "یاسین ترکی"
        }
        ListElement{
            source: "qrc:/Images/Adel.jpg"
            text1: "امیرعلی یاسر"
        }
    }

    ListModel{
        id: prepurchaseModel
        ListElement{
            source: "qrc:/Images/book.png"
            text1: "تلاش در مسیر"
            text2: "نوشته کیگو هیکاشینو"
            price: "25000"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "مروری بر خاطرات"
            text2: "نوشته کیگو هیکاشینو"
            price: "25000"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "رمان حکومت نظامی"
            text2: "نوشته کیگو هیکاشینو"
            price: "25000"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "خوشه های خشم"
            text2: "نوشته کیگو هیکاشینو"
            price: "0"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "سفرهای گالیور"
            text2: "نوشته کیگو هیکاشینو"
            price: "25000"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "ولورانت گیمز"
            text2: "نوشته کیگو هیکاشینو"
            price: "25000"
            rate: 37
        }
    }

    ListModel{
        id: relateBooksModel
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
    }

    ListModel{
        id: commentsModel
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
        ListElement{
            profile: ""
            name: "محسن حسنی"
            comment: "رمان عاشقانه من پیش از تو نوشته جوجو مویز را با ترجمه مریم مفتاحی به صورت الکترونیکی خریدم. بر این قصد بودم که بتوانم هر شب قبل از خواب بخشی از آن را بخوانم. شروع کردم، در گوشه‌ای از اتاق در سکوتی جاودانه داستان عاشقانه بین لوئیزا کلارک و ویل ترینر را از طریق تبلت می‌خواندم. آنقدر با کتاب اُنس یافته بودم که احساس می‌کردم از زندگی‌ام الهام گرفته شده است. هر شبم آکنده از غم، شادی، اشک و خنده بود، بی‌آنکه بدانم در کجایم، در داستان غرق شده بودم. هر لحظه بخش از رمان انگار تداعی بخش خاطره‌ای دور و تجربه‌ای نزدیک بود. مواقعی بعد از خواندن رمان من پیش از تو، افسردگی وجودم را می‌گرفت و زمانی از حس عاشقانه لبریزم می‌کرد. وقتی آخرین صفحات کتاب را خواندم و پایان داستان را فهمیدم، پیش از پیش به زندگی‌ام بالیدم؛ به ناگهان از جایم برخاستم و شتابان به اتاق همسرم رفتم و او را که بر روی ویلچرش نشسته بود، بوسه باران کردم. سپس همسرم رو به من کرد و گفت: «من فقط می‌خواهم مردی باشم که دختری با لباس قرمز در کنارم و در کنسرت موسیقی زنده نشسته‌ است؛ فقط برای چند دقیقه بیشتر.»"
            date: "یک هفته قبل"
            like: 22
            dislike: 5
        }
    }

    ListModel{
        id: document_booksModel
    }

    ListModel{
        id: audio_booksModel
    }

    ListModel{
        id: video_booksModel
    }

    ListModel{
        id: homeModel
        ListElement{
            type: "SpecialCategory"
            title: "دسته بندی های ویژه"
            source: ""
            fileType: ""
            canSelect: false
        }
        ListElement{
            type: "BestCategory"
            title: "برترین کتاب های ماه"
            source: ""
            canSelect: false
            fileType: ""
        }
        ListElement{
            type: "BestCollection"
            title: "مجموعه های برتر"
            source: ""
            canSelect: false
            fileType: ""
        }
        ListElement{
            type: "BooksList"
            title: "پیشنهادی برای شما"
            fileType: "Document"
            source: ""
            canSelect: false
        }
        ListElement{
            type: "Writers"
            title: "نویسندگان محبوب"
            source: ""
            canSelect: false
            fileType: ""
        }
        ListElement{
            type: "Writers"
            title: "صداهای محبوب"
            source: ""
            canSelect: false
            fileType: ""
        }
        ListElement{
            type: "Advertisement"
            title: ""
            source: "qrc:/Images/Adver1.jpg"
            canSelect: true
            fileType: ""
        }
        ListElement{
            type: "Advertisement"
            title: ""
            source: "qrc:/Images/Adver2.jpg"
            canSelect: false
            fileType: ""
        }
        ListElement{
            type: "BooksList"
            title: "تازه های نشر ققنوس"
            source: ""
            fileType: "Document"
            canSelect: false
        }
        ListElement{
            type: "Footer"
            title: ""
            source: ""
            fileType: ""
            canSelect: false
        }
    }


    Component.onCompleted:{
//        var d  = Service.get_all(Service.document_books , function(data){
//            var allbooks = data.length
//            for(var i=0 ; i< data.length ; i++){
//                document_booksModel.append({
//                                               "writer": "",
//                                               "publisher":"",
//                                               "pages":"",
//                                               "price":"",
//                                               "filetype":"",
//                                               "isbn":"",
//                                               "introduction":"",
//                                               "comments":"",
//                                               "publish_date":"",
//                                               "score":"",
//                                               "votes":"",
//                                               "age_limit":"",
//                                               "purchase_count":"",
//                                               "category":"",
//                                               "user_request": ""

//                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

//        var d1  = Service.get_all(Service.audio_books , function(data1){
//            var allAudiobooks = data1.length
//            for(var i=0 ; i< data1.length ; i++){
//                audio_booksModel.append({
//                                               "writer": "",
//                                               "speaker":"",
//                                               "publisher":"",
//                                               "time":"",
//                                               "price":"",
//                                               "filetype":"",
//                                               "isbn": "",
//                                               "introduction":"",
//                                               "comments":"",
//                                               "publish_date":"",
//                                               "score":"",
//                                               "votes":"",
//                                               "age_limit":"",
//                                               "purchase_count":"",
//                                               "category":"",
//                                               "user_request": ""

//                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

//        var d2  = Service.get_all(Service.audio_books , function(data2){
//            var allVideobooks = data2.length
//            for(var i=0 ; i< data2.length ; i++){
//                video_booksModel.append({
//                                               "writer": "",
//                                               "publisher":"",
//                                               "time":"",
//                                               "price":"",
//                                               "filetype":"",
//                                               "isbn": "",
//                                               "introduction":"",
//                                               "comments":"",
//                                               "publish_date":"",
//                                               "score":"",
//                                               "votes":"",
//                                               "age_limit":"",
//                                               "purchase_count":"",
//                                               "category":"",
//                                               "user_request": ""
//                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

//        var d3  = Service.get_all(Service.category , function(data3){
//            var categories = data3.length
//            for(var i=0 ; i< data3.length ; i++){
//                specialCatModel.append({
//                                               "text": data3[i].name,
//                                               "items":""
//                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

//        var d4  = Service.get_all(Service.writers , function(data4){
//            var writers = data4.length
//            for(var i=0 ; i< data4.length ; i++){
//                 writersModel.append({
//                                               "source": data4[i].name,
//                                               "text1":"",
//                                               "purchase_count": "",
//                                               "votes": ""
//                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

//        var d5  = Service.get_all(Service.speakers , function(data5){
//            var speakers = data5.length
//            for(var i=0 ; i< data5.length ; i++){
////                 speakersModel.append({
////                                               "source": data4[i].name,
////                                               "text1":"",
////                                               "purchase_count": "",
////                                               "votes": ""
////                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

//        var d6  = Service.get_all(Service.publishers , function(data6){
//            var publishers = data6.length
//            for(var i=0 ; i< data6.length ; i++){
////                 publishersModel.append({
////                                               "source": data4[i].name,
////                                               "text1":"",
////                                               "purchase_count": "",
////                                               "votes": ""
////                                           })
//            }
//            Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))

//        })

        //Sample
//        Functions.listModelSort(model, (a, b) => (b.grade - a.grade), (a, b) => (b.minute - a.minute), (a, b) => (b.second - a.second))
    }

    Component{
        id: specialCategoryCom
        SpecialCategory{
            width: parent.width
            height: 450
            title: modelTitle
        }
    }

    Component{
        id: bestCategoryCom
        BestCategory{
            id: best_cat
            width: parent.width
            height: 450
            title: modelTitle
            itemModel: bestCatModel
            onMoreBtnClicked: {
                morebooks.itemModel = bestCatModel
                morebooks.title = best_cat.title
            }
        }
    }

    Component{
        id: bestCollectionCom
        BestCollection{
            width: parent.width
            height: 350
            title: modelTitle
            itemModel: bestCollectionModel
        }
    }

    Component{
        id: bookListCom
        BooksList{
            width: parent.width
            height: 450
            title: modelTitle
            fileType: "Document"
            itemModel: offerBooksModel

            onMoreBtnClicked: {
                //                        morebooks.itemModel = offerBooksModel
                //                        morebooks.title = offer_books.title
            }
        }
    }

    Component{
        id: writersCom
        Writers{
            width: parent.width
            height: 250
            title: modelTitle
            itemModel: writersModel

            onMoreBtnClicked: {
                //                        morebooks.itemModel = writersModel
                //                        morebooks.title = writers.title
            }
        }
    }

    Component{
        id: advertisementCom
        Advertisement{
            width: parent.width
            height: 220
            source: modelSource
            selectable: modelSelectable
        }
    }

    Component{
        id: footerCom
        Footer{
            width: parent.width
            height: 270
        }
    }
}

