import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

import "./../../Items"

Item {
    Rectangle{
        anchors.fill: parent

        color: "#00ff0000"

        //-- container --//
        Rectangle{
            anchors.fill: parent

            color: color1

            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                horizontalOffset: 3
                color: addOpacity(color4, 40)
                samples: 70
            }

            //-- logo and intro -//
            Rectangle{
                id: rec_head_activity

                height: parent.height * 0.25
                width: parent.width + (20 * ratio)
                color: "#00000000"

                //-- red background --//
                Canvas{
                    id: mycanvas
                    anchors.fill: parent

                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 3
                        horizontalOffset: 0
                        color: addOpacity(color4, 40)
                        samples: 40
                    }


                    onPaint: {
                        var ctx = getContext("2d");

                        //-- set red color --//
                        ctx.fillStyle = "#1684A7"

                        //-- shadow --//
                        //                                ctx.shadowBlur = 10;
                        //                                ctx.shadowOffsetX = 3;
                        //                                ctx.shadowOffsetY = 3;
                        //                                ctx.shadowColor = Util.color_StatusBar;

                        var margin = 5;
                        var x1 = 0 + margin;
                        var x2 = width - margin;
                        var y1 = 0 + margin;
                        var y2 = height - ctx.shadowOffsetY*2;
                        var y3 = height * 0.5;

                        //-- draw polygon path --//
                        // x1, y1
                        //  _________ x2,y1
                        // |        |
                        // |        |
                        // |________|
                        // x1,y3   x2,y2
                        //
                        ctx.beginPath();
                        ctx.moveTo(x1, y1);
                        ctx.lineTo(x2, y1);
                        ctx.lineTo(x2, y2);
                        ctx.lineTo(x1, y3);
                        ctx.lineTo(x1, y1);
                        ctx.closePath();
                        ctx.fill();
                    }

                }

                //-- Icon section --//
                Label{
                    id: lbl_Icon
                    width: implicitWidth
                    height: parent.height
                    anchors.right: parent.right
                    anchors.rightMargin: 20 * ratio
                    anchors.top: parent.top
                    anchors.topMargin: 10 * ratio
                    verticalAlignment: Qt.AlignVCenter
                    text: Icons.email
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 6
                    color: color1
                }

                //-- title --//
                Label{
                    text: "ارسال بازخورد"
                    color: color1
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    renderType: Text.NativeRendering

                    anchors.right: lbl_Icon.left
                    anchors.rightMargin: 8 * ratio
                    anchors.verticalCenter: lbl_Icon.verticalCenter
                }
            }

            //-- activity buttons -//
            Rectangle{
                width: parent.width
                height: parent.height - rec_head_activity.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                color: "#00ff0000"

                Flickable{
                    id: flick
                    anchors.fill: parent
                    contentHeight: membershipItem.height
                    contentWidth: parent.width
                    boundsBehavior: Flickable.StopAtBounds
                    ScrollBar.vertical: ScrollBar {}
                    clip: true

                    Item{
                        id: membershipItem
                        implicitHeight: childrenRect.height
                        implicitWidth: parent.width

                        ColumnLayout{
                            width: parent.width
                            spacing: 0

                            Item{Layout.preferredHeight: 50}

                            Item{
                                Layout.fillWidth: true
                                Layout.preferredHeight: 100
                                Layout.rightMargin: 50
                                Layout.leftMargin: 50
                                RowLayout{
                                    anchors.fill: parent
                                    spacing: 10
                                    layoutDirection: Qt.RightToLeft
                                    M_inputText{
                                        id: input_name
                                        label: "نام"
                                        icon: Icons.account
                                        placeholder: "نام"
                                        inputText.text: setting.userName
                                        acceptInput: false
                                        Layout.rightMargin: 0
                                    }

                                    M_inputText{
                                        id: input_email
                                        label: "ایمیل"
                                        icon: Icons.email
                                        placeholder: "ایمیل"
                                        inputText.text: setting.userEmail
                                        acceptInput: true
                                        Layout.rightMargin: 0
                                    }
                                }
                            }

                            Item{Layout.preferredHeight: 50}

                            M_inputText{
                                Layout.fillWidth: true
                                Layout.preferredHeight: 100
                                Layout.rightMargin: 50
                                Layout.leftMargin: 50
                                id: input_subject
                                label: "موضوع"
                                icon: Icons.text_subject
                                placeholder: "موضوع"
                                inputText.text: ""
                                fontSize: 2
                            }

                            Item{Layout.preferredHeight: 50}

                            Rectangle {
                                Layout.preferredHeight: 400
                                Layout.fillWidth: true
                                Layout.rightMargin: 50
                                Layout.leftMargin: 50

                                color: color_input
                                border.color: "#ffffff"
                                radius: 10

                                ScrollView{
                                    anchors.fill: parent
                                    clip: true
                                    //-- TextField --//
                                    TextArea{
                                        id:txf_main

                                        padding: 30 * ratio
                                        wrapMode: TextArea.WordWrap
                                        //                            leftPadding: 10 * ratio

                                        font.family: iranSansFAnum.name
                                        font.pixelSize: Qt.application.font.pixelSize * 2
                                        selectedTextColor: color14
                                        color: color4

                                        selectByMouse: true
                                        horizontalAlignment: TextArea.AlignRight


                                        //-- placeholder --//
                                        Label{
                                            id: lbl_placeholder

                                            visible: (txf_main.length >= 1) ? false : true

                                            text: "متن پیام"

                                            anchors.verticalCenter: parent.verticalCenter
                                            anchors.horizontalCenter: parent.horizontalCenter

                                            font.family: iranSans.name
                                            font.pixelSize: Qt.application.font.pixelSize * 3

                                            color: color18

                                            background: Rectangle{
                                                color: "transparent"
                                            }

                                        }


                                        //-- Cut Copy Paste => MouseArea --//
                                        MouseArea {
                                            anchors.fill: parent
                                            acceptedButtons: Qt.RightButton
                                            hoverEnabled: true

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

                                    }
                                }
                            }

                            Item{Layout.preferredHeight: 50}

                            ButtonShadow{
                                id: sentBtn
                                Layout.fillWidth: true
                                Layout.preferredHeight: 80
                                Layout.leftMargin: 100
                                Layout.rightMargin: 100
                                fontSize: 2
                                btnText: "ارسال پیام"
                            }

                            Item{Layout.preferredHeight: 50}
                        }
                    }
                }
            }
        }
    }
}
