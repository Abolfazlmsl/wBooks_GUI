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
    id: root_login

    property alias phone    : input_phone.inputText
    property alias password    : input_password.inputText
    property string gender  : ""

    property double rMargin: 0
    property double lMargin: 0

    signal getMessage(var signalmsg)
    signal trialFinished()

    signal login()

    onLogin: {

    }

    Component.onCompleted: {

    }

    objectName: "Login"

    MouseArea {
        //            anchors.fill: parent
        width: parent.width
        height: parent.height

        propagateComposedEvents: true
        property real lastMouseX: 0
        property real lastMouseY: 0
        acceptedButtons: Qt.LeftButton
        onMouseXChanged: root_login.x += (mouseX - lastMouseX)
        onMouseYChanged: root_login.y += (mouseY - lastMouseY)
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
                        ColorOverlay {
                            anchors.fill: image
                            source: image
                            color: color4
                        }
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
                        text: "به وی بوکس خوش آمدید"
                        font.family: mainFont.name
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

                        //-- Phone --//
                        M_inputText{
                            id: input_phone
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.preferredHeight: 45
                            Layout.fillWidth: true
                            label: "شماره همراه"
                            icon: Icons.phone
                            itemRadius: 0
                            placeholder: "شماره همراه"
                            placeHolderPosition: "Center"
                            iconColor: "#989898"
                            fontSize: 1.2
                            bgColor: "#d6d6d6"
                            borderColor: "#d6d6d6"
                            Keys.onTabPressed: {
                                input_password.inputText.forceActiveFocus()
                            }
                            inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
                        }

                        Item{Layout.preferredHeight: 20}

                        //-- Password --//
                        M_inputText{
                            id: input_password
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.preferredHeight: 45
                            Layout.fillWidth: true
                            label: "رمز عبور"
                            icon: Icons.key
                            placeholder: "رمز عبور"
                            echoMode: TextInput.Password
                            itemRadius: 0
                            fontSize: 1.3
                            placeHolderPosition: "Center"
                            iconColor: "#989898"
                            bgColor: "#d6d6d6"
                            borderColor: "#d6d6d6"
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
                                input_phone.inputText.forceActiveFocus()
                            }

                            //            inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
                        }

                        Item{Layout.preferredHeight: 30}

                        //-- Button login --//
                        ButtonIcon{
                            id: login
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            icon: Icons.account
                            iconFont: webfont.name
                            iconColor: "#ffffff"
                            iconSize: 2
                            text: "ورود به پنل کاربری"
                            textColor: "#ffffff"
                            color: "#d43460"
                            textSize: 1
                            onBtnClicked: {
                                if (parseInt(phone.length) === 0){
                                    getMessage("شماره همراه خود را وارد کنید")
                                }else if (parseInt(password.length) === 0){
                                    getMessage("رمز عبور خود را وارد کنید")
                                }else{
                                    var obj = db.readAllData("users")
                                    var data
                                    var isUser = false
                                    for(var i=0 ; i< obj.length ; i++){
                                        data = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
                                        if (data.phone === phone.text){
                                            isUser = true
                                            break;
                                        }
                                    }

                                    if (isUser){
                                        if (data.password === password.text){
                                            setting.isLogined = true
                                            setting.userName = data.name
                                            setting.userEmail = data.email
                                            setting.userPhone = data.phone
                                            setting.gender = data.gender
                                            setting.profile = JSON.parse(JSON.stringify(obj[i])).image
                                            setting.user_id = JSON.parse(JSON.stringify(obj[i])).id
                                            setting.password = data.password
                                            mainPage.state = "Home"
                                        }else{
                                            getMessage("رمز عبور اشتباه است")
                                        }
                                    }else{
                                        getMessage("کاربری با این مشخصات یافت نشد")
                                    }

                                    //                            var d  = Service.get_all(Service.url_user , function(data){
                                    //                                for(var i=0 ; i< data.length ; i++){
                                    //                                    if (data[i].phone === phone.text){
                                    //                                        isUser = true
                                    //                                        break;
                                    //                                    }
                                    //                                }

                                    //                                if (isUser){
                                    //                                    if (data[i].password === password.text){
                                    //                                        setting.isLogined = true
                                    //                                        setting.userName = data[i].name
                                    //                                        setting.userEmail = data[i].email
                                    //                                        setting.userPhone = data[i].phone
                                    //                                        setting.gender = data[i].gender
                                    //                                          setting.mybooks = data[i].mybooks
                                    //اضافه کردن بقیه
                                    //                                        setting.profile = JSON.parse(JSON.stringify(obj[i])).image
                                    //                                        setting.user_id = JSON.parse(JSON.stringify(obj[i])).id
                                    //                                        setting.password = data.password
                                    //                                        mainPage.state = "Home"
                                    //                                    }else{
                                    //                                        getMessage("رمز عبور اشتباه است")
                                    //                                    }
                                    //                                }else{
                                    //                                    getMessage("کاربری با این مشخصات یافت نشد")
                                    //                                }
                                    //                            })

                                }
                            }
                        }

                        Item{Layout.preferredHeight: 30}

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 20
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            RowLayout{
                                anchors.fill: parent
                                spacing: 0
                                layoutDirection: Qt.RightToLeft

                                Item{Layout.fillWidth: true}

                                Rectangle{
                                    Layout.preferredWidth: 20
                                    Layout.fillHeight: true
                                    color: "transparent"
                                    Label{
                                        anchors.centerIn: parent
                                        text: Icons.lock
                                        font.family: webfont.name
                                        font.pixelSize: Qt.application.font.pixelSize * 2 //* widthRatio
                                        font.bold: true

                                        color: "#000000"
                                    }
                                }

                                Item{Layout.preferredWidth: 10}

                                Label{
                                    id: forgotPassword
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: "رمز عبور خود را فراموش کرده اید؟"
                                    font.family: mainFont.name
                                    font.pixelSize: Qt.application.font.pixelSize
                                    color: color4
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {

                                        }
                                    }
                                }

                                Item{Layout.fillWidth: true}
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
                        spacing: 10
                        layoutDirection: Qt.RightToLeft

                        //-- Button login gmail --//
                        ButtonIcon{
                            id: logingmail
                            Layout.preferredWidth: parent.width * 0.3
                            Layout.fillHeight: parent
                            icon: Icons.email
                            iconFont: webfont.name
                            iconColor: "#000000"
                            iconSize: 2
                            text: "ورود با جیمیل"
                            textColor: "#000000"
                            color: "#d6d6d6"
                            textSize: 1
                            onBtnClicked: {

                            }
                        }

                        Item{Layout.fillWidth: true}

                        //-- Button login github --//
                        ButtonIcon{
                            id: logingithub
                            Layout.preferredWidth: parent.width * 0.3
                            Layout.fillHeight: parent
                            icon: Icons.github_box
                            iconFont: webfont.name
                            iconColor: "#000000"
                            iconSize: 2
                            text: "ورود با گیت هاب"
                            textColor: "#000000"
                            color: "#d6d6d6"
                            textSize: 1
                            onBtnClicked: {

                            }
                        }

                        Item{Layout.fillWidth: true}

                        //-- Button login facebook --//
                        ButtonIcon{
                            id: loginfacebook
                            Layout.preferredWidth: parent.width * 0.3
                            Layout.fillHeight: parent
                            icon: Icons.facebook
                            iconFont: webfont.name
                            iconColor: "#000000"
                            iconSize: 2
                            text: "ورود با فیس بوک"
                            textColor: "#000000"
                            color: "#d6d6d6"
                            textSize: 1
                            onBtnClicked: {

                            }
                        }
                    }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 20}

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
                            imgSource: "qrc:/Icons/add-user.png"
                            imgColor: color4
                        }

                        Item{Layout.preferredWidth: 10}

                        Label{
                            id: txtregiste
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "آیا تا به حال ثبت نام نکرده اید؟"
                            font.family: mainFont.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: color4
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        Item{Layout.preferredWidth: 10}

                        Label{
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "ثبت نام کنید"
                            font.family: mainFont.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: "#d43460"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    mainPage.state = "Registration"
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
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
//                    leftMarg: 60
                }

                //-- filler --//
                Item{Layout.preferredHeight: 100}
            }
        }
    }
}

