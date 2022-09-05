import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../REST/apiService.js" as Service

import "./../../Items"


Item{
    property double rightMargin: 0
    property double leftMargin: 0

    signal sendWarning(var message)
    signal changePassBtnClicked(var newPassword)

    function clearInputs(){
        input_password.inputText.text = ""
        input_password_repeat.inputText.text = ""
    }

    Flickable{
        anchors.fill: parent
        contentHeight: homeItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}

        Item{
            id: homeItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "transparent"
                    Image{
                        id: image
                        anchors.fill: parent
                        source: "qrc:/Images/Logo2.png"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                        visible: false
                    }
                    ColorOverlay {
                        anchors.fill: image
                        source: image
                        color: color4
                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 15}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#474749"
                    Label{
                        anchors.centerIn: parent
                        text: "رمز عبور خود را تغییر دهید"
                        font.family: setting.activeFont
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                        color: "#ffffff"
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 330
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#e2e2e2"
                    ColumnLayout{
                        anchors.fill: parent
                        anchors.rightMargin: 50
                        anchors.leftMargin: 50

                        Item{Layout.preferredHeight: 40}

                        //-- Password --//
                        M_inputText{
                            id: input_password
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.preferredHeight: 45
                            Layout.fillWidth: true
                            label: "رمز عبور جدید"
                            itemRadius: 0
                            placeholder: "رمز عبور جدید"
                            echoMode: TextInput.Password
                            placeHolderPosition: "Center"
                            iconColor: "#989898"
                            iconAsImage: true
                            imgIcon: "qrc:/Icons/key.png"
                            fontSize: 1.2
                            bgColor: "#d6d6d6"
                            borderColor: "#d6d6d6"
                            inputText.maximumLength: 16
                            Label{
                                id: lbl_eyeIcon
                                width: implicitWidth
                                height: parent.height
                                anchors.left: parent.left
                                anchors.leftMargin: 10 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                text: Icons.eye_off
                                color: "#989898"
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                MouseArea{

                                    property bool passViewHandler: false

                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor

                                    onClicked: {
                                        if(passViewHandler){
                                            lbl_eyeIcon.text = Icons.eye_off
                                            input_password.echoMode = TextInput.Password
                                        }
                                        else{
                                            lbl_eyeIcon.text = Icons.eye
                                            input_password.echoMode = TextInput.Normal
                                        }
                                        passViewHandler = !passViewHandler
                                    }
                                }
                            }
                            Keys.onTabPressed: {
                                input_password_repeat.inputText.forceActiveFocus()
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        //-- Password --//
                        M_inputText{
                            id: input_password_repeat
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.preferredHeight: 45
                            Layout.fillWidth: true
                            label: "تکرار رمز عبور جدید"
                            placeholder: "تکرار رمز عبور جدید"
                            echoMode: TextInput.Password
                            itemRadius: 0
                            fontSize: 1.3
                            iconAsImage: true
                            imgIcon: "qrc:/Icons/key.png"
                            placeHolderPosition: "Center"
                            iconColor: "#989898"
                            bgColor: "#d6d6d6"
                            borderColor: "#d6d6d6"
                            inputText.maximumLength: 16
                            Label{
                                id: lbl_eyeIcon2
                                width: implicitWidth
                                height: parent.height
                                anchors.left: parent.left
                                anchors.leftMargin: 10 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                text: Icons.eye_off
                                color: "#989898"
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * 2

                                MouseArea{

                                    property bool passViewHandler: false

                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor

                                    onClicked: {
                                        if(passViewHandler){
                                            lbl_eyeIcon2.text = Icons.eye_off
                                            input_password_repeat.echoMode = TextInput.Password
                                        }
                                        else{
                                            lbl_eyeIcon2.text = Icons.eye
                                            input_password_repeat.echoMode = TextInput.Normal
                                        }
                                        passViewHandler = !passViewHandler
                                    }
                                }
                            }
                            Keys.onTabPressed: {

                            }

                            //            inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
                        }

                        Item{Layout.preferredHeight: 20}

                        //-- Button login --//
                        ButtonImageIcon{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            icon: "qrc:/Icons/user.png"
                            flip: true
                            iconColor: "#ffffff"
                            text: "تغییر رمز عبور"
                            textColor: "#ffffff"
                            color: "#d43460"
                            textSize: 1
                            onBtnClicked: {
                                if (parseInt(input_password.inputText.text.length) === 0){
                                    sendWarning("رمز عبور جدید را وارد کنید")
                                }else if (parseInt(input_password_repeat.inputText.text.length) === 0){
                                    sendWarning("تکرار رمز عبور جدید را وارد نمایید")
                                }else if (input_password.inputText.text !== input_password_repeat.inputText.text){
                                    sendWarning("رمز عبور و تکرار رمز عبور یکسان نیستند")
                                }else if (input_password.inputText.text === passwordUser){
                                    sendWarning("رمز عبور جدید با رمز عبور قدیم یکسان است")
                                }else{
                                    changePassBtnClicked(input_password.inputText.text)
                                    clearInputs()
                                    //                                MainPython.sendSMS(phone.text)
                                    confirmItem.timer = true
                                    confirmItem.sendAgain = false
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 30}
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#d43460"
                }

                //-- filler --//
                Item{Layout.preferredHeight: 100}
            }
        }
    }
}



