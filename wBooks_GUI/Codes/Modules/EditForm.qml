import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../Fonts/Icon.js" as Icons

Item{
    id: root_edit

    property alias name     : input_name.inputText
    property alias phone    : input_phone.inputText
    property alias email    : input_Email.inputText
    property string gender  : ""

    signal getMessage(var signalmsg)

    signal registe()

    onRegiste: {

    }

    Component.onCompleted: {

    }

    objectName: "Edit"

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
            Layout.rightMargin: 5
            text: "نام"
            font.family: iranSans.name
            color: "darkblue"

            font.pixelSize: Qt.application.font.pixelSize * 1.3

        }

        //-- Email --//
        M_inputText{
            id: input_name
            label: "نام"
            icon: Icons.account
            placeholder: "نام"
            inputText.text: setting.userName
            Keys.onTabPressed: {
                input_phone.inputText.forceActiveFocus()
            }

            //                                    inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
        }

        //-- spacer --//
        Item{Layout.preferredHeight: 5}

        Label{
            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
            Layout.rightMargin: 5
            text: "شماره تماس"
            font.family: iranSans.name
            color: "darkblue"

            font.pixelSize: Qt.application.font.pixelSize * 1.3

        }
        //-- Phone --//
        M_inputText{
            id: input_phone
            label: "شماره تماس"
            icon: Icons.cellphone
            placeholder: "09xxxxxxxxx"
            inputText.text: setting.userPhone
            Keys.onTabPressed: {
                input_Email.inputText.forceActiveFocus()
            }
            inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
        }

        //-- spacer --//
        Item{Layout.preferredHeight: 5}

        Label{
            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
            Layout.rightMargin: 5
            text: "ایمیل"
            font.family: iranSans.name
            color: "darkblue"

            font.pixelSize: Qt.application.font.pixelSize * 1.3

        }
        //-- Email --//
        M_inputText{
            id: input_Email
            label: "ایمیل"
            icon: Icons.email_outline
            placeholder: "ایمیل"
            inputText.text: setting.userEmail
            Keys.onTabPressed: {
                input_name.inputText.forceActiveFocus()
            }

            //            inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
        }

        //-- spacer --//
        Item{Layout.preferredHeight: 10}

        //-- Button edit --//
        Rectangle{
            id: edit
            Layout.fillWidth: true
            Layout.preferredHeight: 38

            radius: height / 2

            color: "#211D1D"

            Label{
                anchors.centerIn: parent
                text: "ثبت تغییرات"
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
                    }else{

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

