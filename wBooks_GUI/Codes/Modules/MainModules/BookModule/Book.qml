import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4

import "./../../../../Fonts/Icon.js" as Icons

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
                                        font.family: iranSans.name
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
                                        font.family: iranSans.name
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
                                        font.family: iranSans.name
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
                                        font.family: iranSans.name
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
                                                font.family: iranSansFAnum.name
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

                                        Rectangle{
                                            id: btnview
                                            Layout.preferredWidth: parent.width * 0.25
                                            Layout.fillHeight: true
                                            color: color2
                                            Label{
                                                id: txtview
                                                anchors.fill: parent
                                                text: "مشاهده کتاب"
                                                font.family: iranSans.name
                                                color: "#ffffff"
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Qt.AlignHCenter
                                                font.pixelSize: Qt.application.font.pixelSize
                                            }
                                            MouseArea{
                                                anchors.fill: parent
                                                cursorShape: Qt.PointingHandCursor
                                                onClicked: {
                                                    bookreader.visible = true
                                                }
                                            }
                                        }

                                        Rectangle{
                                            id: btnpurchase
                                            Layout.preferredWidth: parent.width * 0.25
                                            Layout.fillHeight: true
                                            color: color2
                                            Label{
                                                id: txt5
                                                anchors.fill: parent
                                                text: "خرید کتاب"
                                                font.family: iranSans.name
                                                color: "#ffffff"
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Qt.AlignHCenter
                                                font.pixelSize: Qt.application.font.pixelSize
                                            }
                                            MouseArea{
                                                anchors.fill: parent
                                                cursorShape: Qt.PointingHandCursor
                                                onClicked: {

                                                }
                                            }
                                        }

                                        Rectangle{
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            color: "transparent"
                                            Label{
                                                anchors.fill: parent
                                                text: "قیمت: 26000 تومان"
                                                font.family: iranSansFAnum.name
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
                    currentIndex: 2
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
                            font.family: iranSans.name
                            color: section1.checked ? color4 : "#aaaaaa"
                            anchors.centerIn: parent
                        }

                        onClicked: {
                            checkSection1()
                        }
                    }

                    //-- Section 2 Button --//
                    TabButton {
                        id: section4

                        signal checkSection4()
                        onCheckSection4: {
                            checked = true
                        }


                        Label{
                            text: "فهرست"
                            font.bold: section4.checked ? true : false
                            font.pixelSize: section4.checked ? Qt.application.font.pixelSize * 1.3 : Qt.application.font.pixelSize * 1.2
                            font.family: iranSans.name
                            color: section4.checked ? color4 : "#aaaaaa"
                            anchors.centerIn: parent
                        }

                        onClicked: {
                            checkSection4()
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
                            font.family: iranSans.name
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
                Layout.preferredHeight: 2500
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

                    }
                    Item{
                        BookIntroduction{
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