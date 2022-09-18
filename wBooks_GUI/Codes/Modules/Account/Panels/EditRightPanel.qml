import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import Qt.labs.platform 1.1
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

import "./../../Items"

Rectangle{
    id: accountObjPage
    color: "#e6e5e3"

    signal btnClicked()

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Item{Layout.preferredHeight: 10}

        Item{
            Layout.preferredHeight: 52
            Layout.fillWidth: true
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                spacing: 0
                Item{Layout.preferredWidth: 10}

                Label{
                    Layout.preferredWidth: 10
                    Layout.fillHeight: true
                    text: Icons.close
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio

                    verticalAlignment: Qt.AlignVCenter
                    color: "#d43460"
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            btnClicked()
                        }
                    }
                }

                Item{Layout.preferredWidth: 10}

                Label{
                    Layout.preferredWidth: contentWidth
                    Layout.fillHeight: true
                    text: "پنل کاربری"
                    font.family: setting.activeFont
                    font.bold: true
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                    verticalAlignment: Qt.AlignVCenter
                    color: "#d43460"
                }


                Item{Layout.fillWidth: true}
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#d8d9d7"
        }

        Item{Layout.preferredHeight: 10}

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.4
            clip: true
            ColumnLayout{
                anchors.fill: parent
                spacing: 0

                Item{Layout.preferredHeight: 10}

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.4
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft

                        Item{Layout.fillWidth: true}

                        Rectangle{
                            id: mask
                            Layout.preferredWidth: parent.width * 0.5
                            Layout.fillHeight: true
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

                        Item{Layout.fillWidth: true}
                    }
                }

                Item{Layout.preferredHeight: 10}

                Rectangle{
                    Layout.preferredHeight: 20
                    Layout.fillWidth: true
                    color: "transparent"
                    Label{
                        id: txt1
                        anchors.centerIn: parent
                        text: setting.userName
                        font.family: setting.activeFont
                        font.bold: true
                        color: "#d43460"
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.3
                    }
                }

                Rectangle{
                    Layout.preferredHeight: 20
                    Layout.fillWidth: true
                    color: "transparent"
                    Label{
                        id: txt2
                        anchors.centerIn: parent
                        text: "شماره کاربری: " + setting.user_number
                        font.family: setting.activeNumFont
                        color: "#646464"

                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio
                    }
                }

                Item{Layout.preferredHeight: 20}

                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.leftMargin: 50
                    Layout.rightMargin: 50
                    color: "transparent"
                    radius: 10
                    border.color: "#d8d9d7"
                    Label{
                        id: txt_exit
                        anchors.fill: parent
                        text: "افزایش اعتبار شما"
                        font.family: setting.activeFont
                        color: "#d43460"

                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            accountObj.state = "Wallet"
                        }
                    }
                }

                Item{Layout.fillHeight: true}
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            color: "#d8d9d7"
        }

        Item{Layout.preferredHeight: 10}

        Flickable{
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: rightPanelItem.height
            contentWidth: parent.width
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar {}
            clip: true

            Item{
                id: rightPanelItem
                implicitHeight: childrenRect.height
                implicitWidth: parent.width
                ColumnLayout{
                    width: parent.width
                    spacing: 0

                    ButtonPanel{
                        id: btnEdit

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.account
                        iconColor: editAccountColor
                        text: "ویرایش حساب کاربری"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Account"
                        }
                    }
                    ButtonPanel{
                        id: btnWallet

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.wallet
                        iconColor: walletColor
                        text: "کیف پول"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Wallet"
                        }
                    }
                    ButtonPanel{
                        id: btnBooks

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.library_books
                        iconColor: myBookColor
                        text: "کتاب های من"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "My Books"
                        }
                    }
                    ButtonPanel{
                        id: btnAudiobooks

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.audiobook
                        iconColor: audioBookColor
                        text: "کتاب های صوتی من"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Audio Books"
                        }
                    }

                    ButtonPanel{
                        id: btnpurchases

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.bag_personal
                        iconColor: purchasesColor
                        text: "سوابق خرید"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Purchases"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: "#d8d9d7"
                    }
                    Item{Layout.preferredHeight: 10}

                    ButtonPanel{
                        id: btnChangePassword

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.account_key
                        iconColor: changePassColor
                        text: "تغییر رمز عبور"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Change Password"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: "#d8d9d7"
                    }

                    Item{Layout.preferredHeight: 10}

                    ButtonPanel{
                        id: btnComments

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.comment
                        iconColor: commentsColor
                        text: "بازخورد"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Comments"
                        }
                    }

                    ButtonPanel{
                        id: btnAboutUs

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.information_outline
                        iconColor: aboutUsColor
                        text: "درباره ی ما"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "About us"
                        }
                    }

                    ButtonPanel{
                        id: btnSupport

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.phone
                        iconColor: supportColor
                        text: "تماس با ما"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            accountObj.state = "Support"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: "#d8d9d7"
                    }

                    Item{Layout.preferredHeight: 10}

                    ButtonPanel{
                        id: btnExit

                        Layout.fillWidth: true
                        Layout.preferredHeight: 35 * ratio

                        icon: Icons.exit_to_app
                        iconColor: color2
                        text: "خروج از حساب کاربری"
                        iconSize: 1.3
                        textSize: 1.1

                        onBtnClicked: {
                            resetSetting()
                            commander.changePage(mainPage.state)
                            mainPage.state = "Home"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        color: "#d8d9d7"
                    }

                    Item{Layout.preferredHeight: 10}

                }
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
