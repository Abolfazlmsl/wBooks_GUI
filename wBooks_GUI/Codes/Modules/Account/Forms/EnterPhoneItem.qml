import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../REST/apiService.js" as Service

import "./../../Items"

Item {

    property bool bottomText: true
    property double rightMargin: 0
    property double leftMargin: 0

    signal sendWarning(var message)
    signal confirmBtnClicked(var name,
                             var email,
                             var phone,
                             var gender,
                             var image,
                             var id,
                             var password,
                             var wallet,
                             var uNumber,
                             var lcnExpTime,
                             var lcnTime,
                             var lcnImage,
                             var lcnPurchaseNumber)
    signal bottomBtnClicked()

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
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
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
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#474749"
                    Label{
                        anchors.centerIn: parent
                        text: "شماره همراه را وارد کنید"
                        font.family: setting.activeFont
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                        color: "#ffffff"
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#e2e2e2"
                    ColumnLayout{
                        anchors.fill: parent
                        anchors.rightMargin: 50
                        anchors.leftMargin: 50

                        Item{Layout.preferredHeight: 20}

                        //-- Phone --//
                        M_inputText{
                            id: input_phone
                            Layout.rightMargin: 50
                            Layout.leftMargin: 50
                            Layout.preferredHeight: 45
                            Layout.fillWidth: true
                            label: "شماره همراه"
                            itemRadius: 0
                            placeholder: "شماره همراه"
                            placeHolderPosition: "Center"
                            iconColor: "#989898"
                            iconAsImage: true
                            iconRotation: 270
                            imgIcon: "qrc:/Icons/phone-call.png"
                            fontSize: 1.2
                            bgColor: "#d6d6d6"
                            borderColor: "#d6d6d6"
                            Keys.onTabPressed: {

                            }
                            inputText.validator: RegularExpressionValidator { regularExpression: /^([0]{1})([9]{1})([0-9]{3,9})$/ }
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
                            text: "ارسال کد تایید"
                            textColor: "#ffffff"
                            color: "#d43460"
                            textSize: 1
                            direction: "Left_Right"
                            onBtnClicked: {
                                if (parseInt(input_phone.inputText.text.length) === 0){
                                    sendWarning("شماره همراه خود را وارد کنید")
                                }else{
                                    var obj = db.readAllData("users")
                                    var data
                                    var phoneExist = false
                                    for(var i=0 ; i< obj.length ; i++){
                                        data = JSON.parse(JSON.parse(JSON.stringify(obj[i])).VALUE)
                                        if (data.phone === input_phone.inputText.text){
                                            phoneExist = true
                                            break;
                                        }
                                    }
                                    if (phoneExist){
                                        confirmBtnClicked(data.name,
                                        data.email,
                                        data.phone,
                                        data.gender,
                                        JSON.parse(JSON.stringify(obj[i])).image,
                                        JSON.parse(JSON.stringify(obj[i])).id,
                                        data.password,
                                        data.mywallet,
                                        data.user_number,
                                        JSON.parse(JSON.stringify(data.mylicense)).expiredTime,
                                        JSON.parse(JSON.stringify(data.mylicense)).time,
                                        JSON.parse(JSON.stringify(data.mylicense)).image,
                                        JSON.parse(JSON.stringify(data.mylicense)).purchase_id)

                                    }else{
                                        sendWarning("کاربری با این شماره همراه یافت نشد")
                                    }
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 30}
                    }
                }

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 2
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    color: "#d43460"
                }

                //-- spacer --//
                Item{Layout.preferredHeight: 30}


                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 38
                    Layout.rightMargin: rightMargin
                    Layout.leftMargin: leftMargin
                    visible: bottomText
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
                            id: txtlogin2
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "آیا می خواهید به صفحه ورود بروید؟"
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
                            text: "بازگشت"
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                            color: "#d43460"
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    bottomBtnClicked()
                                }
                            }
                        }

                        Item{Layout.fillWidth: true}
                    }
                }

                //-- filler --//
                Item{Layout.preferredHeight: 100}
            }
        }
    }
}
