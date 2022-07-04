import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.12

import "./../Fonts/Icon.js" as Icons
import "./../Utils/Enum.js" as Enum
import "./../Utils/Utils.js" as Util

import "./Modules/Account/Forms"
import "./Modules/Account/Panels"
import "./Modules/Pages"
import "./Modules/FilterPanel"

//-- Body --//
Rectangle{
    id: mainBody
    anchors.fill: parent

    property int editFormIndex: 0
    property string editAccountColor: ""
    property string walletColor: ""
    property string myBookColor: ""
    property string audioBookColor: ""
    property string changePassColor: ""
    property string commentsColor: ""
    property string aboutUsColor: ""
    property string supportColor: ""

    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: Qt.RightToLeft

        Item{
            Layout.preferredWidth: inHomeMode * parent.width * 0.15
            Layout.fillHeight: true
            StackLayout {
                id: barMainStack
                anchors.fill: parent
                currentIndex: rightView

                RightPanel{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }

                EditRightPanel{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
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
                    Layout.preferredHeight: 50
                    color: color0
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        layoutDirection: Qt.RightToLeft

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.75
                            color: "transparent"
                            clip: true
                            Label {
                                id: lbl_book_number
                                height: parent.height - 1
                                width: Text.contentWidth
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                text: "1000 کتاب موجود"
                                font.family: iranSansFAnum.name
                                font.pixelSize: Qt.application.font.pixelSize * 1.3
                                verticalAlignment: Qt.AlignVCenter
                                color: color5
                            }

                            Rectangle{
                                width: lbl_book_number.width
                                anchors.top: lbl_book_number.bottom
                                anchors.right: parent.right
                                anchors.rightMargin: 20
                                anchors.bottomMargin: 2
                                height: 2
                                color: color5
                            }

                            Rectangle {
                                width: parent.width * 0.8
                                anchors.right: lbl_book_number.left
                                anchors.bottomMargin: 2
                                color: "transparent"
                            }
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
                                color: color1
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
                    color: color1
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: color0

                    //-- Pages --//
                    SwipeView {
                        id: sView
                        anchors.fill: parent
                        interactive: false
                        clip: true
                        currentIndex: mainView

                        Item {
                            Home{
                                anchors.fill: parent
                                specialCatModel: specialCatModel
                                bestCatModel: bestCatModel
                                bestCollectionModel: bestCollectionModel
                                offerBooksModel: offerBooksModel
                            }
                        }

                        Item{
                            RegistrationForm{
                                anchors.fill: parent
                                anchors.topMargin: parent.height * 0.05
                                anchors.leftMargin: parent.width * 0.3
                                anchors.rightMargin: parent.width * 0.3

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

                        Item{
                            LoginForm{
                                anchors.fill: parent
                                anchors.topMargin: parent.height * 0.2
                                anchors.leftMargin: parent.width * 0.3
                                anchors.rightMargin: parent.width * 0.3

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
                        Item{
                            EditForm{
                                anchors.fill: parent
                                anchors.topMargin: parent.height * 0.1
                                anchors.leftMargin: parent.width * 0.3
                                anchors.rightMargin: parent.width * 0.3

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

                        }

                        Item {

                        }

                        Item{
                            MoreBooksPage{
                                id: morebooks
                                anchors.fill: parent
                                anchors.topMargin: 20
                            }
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
//            icon: "Icons.book_open_page_variant"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "سبک زندگی"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "مدیریت بازاریابی"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "روانشناسی"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "هنر"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "علوم تجربی"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "دین و عرفان"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "فلسفه و هنر"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "علم و فناوری"
//            icon: "Icons.heart_box"
        }
        ListElement{
            items: "خانواده, ایران شناسی, آشپزی"
            text: "کودک و نوجوان"
//            icon: "Icons.heart_box"
        }

    }

    ListModel{
        id: bestCatModel
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "داستان و رمان"
            text2: "داستان و رمان"
            rate: 37
            date: "1399/02/14"
        }
        ListElement{
            source: "qrc:/Images/callofduty.jpg"
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
        id: specialBooksModel
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
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "مروری بر خاطرات"
            text2: "نوشته کیگو هیکاشینو"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/mebeforeyou.jpg"
            text1: "رمان حکومت نظامی"
            text2: "نوشته کیگو هیکاشینو"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "خوشه های خشم"
            text2: "نوشته کیگو هیکاشینو"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "سفرهای گالیور"
            text2: "نوشته کیگو هیکاشینو"
            rate: 37
        }
        ListElement{
            source: "qrc:/Images/warriorqueen.jpg"
            text1: "ولورانت گیمز"
            text2: "نوشته کیگو هیکاشینو"
            rate: 37
        }
    }


}

