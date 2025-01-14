import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../REST/apiService.js" as Service
import "./../../../../Functions/Funcs.js" as Functions

import "./../../Items"

Item{
    id: root_register

    property alias firstname          : input_firstname.inputText
    property alias lastname           : input_lastname.inputText
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

    property double rMargin: 0
    property double lMargin: 0

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
                confirmItem.timerStart()
            }
        }

        //-- User data --//
        Item{

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
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
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
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            color: "#474749"
                            Label{
                                anchors.centerIn: parent
                                text: "لطفا اطلاعات کاربری خود را وارد کنید"
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                                color: "#ffffff"
                            }
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 420
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            color: "#e2e2e2"
                            ColumnLayout{
                                anchors.fill: parent
                                anchors.rightMargin: 50
                                anchors.leftMargin: 50

                                Item{Layout.preferredHeight: 40}

                                Item{
                                    Layout.rightMargin: 50
                                    Layout.leftMargin: 50
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 45
                                    RowLayout{
                                        anchors.fill: parent
                                        spacing: 0
                                        layoutDirection: Qt.RightToLeft
                                        //-- First name --//
                                        M_inputText{
                                            id: input_firstname
                                            Layout.rightMargin: 0
                                            Layout.leftMargin: 0
                                            Layout.preferredHeight: 45
                                            Layout.fillWidth: true
                                            label: "نام"
                                            iconAsImage: true
                                            imgIcon: "qrc:/Icons/id-card.png"
                                            itemRadius: 0
                                            placeholder: "نام"
                                            placeHolderPosition: "Center"
                                            iconColor: "#989898"
                                            fontSize: 1.2
                                            bgColor: "#d6d6d6"
                                            borderColor: "#d6d6d6"
                                            Keys.onTabPressed: {
                                                input_lastname.inputText.forceActiveFocus()
                                            }
                                        }

                                        Item{Layout.preferredWidth: 15}

                                        //-- Last name --//
                                        M_inputText{
                                            id: input_lastname
                                            Layout.rightMargin: 0
                                            Layout.leftMargin: 0
                                            Layout.preferredHeight: 45
                                            Layout.fillWidth: true
                                            label: "نام خانوادگی"
                                            iconAsImage: true
                                            imgIcon: "qrc:/Icons/id-card.png"
                                            itemRadius: 0
                                            placeholder: "نام خانوادگی"
                                            placeHolderPosition: "Center"
                                            iconColor: "#989898"
                                            fontSize: 1.2
                                            bgColor: "#d6d6d6"
                                            borderColor: "#d6d6d6"
                                            Keys.onTabPressed: {
                                                input_phone.inputText.forceActiveFocus()
                                            }
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 20}

                                //-- Phone --//
                                M_inputText{
                                    id: input_phone
                                    Layout.rightMargin: 50
                                    Layout.leftMargin: 50
                                    Layout.preferredHeight: 45
                                    Layout.fillWidth: true
                                    label: "شماره همراه"
                                    iconAsImage: true
                                    imgIcon: "qrc:/Icons/phone-call.png"
                                    iconRotation: 270
                                    itemRadius: 0
                                    placeholder: "شماره همراه"
                                    placeHolderPosition: "Center"
                                    iconColor: "#989898"
                                    fontSize: 1.2
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
                                    Keys.onTabPressed: {
                                        input_Email.inputText.forceActiveFocus()
                                    }
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
                                }

                                Item{Layout.preferredHeight: 20}

                                //-- Email --//
                                M_inputText{
                                    id: input_Email
                                    Layout.rightMargin: 50
                                    Layout.leftMargin: 50
                                    Layout.preferredHeight: 45
                                    Layout.fillWidth: true
                                    label: "ایمیل"
                                    iconAsImage: true
                                    imgIcon: "qrc:/Icons/arroba.png"
                                    itemRadius: 0
                                    placeholder: "ایمیل"
                                    placeHolderPosition: "Center"
                                    iconColor: "#989898"
                                    fontSize: 1.2
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
                                    Keys.onTabPressed: {
                                        input_password.inputText.forceActiveFocus()
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
                                        layoutDirection: Qt.RightToLeft

                                        //-- password --//
                                        M_inputText{
                                            id: input_password
                                            Layout.rightMargin: 0
                                            Layout.leftMargin: 0
                                            Layout.preferredHeight: 45
                                            Layout.fillWidth: true
                                            label: "رمز عبور"
                                            iconAsImage: true
                                            imgIcon: "qrc:/Icons/key.png"
                                            placeholder: "رمز عبور"
                                            echoMode: TextInput.Password
                                            itemRadius: 0
                                            fontSize: 1.3
                                            placeHolderPosition: "Center"
                                            iconColor: "#989898"
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
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2

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

                                        Item{Layout.preferredWidth: 15}

                                        //-- Confirm password --//
                                        M_inputText{
                                            id: input_password_repeat
                                            Layout.rightMargin: 0
                                            Layout.leftMargin: 0
                                            Layout.preferredHeight: 45
                                            Layout.fillWidth: true
                                            label: "تکرار رمز عبور"
                                            iconAsImage: true
                                            imgIcon: "qrc:/Icons/key.png"
                                            placeholder: "تکرار رمز عبور"
                                            echoMode: TextInput.Password
                                            itemRadius: 0
                                            fontSize: 1.3
                                            placeHolderPosition: "Center"
                                            iconColor: "#989898"
                                            bgColor: "#d6d6d6"
                                            borderColor: "#d6d6d6"
                                            inputText.maximumLength: 16

                                            Keys.onTabPressed: {
                                                regist.forceActiveFocus()
                                            }
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
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2

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
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 20}

                                //-- Button regist --//
                                ButtonImageIcon{
                                    id: regist
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 50
                                    Layout.rightMargin: 50
                                    Layout.leftMargin: 50
                                    icon: "qrc:/Icons/next.png"
                                    iconRotation: 180
                                    iconColor: "#ffffff"
                                    text: "مرحله بعد"
                                    textColor: "#ffffff"
                                    color: "#d43460"
                                    textSize: 1
                                    direction: "Left_Right"
                                    onBtnClicked: {
                                        var obj = db.readAllData("users")
                                        var data
                                        var phoneExist = false
                                        var emailExist = false
                                        for(var i=0 ; i< obj.length ; i++){
                                            data = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
                                            if (data.phone === phone.text){
                                                phoneExist = true
                                                break;
                                            }else if (data.email === email.text){
                                                emailExist = true
                                                break;
                                            }
                                        }

                                        if (parseInt(firstname.length) === 0){
                                            getMessage("نام خود را وارد کنید")
                                        }else if (parseInt(lastname.length) === 0){
                                            getMessage("نام خانوادگی خود را وارد کنید")
                                        }else if (parseInt(phone.length) === 0){
                                            getMessage("شماره تماس خود را وارد کنید")
                                        }else if (parseInt(email.length) === 0){
                                            getMessage("ایمیل خود را وارد کنید")
                                            //                                spinner.visible = false
                                        }else if (parseInt(password.length) === 0){
                                            getMessage("رمز عبور خود را وارد کنید")
                                        }else if (parseInt(password_repeat.length) === 0){
                                            getMessage("تکرار رمز عبور خود را وارد نمایید")
                                        }else if (password.text != password_repeat.text){
                                            getMessage("رمز عبور و تکرار رمز عبور یکی نمی باشد")
                                        }else if (phoneExist){
                                            getMessage("کاربری با شماره همراه وارد شده قبلا ثبت نام کرده است")
                                        }else if (emailExist){
                                            getMessage("کاربری با ایمیل وارد شده قبلا ثبت نام کرده است")
                                        }else{
                                            //                                MainPython.sendSMS(phone.text)
                                            confirmItem.timer = true
                                            confirmItem.sendAgain = false
                                            getMessage("")
                                            swipe_register.currentIndex = 1
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 30}
                            }
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 2
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            color: "#d43460"
                        }

                        //-- spacer --//
                        Item{Layout.preferredHeight: 30}


                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 38
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
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
                                    id: txtlogin
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: "آیا حساب کاربری دارید؟"
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
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
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                                    color: "#d43460"
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            getMessage("")
                                            commander.changePage(mainPage.state)
                                            mainPage.state = "Login"
                                        }
                                    }
                                }

                                Item{Layout.fillWidth: true}
                            }
                        }

                        LoadingSpinner{
                            id: spinner
                            visible: false
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            leftMarg: 60
                        }

                        //-- filler --//
                        Item{Layout.preferredHeight: 100}
                    }
                }
            }
        }

        //-- Confirm phone Number --//
        PhoneConfirmForm{
            id: confirmItem
            phoneNumber: phone.text
            timeMinutes: 2
            rightMargin: rMargin
            leftMargin: lMargin
            btnText: "تکمیل ثبت نام"

            onPhoneClicked: {
                confirmItem.timer = false
                confirmItem.sendAgain = true
                getMessage("")
                swipe_register.currentIndex = 0
            }

            onBottomBtnClicked: {
                confirmItem.timer = false
                confirmItem.sendAgain = true
                commander.changePage(mainPage.state)
                mainPage.state = "Login"
                getMessage("")
                swipe_register.currentIndex = 0
            }

            onConfirmBtnClicked: {
                var obj = db.readAllData("users")
                var isNumber = true
                while(isNumber){
                    var uNumber = Functions.getRandomNumber(100000, 1000000)
                    var dbData
                    isNumber = false
                    for(var i=0 ; i< obj.length ; i++){
                        dbData = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
                        if (dbData.user_number === uNumber){
                            isNumber = true
                            break;
                        }
                    }
                }

                var rand_id = Functions.getRandomNumber(1, 10000000)
                var is_id = true
                while(is_id){
                    is_id = false
                    for(var j=0 ; j< obj.length ; j++){
                        dbData = JSON.parse(JSON.parse(JSON.stringify(obj[j])).VALUE)
                        if (dbData.id === rand_id){
                            is_id = true
                            break;
                        }
                    }
                }


                var licenseData = {
                    "image": "",
                    "purchase_id": 0,
                    "time": 0,
                    "expiredTime": ""
                }

                var birthday = {
                    "day": "",
                    "month": "",
                    "year": ""
                }

                var data = {
                    "id": rand_id,
                    "name": firstname.text + " " + lastname.text,
                    "email": email.text,
                    "phone": phone.text,
                    "password": password.text,
                    "gender": "",
                    "birthday": birthday,
                    "getEmail": true,
                    "mybooks": "",
                    "myaudiobooks": "",
                    "myvideos": "",
                    "mywallet": 0,
                    "mylicense": licenseData,
                    "profile": "",
                    "user_number": uNumber,
                    "basket": ""
                }

                db.addTable("users", true)
                db.storeData("users", data, "")

                setting.user_id = rand_id
                setting.userName = firstname.text + " " + lastname.text
                setting.userPhone = phone.text
                setting.userEmail = email.text
                setting.password = password.text
                setting.mywallet = 0
                setting.user_number = uNumber
                setting.isLogined = true
                confirmItem.timer = false
                confirmItem.sendAgain = true
                getMessage("")
                swipe_register.currentIndex = 2
//                mainPage.state = "Home"
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

        WelcomePage{
            id: welcomeItem
            rightMargin: rMargin
            leftMargin: lMargin
            onTopBtnClicked: {
                getMessage("")
                commander.changePage(mainPage.state)
                mainPage.state = "Edit"
            }

            onBottomBtnClicked: {
                getMessage("")
                commander.changePage(mainPage.state)
                mainPage.state = "Membership"
            }
        }
    }
}

