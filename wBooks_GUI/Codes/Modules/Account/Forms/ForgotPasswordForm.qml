import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../Modules/Items"

import "./../../../../Fonts/Icon.js" as Icons

Item{
    id: root_password


    property alias prePassword        : input_pre_pass.inputText
    property alias password           : input_new_pass.inputText
    property alias password_repeat    : input_new_pass_repeat.inputText

    signal getMessage(var signalmsg)
    signal trialFinished()

    signal registe()

    onRegiste: {

    }

    property string smsCode: ""
    signal getCode(var code)
    onGetCode: {
        smsCode = code
    }

    Component.onCompleted: {

    }

    objectName: "ForgotPassword"

    MouseArea {
        //            anchors.fill: parent
        width: parent.width
        height: parent.height

        propagateComposedEvents: true
        property real lastMouseX: 0
        property real lastMouseY: 0
        acceptedButtons: Qt.LeftButton
        onMouseXChanged: root_password.x += (mouseX - lastMouseX)
        onMouseYChanged: root_password.y += (mouseY - lastMouseY)
        onPressed: {
            if(mouse.button == Qt.LeftButton){
                parent.forceActiveFocus()
                lastMouseX = mouseX
                lastMouseY = mouseY

                //-- seek clip --//
                //                    player.seek((player.duration*mouseX)/width)
            }
            //                mouse.accepted = false
        }
    }


    SwipeView{
        id: swipe_pass
        anchors.fill: parent
        clip: true
        interactive: false
        currentIndex: 0

        onCurrentIndexChanged: {
            if(currentIndex === 1){
                timer_confirmSMS.resetTimer()
                timer_confirmSMS.minutes = 1
                timer_confirmSMS.startTimer()
            }
        }

        //-- User data --//
        Item{
            ColumnLayout{
                width: parent.width
                height: parent.height * 0.5


                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    color: "transparent"
                    Image{
                        id: image
                        width: 50
                        height: parent.height
                        anchors.left: titletxt.right
                        anchors.leftMargin: 10
                        source: "qrc:/Images/Wbooks1.png"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                    }

                    Label{
                        id: titletxt
                        width: Text.contentWidth
                        height: parent.height
                        anchors.centerIn: parent
                        text: "اطلاعات را به منظور تغییر رمز عبور خود وارد کنید"
                        font.family: mainFont.name
                        color: color8
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                        horizontalAlignment: Qt.AlignHCenter
                        verticalAlignment: Qt.AlignVCenter
                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- previous pass --//
                M_inputText{
                    id: input_pre_pass
                    Layout.fillWidth: true
                    Layout.rightMargin: 0
                    label: "رمز عبور قبلی"
                    icon: Icons.key
                    placeholder: "رمز عبور قبلی"
                    echoMode: TextInput.Password
                    Label{
                        id: lbl_eyeIcon_prepass
                        width: implicitWidth
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 10 * ratio
                        verticalAlignment: Qt.AlignVCenter
                        text: Icons.eye_off
                        font.family: webfont.name
                        font.pixelSize: Qt.application.font.pixelSize * 2

                        MouseArea{

                            property bool passViewHandler: false

                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor


                            onClicked: {
                                if(passViewHandler){
                                    lbl_eyeIcon_prepass.text = Icons.eye_off
                                    input_pre_pass.echoMode = TextInput.Password
                                }
                                else{
                                    lbl_eyeIcon_prepass.text = Icons.eye
                                    input_pre_pass.echoMode = TextInput.Normal
                                }
                                passViewHandler = !passViewHandler
                            }
                        }
                    }
                    Keys.onTabPressed: {
                        input_new_pass.inputText.forceActiveFocus()
                    }

                    //                                    inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 5}

                //-- Email --//
                M_inputText{
                    id: input_new_pass
                    Layout.fillWidth: true
                    Layout.rightMargin: 0
                    label: "رمز عبور جدید"
                    icon: Icons.key
                    placeholder: "رمز عبور جدید"
                    echoMode: TextInput.Password
                    clearEnable: false
                    inputText.maximumLength: 16

                    Label{
                        id: lbl_eyeIcon
                        width: implicitWidth
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 10 * ratio
                        verticalAlignment: Qt.AlignVCenter
                        text: Icons.eye_off
                        font.family: webfont.name
                        font.pixelSize: Qt.application.font.pixelSize * 2

                        MouseArea{

                            property bool passViewHandler: false

                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor


                            onClicked: {
                                if(passViewHandler){
                                    lbl_eyeIcon.text = Icons.eye_off
                                    input_new_pass.echoMode = TextInput.Password
                                    input_new_pass_repeat.echoMode = TextInput.Password
                                }
                                else{
                                    lbl_eyeIcon.text = Icons.eye
                                    input_new_pass.echoMode = TextInput.Normal
                                    input_new_pass_repeat.echoMode = TextInput.Normal
                                }
                                passViewHandler = !passViewHandler
                            }
                        }
                    }

                    Keys.onTabPressed: {
                        input_new_pass_repeat.inputText.forceActiveFocus()
                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 5}

                //-- Email --//
                M_inputText{
                    id: input_new_pass_repeat
                    Layout.fillWidth: true
                    Layout.rightMargin: 0
                    label: "تکرار رمز عبور جدید"
                    icon: Icons.key
                    placeholder: "تکرار رمز عبور جدید"
                    Keys.onTabPressed: {
                        changepassBtn.forceActiveFocus()
                    }
                    echoMode: TextInput.Password
                    clearEnable: false
                    inputText.maximumLength: 16

                    Label{
                        id: lbl_confirmIcon

                        visible: (input_new_pass.inputText.text === input_new_pass_repeat.inputText.text) &&
                                 (input_new_pass.inputText.text !== "" && input_new_pass_repeat.inputText.text !== "") ? true : false
                        width: implicitWidth
                        height: parent.height
                        anchors.left: parent.left
                        anchors.leftMargin: 10 * ratio
                        verticalAlignment: Qt.AlignVCenter
                        text: Icons.check
                        color: color21
                        font.family: webfont.name
                        font.pixelSize: Qt.application.font.pixelSize * 2

                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- Button change pass --//
                ButtonShadow{
                    id: changepassBtn
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    btnText: "تغییر رمز عبور"
                    textColor: "#ffffff"
                    btnRadius: 10
                    onDashboard_btnClicked: {
                        if (parseInt(prePassword.length) === 0){
                            getMessage("رمز عبور قبلی خود را وارد کنید")
                            //                                spinner.visible = false
                        }else if (prePassword.text !== setting.password){
                            getMessage("رمز عبور قبلی خود را اشتباه وارد کرده اید")
                        }else if (parseInt(password.length) === 0){
                            getMessage("رمز عبور جدید خود را وارد کنید")
                        }else if (password.text != password_repeat.text){
                            getMessage("رمز عبور و تکرار رمز عبور یکسان نمی باشد")
                        }else{
//                                MainPython.sendSMS(phone.text)
                            timer_confirmSMS.visible = true
                            lbl_SendAgain.visible = false
                            swipe_pass.currentIndex = 1
                        }
                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 15}

                LoadingSpinner{
                    id: spinner
                    visible: false
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    leftMarg: 60
                }

                //-- filler --//
                Item{Layout.fillHeight: true}
            }
        }

        //-- Confirm phone Number --//
        Item {
            Rectangle{
                anchors.fill: parent
                anchors.leftMargin: parent.width * 0.2
                anchors.rightMargin: parent.width * 0.15
                color: "transparent"

                ColumnLayout{
                    anchors.fill: parent
                    spacing: 10

                    //-- spacer --//
                    Item{Layout.preferredHeight: 50}

                    //-- "Confirmation Code" text --//
                    Label{
                        Layout.fillWidth: true
                        Layout.preferredHeight: implicitHeight
                        text: "پیامک فعالسازی به شماره زیر ارسال شده است:"
                        font.family: mainFont.name
                        color: color8
                        font.pixelSize: Qt.application.font.pixelSize * 1.3
                        horizontalAlignment: Qt.AlignHCenter

                    }

                    //-- "phoneNumber" and "Phone number correction" --//
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        Layout.topMargin: -10

                        RowLayout{
                            anchors.fill: parent
                            spacing: 10

                            //-- spacer --//
                            Item{Layout.fillWidth: true}

                            //-- "phoneNumber" text --//
                            Label{
                                Layout.preferredWidth: implicitWidth
                                Layout.preferredHeight: implicitHeight
                                text: setting.userPhone
                                font.family: mainFont.name
                                color: color12

                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                horizontalAlignment: Qt.AlignHCenter

                            }

                            //-- "phoneNumber" text --//
                            Label{
                                Layout.preferredWidth: implicitWidth
                                Layout.preferredHeight: implicitHeight
                                text: "بازگشت"
                                font.family: mainFont.name
                                color: color8

                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                horizontalAlignment: Qt.AlignHCenter

                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        swipe_pass.currentIndex = 0
                                    }
                                }
                            }

                            //-- spacer --//
                            Item{Layout.fillWidth: true}

                        }
                    }

                    //-- TextInput Confirm --//
                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 38

                        radius: height / 2

                        border.width: 2
                        border.color: "#211D1D"

                        //-- TextField --//
                        TextInput{
                            id:txf_confirm

                            clip: true
                            maximumLength: 5

                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter

                            width: parent.width - (parent.radius * 2)
                            height: parent.height - (parent.border.width * 2)
                            anchors.centerIn: parent

                            font.pixelSize: Qt.application.font.pixelSize * 1.3
                            font.letterSpacing: 15

                            selectByMouse: true

                            validator: RegularExpressionValidator { regularExpression: /^[0-9]{5}$/ }

                            onTextChanged: {
                                if(length === 5){
                                    btn_Confirm.forceActiveFocus()
                                }
                            }


                            //-- placeholder --//
                            Label{
                                id: lbl_placeholder

                                visible: (txf_confirm.length >= 1) ? false : true

                                text: "5-Digits"

                                anchors.centerIn: parent
                                //                                anchors.horizontalCenter: parent.horizontalCenter


                                font.pixelSize: Qt.application.font.pixelSize

                                color: color19

                                background: Rectangle{
                                    color: "transparent"
                                }

                            }

                        }



                    }

                    //-- Button Confirm --//
                    Rectangle{
                        id: rect_Confirm
                        Layout.fillWidth: true
                        Layout.preferredHeight: 38

                        radius: height / 2

                        color: "#211D1D"
                        border.color: color8

                        Label{
                            anchors.centerIn: parent
                            text: "تایید"
                            font.family: mainFont.name
                            font.pixelSize: Qt.application.font.pixelSize * 1
                            color: "#ffffff"
                        }

                        Rectangle{
                            id: rect_focus
                            visible: btn_Confirm.focus ? true : false
                            width: parent.width - 5
                            height: parent.height - 5
                            anchors.centerIn: parent

                            radius: height / 2
                            color: "transparent"

                            border.color: "#ffffff"
                            border.width: 1


                        }

                        MouseArea{
                            id: btn_Confirm
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {
                                var data = {
                                    "name": setting.userName,
                                    "email": setting.userEmail,
                                    "phone": setting.userPhone,
                                    "password": password.text,
                                    "gender": "",
                                    "mybooks": "",
                                    "myaudiobooks": "",
                                    "myvideos": "",
                                    "mywallet": "",
                                    "mylicense": "",
                                    "profile": "",
                                    "user_id": "",
                                    "basket": ""
                                }

                                db.addTable("users", true)
                                db.storeData("users", data, "")

                                setting.password = password.text
                                mainPage.state = "Edit"
//                                if (txf_confirm.text === smsCode){
//                                    spinner.visible = true
////                                    MainPython.makeTrialData(15, setting.tokenAccess, Service.BASE, Service.url_license, Service.url_device)
//                                }else{
//                                    getMessage("کد وارد شده اشتباه است")
//                                    spinner.visible = false
//                                }

//                                var endpoint = Service.url_user

//                                Service.create_item(_token_access, endpoint, data, function(resp, http) {

//                                    setting.userName = name.text
//                                    setting.userPhone = phone.text
//                                    setting.userEmail = email.text
//                                    setting.password = password.text
//                                    setting.isLogined = true
//                                    mainPage.state = "Home"

//                                })
                            }

                            Keys.onEnterPressed: {
                                var data = {
                                    "name": setting.userName,
                                    "email": setting.userEmail,
                                    "phone": setting.userPhone,
                                    "password": password.text,
                                    "gender": "",
                                    "mybooks": "",
                                    "myaudiobooks": "",
                                    "myvideos": "",
                                    "mywallet": "",
                                    "mylicense": "",
                                    "profile": "",
                                    "user_id": "",
                                    "basket": ""
                                }

                                db.addTable("users", true)
                                db.storeData("users", data, "")

                                setting.password = password.text
                                mainPage.state = "Edit"
//                                if (txf_confirm.text === smsCode){
//                                    spinner.visible = true
////                                    MainPython.makeTrialData(15, setting.tokenAccess, Service.BASE, Service.url_license, Service.url_device)
//                                }else{
//                                    getMessage("کد وارد شده اشتباه است")
//                                    spinner.visible = false
//                                }

//                                var endpoint = Service.url_user

//                                Service.create_item(_token_access, endpoint, data, function(resp, http) {

//                                    setting.userName = name.text
//                                    setting.userPhone = phone.text
//                                    setting.userEmail = email.text
//                                    setting.password = password.text
//                                    setting.isLogined = true
//                                    mainPage.state = "Home"

//                                })
                            }

                        }
                    }

                    //-- module Timer --//
                    Countdown_Timer{
                        id: timer_confirmSMS
                        Layout.fillWidth: true
                        Layout.preferredHeight: lbl_SendAgain.implicitHeight

                        minutes: 1

                        //color: "#55ff0000"
                        lblTimer.color: color4

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
                        Layout.fillWidth: true
                        Layout.preferredHeight: implicitHeight
                        text: "ارسال مجدد کد"
                        font.family: mainFont.name
                        color: color8

                        font.pixelSize: Qt.application.font.pixelSize * 1.1
                        horizontalAlignment: Qt.AlignHCenter

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

                    //-- filler --//
                    Item{Layout.fillHeight: true}
                }


            }
        }

    }
}
