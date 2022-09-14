import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

import "./../../Items"

import "./../../../../Fonts/Icon.js" as Icons

Item {

    property bool back: true
    property bool showList: true

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 20

        BodyHeader{
            Layout.fillWidth: true
            Layout.preferredHeight: !showRightPop * 52
            topFilterVis: false
            listHeaderVis: false
            bgColor: "transparent"
            onItemClicked: {

            }
        }

        RowLayout{
            Layout.fillWidth: true
            Layout.preferredHeight: 40

            HoverButton{
                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                visible: back
                btnRadius: 10
                backgroundColor: color2
                btnIcon: Icons.arrow_left
                btnText: "بازگشت"
                textColor: color4

                onBtnClicked: {
                    myBooksView = 0
                }
            }

            Item{Layout.fillWidth: true}
            Rectangle{
                Layout.preferredHeight: 50
                Layout.preferredWidth: 50
                radius: 10
                color: "transparent"
                Label{
                    anchors.fill: parent
                    text: Icons.apps
                    font.family: webfont.name
                    color: (showList)? color4:color2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (showList){
                            showList = false
                        }
                    }
                }
            }

            Item{Layout.preferredWidth: 10}

            Rectangle{
                Layout.preferredHeight: 50
                Layout.preferredWidth: 50
                color: "transparent"
                radius: 10
                Label{
                    anchors.fill: parent
                    text: Icons.format_list_bulleted
                    rotation: 180
                    font.family: webfont.name
                    color: (showList)? color2:color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        if (!showList){
                            showList = true
                        }
                    }
                }
            }
        }

        ListView{
            id: lView
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: showList
            clip: true
            spacing: 0
            model: myAudioBooksModel
            header: Rectangle{
                width: lView.width
                height: 100
                border.width: 1
                border.color: color4
                color: color2
                RowLayout{
                    anchors.fill: parent
                    layoutDirection: Qt.RightToLeft
                    spacing: 0
                    Rectangle{
                        Layout.preferredWidth: 100
                        Layout.fillHeight: true
                        color: "transparent"
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.preferredWidth: parent.width * 0.5
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: "نام اثر"
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.preferredWidth: parent.width * 0.15
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: "نام نویسنده"
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.preferredWidth: parent.width * 0.15
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: "نام گوینده"
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: "حذف اثر"
                        }
                    }
                }
            }

            delegate: Rectangle{
                id: rec
                width: lView.width
                height: 100
                color: "transparent"
                border.width: 1
                border.color: color4
                RowLayout{
                    anchors.fill: parent
                    layoutDirection: Qt.RightToLeft
                    spacing: 0
                    Image{
                        Layout.preferredWidth: 100
                        Layout.fillHeight: true
                        source: "qrc:/Images/Wbooks1.png"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {

                            }
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.preferredWidth: parent.width * 0.5
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: model.title
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {

                            }
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.preferredWidth: parent.width * 0.15
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: model.author
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {

                            }
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.preferredWidth: parent.width * 0.15
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            font.bold: true
                            color: color4
                            text: model.speaker
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {

                            }
                        }
                    }
                    Rectangle{
                        Layout.preferredWidth: 1
                        Layout.fillHeight: true
                        color: color4
                    }
                    Rectangle{
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: webfont.name
                            font.bold: true
                            color: color4
                            text: Icons.trash_can_outline
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.5
                        }
                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {

                            }
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered: {
                        rec.color = color17
                    }
                    onExited: {
                        rec.color = "transparent"
                    }
                }
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: !showList
            color: "transparent"

            Flickable{
                id: flick_Result
                anchors.fill: parent
                contentHeight: myFlowDocument.height
                clip: true

                //anchors.margins: 10

                ScrollBar.vertical: ScrollBar {
                    width: 10 * ratio
                    parent: flick_Result.parent
                    anchors.top: flick_Result.top
                    anchors.right: flick_Result.right
                    anchors.bottom: flick_Result.bottom
                }

                //-- Document Books Result --//
                Flow {
                    id: myFlowDocument

                    layoutDirection: Qt.RightToLeft

                    width: (flick_Result.width % 255 === 0) ? (255 * ((flick_Result.width / 255)) + ((Math.floor(flick_Result.width / 255) - 1) * spacing))
                                                            : ((255 * Math.floor(flick_Result.width / 255)) + ((Math.floor(flick_Result.width / 255) - 1) * spacing))
                    height: implicitHeight
                    spacing: 10

                    anchors.horizontalCenter: parent.horizontalCenter

                    Repeater {
                        model: myAudioBooksModel


                        Rectangle{

                            width: 250
                            height: 285
                            color: "transparent"
                            clip: true

                            MyAudioBookItem{
                                id: documentItem
                                anchors.centerIn: parent
                                imageSource: "qrc:/Images/mebeforeyou.jpg"
                                text1: myAudioBooksModel.get(index).title
                                text2: myAudioBooksModel.get(index).author
                                text3: myAudioBooksModel.get(index).speaker
                            }
                        }
                    }
                }
            }
        }
    }
}
