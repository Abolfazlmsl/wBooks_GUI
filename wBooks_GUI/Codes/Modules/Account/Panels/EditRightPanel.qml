import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import Qt.labs.platform 1.1
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

import "./../../Items"

Rectangle{
    id: editRightPanel
    color: color1

    state: "Account"
    states: [
        State{
            name: "Account"
            PropertyChanges {
                target: mainBody
                editFormIndex: 0
                editAccountColor: color7
                walletColor: color4
                myBookColor: color4
                audioBookColor: color4
                changePassColor: color4
                commentsColor: color4
                aboutUsColor: color4
                supportColor: color4
            }
        },
        State{
            name: "Wallet"
            PropertyChanges {
                target: mainBody
                editFormIndex: 1
                editAccountColor: color4
                walletColor: color7
                myBookColor: color4
                audioBookColor: color4
                changePassColor: color4
                commentsColor: color4
                aboutUsColor: color4
                supportColor: color4
            }
        },
        State{
            name: "My Books"
            PropertyChanges {
                target: mainBody
                editFormIndex: 2
                editAccountColor: color4
                walletColor: color4
                myBookColor: color7
                audioBookColor: color4
                changePassColor: color4
                commentsColor: color4
                aboutUsColor: color4
                supportColor: color4
            }
        },
        State{
            name: "Audio Books"
            PropertyChanges {
                target: mainBody
                editFormIndex: 3
                editAccountColor: color4
                walletColor: color4
                myBookColor: color4
                audioBookColor: color7
                changePassColor: color4
                commentsColor: color4
                aboutUsColor: color4
                supportColor: color4
            }
        },
        State{
            name: "Change Password"
            PropertyChanges {
                target: mainBody
                editFormIndex: 4
                editAccountColor: color4
                walletColor: color4
                myBookColor: color4
                audioBookColor: color4
                changePassColor: color7
                commentsColor: color4
                aboutUsColor: color4
                supportColor: color4
            }
        },
        State{
            name: "Comments"
            PropertyChanges {
                target: mainBody
                editFormIndex: 5
                editAccountColor: color4
                walletColor: color4
                myBookColor: color4
                audioBookColor: color4
                changePassColor: color4
                commentsColor: color7
                aboutUsColor: color4
                supportColor: color4
            }
        },
        State{
            name: "About us"
            PropertyChanges {
                target: mainBody
                editFormIndex: 6
                editAccountColor: color4
                walletColor: color4
                myBookColor: color4
                audioBookColor: color4
                changePassColor: color4
                commentsColor: color4
                aboutUsColor: color7
                supportColor: color4
            }
        },
        State{
            name: "Support"
            PropertyChanges {
                target: mainBody
                editFormIndex: 7
                editAccountColor: color4
                walletColor: color4
                myBookColor: color4
                audioBookColor: color4
                changePassColor: color4
                commentsColor: color4
                aboutUsColor: color4
                supportColor: color7
            }
        }
    ]

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.3
            clip: true
            ColumnLayout{
                anchors.fill: parent
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.6
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        Rectangle{
                            id: mask
                            Layout.preferredWidth: parent.width * 0.3
                            Layout.preferredHeight: width
                            Layout.margins: 10
                            radius: width/2
                            color: color3
                            Label{
                                anchors.fill: parent
                                text: Icons.account
                                visible: (setting.profile === "")?true:false
                                font.family: webfont.name
                                color: color7

                                font.pixelSize: Qt.application.font.pixelSize * 3
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

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    fileDialog.open()
                                }
                            }
                        }

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.5
                            Layout.topMargin: 20
                            Layout.bottomMargin: 20
                            color: "transparent"
                            Label{
                                id: txt1
                                width: parent.width
                                height: parent.height / 3
                                text: setting.userName
                                font.family: iranSans.name
                                color: color4

                                font.pixelSize: Qt.application.font.pixelSize * 1
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                LayoutMirroring.enabled: true
                            }
                            Label{
                                id: txt2
                                width: parent.width
                                height: parent.height / 3
                                anchors.top: txt1.bottom
                                text: "شماره کاربری: 145625"
                                font.family: iranSansFAnum.name
                                color: color4

                                font.pixelSize: Qt.application.font.pixelSize * 1
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                LayoutMirroring.enabled: true
                            }
                            Label{
                                width: parent.width
                                height: parent.height / 3
                                anchors.top: txt2.bottom
                                text: setting.userPhone
                                font.family: iranSansFAnum.name
                                color: color4

                                font.pixelSize: Qt.application.font.pixelSize * 1
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                LayoutMirroring.enabled: true
                            }
                        }

                        Item{
                            Layout.preferredWidth: 10
                        }
                    }
                }

                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.margins: 10
                    color: "transparent"
                    radius: 10
                    border.color: color7
                    Label{
                        id: txt_exit
                        anchors.fill: parent
                        text: "افزایش اعتبار"
                        font.family: iranSans.name
                        color: color7

                        font.pixelSize: Qt.application.font.pixelSize * 1.3
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

                Item{Layout.fillHeight: true}
            }
        }

        Item{Layout.preferredHeight: 10}

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 1
            Layout.leftMargin: 10
            Layout.rightMargin: 10
            color: color4
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
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.account
                        iconColor: editAccountColor
                        text: "ویرایش حساب کاربری"

                        onBtnClicked: {
                            editRightPanel.state = "Account"
                        }
                    }
                    ButtonPanel{
                        id: btnWallet

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.wallet
                        iconColor: walletColor
                        text: "کیف پول"

                        onBtnClicked: {
                            editRightPanel.state = "Wallet"
                        }
                    }
                    ButtonPanel{
                        id: btnBooks

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.library_books
                        iconColor: myBookColor
                        text: "کتاب های من"

                        onBtnClicked: {
                            editRightPanel.state = "My Books"
                        }
                    }
                    ButtonPanel{
                        id: btnAudiobooks

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.audiobook
                        iconColor: audioBookColor
                        text: "کتاب های صوتی من"

                        onBtnClicked: {
                            editRightPanel.state = "Audio Books"
                        }
                    }
                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        color: color4
                    }

                    Item{Layout.preferredHeight: 10}

                    ButtonPanel{
                        id: btnChangePassword

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.account_key
                        iconColor: changePassColor
                        text: "تغییر رمز عبور"

                        onBtnClicked: {
                            editRightPanel.state = "Change Password"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        color: color4
                    }

                    Item{Layout.preferredHeight: 10}

                    ButtonPanel{
                        id: btnComments

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.comment
                        iconColor: commentsColor
                        text: "بازخورد"

                        onBtnClicked: {
                            editRightPanel.state = "Comments"
                        }
                    }

                    ButtonPanel{
                        id: btnAboutUs

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.information_outline
                        iconColor: aboutUsColor
                        text: "درباره ی ما"

                        onBtnClicked: {
                            editRightPanel.state = "About us"
                        }
                    }

                    ButtonPanel{
                        id: btnSupport

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.phone
                        iconColor: supportColor
                        text: "پشتیبانی"

                        onBtnClicked: {
                            editRightPanel.state = "Support"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        color: color4
                    }

                    Item{Layout.preferredHeight: 10}

                    ButtonPanel{
                        id: btnExit

                        Layout.fillWidth: true
                        Layout.preferredHeight: 45 * ratio

                        icon: Icons.exit_to_app
                        iconColor: color2
                        text: "خروج از حساب"

                        onBtnClicked: {
                            resetSetting()
                            mainPage.state = "Home"
                        }
                    }

                    Item{Layout.preferredHeight: 10}

                    Rectangle{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 1
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        color: color4
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
            var data = {
                "id": setting.user_id,
                "name": setting.userName,
                "email": setting.userEmail,
                "phone": setting.userPhone,
                "password": setting.password,
                "gender": setting.gender
            }
            db.storeData("users", data, cPath)
        }
        onRejected: {
            console.log("Canceled")
        }
    }
}
