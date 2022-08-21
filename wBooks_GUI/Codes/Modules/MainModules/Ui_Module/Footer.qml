import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../Items"

import "./../../../../Fonts/Icon.js" as Icons

Rectangle {
    id: footer
    color: "#333335"

    property alias suggestBook1: txt1.text
    property alias suggestBook2: txt2.text
    property alias suggestBook3: txt3.text
    property alias suggestBook4: txt4.text

    property alias suggestCollection1: txt6.text
    property alias suggestCollection2: txt7.text
    property alias suggestCollection3: txt8.text
    property alias suggestCollection4: txt9.text

    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: Qt.RightToLeft

        Item{Layout.preferredWidth: 40* ratio}

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: 350 * ratio
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Item{Layout.preferredHeight: 30}

                Rectangle{
                    id: title
                    Layout.fillWidth: true
                    Layout.preferredHeight: 35
                    color: "transparent"
                    Label{
                        anchors.fill: parent
                        font.family: mainFont.name
                        color: "#d43460"
                        text: "وی بوکس تحولی نو در صنعت نشر دیجیتال"
                        font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio
                        font.bold: true
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        LayoutMirroring.enabled: true
                    }
                }

                Rectangle{
                    id: title2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    color: "transparent"
                    Label{
                        anchors.fill: parent
                        font.family: mainFont.name
                        color: "white"
                        text: "برای عضویت در خبرنامه اطلاعات خود را وارد کنید"
                        font.pixelSize: Qt.application.font.pixelSize * 1.3 * ratio
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        LayoutMirroring.enabled: true
                    }
                }

                Rectangle{
                    id: title3
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    color: "transparent"
                    Label{
                        anchors.fill: parent
                        font.family: mainFont.name
                        color: "#a2a2a2"
                        text: "اطلاع از آخرین کتاب ها، آپدیت ها و ..."
                        font.pixelSize: Qt.application.font.pixelSize * 1.1 * ratio
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        LayoutMirroring.enabled: true
                    }
                }

                Item{Layout.preferredHeight: 35}

                Item{
                    Layout.preferredHeight: 40
                    Layout.fillWidth: true
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        layoutDirection: Qt.RightToLeft

                        //-- Email --//
                        M_inputText{
                            id: input_phone
                            Layout.preferredWidth: parent.width * 0.6
                            Layout.fillHeight: true
                            Layout.rightMargin: 0
                            label: "ایمیل"
                            icon: ""
                            placeholder: "ایمیل خود را وارد کنید"
                            itemRadius: 15
                            bgColor: "#d2d1cf"
                            borderColor: "#d2d1cf"
                            iconVisible: false
                            placeHolderPosition: "Center"
                            Keys.onTabPressed: {

                            }
                        }

                        Item{Layout.preferredWidth: 5}

                        //-- Button watch --//
                        ButtonShadow{
                            id: purchase
                            Layout.preferredWidth: parent.width * 0.35
                            Layout.fillHeight: true
                            btnText: "عضویت خبرنامه"
                            textColor: "white"
                            fontSize: 1
                            btnRadius: 15
                            btnColor: "#d43460"
                            shadowColor: "#d43460"
                            onDashboard_btnClicked: {

                            }
                        }
                    }
                }

                Item{Layout.fillHeight: true}

            }
        }

        Item{Layout.fillWidth: true}

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: 120* ratio
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "وی بوکس"
                    font.family: mainFont.name
                    color: "#a2a2a2"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "خانه"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "Support"
                            mainPage.state = "Edit"
                            accountPopEnabled = false
                        }
                    }
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "اشتراک"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "Support"
                            mainPage.state = "Edit"
                            accountPopEnabled = false
                        }
                    }
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "کتاب های سریالی"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "Support"
                            mainPage.state = "Edit"
                            accountPopEnabled = false
                        }
                    }
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "کتاب های صوتی"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "Support"
                            mainPage.state = "Edit"
                            accountPopEnabled = false
                        }
                    }
                }

                Item{Layout.fillHeight: true}

            }
        }

        Item{Layout.preferredWidth: 30* ratio}

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: 120* ratio
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "دسته بندی"
                    font.family: mainFont.name
                    color: "#a2a2a2"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "ادبیات و هنر"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "Support"
                            mainPage.state = "Edit"
                            accountPopEnabled = false
                        }
                    }
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "درسی و کمک درسی"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "About us"
                            mainPage.state = "Edit"
                            accountPopEnabled = false
                        }
                    }
                }

                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "ریاضی و فیزیک"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }

                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "تاریخی و دین"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Item{Layout.fillHeight: true}

            }
        }

        Item{Layout.preferredWidth: 30* ratio}

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: 120* ratio
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "کتاب های شما"
                    font.family: mainFont.name
                    color: "#a2a2a2"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    id: txt1
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "کتاب های متنی"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Book Page"
                            accountPopEnabled = false
                        }
                    }
                }
                Label{
                    id: txt2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "کتای های صوتی"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Book Page"
                            accountPopEnabled = false
                        }
                    }
                }

                Label{
                    id: txt3
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "ویدئوهای من"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Book Page"
                            accountPopEnabled = false
                        }
                    }
                }

                Label{
                    id: txt4
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "ویرایش کتابخانه"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Book Page"
                            accountPopEnabled = false
                        }
                    }
                }

                Item{Layout.fillHeight: true}

            }
        }

        Item{Layout.preferredWidth: 30* ratio}

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: 120* ratio
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "سایر"
                    font.family: mainFont.name
                    color: "#a2a2a2"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    id: txt6
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "پرسش های رایج"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Category"
                            accountPopEnabled = false
                        }
                    }
                }
                Label{
                    id: txt7
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "راهنمای محصولات"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Category"
                            accountPopEnabled = false
                        }
                    }
                }

                Label{
                    id: txt8
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "مستندهای فنی"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Audio Book"
                            accountPopEnabled = false
                        }
                    }
                }

                Label{
                    id: txt9
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.rightMargin: 20
                    text: "وبینارها"
                    font.family: mainFont.name
                    color: "white"
                    font.pixelSize: Qt.application.font.pixelSize * ratio * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainPage.state = "Category"
                            accountPopEnabled = false
                        }
                    }
                }

                Item{Layout.fillHeight: true}
            }
        }

        Item{Layout.preferredWidth: 80* ratio}
    }
}
