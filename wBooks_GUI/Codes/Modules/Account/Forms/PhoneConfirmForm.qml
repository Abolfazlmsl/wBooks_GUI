import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../REST/apiService.js" as Service

import "./../../Items"

Item {

    property alias timer: timer_confirmSMS.visible
    property alias sendAgain: lbl_SendAgain.visible
    property string phoneNumber: ""
    property double timeMinutes: 1
    property string btnText: ""

    property double rightMargin: 0
    property double leftMargin: 0

    property bool bottomText: true

    function clearCodes(){
        txf_confirm_1.inputText.text = ""
        txf_confirm_2.inputText.text = ""
        txf_confirm_3.inputText.text = ""
        txf_confirm_4.inputText.text = ""
    }

    signal timerStart()
    onTimerStart: {
        clearCodes()
        timer_confirmSMS.resetTimer()
        timer_confirmSMS.minutes = timeMinutes
        timer_confirmSMS.startTimer()
    }

    signal phoneClicked()
    signal confirmBtnClicked()
    signal bottomBtnClicked()

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
                        text: "کد تایید را وارد کنید"
                        font.family: setting.activeFont
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                        color: "#ffffff"
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 360
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#e2e2e2"
                    ColumnLayout{
                        anchors.fill: parent
                        anchors.rightMargin: 50
                        anchors.leftMargin: 50

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            RowLayout{
                                anchors.fill: parent
                                spacing: 0
                                layoutDirection: Qt.RightToLeft

                                Item{Layout.fillWidth: true}
                                Label{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: contentWidth
                                    text: "کد تایید برای شماره "
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    color: "#000000"
                                }
                                Label{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: contentWidth
                                    text: phoneNumber
                                    font.family: setting.activeNumFont
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    color: "#d43460"
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                           phoneClicked()
                                        }
                                    }
                                }
                                Label{
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: contentWidth
                                    text: " ارسال شد"
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                                    color: "#000000"
                                }
                                Item{Layout.fillWidth: true}
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.fillWidth: true
                            Layout.preferredHeight: 45
                            RowLayout{
                                anchors.fill: parent
                                spacing: 0
                                Item{Layout.fillWidth: true}

                                //-- TextInput first number --//
                                M_inputText{
                                    id: txf_confirm_1
                                    Layout.preferredWidth: 70
                                    Layout.fillHeight: true
                                    Layout.rightMargin: 0
                                    Layout.leftMargin: 0
                                    label: "_"
                                    placeholder: "_"
                                    itemRadius: 0
                                    fontSize: 1.3
                                    placeHolderPosition: "Center"
                                    iconVisible: false
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d2d2d2"
                                    borderWidth: 2
                                    textPosition: "Center"
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^[0-9]{1}$/ }

                                    inputText.maximumLength: 1
                                    inputText.onTextChanged: {
                                        if(inputText.length === 1){
                                            txf_confirm_2.inputText.forceActiveFocus()
                                        }
                                    }
                                }

                                Item{Layout.preferredWidth: 15}

                                //-- TextInput second number --//
                                M_inputText{
                                    id: txf_confirm_2
                                    Layout.preferredWidth: 70
                                    Layout.fillHeight: true
                                    Layout.rightMargin: 0
                                    Layout.leftMargin: 0
                                    label: "_"
                                    placeholder: "_"
                                    itemRadius: 0
                                    fontSize: 1.3
                                    placeHolderPosition: "Center"
                                    iconVisible: false
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d2d2d2"
                                    borderWidth: 2
                                    textPosition: "Center"
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^[0-9]{1}$/ }

                                    inputText.maximumLength: 1
                                    inputText.onTextChanged: {
                                        if(inputText.length === 1){
                                            txf_confirm_3.inputText.forceActiveFocus()
                                        }else if (inputText.length === 0){
                                            txf_confirm_1.inputText.forceActiveFocus()
                                        }
                                    }
                                }

                                Item{Layout.preferredWidth: 15}

                                //-- TextInput third number --//
                                M_inputText{
                                    id: txf_confirm_3
                                    Layout.preferredWidth: 70
                                    Layout.fillHeight: true
                                    Layout.rightMargin: 0
                                    Layout.leftMargin: 0
                                    label: "_"
                                    placeholder: "_"
                                    itemRadius: 0
                                    fontSize: 1.3
                                    placeHolderPosition: "Center"
                                    iconVisible: false
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d2d2d2"
                                    borderWidth: 2
                                    textPosition: "Center"
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^[0-9]{1}$/ }

                                    inputText.maximumLength: 1
                                    inputText.onTextChanged: {
                                        if(inputText.length === 1){
                                            txf_confirm_4.inputText.forceActiveFocus()
                                        }else if (inputText.length === 0){
                                            txf_confirm_2.inputText.forceActiveFocus()
                                        }
                                    }
                                }

                                Item{Layout.preferredWidth: 15}

                                //-- TextInput forth number --//
                                M_inputText{
                                    id: txf_confirm_4
                                    Layout.preferredWidth: 70
                                    Layout.fillHeight: true
                                    Layout.rightMargin: 0
                                    Layout.leftMargin: 0
                                    label: "_"
                                    placeholder: "_"
                                    itemRadius: 0
                                    fontSize: 1.3
                                    placeHolderPosition: "Center"
                                    iconVisible: false
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d2d2d2"
                                    borderWidth: 2
                                    textPosition: "Center"
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^[0-9]{1}$/ }

                                    inputText.maximumLength: 1
                                    inputText.onTextChanged: {
                                        if(inputText.length === 1){
                                            btn_Confirm.forceActiveFocus()
                                        }else if (inputText.length === 0){
                                            txf_confirm_3.inputText.forceActiveFocus()
                                        }
                                    }
                                }

                                Item{Layout.fillWidth: true}
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50

                            RowLayout{
                                anchors.fill: parent
                                spacing: 0
                                layoutDirection: Qt.RightToLeft
                                Item{Layout.fillWidth: true}

                                ImageIcon{
                                    Layout.preferredWidth: 20
                                    Layout.fillHeight: true
                                    imgSource: "qrc:/Icons/forgot.png"
                                    imgColor: "#d43460"
                                    visible: timer_confirmSMS.visible
                                }

                                Item{
                                    Layout.preferredWidth: 10
                                    visible: timer_confirmSMS.visible
                                }

                                //-- module Timer --//
                                Countdown_Timer{
                                    id: timer_confirmSMS
                                    Layout.preferredWidth: 30
                                    Layout.fillHeight: true
                                    minutes: timeMinutes
                                    textColor: "#d43460"
                                    onSecondChanged: {
                                        if(minutes === 0 && second === 0){
                                            timer_confirmSMS.visible = false
                                            lbl_SendAgain.visible = true
                                        }
                                    }
                                }

                                Label{
                                    id: lbl_SendAgain
                                    visible: false
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: "ارسال مجدد کد"
                                    font.family: setting.activeFont
                                    color: "#d43460"

                                    font.pixelSize: Qt.application.font.pixelSize * 1.1
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            timer_confirmSMS.resetTimer()
                                            timer_confirmSMS.minutes = 1
                                            timer_confirmSMS.startTimer()
                                            lbl_SendAgain.visible = false
                                            timer_confirmSMS.visible = true
                                        }
                                    }
                                }

                                Item{
                                    Layout.preferredWidth: 8
                                    visible: timer_confirmSMS.visible
                                }

                                Label{
                                    visible: timer_confirmSMS.visible
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: "تا پایان اعتبار کد تایید"
                                    font.family: setting.activeFont
                                    color: "#d43460"

                                    font.pixelSize: Qt.application.font.pixelSize * 1.1
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter
                                }

                                Item{Layout.fillWidth: true}
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        //-- Button regist --//
                        ButtonImageIcon{
                            id: btn_Confirm
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            icon: "qrc:/Icons/add-user.png"
                            iconColor: "#ffffff"
                            text: btnText
                            textColor: "#ffffff"
                            color: "#d43460"
                            textSize: 1
                            onBtnClicked: {
                                clearCodes()
                                confirmBtnClicked()
                            }
                            Keys.onEnterPressed:{
                                clearCodes()
                                confirmBtnClicked()
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

                //-- spacer --//
                Item{Layout.preferredHeight: 30}


                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 38
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    visible: bottomText
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        layoutDirection: Qt.RightToLeft

                        Item{Layout.fillWidth: true}

                        ImageIcon{
                            Layout.preferredWidth: 20
                            Layout.fillHeight: true
                            imgSource: "qrc:/Icons/user.png"
                            imgColor: color4
                            flip: true
                        }

                        Item{Layout.preferredWidth: 10}

                        Label{
                            id: txtlogin2
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "آیا حساب کاربری دارید؟"
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: color4
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        Item{Layout.preferredWidth: 10}

                        Label{
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "وارد شوید"
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: "#d43460"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    clearCodes()
                                    bottomBtnClicked()
                                }
                            }
                        }

                        Item{Layout.fillWidth: true}
                    }
                }

                //-- filler --//
                Item{Layout.preferredHeight: 100}
            }
        }
    }
}
