import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtMultimedia 5.9

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Player"
import "./../MainModules/Ui_Module"

Item {

    RowLayout{
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        spacing: 10
        Rectangle{
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.25
            color: color1

            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 20
                spacing: 5
                Rectangle{
                    id: iconRec
                    Layout.preferredWidth: parent.width * 0.5
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.alignment: Qt.AlignHCenter

                    color: color8
                    Image {
                        anchors.fill: parent
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        source: "qrc:/Images/mebeforeyou.jpg"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Rectangle{
                    id: title1Rec
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.07
                    color: "transparent"
                    Label{
                        id: txt1
                        anchors.fill: parent
                        text: "من پیش از تو"
                        font.family: iranSans.name
                        font.bold: true
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                    }
                }

                Rectangle{
                    id: title2Rec
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.07
                    color: "transparent"
                    Label{
                        id: txt2
                        anchors.fill: parent
                        text: "نویسنده: جوجو مویز"
                        font.family: iranSans.name
                        font.bold: true
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        font.pixelSize: Qt.application.font.pixelSize * 1.2
                    }
                }
                Rectangle{
                    id: title3Rec
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.07
                    color: "transparent"
                    Label{
                        id: txt3
                        anchors.fill: parent
                        text: "گوینده: رضا عمرانی"
                        font.family: iranSans.name
                        font.bold: true
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        font.pixelSize: Qt.application.font.pixelSize * 1.2
                    }
                }

                Rectangle{
                    id: title4Rec
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.07
                    color: "transparent"
                    Label{
                        id: txt4
                        anchors.fill: parent
                        text: "ناشر: ماه آوا"
                        font.family: iranSans.name
                        font.bold: true
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        font.pixelSize: Qt.application.font.pixelSize * 1.2
                    }
                }

                Item{Layout.preferredHeight: 10}

                Rectangle{
                    id: timeRec
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.1
                    color: "transparent"
                    Label{
                        id: timetxt
                        anchors.fill: parent
                        text: "مدت زمان:   5:43"
                        font.family: iranSans.name
                        font.bold: true
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                    }
                }

                Item{Layout.fillHeight: true}
            }
        }

        //-- video player --//
        Player{
            id: player

            Layout.fillHeight: true
            Layout.fillWidth: true
            isTopToolsVisible: false
            isIgnoreOffset: false
            clip: true
        }
    }
}
