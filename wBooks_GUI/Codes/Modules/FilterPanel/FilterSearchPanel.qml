import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

Item {
    id: panel
    property alias title: lbl_title.text
    property alias inputText: txf_main
    property alias icon: iconLabel.text
    property string label: ""
    property string iconColor: ""
    property bool isClearIcon: true
    property alias placeholder: lbl_placeholder.text
    property alias echoMode: txf_main.echoMode
    property alias clearEnable: lbl_clear.visible
    property string borderColor: color12
    property bool enterAsAccept: false

    signal acceptedLogin()

    property int selectStart
    property int selectEnd
    property int curPos

    clip: true

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.5

            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft

                Label {
                    id: lbl_title
                    Layout.fillHeight: true
                    Layout.rightMargin: 20
                    text: "تیتر اصلی"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color4
                }

                Item{Layout.fillWidth: true}

            }
        }

        //-- InputBox For Search --//
        Rectangle{
            id: root_txf

            color: color13

            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.4
            Layout.leftMargin: 15
            Layout.rightMargin: 15
        //    border.width: 2
            radius: 10

            RowLayout{

                anchors.fill: parent
                anchors.rightMargin: 15 * ratio
                anchors.leftMargin: 5 * ratio
                layoutDirection: Qt.RightToLeft

                //-- TextField --//
                TextInput{
                    id:txf_main

                    clip: true
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    verticalAlignment: Qt.AlignVCenter
                    rightPadding: 10 * ratio

                    font.pixelSize: Qt.application.font.pixelSize
                    selectedTextColor: color14

                    selectByMouse: true
                    horizontalAlignment: TextInput.AlignRight


                    //-- placeholder --//
                    Label{
                        id: lbl_placeholder

                        visible: (txf_main.length >= 1) ? false : true

                        text: "متن پیش فرض"

                        anchors.right: parent.right
                        anchors.rightMargin: 10 * ratio
                        anchors.verticalCenter: parent.verticalCenter


                        font.pixelSize: Qt.application.font.pixelSize

                        color: color18

                        background: Rectangle{
                            color: "transparent"
                        }

                    }


                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.RightButton
                        hoverEnabled: true
                        cursorShape: Qt.IBeamCursor

                        onClicked: {

                            selectStart = txf_main.selectionStart
                            selectEnd = txf_main.selectionEnd
                            curPos = txf_main.positionAt(mouse.x)
                            copyPaste_Menu.x = mouse.x
                            copyPaste_Menu.y = mouse.y
                            txf_main.cursorPosition = curPos
                            copyPaste_Menu.open()

                            txf_main.select(selectStart,selectEnd)
                        }
                        onPressAndHold: {
                            if (mouse.source === Qt.MouseEventNotSynthesized) {
                                selectStart = txf_main.selectionStart
                                selectEnd = txf_main.selectionEnd
                                curPos = txf_main.positionAt(mouse.x)
                                copyPaste_Menu.x = mouse.x
                                copyPaste_Menu.y = mouse.y
                                txf_main.cursorPosition = curPos
                                copyPaste_Menu.open()

                                txf_main.select(selectStart,selectEnd)
                            }
                        }

                        //-- Cut Copy Paste => Menu --//
                        Menu {
                            id: copyPaste_Menu
                            topPadding: 0
                            bottomPadding: 0
                            width: 150 * ratio
                            height: 150 * ratio
                            MenuItem {
                                text: "Cut"

                                font.pixelSize: 15 * ratio

                                enabled: (selectEnd - selectStart !== 0) ? true : false

                                width: 150 * ratio
                                height: 50 * ratio

                                onTriggered: {
                                    txf_main.select(selectStart,selectEnd)
                                    txf_main.cut()
                                }
                            }
                            MenuItem {
                                text: "Copy"

                                font.pixelSize: 15 * ratio

                                enabled: (selectEnd - selectStart !== 0) ? true : false

                                width: 150 * ratio
                                height: 50 * ratio

                                onTriggered: {
                                    txf_main.select(selectStart,selectEnd)
                                    txf_main.copy()
                                }
                            }
                            MenuItem {
                                text: "Paste"


                                font.pixelSize: Qt.application.font.pixelSize
                                enabled:txtTemp.text != "" ? true : false

                                width : 150 * ratio
                                height : 50 * ratio

                                onTriggered: {
                                    txf_main.paste()
                                }

                                TextInput {
                                    id: txtTemp
                                    visible: false
                                }
                            }
                            onOpened: {

                                txf_main.select(selectStart,selectEnd)
                                txf_main.cursorPosition = curPos

                                //console.log(txf_Search.cursorPosition)
                            }

                            onAboutToShow: {
                                //-- paste enable check --//
                                txtTemp.text = ""
                                txtTemp.paste()
                            }
                        }
                    }

                    onAccepted: {

                        if(enterAsAccept){
                            acceptedLogin()

                        }

                    }

                }


                //-- Optional/Clear Icon  --//
                Label{
                    id: lbl_clear

                    visible: false
                    text: (isClearIcon) ? Icons.close:Icons.star
                    font.family: webfont.name
                    font.pixelSize: (isClearIcon) ? Qt.application.font.pixelSize * 1.5:Qt.application.font.pixelSize * 0.5

                    verticalAlignment: Qt.AlignVCenter
                    Layout.alignment: Qt.AlignRight

                    ItemDelegate{
                        anchors.fill: parent
                        onClicked: {
                            txf_main.text = ""
                        }
                    }

                }


            }

            //-- Exit Icon --//
            Label{
                id: iconLabel
                width: 10
                height: parent.height
                anchors.right: parent.right
                anchors.rightMargin: 10
                color: "#000000"

                text: Icons.key

                font.family: webfont.name
                font.pixelSize: Qt.application.font.pixelSize * 1.5

                verticalAlignment: Qt.AlignVCenter
            }

        }

        Item{Layout.fillHeight: true}

    }
}

