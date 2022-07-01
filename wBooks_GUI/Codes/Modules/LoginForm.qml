import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../Fonts/Icon.js" as Icons

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

    objectName: "Logimn"

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


    ColumnLayout{
            width: parent.width
            height: parent.height * 0.5


            //-- spacer --//
            Item{Layout.preferredHeight: 20}

            Label{
                Layout.fillWidth: true
                Layout.preferredHeight: implicitHeight
                text: "لطفا اطلاعات خود را وارد کنید"
                font.family: iranSans.name
                color: "#211D1D"

                font.pixelSize: Qt.application.font.pixelSize * 1.3
                horizontalAlignment: Qt.AlignHCenter

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
                    input_password.inputText.forceActiveFocus()

                }
                inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
            }

            //-- spacer --//
            Item{Layout.preferredHeight: 5}

            //-- Email --//
            M_inputText{
                id: input_password
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
            Item{Layout.preferredHeight: 10}

            //-- Button login --//
            Rectangle{
                id: login
                Layout.fillWidth: true
                Layout.preferredHeight: 38

                radius: height / 2

                color: "#211D1D"

                Label{
                    anchors.centerIn: parent
                    text: "ورود"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize * 1.5
                    color: "#ffffff"
                }

                MouseArea{
                    id: btn_login
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor

                    onClicked: {
                        if (parseInt(phone.length) === 0){
                            getMessage("شماره تماس خود را وارد کنید")
                        }else if (parseInt(password.length) === 0){
                            getMessage("پسورد خود را وارد کنید")
                        }else{
                            setting.isLogined = true
                            mainView = home
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

