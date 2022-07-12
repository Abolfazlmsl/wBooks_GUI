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

                RowLayout{
                    anchors.fill: parent
                    anchors.topMargin: 100
                    spacing: 40
                    layoutDirection: Qt.RightToLeft

                    Item {
                        Layout.fillWidth: true
                    }

                    CategoryButton{
                        Layout.preferredWidth: 280 //* widthRatio
                        Layout.fillHeight: true
                        picSource: "qrc:/Images/MyBooks.png"
                        title: "کتاب های من"
                        bgColor: "#00adb3"

                        onDashboard_btnClicked: {
                            myBooksView = 1
                        }
                    }

                    CategoryButton{
                        Layout.preferredWidth: 280 //* widthRatio
                        Layout.fillHeight: true
                        picSource: "qrc:/Images/music2.png"
                        title: "کتاب های صوتی من"
                        bgColor: "#6c88b7"

                        onDashboard_btnClicked: {
                            myBooksView = 2
                        }
                    }

                    CategoryButton{
                        Layout.preferredWidth: 280 //* widthRatio
                        Layout.fillHeight: true
                        picSource: "qrc:/Images/video.jpg"
                        title: "ویدیوهای من"
                        bgColor: "#2384b6"

                        onDashboard_btnClicked: {
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
