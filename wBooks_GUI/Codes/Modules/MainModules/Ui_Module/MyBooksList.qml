import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

Item {

    property bool back: true

    ParallelAnimation {
        id: showReturnAnim
        NumberAnimation { target: iconReturn; property: "Layout.preferredWidth"; to: 100; duration: 300 }
    }
    ParallelAnimation {
        id: hideReturnAnim
        NumberAnimation { target: iconReturn; property: "Layout.preferredWidth"; to: 50; duration: 300 }
    }

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 20
        RowLayout{
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            layoutDirection: Qt.RightToLeft
            visible: back
            Rectangle{
                id: iconReturn
                property bool isHover: false

                Layout.preferredWidth: 50
                Layout.preferredHeight: 50
                radius: 10
                color: color2
                Label{
                    id: icon
                    anchors.fill: parent
                    text: (iconReturn.isHover) ? "بازگشت":Icons.arrow_right
                    font.family: (iconReturn.isHover) ? mainFont.name:webfont.name
                    font.pixelSize: (iconReturn.isHover) ? Qt.application.font.pixelSize*1.5:Qt.application.font.pixelSize * 2
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked: {
                        myBooksView = 0
                    }
                    onEntered: {
                        showReturnAnim.restart()
                        iconReturn.isHover = true
                    }
                    onExited: {
                        hideReturnAnim.restart()
                        iconReturn.isHover = false
                    }
                }
            }

            Item{Layout.fillWidth: true}
        }

        ListView{
            id: lView
            Layout.fillHeight: true
            Layout.fillWidth: true
            clip: true
            spacing: 0
            model: myBooksModel
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
                            font.family: mainFont.name
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
                        Layout.preferredWidth: parent.width * 0.3
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: mainFont.name
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
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: mainFont.name
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
                            font.family: mainFont.name
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
                        Layout.preferredWidth: parent.width * 0.3
                        Layout.fillHeight: true
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            font.family: mainFont.name
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
                            font.pixelSize: Qt.application.font.pixelSize * 2.5
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
    }
}
