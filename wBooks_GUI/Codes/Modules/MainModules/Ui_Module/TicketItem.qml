import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../Modules/Items"

import "./../../../../Fonts/Icon.js" as Icons

Item {
    property real btn_ShadowSpread: 0.0
    property real btn_ShadowRadius: 9

    signal dashboard_btnClicked()

    property int selectStart
    property int selectEnd
    property int curPos

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
                    Layout.preferredHeight: 80
                    Layout.rightMargin: 50
                    Layout.leftMargin: 50
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        spacing: 10
                        Label{
                            Layout.preferredWidth: 50
                            Layout.fillHeight: true
                            text: Icons.email
                            color: color12
                            font.family: webfont.name
                            font.pixelSize: 40
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }
                        Label{
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "ارسال بازخورد"
                            font.family: iranSans.name
                            font.pixelSize: 40 //* widthRatio
                            font.bold: true
                            verticalAlignment: Qt.AlignVCenter
                            color: color12
                            LayoutMirroring.enabled: true
                            Layout.alignment: Qt.AlignLeft
                        }
                        Item{Layout.fillWidth: true}
                    }
                }

                Item{Layout.preferredHeight: 50}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    Layout.rightMargin: 50
                    Layout.leftMargin: 50
                    color: color4
                }

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

                    //-- TextField --//
                    TextInput{
                        id:txf_main
                        anchors.fill: parent
                        clip: true

                        padding: 30 * ratio
                        wrapMode: TextInput.WordWrap
        //                            leftPadding: 10 * ratio

                        font.family: iranSansFAnum.name
                        font.pixelSize: Qt.application.font.pixelSize * 2
                        selectedTextColor: color14
                        color: color4

                        selectByMouse: true
                        horizontalAlignment: TextInput.AlignRight


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

                        onAccepted: {

                            if(enterAsAccept){
                                acceptedLogin()

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
