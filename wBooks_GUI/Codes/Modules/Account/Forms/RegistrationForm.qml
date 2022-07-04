import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons

import "./../../Items"

Item{
    id: root_register

    property alias name               : input_name.inputText
    property alias phone              : input_phone.inputText
    property alias email              : input_Email.inputText
    property alias password           : input_password.inputText
    property alias password_repeat    : input_password_repeat.inputText

//    function isEmailExist(data, email){
//        for(var i=0; i<data.length; i++){
//            if(data[i].email===email && data[i].licenseType==="trial"){
//                return true
//            }
//        }
//        return false
//    }

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

    objectName: "Registration"

    MouseArea {
        //            anchors.fill: parent
        width: parent.width
        height: parent.height

        propagateComposedEvents: true
        property real lastMouseX: 0
        property real lastMouseY: 0
        acceptedButtons: Qt.LeftButton
        onMouseXChanged: root_register.x += (mouseX - lastMouseX)
        onMouseYChanged: root_register.y += (mouseY - lastMouseY)
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
        id: swipe_register
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
                Item{Layout.preferredHeight: 20}

                //-- "purchase PoroX license key --//
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    text: "لطفا اطلاعات خود را وارد کنید"
                    font.family: iranSans.name
                    color: color8

                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                    horizontalAlignment: Qt.AlignHCenter

                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- Email --//
                M_inputText{
                    id: input_name
                    label: "نام"
                    icon: Icons.account
                    placeholder: "نام"

                    Keys.onTabPressed: {
                        input_phone.inputText.forceActiveFocus()
                    }

                    //                                    inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 5}

                //-- Email --//
                M_inputText{
                    id: input_phone
                    label: "شماره تماس"
                    icon: Icons.cellphone
                    placeholder: "09xxxxxxxxx"
                    Keys.onTabPressed: {
                        input_Email.inputText.forceActiveFocus()
                    }
                    inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 5}

                //-- Email --//
                M_inputText{
                    id: input_Email
                    label: "ایمیل"
                    icon: Icons.email_outline
                    placeholder: "ایمیل"
                    Keys.onTabPressed: {
                        input_password.inputText.forceActiveFocus()
                    }

                    //            inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- password --//
                M_inputText{
                    id: input_password

                    label: "رمز عبور"
                    icon: Icons.lock_outline
                    placeholder: "رمز عبور (8 حرف)"
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
                                    input_password.echoMode = TextInput.Password
                                    input_password_repeat.echoMode = TextInput.Password
                                }
                                else{
                                    lbl_eyeIcon.text = Icons.eye
                                    input_password.echoMode = TextInput.Normal
                                    input_password_repeat.echoMode = TextInput.Normal
                                }
                                passViewHandler = !passViewHandler
                            }
                        }
                    }


                    Keys.onTabPressed: {
                        input_password_repeat.inputText.forceActiveFocus()
                    }

                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- Confirm password --//
                M_inputText{
                    id: input_password_repeat

                    label: "تایید رمز عبور"
                    icon: Icons.lock
                    placeholder: "تایید رمز عبور"
                    echoMode: TextInput.Password
                    clearEnable: false
                    inputText.maximumLength: 16

                    Keys.onTabPressed: {
                        input_name.inputText.forceActiveFocus()
                    }

                    Label{
                        id: lbl_confirmIcon

                        visible: (input_password.inputText.text === input_password_repeat.inputText.text) &&
                                 (input_password.inputText.text !== "" && input_password_repeat.inputText.text !== "") ? true : false
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

                //-- Button registe --//
                Rectangle{
                    id: purchase
                    Layout.fillWidth: true
                    Layout.preferredHeight: 38

                    radius: height / 2

                    color: "#211D1D"
                    border.color: color8

                    Label{
                        anchors.centerIn: parent
                        text: "ثبت نام"
                        font.family: iranSans.name
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                        color: "#ffffff"
                    }

                    MouseArea{
                        id: btn_register
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor

                        onClicked: {
                            if (parseInt(email.length) === 0){
                                getMessage("ایمیل خود را وارد کنید")
                                //                                spinner.visible = false
                            }else if (parseInt(name.length) === 0){
                                getMessage("نام خود را وارد کنید")
                            }else if (parseInt(phone.length) === 0){
                                getMessage("شماره تماس خود را وارد کنید")
                            }else if (parseInt(password.length) === 0){
                                getMessage("رمز عبور خود را وارد کنید")
                            }else if (parseInt(password_repeat.length) === 0){
                                getMessage("تایی رمز عبور خود را وارد نمایید")
                            }else if (password.text != password_repeat.text){
                                getMessage("رمز عبور و تایید رمز عبور یکی نمی باشد")
                            }else{
//                                MainPython.sendSMS(phone.text)
                                timer_confirmSMS.visible = true
                                lbl_SendAgain.visible = false
                                swipe_register.currentIndex = 1
                            }
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
                        font.family: iranSans.name
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
                                text: input_phone.inputText.text
                                font.family: iranSans.name
                                color: color12

                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                horizontalAlignment: Qt.AlignHCenter

                            }

                            //-- "Phone number correction" text --//
                            Label{
                                Layout.preferredWidth: implicitWidth
                                Layout.preferredHeight: implicitHeight
                                text: "تغییر شماره همراه"
                                color: color8
                                font.family: iranSans.name

                                font.pixelSize: Qt.application.font.pixelSize * 1.1
                                horizontalAlignment: Qt.AlignHCenter

                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        swipe_register.currentIndex = 0
                                        input_phone.inputText.forceActiveFocus()
                                        input_phone.inputText.selectAll()
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
                            font.family: iranSans.name
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
                                    "name": name.text,
                                    "email": email.text,
                                    "phone": phone.text,
                                    "password": password.text,
                                    "gender": ""
                                }

                                db.addTable("users", true)
                                db.storeData("users", data, "")

                                setting.userName = name.text
                                setting.userPhone = phone.text
                                setting.userEmail = email.text
                                setting.password = password.text
                                setting.isLogined = true
                                mainPage.state = "Home"
//                                if (txf_confirm.text === smsCode){
//                                    spinner.visible = true
////                                    MainPython.makeTrialData(15, setting.tokenAccess, Service.BASE, Service.url_license, Service.url_device)
//                                }else{
//                                    getMessage("کد وارد شده اشتباه است")
//                                    spinner.visible = false
//                                }
                            }

                            Keys.onEnterPressed: {
                                var data = {
                                    "name": name.text,
                                    "email": email.text,
                                    "phone": phone.text,
                                    "password": password.text,
                                    "gender": ""
                                }

                                db.addTable("users", true)
                                db.storeData("users", data, "")

                                var obj = db.readAllData("users")
                                var data2
                                for(var i=0 ; i< obj.length ; i++){
                                    data2 = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
                                    if (data2.phone === phone.text){
                                        break;
                                    }
                                }

                                setting.user_id = data2.id
                                setting.userName = name.text
                                setting.userPhone = phone.text
                                setting.userEmail = email.text
                                setting.password = password.text
                                setting.isLogined = true
                                mainPage.state = "Home"
//                                if (txf_confirm.text === smsCode){
//                                    spinner.visible = true
////                                    MainPython.makeTrialData(15, setting.tokenAccess, Service.BASE, Service.url_license, Service.url_device)
//                                }else{
//                                    getMessage("کد وارد شده اشتباه است")
//                                    spinner.visible = false
//                                }
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
                        font.family: iranSans.name
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

