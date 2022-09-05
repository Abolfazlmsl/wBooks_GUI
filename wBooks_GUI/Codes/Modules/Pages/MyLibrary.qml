import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

import "./../../Modules/Items"
import "./../MainModules/Ui_Module"

Item {

    //-- Pages --//
    SwipeView {
        id: mybookView
        anchors.fill: parent
        interactive: false
        clip: true
        currentIndex: myBooksView

        Item{
            Rectangle{
                anchors.fill: parent
                color: "transparent"

                Rectangle{
                    id: titleRec
                    width: parent.width
                    height: 10
                    anchors.top: parent.top
                    anchors.topMargin: 60
                    color: "transparent"
                    Label{
                        id: txt1
                        anchors.fill: parent
                        anchors.leftMargin: 120 * ratio
                        text: "کتابخانه ی من"
                        font.family: setting.activeFont
                        color: color4
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        LayoutMirroring.enabled: true
                    }
                }

                RowLayout{
                    width: parent.width
                    height: parent.height - titleRec.height - 80
                    anchors.top: titleRec.bottom
                    spacing: 40
                    layoutDirection: Qt.RightToLeft

                    Item {
                        Layout.fillWidth: true
                    }

                    MyLibraryItem{
                        Layout.preferredWidth: 280 * ratio //* widthRatio
                        Layout.preferredHeight: 350 * ratio
                        title: "کتاب های متنی من"
                        btnTitle: "مشاهده مجموعه"
                        imgSource: "qrc:/Images/myBooks.jpg"
                        btnTextColor: color3
                        radiusBtn: 0
                        colorBtn: color8
                        percent: 57
                        firstColor: color4
                        progressThickness: 10
                        secondColor: "#2cbbb9"
                        itemModel: myBooksModel

                        onBtnClicked: {
                            myBooksView = 1
                        }
                    }

                    MyLibraryItem{
                        Layout.preferredWidth: 280 * ratio //* widthRatio
                        Layout.preferredHeight: 350 * ratio
                        title: "کتاب های صوتی من"
                        btnTitle: "مشاهده مجموعه"
                        imgSource: "qrc:/Images/myAudioBooks.jpg"
                        btnTextColor: color3
                        radiusBtn: 0
                        colorBtn: color8
                        percent: 34
                        firstColor: color4
                        progressThickness: 10
                        secondColor: "#2cbbb9"
                        itemModel: myAudioBooksModel

                        onBtnClicked: {
                            myBooksView = 2
                        }
                    }

                    MyLibraryItem{
                        Layout.preferredWidth: 280 * ratio //* widthRatio
                        Layout.preferredHeight: 350 * ratio
                        title: "ویدئوهای من"
                        btnTitle: "مشاهده مجموعه"
                        imgSource: "qrc:/Images/myVideos.jpg"
                        btnTextColor: color3
                        radiusBtn: 0
                        colorBtn: color8
                        percent: 21
                        firstColor: color4
                        progressThickness: 10
                        secondColor: "#2cbbb9"
                        itemModel: myVideosModel

                        onBtnClicked: {
                            myBooksView = 3
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }
            }
        }

        Item{
            MyBooksList{
                anchors.fill: parent
            }
        }

        Item{
            MyAudioBooksList{
                anchors.fill: parent
            }
        }

        Item{
            MyVideos{
                anchors.fill: parent
            }
        }
    }
}
