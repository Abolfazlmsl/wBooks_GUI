import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

import "./../../../Modules/Items"

import "./../../../../Fonts/Icon.js" as Icons

Item{
    id: root_password


    property alias prePassword        : input_pre_pass.inputText
    property alias password           : input_new_pass.inputText
    property alias password_repeat    : input_new_pass_repeat.inputText

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

    function clearInputs(){
        input_pre_pass.inputText.text = ""
        input_new_pass.inputText.text = ""
        input_new_pass_repeat.inputText.text = ""
    }

    objectName: "ChangePassword"

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
                                text: "اطلاعات را وارد کنید"
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                color: "#ffffff"
                            }
                        }

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 340
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            color: "#e2e2e2"
                            ColumnLayout{
                                anchors.fill: parent
                                anchors.rightMargin: 50
                                anchors.leftMargin: 50

                                Item{Layout.preferredHeight: 40}

                                M_inputText{
                                    id: input_pre_pass
                                    Layout.rightMargin: 50
                                    Layout.leftMargin: 50
                                    Layout.preferredHeight: 45
                                    Layout.fillWidth: true
                                    label: "رمز عبور فعلی"
                                    placeholder: "رمز عبور فعلی"
                                    echoMode: TextInput.Password
                                    itemRadius: 0
                                    fontSize: 1.3
                                    iconAsImage: true
                                    imgIcon: "qrc:/Icons/key.png"
                                    placeHolderPosition: "Center"
                                    iconColor: "#989898"
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
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
                                        color: "#989898"
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

                                Item{Layout.preferredHeight: 20}

                                //-- Password --//
                                M_inputText{
                                    id: input_new_pass
                                    Layout.rightMargin: 50
                                    Layout.leftMargin: 50
                                    Layout.preferredHeight: 45
                                    Layout.fillWidth: true
                                    label: "رمز عبور جدید"
                                    placeholder: "رمز عبور جدید"
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
                                        id: lbl_eyeIcon
                                        width: implicitWidth
                                        height: parent.height
                                        anchors.left: parent.left
                                        anchors.leftMargin: 10 * ratio
                                        verticalAlignment: Qt.AlignVCenter
                                        text: Icons.eye_off
                                        font.family: webfont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 2
                                        color: "#989898"
                                        MouseArea{

                                            property bool passViewHandler: false

                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor


                                            onClicked: {
                                                if(passViewHandler){
                                                    lbl_eyeIcon.text = Icons.eye_off
                                                    input_new_pass.echoMode = TextInput.Password
                                                }
                                                else{
                                                    lbl_eyeIcon.text = Icons.eye
                                                    input_new_pass.echoMode = TextInput.Normal
                                                }
                                                passViewHandler = !passViewHandler
                                            }
                                        }
                                    }

                                    Keys.onTabPressed: {
                                        input_new_pass_repeat.inputText.forceActiveFocus()
                                    }
                                }

                                Item{Layout.preferredHeight: 20}

                                M_inputText{
                                    id: input_new_pass_repeat
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
                                    Keys.onTabPressed: {
                                        changepassBtn.forceActiveFocus()
                                    }

                                    Label{
                                        id: lbl_eyeIcon2
                                        width: implicitWidth
                                        height: parent.height
                                        anchors.left: parent.left
                                        anchors.leftMargin: 10 * ratio
                                        verticalAlignment: Qt.AlignVCenter
                                        text: Icons.eye_off
                                        font.family: webfont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 2
                                        color: "#989898"
                                        MouseArea{

                                            property bool passViewHandler: false

                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor


                                            onClicked: {
                                                if(passViewHandler){
                                                    lbl_eyeIcon2.text = Icons.eye_off
                                                    input_new_pass_repeat.echoMode = TextInput.Password
                                                }
                                                else{
                                                    lbl_eyeIcon2.text = Icons.eye
                                                    input_new_pass_repeat.echoMode = TextInput.Normal
                                                }
                                                passViewHandler = !passViewHandler
                                            }
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 20}

                                //-- Button login --//
                                ButtonImageIcon{
                                    id: login
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
                                        if (parseInt(prePassword.length) === 0){
                                            getMessage("رمز عبور فعلی خود را وارد کنید")
                                            //                                spinner.visible = false
                                        }else if (prePassword.text !== setting.password){
                                            getMessage("رمز عبور فعلی خود را اشتباه وارد کرده اید")
                                        }else if (parseInt(password.length) === 0){
                                            getMessage("رمز عبور جدید خود را وارد کنید")
                                        }else if (password.text != password_repeat.text){
                                            getMessage("رمز عبور و تکرار رمز عبور یکسان نمی باشد")
                                        }else if (password.text === setting.password){
                                            getMessage("رمز عبور جدید با رمز عبور فعلی یکسان است")
                                        }else{
                                            var licenseData = {
                                                "image": setting.licenseImage,
                                                "purchase_id": setting.licensePurchaseNumber,
                                                "time": setting.licenseTime,
                                                "expiredTime": setting.licenseExpiredTime
                                            }
                                            var data = {
                                                "id": setting.user_id,
                                                "name": setting.userName,
                                                "email": setting.userEmail,
                                                "phone": setting.userPhone,
                                                "password": password.text,
                                                "gender": setting.gender,
                                                "mywallet": setting.mywallet,
                                                "user_number": setting.user_number,
                                                "mylicense": licenseData
                                            }
                                            db.storeData("users", data, setting.profile)
                                            setting.password = password.text
                                            clearInputs()
                                            getMessage("")
                                            swipe_pass.currentIndex = 1
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

                        //-- filler --//
                        Item{Layout.preferredHeight: 100}
                    }
                }
            }
        }

        //-- Success Page --//
        SuccessItem{
            id: success
            rightMargin: rMargin
            leftMargin: lMargin
            text: "رمز عبور شما با موفقیت تغییر یافت"
            text2: "بازگشت"
            onLblClicked: {
                getMessage("")
                swipe_pass.currentIndex = 0
            }
        }

    }
}
