import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Utils/Utils.js" as Util
import "./../../../../REST/apiService.js" as Service

import "./../../Items"

Item {

    property alias name     : input_name.inputText
    property alias phone    : input_phone.inputText
    property alias email    : input_Email.inputText
    property string gender  : ""

    signal getMessage(var signalmsg)

    signal registe()

    onRegiste: {

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
                Item{Layout.preferredHeight: 20}

                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight
                    Layout.rightMargin: 5
                    text: "نام"
                    font.family: mainFont.name
                    color: color11

                    font.pixelSize: Qt.application.font.pixelSize * 1.3

                }

                //-- Email --//
                M_inputText{
                    id: input_name
                    Layout.rightMargin: 0
                    Layout.fillWidth: true
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
                    font.family: mainFont.name
                    color: color11

                    font.pixelSize: Qt.application.font.pixelSize * 1.3

                }
                //-- Phone --//
                M_inputText{
                    id: input_phone
                    Layout.rightMargin: 0
                    Layout.fillWidth: true
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
                    font.family: mainFont.name
                    color: color11

                    font.pixelSize: Qt.application.font.pixelSize * 1.3

                }
                //-- Email --//
                M_inputText{
                    id: input_Email
                    Layout.rightMargin: 0
                    Layout.fillWidth: true
                    label: "ایمیل"
                    icon: Icons.email_outline
                    placeholder: "ایمیل"
                    inputText.text: setting.userEmail
                    Keys.onTabPressed: {
                        radio_Male.forceActiveFocus()
                    }

                    //            inputText.validator: RegularExpressionValidator { regularExpression: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/ }
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- Gender --//
                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 45 * ratio
                    //            Layout.rightMargin: 10 * ratio
                    color: "transparent"


                    Label{
                        id:lbl_Gender
                        width: Text.contentWidth
                        height: parent.height
                        verticalAlignment: Qt.AlignVCenter
                        anchors.right: parent.right

                        text: "جنسیت: "
                        color: color11
                        font.family: mainFont.name
                        font.pixelSize: Qt.application.font.pixelSize * 1.3
                    }

                    ButtonGroup {id: genderRadios}
                    RadioButton {
                        id:radio_Male
                        anchors.right: lbl_Gender.left
                        width: implicitWidth
                        height: implicitHeight
                        font.family: mainFont.name
                        font.pixelSize: Qt.application.font.pixelSize* 1.3
                        anchors.verticalCenter: parent.verticalCenter
                        Material.accent: color11
                        checked: (setting.gender === "آقا")?true:false

                        text: "آقا"
                        ButtonGroup.group: genderRadios

                        contentItem: Text {
                            text: radio_Male.text
                            color: color11
                            leftPadding: radio_Male.indicator.width + radio_Male.spacing
                            verticalAlignment: Text.AlignVCenter
                            font.family: mainFont.name
                            font.pixelSize: Qt.application.font.pixelSize* 1.3
                        }

                        onCheckedChanged: {
                            if(checked) gender = "آقا"
                        }

                        Keys.onTabPressed: {
                            radio_Female.forceActiveFocus()
                        }

                    }

                    RadioButton {
                        id:radio_Female
                        anchors.right: radio_Male.left
                        width: implicitWidth
                        height: implicitHeight
                        font.family: mainFont.name
                        font.pixelSize: Qt.application.font.pixelSize* 1.3

                        anchors.verticalCenter: parent.verticalCenter
                        Material.accent: color11
                        checked: (setting.gender === "خانم")?true:false

                        text: "خانم"
                        ButtonGroup.group: genderRadios

                        contentItem: Text {
                            text: radio_Female.text
                            color: color11
                            leftPadding: radio_Female.indicator.width + radio_Female.spacing
                            verticalAlignment: Text.AlignVCenter
                            font.family: mainFont.name
                            font.pixelSize: Qt.application.font.pixelSize* 1.3
                        }

                        onCheckedChanged: {
                            if(checked) gender = "خانم"
                        }

                        Keys.onTabPressed: {
                            input_name.inputText.forceActiveFocus()
                        }

                    }

                }

                //-- spacer --//
                Item{Layout.preferredHeight: 10}

                //-- Button edit --//
                ButtonShadow{
                    id: edit
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    btnText: "ثبت تغییرات"
                    textColor: "#ffffff"
                    btnRadius: 10
                    onDashboard_btnClicked: {
                        if (parseInt(email.length) === 0){
                            getMessage("ایمیل خود را وارد کنید")
                            //                                spinner.visible = false
                        }else if (parseInt(name.length) === 0){
                            getMessage("نام خود را وارد کنید")
                        }else if (parseInt(phone.length) === 0){
                            getMessage("شماره تماس خود را وارد کنید")
                        }else{
                            var data = {
                                "id": setting.user_id,
                                "name": name.text,
                                "email": email.text,
                                "phone": phone.text,
                                "password": setting.password,
                                "gender": gender
                                //                            "mybooks": setting.mybooks
                            }
                            db.storeData("users", data, setting.profile)

                            setting.userName = name.text
                            setting.userEmail = email.text
                            setting.userPhone = phone.text
                            setting.gender = gender

                            //                        var endpoint = Service.url_user

                            //                        Service.update_item(_token_access, endpoint, data, function(resp, http) {

                            //                            setting.userName = name.text
                            //                            setting.userEmail = email.text
                            //                            setting.userPhone = phone.text
                            //                            setting.gender = gender


                            //                        })
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
    }
}
