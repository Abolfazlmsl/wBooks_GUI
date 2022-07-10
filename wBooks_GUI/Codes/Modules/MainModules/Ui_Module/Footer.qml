import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../../Fonts/Icon.js" as Icons

Rectangle {
    id: footer
    color: color23

    property alias suggestBook1: txt1.text
    property alias suggestBook2: txt2.text
    property alias suggestBook3: txt3.text
    property alias suggestBook4: txt4.text
    property alias suggestBook5: txt5.text

    property alias suggestCollection1: txt6.text
    property alias suggestCollection2: txt7.text
    property alias suggestCollection3: txt8.text
    property alias suggestCollection4: txt9.text
    property alias suggestCollection5: txt10.text

    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: Qt.RightToLeft

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.4
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "وی بوکس"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.rightMargin: 20
                    text: "وی بوکس سایت و اپلیکیشن دانلود کتاب الکترونیکی و دانلود کتاب صوتی است."
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
                    wrapMode: Text.WordWrap
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.rightMargin: 20
                    text: "در وی بوکس کتاب های روانشناسی، رمان و داستان، کتاب های تاریخی، کتاب فلسفی و هزاران کنتب رایگان برای دانلود وجود دارد."
                    font.family: iranSans.name
                    font.bold: true
                    wrapMode: Text.WordWrap
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
                    LayoutMirroring.enabled: true
                    Layout.alignment: Qt.AlignLeft
                }

                Item{Layout.fillHeight: true}

            }
        }

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.2
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "طاقچه"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "تماس با ما"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "درباره ی طاقچه"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "وبلاگ طاقچه"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "سوال های متداول"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "فرصت های شغلی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.2
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "کتاب های پیشنهادی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    id: txt1
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "دنیای سوفی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt2
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "شازده کوچولو"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt3
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "غرور و تعصب"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt4
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "مغازه خودکشی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt5
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "کتاب اثر مرکب"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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

        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.2
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.rightMargin: 20
                    text: "دسته بندی پیشنهادی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.7
                    verticalAlignment: Qt.AlignVCenter
                }
                Label{
                    id: txt6
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "رمان عاشقانه"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt7
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "کتاب های علمی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt8
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "کتاب های صوتی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt9
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "کتاب های پزشکی"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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
                    id: txt10
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.rightMargin: 20
                    text: "کتاب صوتی رایگان"
                    font.family: iranSans.name
                    font.bold: true
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * 1.4
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

    }
}
