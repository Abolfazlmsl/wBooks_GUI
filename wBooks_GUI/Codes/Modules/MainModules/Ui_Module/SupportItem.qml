import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../Items"

import "./../../../../Fonts/Icon.js" as Icons

Item {
    Rectangle{
        anchors.fill: parent

        color: "#00ff0000"

        BodyHeader{
            id: header
            width: parent.width
            height: !showRightPop * 52
            topFilterVis: false
            listHeaderVis: false
            bgColor: "transparent"
            onItemClicked: {

            }
        }

        Flickable {
            contentWidth: parent.width
            contentHeight: book.height
            height: parent.height - header.height
            width: parent.width
            anchors.top: header.bottom
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar {}
            clip: true

            Item{
                id: book
                implicitWidth: parent.width
                implicitHeight: childrenRect.height

                ColumnLayout{
                    width: parent.width
                    spacing: 0

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        color: "#bdbac1"
                        Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                            anchors.topMargin: 50
                            anchors.bottomMargin: 50
                            anchors.rightMargin: 40
                            Label{
                                id: headerTxt
                                width: contentWidth
                                height: contentHeight
                                anchors.top: parent.top
                                anchors.right: parent.right
                                text: "تماس با ما"
                                font.family: setting.activeFont
                                font.bold: true
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2 //* widthRatio
                                color: "#000000"
                            }
                            Label{
                                id: headerTxt2
                                width: contentWidth
                                height: contentHeight
                                anchors.top: headerTxt.bottom
                                anchors.right: parent.right
                                text: "برای پشتیبانی تمام روزها (ساعت 9 الی 17) همراه شما هستیم"
                                font.family: setting.activeNumFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                                color: "#000000"
                            }
                            Label{
                                width: contentWidth
                                height: contentHeight
                                anchors.top: headerTxt2.bottom
                                anchors.right: parent.right
                                text: "شماره: 44887755-021"
                                font.family: setting.activeNumFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                                color: "#000000"
                            }
                        }
                    }

                    Item{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 500
                        Layout.topMargin: 50
                        Layout.bottomMargin: 50
                        Layout.rightMargin: 50
                        Layout.leftMargin: 50
                        RowLayout{
                            anchors.fill: parent
                            spacing: 0
                            layoutDirection: Qt.RightToLeft
                            Item{
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.45
                                ColumnLayout{
                                    anchors.fill: parent
                                    spacing: 0
                                    Rectangle{
                                        Layout.preferredHeight: 50
                                        Layout.fillWidth: true
                                        color: "transparent"
                                        Label{
                                            anchors.fill: parent
                                            text: "نوع مشکل"
                                            font.family: setting.activeNumFont
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                                            color: "#000000"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                        }
                                    }

                                    ComboBox{
                                        id: cbox
                                        Layout.preferredHeight: 60
                                        Layout.fillWidth: true
                                        LayoutMirroring.enabled: true
                                        font.family: setting.activeFont
                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
                                        background: Rectangle {
                                            color: color1
                                            radius: 20
                                        }
                                        contentItem: Text {
                                            color: color18
                                            text: cbox.currentText
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
                                            LayoutMirroring.enabled: true
                                            verticalAlignment: Text.AlignVCenter
                                            horizontalAlignment: Text.AlignLeft
                                            rightPadding: 20
                                        }

                                        indicator: Label{
                                            width: implicitWidth
                                            height: parent.height
                                            anchors.left: parent.left
                                            anchors.leftMargin: 10 * ratio
                                            verticalAlignment: Qt.AlignVCenter
                                            text: Icons.chevron_down
                                            color: color18
                                            font.family: webfont.name
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                                        }

                                        model: ListModel {
                                            id: model
                                            ListElement { text: "مشکل در دانلود کتاب" }
                                            ListElement { text: "مشکل در نرم افزار" }
                                        }
                                        delegate: ItemDelegate {
                                            id:itemDlgt
                                            width: cbox.width
                                            height:40
                                            padding:0

                                            contentItem: Text {
                                                id:textItem
                                                text: model.text
                                                color: itemDlgt.hovered?color18:color4
                                                font.family: setting.activeFont
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
                                                LayoutMirroring.enabled: true
                                                verticalAlignment: Text.AlignVCenter
                                                horizontalAlignment: Text.AlignLeft
                                                rightPadding: 20
                                            }

                                            background: Rectangle {
                                                color:itemDlgt.hovered?color4:color1;
                                                anchors.left: itemDlgt.left
                                                anchors.leftMargin: 0
                                                width:itemDlgt.width
                                            }

                                        }

                                        onActivated: {

                                        }
                                    }

                                    Rectangle {
                                        Layout.preferredHeight: 250
                                        Layout.fillWidth: true

                                        color: color1
                                        radius: 20

                                        ScrollView{
                                            anchors.fill: parent
                                            clip: true
                                            //-- TextField --//
                                            TextArea{
                                                id:txf_main

                                                padding: 30 * ratio
                                                wrapMode: TextArea.WordWrap
                                                //                            leftPadding: 10 * ratio

                                                font.family: setting.activeNumFont
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                                                selectedTextColor: color14
                                                color: color4

                                                selectByMouse: true
                                                horizontalAlignment: TextArea.AlignRight


                                                //-- placeholder --//
                                                Label{
                                                    id: lbl_placeholder

                                                    visible: (txf_main.length >= 1) ? false : true

                                                    text: "شرح مشکل"

                                                    anchors.top: parent.top
                                                    anchors.right: parent.right
                                                    anchors.topMargin: 20
                                                    anchors.rightMargin: 20
                                                    font.family: setting.activeFont
                                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3

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


                                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio
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

                                    Item{Layout.preferredHeight: 20}

                                    ButtonShadow{
                                        Layout.preferredHeight: 50
                                        Layout.fillWidth: true
                                        btnText: "ارسال"
                                        textColor: "#ffffff"
                                        fontSize: 1.1 * ratio
                                        btnColor: "#d43460"
                                        btnRadius: 10
                                        onDashboard_btnClicked: {

                                        }
                                    }
                                }
                            }

                            Item{Layout.fillWidth: true}

                            Item{
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width * 0.45
                                ColumnLayout{
                                    anchors.fill: parent
                                    spacing: 0
                                    Rectangle{
                                        Layout.preferredHeight: 50
                                        Layout.fillWidth: true
                                        color: "transparent"
                                        Label{
                                            anchors.fill: parent
                                            text: "درخواست کتاب"
                                            font.family: setting.activeNumFont
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                                            color: "#000000"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                        }
                                    }
                                    Item{
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 45
                                        RowLayout{
                                            anchors.fill: parent
                                            spacing: 0
                                            layoutDirection: Qt.RightToLeft
                                            M_inputText{
                                                id: input_bookName
                                                Layout.preferredHeight: 45 * ratio
                                                Layout.preferredWidth: parent.width * 0.45
                                                label: "نام کتاب"
                                                itemRadius: 20
                                                placeholder: "نام کتاب"
                                                placeHolderPosition: "Right"
                                                icon: ""
                                                fontSize: 1.2
                                                bgColor: "#d6d6d6"
                                                borderColor: "#d6d6d6"
                                                Keys.onTabPressed: {
                                                    input_authorName.inputText.forceActiveFocus()
                                                }
                                            }

                                            Item{Layout.fillWidth: true}

                                            M_inputText{
                                                id: input_authorName
                                                Layout.preferredHeight: 45 * ratio
                                                Layout.preferredWidth: parent.width * 0.5
                                                label: "نام نویسنده"
                                                itemRadius: 20
                                                placeholder: "نام نویسنده"
                                                placeHolderPosition: "Right"
                                                icon: ""
                                                fontSize: 1.2
                                                bgColor: "#d6d6d6"
                                                borderColor: "#d6d6d6"
                                                Keys.onTabPressed: {
                                                    input_publisherName.inputText.forceActiveFocus()
                                                }
                                            }
                                        }
                                    }

                                    Item{Layout.preferredHeight: 10}

                                    Item{
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 45
                                        RowLayout{
                                            anchors.fill: parent
                                            spacing: 0
                                            layoutDirection: Qt.RightToLeft
                                            M_inputText{
                                                id: input_publisherName
                                                Layout.preferredHeight: 45 * ratio
                                                Layout.preferredWidth: parent.width * 0.45
                                                label: "نام ناشر"
                                                itemRadius: 20
                                                placeholder: "نام ناشر"
                                                placeHolderPosition: "Right"
                                                icon: ""
                                                fontSize: 1.2
                                                bgColor: "#d6d6d6"
                                                borderColor: "#d6d6d6"
                                                Keys.onTabPressed: {

                                                }
                                            }

                                            Item{Layout.fillWidth: true}

                                            ButtonShadow{
                                                Layout.fillHeight: true
                                                Layout.preferredWidth: parent.width * 0.5
                                                btnText: "ارسال درخواست"
                                                textColor: "#ffffff"
                                                fontSize: 1.1 * ratio
                                                btnColor: "#d43460"
                                                btnRadius: 20
                                                onDashboard_btnClicked: {

                                                }
                                            }
                                        }
                                    }

                                    Item{Layout.preferredHeight: 50}

                                    Rectangle{
                                        Layout.preferredHeight: 1
                                        Layout.fillWidth: true
                                        color: "#000000"
                                    }

                                    Item{Layout.preferredHeight: 40}

                                    Rectangle{
                                        Layout.preferredHeight: 50
                                        Layout.fillWidth: true
                                        color: "transparent"
                                        Label{
                                            anchors.fill: parent
                                            text: "درخواست همکاری ناشران و نویسندگان"
                                            font.family: setting.activeNumFont
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                                            color: "#000000"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                        }
                                    }

                                    Item{
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 45
                                        RowLayout{
                                            anchors.fill: parent
                                            spacing: 0
                                            layoutDirection: Qt.RightToLeft
                                            M_inputText{
                                                id: input_name
                                                Layout.preferredHeight: 45 * ratio
                                                Layout.preferredWidth: parent.width * 0.45
                                                label: "نام و نام خانوادگی"
                                                itemRadius: 20
                                                placeholder: "نام و نام خانوادگی"
                                                placeHolderPosition: "Right"
                                                icon: ""
                                                fontSize: 1.2
                                                bgColor: "#d6d6d6"
                                                borderColor: "#d6d6d6"
                                                Keys.onTabPressed: {
                                                    input_phone.inputText.forceActiveFocus()
                                                }
                                            }

                                            Item{Layout.fillWidth: true}

                                            M_inputText{
                                                id: input_phone
                                                Layout.preferredHeight: 45 * ratio
                                                Layout.preferredWidth: parent.width * 0.5
                                                label: "شماره تماس"
                                                itemRadius: 20
                                                placeholder: "شماره تماس"
                                                placeHolderPosition: "Right"
                                                icon: ""
                                                fontSize: 1.2
                                                bgColor: "#d6d6d6"
                                                borderColor: "#d6d6d6"
                                                Keys.onTabPressed: {
                                                    input_job.inputText.forceActiveFocus()
                                                }
                                                inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
                                            }
                                        }
                                    }

                                    Item{Layout.preferredHeight: 10}

                                    Item{
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 45
                                        RowLayout{
                                            anchors.fill: parent
                                            spacing: 0
                                            layoutDirection: Qt.RightToLeft
                                            M_inputText{
                                                id: input_job
                                                Layout.preferredHeight: 45 * ratio
                                                Layout.preferredWidth: parent.width * 0.45
                                                label: "شغل"
                                                itemRadius: 20
                                                placeholder: "شغل"
                                                placeHolderPosition: "Right"
                                                icon: ""
                                                fontSize: 1.2
                                                bgColor: "#d6d6d6"
                                                borderColor: "#d6d6d6"
                                                Keys.onTabPressed: {

                                                }
                                            }

                                            Item{Layout.fillWidth: true}

                                            ButtonShadow{
                                                Layout.fillHeight: true
                                                Layout.preferredWidth: parent.width * 0.5
                                                btnText: "ارسال درخواست"
                                                textColor: "#ffffff"
                                                fontSize: 1.1 * ratio
                                                btnColor: "#d43460"
                                                btnRadius: 20
                                                onDashboard_btnClicked: {

                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
