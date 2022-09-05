import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle{

    color: color1
    ColumnLayout{
        anchors.fill: parent
        anchors.rightMargin: 80
        anchors.leftMargin: 80
        spacing: 0
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 4
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "کامپیوتر"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "ادبیات"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "آموزش زبان"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "ادبیات"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
            }
        }
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 4
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "حقوق"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "داستان و رمان"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "کمیک"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "داستان و رمان"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
            }
        }
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 4
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "رمان"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "روانشناسی"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "سلامتی و بهداشت"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "روانشناسی"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
            }
        }
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height / 4
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "کامپیوتر"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "عمومی"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "اقتصاد و مدیریت"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
                Label{
                    Layout.preferredWidth: parent.width / 4
                    Layout.fillHeight: true
                    text: "فنی و مهندسی"
                    font.family: setting.activeFont
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
            }
        }
    }
}
