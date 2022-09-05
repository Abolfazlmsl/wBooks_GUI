import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

Rectangle {

    color: "#000000"

    ColumnLayout{
        anchors.fill: parent
        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.2
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                Rectangle{
                    id: mask
                    Layout.preferredWidth: parent.width * 0.2
                    Layout.preferredHeight: width
                    Layout.margins: 10
                    radius: width/2
                    color: "#ffffff"
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
                        anchors.fill: parent
                        visible: (setting.profile === "")?false:true
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
//                        anchors.margins: 8
                        source: setting.profile
                        mipmap: true

                        fillMode: Image.PreserveAspectFit
                        layer.enabled: true
                        layer.effect: OpacityMask {
                            maskSource: mask
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
                        height: parent.height / 2
                        text: setting.userName
                        font.family: setting.activeFont
                        color: "#ffffff"

                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                        verticalAlignment: Qt.AlignVCenter
                    }
                    Label{
                        width: parent.width
                        height: parent.height / 2
                        anchors.top: txt1.bottom
                        text: "شماره کاربری: " + setting.user_number
                        font.family: setting.activeNumFont
                        color: "#ffffff"

                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                        verticalAlignment: Qt.AlignVCenter
                    }
                }

                Rectangle{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.topMargin: 20
                    Layout.bottomMargin: 20
                    color: color2
                    radius: 10
                    Label{
                        id: txt_exit
                        anchors.fill: parent
                        text: "خروج"
                        font.family: setting.activeFont
                        color: "#ffffff"

                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            resetSetting()
                            mainPage.state = "Home"
                        }
                    }
                }

                Item{
                    Layout.preferredWidth: 10
                }
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            Layout.rightMargin: 10
            Layout.leftMargin: 10
            color: "#ffffff"
        }

        RowsofAccountPop{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
            icon: Icons.account
            text: "مشاهده پنل کاربری"
            counter: false
            onShowClick: {
                accountObj.state = "Account"
                mainPage.state = "Edit"
                accountPopEnabled = false
            }
        }

        RowsofAccountPop{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
            icon: Icons.account
            text: "شخصی سازی صفحه اول"
            counter: false

        }

        RowsofAccountPop{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
            icon: Icons.wallet
            text: "کیف پول شما"
            counter: false
            onShowClick: {
                accountObj.state = "Wallet"
                mainPage.state = "Edit"
                accountPopEnabled = false
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 2
            Layout.rightMargin: 10
            Layout.leftMargin: 10
            color: "#ffffff"
        }

        RowsofAccountPop{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
            icon: Icons.library_books
            text: "کتاب های من"
            counter: true
            recText: myBooksModel.count
            onShowClick: {
                accountObj.state = "My Books"
                mainPage.state = "Edit"
                accountPopEnabled = false
            }

        }

        RowsofAccountPop{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
            icon: Icons.audiobook
            text: "کتاب های صوتی من"
            counter: true
            recText: myAudioBooksModel.count
            onShowClick: {
                accountObj.state = "Audio Books"
                mainPage.state = "Edit"
                accountPopEnabled = false
            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: color2
            Rectangle{
                id: txtBottomRec
                width: parent.width
                height: parent.height * 0.4
                color: "transparent"
                Label{

                    anchors.fill: parent
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.topMargin: 10
                    color: "#ffffff"
                    text: (setting.isLicense)? Functions.remainingLicenseTime(setting.licenseExpiredTime) + " روز از اشتراک شما باقی مانده است" : "شما اشتراک فعالی ندارید"
                    font.family: setting.activeNumFont
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
            Rectangle{
                width: parent.width
                height: parent.height * 0.6
                anchors.top: txtBottomRec.bottom
                color: color2
                Rectangle{
                    anchors.fill: parent
                    anchors.leftMargin: 50
                    anchors.rightMargin: 50
                    anchors.topMargin: 5
                    anchors.bottomMargin: 5
                    color: "#ffffff"
                    Label{
                        anchors.fill: parent
                        color: "#000000"
                        text: "تغییر و تمدید طرح"
                        font.family: setting.activeFont
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        mainPage.state = "Membership"
                    }
                }
            }
        }
    }
}
