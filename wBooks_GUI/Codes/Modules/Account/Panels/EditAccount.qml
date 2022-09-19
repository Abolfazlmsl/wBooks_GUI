import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.15
import Qt.labs.platform 1.1

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Utils/Utils.js" as Util
import "./../../../../REST/apiService.js" as Service

import "./../../Items"
import "./../../MainModules/Ui_Module"

Item {

    property alias name     : input_name.inputText
    property string gender  : ""

    property double rMargin: 0
    property double lMargin: 0

    signal getMessage(var signalmsg)

    signal registe()

    onRegiste: {

    }

    SwipeView{
        id: swipe_edit
        anchors.fill: parent
        clip: true
        interactive: false
        currentIndex: 0

        onCurrentIndexChanged: {

        }

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
                        BodyHeader{
                            Layout.fillWidth: true
                            Layout.preferredHeight: !showRightPop * 52
                            topFilterVis: false
                            listHeaderVis: false
                            bgColor: "transparent"
                            onItemClicked: {

                            }
                        }
                        //-- spacer --//
                        Item{Layout.preferredHeight: 50}

                        Item{
                            Layout.preferredHeight: 100
                            Layout.fillWidth: true
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 15
                                Rectangle{
                                    id: mask
                                    Layout.preferredWidth: 100
                                    Layout.preferredHeight: width
                                    radius: width/2
                                    color: color3
                                    Label{
                                        anchors.fill: parent
                                        text: Icons.account
                                        visible: (setting.profile === "")?true:false
                                        font.family: webfont.name
                                        color: color7
                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3
                                        verticalAlignment: Qt.AlignVCenter
                                        horizontalAlignment: Qt.AlignHCenter
                                    }

                                    Image{
                                        id: image
                                        anchors.fill: parent
                                        visible: (setting.profile === "")?false:true
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        source: setting.profile
                                        mipmap: true
                                        fillMode: Image.PreserveAspectFit
                                        layer.enabled: true
                                        layer.effect: OpacityMask {
                                            maskSource: mask
                                        }
                                    }
                                }

                                ButtonShadow{
                                    id: purchase
                                    Layout.preferredWidth: 200
                                    Layout.fillHeight: true
                                    Layout.topMargin: 30
                                    Layout.bottomMargin: 30
                                    fontSize: 1
                                    btnText: "ویرایش تصویر پروفایل"
                                    btnColor: "#d6d6d6"
                                    textColor: "#d43460"

                                    onDashboard_btnClicked: {
                                        fileDialog.open()
                                    }
                                }

                                Item{Layout.fillWidth: true}
                            }
                        }

                        Item{Layout.preferredHeight: 50}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            text: "مشخصات فردی"
                            font.family: setting.activeFont
                            color: "#000000"

                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3

                        }

                        Item{Layout.preferredHeight: 5}

                        Item{
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            Layout.fillWidth: true
                            Layout.preferredHeight: 45 * ratio
                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 5
                                M_inputText{
                                    id: input_name
                                    Layout.preferredHeight: 45 * ratio
                                    Layout.preferredWidth: 300
                                    Layout.rightMargin: 0
                                    label: "نام و نام خانوادگی"
                                    itemRadius: 20
                                    placeholder: "نام و نام خانوادگی"
                                    placeHolderPosition: "Right"
                                    icon: ""
                                    fontSize: 1.2
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
                                    inputText.text: setting.userName
                                    Keys.onTabPressed: {
                                        input_day.inputText.forceActiveFocus()
                                    }
                                }
                                Item{Layout.fillWidth: true}
                            }
                        }

                        //-- spacer --//
                        Item{Layout.preferredHeight: 15}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            text: "تاریخ تولد"
                            font.family: setting.activeFont
                            color: "#000000"

                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3

                        }
                        Item{Layout.preferredHeight: 5}

                        Item{
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            Layout.fillWidth: true
                            Layout.preferredHeight: 45 * ratio
                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 5
                                M_inputText{
                                    id: input_day
                                    Layout.preferredHeight: 45 * ratio
                                    Layout.preferredWidth: 80
                                    label: "روز"
                                    itemRadius: 20
                                    placeholder: "روز"
                                    placeHolderPosition: "Right"
                                    icon: ""
                                    fontSize: 1.2
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
                                    Keys.onTabPressed: {
                                        input_month.inputText.forceActiveFocus()
                                    }
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^([0-9]{1,2})$/ }
                                }

                                M_inputText{
                                    id: input_month
                                    Layout.preferredHeight: 45 * ratio
                                    Layout.preferredWidth: 80
                                    label: "ماه"
                                    itemRadius: 20
                                    placeholder: "ماه"
                                    placeHolderPosition: "Right"
                                    icon: ""
                                    fontSize: 1.2
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
                                    Keys.onTabPressed: {
                                        input_year.inputText.forceActiveFocus()
                                    }
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^([0-9]{1,2})$/ }
                                }


                                M_inputText{
                                    id: input_year
                                    Layout.preferredHeight: 45 * ratio
                                    Layout.preferredWidth: 80
                                    label: "سال"
                                    itemRadius: 20
                                    placeholder: "سال"
                                    placeHolderPosition: "Right"
                                    icon: ""
                                    fontSize: 1.2
                                    bgColor: "#d6d6d6"
                                    borderColor: "#d6d6d6"
                                    Keys.onTabPressed: {
//                                        input_password.inputText.forceActiveFocus()
                                    }
                                    inputText.validator: RegularExpressionValidator { regularExpression: /^([0-9]{4})$/ }
                                }
                                Item{Layout.fillWidth: true}
                            }
                        }

                        //-- spacer --//
                        Item{Layout.preferredHeight: 15}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            text: "جنسیت"
                            font.family: setting.activeFont
                            color: "#000000"

                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3

                        }

                        //-- Gender --//
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 45 * ratio
                            //            Layout.rightMargin: 10 * ratio
                            color: "transparent"
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin

                            ButtonGroup {id: genderRadios}
                            RadioButton {
                                id:radio_Male
                                anchors.right: parent.right
                                width: implicitWidth
                                height: implicitHeight
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                anchors.verticalCenter: parent.verticalCenter
                                Material.accent: "#d43460"
                                checked: (setting.gender === "آقا")?true:false

                                text: "آقا"
                                ButtonGroup.group: genderRadios

                                contentItem: Text {
                                    text: radio_Male.text
                                    color: "#000000"
                                    rightPadding: radio_Male.indicator.width
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                }

                                indicator: Rectangle {
                                    anchors.right: parent.right
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    y: parent.height / 2 - 9
                                    x: parent.width / 2
                                    radius: 10
                                    color: addOpacity("#c4c4c4", 30)
                                    border.color: "#c4c4c4"
                                    border.width: 2

                                    Rectangle {
                                        width: parent.width
                                        height: parent.height
                                        radius: width/2
                                        color: "transparent"
                                        border.color: "#d43460"
                                        border.width: 3
                                        visible: radio_Male.checked
                                    }

                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: parent.width - 10
                                        height: width
                                        radius: width/2
                                        color: "#d43460"
                                        visible: radio_Male.checked
                                    }

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            radio_Male.checked = true
                                        }
                                    }
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
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3

                                anchors.verticalCenter: parent.verticalCenter
                                Material.accent: "#d43460"
                                checked: (setting.gender === "خانم")?true:false

                                text: "خانم"
                                ButtonGroup.group: genderRadios

                                contentItem: Text {
                                    text: radio_Female.text
                                    color: "#000000"
                                    rightPadding: radio_Female.indicator.width
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                }

                                indicator: Rectangle {
                                    anchors.right: parent.right
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    y: parent.height / 2 - 9
                                    x: parent.width / 2
                                    radius: 10
                                    color: addOpacity("#c4c4c4", 30)
                                    border.color: "#c4c4c4"
                                    border.width: 2

                                    Rectangle {
                                        width: parent.width
                                        height: parent.height
                                        radius: width/2
                                        color: "transparent"
                                        border.color: "#d43460"
                                        border.width: 3
                                        visible: radio_Female.checked
                                    }

                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: parent.width - 10
                                        height: width
                                        radius: width/2
                                        color: "#d43460"
                                        visible: radio_Female.checked
                                    }

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            radio_Female.checked = true
                                        }
                                    }
                                }

                                onCheckedChanged: {
                                    if(checked) gender = "خانم"
                                }

                                Keys.onTabPressed: {
//                                    input_name.inputText.forceActiveFocus()
                                }

                            }

                        }

                        //-- spacer --//
                        Item{Layout.preferredHeight: 15}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            text: "دریافت ایمیل"
                            font.family: setting.activeFont
                            color: "#000000"

                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3

                        }

                        Item{Layout.preferredHeight: 5}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            text: "آیا می خواهید از طریق دریافت ایمیل از آخرین کتاب ها، پیشنهادها و نسخه های جدید نرم افزارهای کتابخوان آگاه شوید؟"
                            color: "#000000"
                            font.family: setting.activeNumFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                            wrapMode: Text.WordWrap
                            lineHeight: 1.15
                        }

                        //-- Email --//
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 45 * ratio
                            //            Layout.rightMargin: 10 * ratio
                            color: "transparent"
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin

                            ButtonGroup {id: emailRadios}
                            RadioButton {
                                id:radio_yes
                                anchors.right: parent.right
                                width: implicitWidth
                                height: implicitHeight
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                anchors.verticalCenter: parent.verticalCenter
                                Material.accent: "#d43460"
                                checked: (setting.getEmail)?true:false

                                text: "بله"
                                ButtonGroup.group: emailRadios

                                contentItem: Text {
                                    text: radio_yes.text
                                    color: "#000000"
                                    rightPadding: radio_yes.indicator.width
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                }

                                indicator: Rectangle {
                                    anchors.right: parent.right
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    y: parent.height / 2 - 9
                                    x: parent.width / 2
                                    radius: 10
                                    color: addOpacity("#c4c4c4", 30)
                                    border.color: "#c4c4c4"
                                    border.width: 2

                                    Rectangle {
                                        width: parent.width
                                        height: parent.height
                                        radius: width/2
                                        color: "transparent"
                                        border.color: "#d43460"
                                        border.width: 3
                                        visible: radio_yes.checked
                                    }

                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: parent.width - 10
                                        height: width
                                        radius: width/2
                                        color: "#d43460"
                                        visible: radio_yes.checked
                                    }

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            radio_yes.checked = true
                                        }
                                    }
                                }

                                onCheckedChanged: {
                                    if(checked) setting.getEmail = true
                                }

                                Keys.onTabPressed: {
                                    radio_no.forceActiveFocus()
                                }

                            }

                            RadioButton {
                                id:radio_no
                                anchors.right: radio_yes.left
                                width: implicitWidth
                                height: implicitHeight
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3

                                anchors.verticalCenter: parent.verticalCenter
                                Material.accent: "#d43460"
                                checked: (!setting.getEmail)?true:false

                                text: "خیر"
                                ButtonGroup.group: emailRadios

                                contentItem: Text {
                                    text: radio_no.text
                                    color: "#000000"
                                    rightPadding: radio_no.indicator.width
                                    verticalAlignment: Text.AlignVCenter
                                    font.family: setting.activeFont
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                }

                                indicator: Rectangle {
                                    anchors.right: parent.right
                                    implicitWidth: 20
                                    implicitHeight: 20
                                    y: parent.height / 2 - 9
                                    x: parent.width / 2
                                    radius: 10
                                    color: addOpacity("#c4c4c4", 30)
                                    border.color: "#c4c4c4"
                                    border.width: 2

                                    Rectangle {
                                        width: parent.width
                                        height: parent.height
                                        radius: width/2
                                        color: "transparent"
                                        border.color: "#d43460"
                                        border.width: 3
                                        visible: radio_no.checked
                                    }

                                    Rectangle {
                                        anchors.centerIn: parent
                                        width: parent.width - 10
                                        height: width
                                        radius: width/2
                                        color: "#d43460"
                                        visible: radio_no.checked
                                    }

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: Qt.PointingHandCursor
                                        onClicked: {
                                            radio_no.checked = true
                                        }
                                    }
                                }

                                onCheckedChanged: {
                                    if(checked) setting.getEmail = false
                                }

                                Keys.onTabPressed: {
//                                    input_name.inputText.forceActiveFocus()
                                }

                            }

                        }

                        //-- spacer --//
                        Item{Layout.preferredHeight: 15}


                        //-- Button edit --//
                        ButtonShadow{
                            id: edit
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: rMargin
                            Layout.leftMargin: lMargin
                            btnText: "ثبت تغییرات"
                            btnColor: "#d43460"
                            textColor: "#ffffff"
                            btnRadius: 10
                            onDashboard_btnClicked: {
                                if (parseInt(name.length) === 0){
                                    getMessage("نام خود را وارد کنید")
                                }else{
                                    var licenseData = {
                                        "image": setting.licenseImage,
                                        "purchase_id": setting.licensePurchaseNumber,
                                        "time": setting.licenseTime,
                                        "expiredTime": setting.licenseExpiredTime
                                    }
                                    var data = {
                                        "id": setting.user_id,
                                        "name": name.text,
                                        "email": email.text,
                                        "phone": phone.text,
                                        "password": setting.password,
                                        "gender": gender,
                                        "mywallet": setting.mywallet,
                                        "user_number": setting.user_number,
                                        "mylicense": licenseData
                                        //                            "mybooks": setting.mybooks
                                    }
                                    db.storeData("users", data, setting.profile)

                                    setting.userName = name.text
                                    setting.userEmail = email.text
                                    setting.userPhone = phone.text
                                    setting.gender = gender
                                    swipe_edit.currentIndex = 1

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
                        Item{Layout.preferredHeight: 50}

                        LoadingSpinner{
                            id: spinner
                            visible: false
                            Layout.fillWidth: true
                            Layout.preferredHeight: implicitHeight
                            leftMarg: 60
                        }
                    }
                }
            }
        }

        //-- Success Page --//
        SuccessItem{
            id: success
            rightMargin: rMargin
            leftMargin: lMargin
            text: "تغییر اطلاعات با موفقیت اعمال شد"
            text2: "بازگشت"
            onLblClicked: {
                getMessage("")
                swipe_edit.currentIndex = 0
            }
        }
    }

    //-- File dialog --//
    FileDialog {
        id: fileDialog
        visible: false
        title: "Please choose a file"
        selectedNameFilter.index: 0
        nameFilters: ["Image files (*.jpg *.jpeg *.png)"]

        onAccepted: {
            var path = fileDialog.file.toString()
            path = path.replace(/^(file:\/{3})/,"")
            var fileName = path.slice(path.lastIndexOf("/")+1)
            var cPath = desktopfunctions.copyImagetoDb(path, offlineStoragePath, fileName)
            setting.profile = cPath
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
                "password": setting.password,
                "gender": setting.gender,
                "mywallet": setting.mywallet,
                "user_number": setting.user_number,
                "mylicense": licenseData
            }
            db.storeData("users", data, cPath)
        }
        onRejected: {
            console.log("Canceled")
        }
    }

}
