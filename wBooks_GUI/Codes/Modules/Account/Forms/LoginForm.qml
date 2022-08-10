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


    ColumnLayout{
            width: parent.width
            height: parent.height


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
                    text: "به wBooks خوش آمدید"
                    font.family: iranSans.name
                    color: color8
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                }
            }

            //-- spacer --//
            Item{Layout.preferredHeight: 5}

            //-- Email --//
            M_inputText{
                id: input_phone
                Layout.rightMargin: 0
                label: "شماره تماس"
                icon: Icons.cellphone
                placeholder: "09xxxxxxxxx"
                Keys.onTabPressed: {
                    input_password.inputText.forceActiveFocus()

                }
                inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
            }

            //-- spacer --//
            Item{Layout.preferredHeight: 5}

            //-- Email --//
            M_inputText{
                id: input_password
                Layout.rightMargin: 0
                label: "پسورد"
                icon: Icons.email_outline
                placeholder: "پسورد"
                echoMode: TextInput.Password
                Keys.onTabPressed: {
                    input_phone.inputText.forceActiveFocus()
                }

                //            inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
            }

            //-- spacer --//
            Item{Layout.preferredHeight: 5}

            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 20
                color: "transparent"
                Label{
                    id: forgotPassword
                    anchors.fill: parent
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    text: "رمز عبور خود را فراموش کرده ام"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {

                        }
                    }
                }
            }
            //-- spacer --//
            Item{Layout.preferredHeight: 10}

            //-- Button login --//
            ButtonShadow{
                id: login
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                btnText: "ورود"
                btnRadius: 10
                onDashboard_btnClicked: {
                    if (parseInt(phone.length) === 0){
                        getMessage("شماره تماس خود را وارد کنید")
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

            //-- spacer --//
            Item{Layout.preferredHeight: 10}

            RowLayout{
                Layout.fillWidth: true
                Layout.preferredHeight: 38
                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: color4
                }
                Label{
                    Layout.preferredWidth: Text.contentWidth + 10
                    Layout.preferredHeight: 38
                    text: "یا"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    color: color4
                }
            }

            //-- spacer --//
            Item{Layout.preferredHeight: 10}

            Item{
                Layout.fillWidth: true
                Layout.preferredHeight: 38
                RowLayout{
                    anchors.fill: parent
                    spacing: 10
                    layoutDirection: Qt.RightToLeft
                    Item{Layout.fillWidth: true}
                    //-- Button login gmail --//
                    Rectangle{
                        id: logingmail
                        Layout.preferredWidth: parent.width * 0.3
                        Layout.fillHeight: parent

                        radius: height / 2

                        color: color14
                        border.color: color8

                        Label{
                            id: gmailIcon
                            width: 40
                            height: parent.height
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            text: Icons.gmail
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * 3
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        Label{
                            id: gmailText
                            width: Text.contentWidth
                            height: parent.height
                            anchors.right: gmailIcon.left
                            anchors.rightMargin: 5
                            text: "ورود با جیمیل"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {

                            }
                        }
                    }

                    //-- Button login github --//
                    Rectangle{
                        id: logingithub
                        Layout.preferredWidth: parent.width * 0.3
                        Layout.fillHeight: parent

                        radius: height / 2

                        color: color2
                        border.color: color8

                        Label{
                            id: githubIcon
                            width: 40
                            height: parent.height
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            text: Icons.github_box
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * 3
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        Label{
                            id: githubText
                            width: Text.contentWidth
                            height: parent.height
                            anchors.right: githubIcon.left
                            anchors.rightMargin: 5
                            text: "ورود با گیت هاب"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor

                            onClicked: {

                            }
                        }
                    }

                    //-- Button login facebook --//
                    Rectangle{
                        id: loginfacebook
                        Layout.preferredWidth: parent.width * 0.3
                        Layout.fillHeight: parent

                        radius: height / 2

                        color: color17
                        border.color: color8

                        Label{
                            id: facebookIcon
                            width: 40
                            height: parent.height
                            anchors.right: parent.right
                            anchors.rightMargin: 5
                            text: Icons.facebook
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * 3
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

                        Label{
                            id: facebookText
                            width: Text.contentWidth
                            height: parent.height
                            anchors.right: facebookIcon.left
                            anchors.rightMargin: 5
                            text: "ورود با فیس بوک"
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                        }

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

            //-- spacer --//
            Item{Layout.preferredHeight: 5}

            Rectangle{
                Layout.fillWidth: true
                Layout.preferredHeight: 38
                color: "transparent"
                Label{
                    id: txtregiste
                    width: Text.contentWidth
                    height: parent.height
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    text: "آیا تا به حال ثبت نام نکرده اید؟"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize * 1.2
                    color: color4
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
                Label{
                    width: Text.contentWidth
                    height: parent.height
                    anchors.right: txtregiste.left
                    anchors.rightMargin: 10
                    text: "ثبت نام کنید"
                    font.family: iranSans.name
                    font.underline: true
                    font.pixelSize: Qt.application.font.pixelSize * 1.2
                    color: color14
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
            }

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

