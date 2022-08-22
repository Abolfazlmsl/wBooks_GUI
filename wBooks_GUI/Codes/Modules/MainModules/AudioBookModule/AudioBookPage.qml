import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

import "./../../Items"
import "./../Ui_Module"

Flickable {
    anchors.fill: parent
    contentWidth: parent.width
    contentHeight: book.height

    Item{
        id: book
        implicitWidth: parent.width
        implicitHeight: childrenRect.height

        ColumnLayout{
            width: parent.width
            spacing: 0

            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 300
                color: color1

                Item{
                    anchors.fill: parent
                    anchors.topMargin: 50
                    anchors.rightMargin: 70
                    anchors.bottomMargin: 50
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        spacing: 0
                        Rectangle{
                            id: iconRec
                            Layout.preferredWidth: parent.width * 0.2
                            Layout.fillHeight: true

                            color: color8
                            Image {
                                anchors.fill: parent
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.margins: 8
                                source: "qrc:/Images/mebeforeyou.jpg"
                                mipmap: true
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        Item{Layout.preferredWidth: 30}

                        Item{
                            Layout.preferredWidth: parent.width * 0.4
                            Layout.fillHeight: true
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 0

                                Rectangle{
                                    id: title1Rec
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    color: "transparent"
                                    Label{
                                        id: txt1
                                        anchors.fill: parent
                                        text: "من پیش از تو"
                                        font.family: mainFont.name
                                        font.bold: true
                                        color: color4
                                        verticalAlignment: Qt.AlignVCenter
                                    }
                                }

                                Rectangle{
                                    id: title2Rec
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    color: "transparent"
                                    Label{
                                        id: txt2
                                        anchors.fill: parent
                                        text: "نویسنده: جوجو مویز"
                                        font.family: mainFont.name
                                        color: color9
                                        verticalAlignment: Qt.AlignVCenter
                                        font.pixelSize: Qt.application.font.pixelSize
                                    }
                                }
                                Rectangle{
                                    id: title3Rec
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    color: "transparent"
                                    Label{
                                        id: txt3
                                        anchors.fill: parent
                                        text: "مترجم: غزال حیدری"
                                        font.family: mainFont.name
                                        color: color9
                                        verticalAlignment: Qt.AlignVCenter
                                        font.pixelSize: Qt.application.font.pixelSize
                                    }
                                }

                                Rectangle{
                                    id: title4Rec
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    color: "transparent"
                                    Label{
                                        id: txt4
                                        anchors.fill: parent
                                        text: "ناشر: نشر ترنگ"
                                        font.family: mainFont.name
                                        color: color9
                                        verticalAlignment: Qt.AlignVCenter
                                        font.pixelSize: Qt.application.font.pixelSize
                                    }
                                }

                                Item{Layout.fillHeight: true}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft

                                        Rectangle{
                                            Layout.fillHeight: true
                                            Layout.preferredWidth: parent.width * 0.2
                                            color: "transparent"
                                            Rating{
                                                anchors.fill: parent
                                                selectable: true
                                            }
                                        }

                                        Rectangle{
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            color: "transparent"
                                            Label{
                                                anchors.fill: parent
                                                text: "(" + "27" + " رای)"
                                                font.family: mainFaNumFont.name
                                                color: color9
                                                verticalAlignment: Qt.AlignVCenter
                                                font.pixelSize: Qt.application.font.pixelSize * 0.9
                                                elide: Text.ElideRight
                                            }
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 20}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.2
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft

                                        ButtonShadow{
                                            id: btnview
                                            Layout.fillHeight: true
                                            Layout.preferredWidth: parent.width * 0.25
                                            btnText: "شنیدن کتاب"
                                            textColor: "#ffffff"
                                            fontSize: 1
                                            btnRadius: 0
                                            btnColor: color2
                                            onDashboard_btnClicked: {
                                                mainPage.state = "Media Page"
                                            }
                                        }

                                        ButtonShadow{
                                            id: btnpurchase
                                            Layout.fillHeight: true
                                            Layout.preferredWidth: parent.width * 0.25
                                            btnText: "خرید کتاب"
                                            textColor: "#ffffff"
                                            fontSize: 1
                                            btnRadius: 0
                                            btnColor: color2
                                            onDashboard_btnClicked: {

                                            }
                                        }

                                        Rectangle{
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            color: "transparent"
                                            Label{
                                                anchors.fill: parent
                                                text: "قیمت: " + Functions.numberWithCommas("26000") + " تومان"
                                                font.family: mainFaNumFont.name
                                                color: color2
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Qt.AlignHCenter
                                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                                elide: Text.ElideRight
                                            }
                                        }
                                    }
                                }

                            }
                        }

                        Item{
                            Layout.preferredWidth: parent.width * 0.1
                            Layout.fillHeight: true
                        }

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            color: "transparent"

                            Item{
                                anchors.fill: parent
                                ColumnLayout{
                                    anchors.fill: parent
                                    spacing: 0
                                    Item{
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: parent.height * 0.1
                                        RowLayout{
                                            anchors.fill: parent
                                            spacing: 0

                                            layoutDirection: Qt.RightToLeft

                                            Item{Layout.fillWidth: true}

                                            Rectangle{
                                                radius: width * 0.5
                                                color: "transparent"
                                                Layout.preferredWidth: parent.width * 0.1
                                                Layout.preferredHeight: width

                                                Label{
                                                    id:lbl_telegram
                                                    anchors.fill: parent
                                                    text: Icons.telegram
                                                    verticalAlignment: Qt.AlignVCenter
                                                    horizontalAlignment: Qt.AlignHCenter
                                                    font.family: webfont.name
                                                    font.pixelSize: Qt.application.font.pixelSize * 2

                                                    color:color4
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
                                                color: "transparent"
                                                Layout.preferredWidth: parent.width * 0.1
                                                Layout.preferredHeight: width

                                                Label{
                                                    id:lbl_setting
                                                    anchors.fill: parent
                                                    text: Icons.settings
                                                    verticalAlignment: Qt.AlignVCenter
                                                    horizontalAlignment: Qt.AlignHCenter
                                                    font.family: webfont.name
                                                    font.pixelSize: Qt.application.font.pixelSize * 2

                                                    color:color4
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
                                                color: "transparent"
                                                Layout.preferredWidth: parent.width * 0.1
                                                Layout.preferredHeight: width

                                                Label{
                                                    id:lbl_email
                                                    anchors.fill: parent
                                                    text: Icons.email
                                                    verticalAlignment: Qt.AlignVCenter
                                                    horizontalAlignment: Qt.AlignHCenter
                                                    font.family: webfont.name
                                                    font.pixelSize: Qt.application.font.pixelSize * 2

                                                    color:color4
                                                }
                                                MouseArea{
                                                    anchors.fill: parent
                                                    cursorShape: Qt.PointingHandCursor
                                                    onClicked: {

                                                    }
                                                }
                                            }

                                            Item{Layout.fillWidth: true}
                                        }
                                    }

                                    Item{Layout.fillHeight: true}
                                }

                            }
                        }

                    }
                }
            }
            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                color: color1

                TabBar {
                    id: bar
                    height: parent.height
                    width: 600
                    anchors.right: parent.right

                    font.pixelSize: Qt.application.font.pixelSize
                    Material.accent: color4
                    currentIndex: 1
                    background: Rectangle{
                        color: color1
                    }

                    //-- Section 1 Button --//
                    TabButton {
                        id: section1

                        signal checkSection1()
                        onCheckSection1: {
                            checked = true
                        }


                        Label{
                            text: "کتاب های مرتبط"
                            font.bold: section1.checked ? true : false
                            font.pixelSize: section1.checked ? Qt.application.font.pixelSize * 1.3 : Qt.application.font.pixelSize * 1.2
                            font.family: mainFont.name
                            color: section1.checked ? color4 : "#aaaaaa"
                            anchors.centerIn: parent
                        }

                        onClicked: {
                            checkSection1()
                        }
                    }

                    //-- Section 3 Button --//
                    TabButton {
                        id: section5

                        signal checkSection5()
                        onCheckSection5: {
                            checked = true
                        }


                        Label{
                            text: "معرفی"
                            font.bold: section5.checked ? true : false
                            font.pixelSize: section5.checked ? Qt.application.font.pixelSize * 1.3 : Qt.application.font.pixelSize * 1.2
                            font.family: mainFont.name
                            color: section5.checked ? color4 : "#aaaaaa"
                            anchors.centerIn: parent
                        }

                        onClicked: {
                            checkSection5()
                        }

                    }

                }

            }

            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 3000
//                Layout.preferredHeight: childrenRect.height
                color: color0
                SwipeView {
                    id: sView
                    anchors.fill: parent
//                    width: parent.width
//                    height: 800
                    interactive: false
                    clip: true
                    currentIndex: bar.currentIndex
                    Item{

                    }
                    Item{
                        AudioBookIntroduction{
                            anchors.fill: parent
                            anchors.topMargin: 50
                            anchors.rightMargin: 70
                            anchors.leftMargin: 70
                            anchors.bottomMargin: 50
                            relatedBooksModel: relateBooksModel
                            otherBooksModel: relateBooksModel
                            offerBooksModel: relateBooksModel
                            commentModel: commentsModel
                        }
                    }
                }
            }

            Footer{
                Layout.fillWidth: true
                Layout.preferredHeight: 270
            }
        }
    }

}
