import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

import "./../../../Modules/Items"

Item{

    property int increseAmount: 10000
    property int totalAmount: 10000

    property real btn_ShadowSpread: 0.0
    property real btn_ShadowRadius: 9

    signal dashboard_btnClicked

    ListModel{
        id: amountModel
        ListElement{
            amount: 10000
            isClick: true
        }
        ListElement{
            amount: 25000
            isClick: false
        }
        ListElement{
            amount: 50000
            isClick: false
        }
        ListElement{
            amount: 100000
            isClick: false
        }
        ListElement{
            amount: 250000
            isClick: false
        }
        ListElement{
            amount: 500000
            isClick: false
        }
    }

    Flickable{
        id: flick
        anchors.fill: parent
        contentHeight: membershipItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}
        clip: true

        Item{
            id: membershipItem
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

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.leftMargin: 50
                    Layout.rightMargin: 50
                    Layout.topMargin: 50
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        spacing: 20
                        WalletItem{
                            Layout.preferredWidth: parent.width * 0.55
                            Layout.fillHeight: true
                            title: "موجودی کیف پول"
                        }

                        Item{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 0
                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 95
                                    color: "#3a3a3c"
                                    radius: 20
                                    Rectangle{
                                        anchors.fill: parent
                                        anchors.rightMargin: 10
                                        anchors.leftMargin: 10
                                        anchors.topMargin: 20
                                        anchors.bottomMargin: 20
                                        color: "transparent"
                                        RowLayout{
                                            anchors.fill: parent
                                            layoutDirection: Qt.RightToLeft
                                            spacing: 5
                                            Label{
                                                Layout.preferredWidth: 40
                                                Layout.fillHeight: true
                                                text: Icons.check
                                                font.family: webfont.name
                                                color: "#ffffff"
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Qt.AlignHCenter
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                                            }
                                            Item{Layout.preferredWidth: 5}

                                            Item{
                                                Layout.fillWidth: true
                                                Layout.fillHeight: true
                                                ColumnLayout{
                                                    anchors.fill: parent
                                                    spacing: 0

                                                    Label{
                                                        Layout.fillWidth: true
                                                        Layout.preferredHeight: 20
                                                        text: "پیشنهاد استثنایی"
                                                        font.family: setting.activeFont
                                                        font.bold: true
                                                        color: "#ffffff"
                                                        verticalAlignment: Qt.AlignVCenter
                                                        horizontalAlignment: Text.AlignLeft
                                                        LayoutMirroring.enabled: true
                                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.5
                                                    }

                                                    Label{
                                                        Layout.fillWidth: true
                                                        Layout.preferredHeight: 20
                                                        text: "10 درصد شارژ بیشتر با پرداخت های بالای " + Functions.numberWithCommas(100000) + " تومان"
                                                        font.family: setting.activeNumFont
                                                        color: "#646464"
                                                        verticalAlignment: Qt.AlignVCenter
                                                        horizontalAlignment: Text.AlignLeft
                                                        LayoutMirroring.enabled: true
                                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.5
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                Item{
                                    Layout.fillHeight: true
                                }
                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 190
                                    color: "#14a085"
                                    radius: 20
                                    ColumnLayout{
                                        anchors.fill: parent
                                        anchors.rightMargin: 20
                                        anchors.leftMargin: 10
                                        anchors.topMargin: 10
                                        anchors.bottomMargin: 10
                                        spacing: 8

                                        Item{Layout.fillHeight: true}

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: 20
                                            text: "کتاب ها همیشه برای شماست"
                                            font.family: setting.activeFont
                                            font.bold: true
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.5
                                        }

                                        Label{
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: 20
                                            text: "تهیه اشتراک ویژه کتاب های سریالی با تخفیف %30"
                                            font.family: setting.activeNumFont
                                            color: "#ffffff"
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Text.AlignLeft
                                            LayoutMirroring.enabled: true
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.5
                                        }
                                        Item{Layout.fillHeight: true}
                                    }
                                }
                            }
                        }
                    }
                }

                Item{Layout.preferredHeight: 50}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 20
                    Layout.leftMargin: 50
                    Layout.rightMargin: 50
                    color: "transparent"
                    Label{
                        anchors.fill: parent
                        text: "گزینه ی موردنظر خود را انتخاب کنید"
                        font.family: setting.activeFont
                        color: "#000000"
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Text.AlignLeft
                        LayoutMirroring.enabled: true
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.5
                    }
                }

                Item{Layout.preferredHeight: 20}

                GridView{
                    id: lview
                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.ceil(lview.count/Math.floor((parent.width-100)/cellWidth)) * cellHeight + 20
                    Layout.rightMargin: 30
                    Layout.leftMargin: 50
                    clip: true
                    focus: true
                    cellWidth: 440
                    cellHeight: 100
                    interactive: true
                    layoutDirection: Qt.RightToLeft
                    model: amountModel
                    ScrollBar.vertical: ScrollBar {}
                    delegate: IncreaseAmountItem{
                        amount: model.amount
                        isClick: model.isClick

                        onBtnClicked: {
                            for (var i=0; i<amountModel.count; i++){
                                if (i===index){
                                    amountModel.setProperty(i, "isClick", true)
                                }else{
                                    amountModel.setProperty(i, "isClick", false)
                                }
                            }
                            increseAmount = model.amount
                            if (increseAmount >= 100000){
                                totalAmount = increseAmount + 0.1*increseAmount
                            }else{
                                totalAmount = increseAmount
                            }
                        }
                    }
                }

                Item{Layout.preferredHeight: 20}

                Rectangle{
                    Layout.preferredHeight: 1
                    Layout.fillWidth: true
                    Layout.rightMargin: 70
                    Layout.leftMargin: 50
                    color: "#d8d9d7"
                }

                Item{Layout.preferredHeight: 20}

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Layout.leftMargin: 50
                    Layout.rightMargin: 70
                    RowLayout{
                        anchors.fill: parent
                        spacing: 10
                        layoutDirection: Qt.RightToLeft

                        Item{
                            Layout.preferredWidth: 70
                            Layout.fillHeight: true
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 5
                                Item{Layout.fillHeight: true}

                                Label{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: contentHeight
                                    text: "قابل پرداخت:"
                                    font.family: setting.activeFont
                                    font.pixelSize: 15 //* widthRatio
                                    horizontalAlignment: Text.AlignLeft
                                    LayoutMirroring.enabled: true
                                    verticalAlignment: Qt.AlignVCenter
                                    color: "#000000"
                                }

                                Label{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: contentHeight
                                    text: "پرداخت بیشتر:"
                                    font.family: setting.activeFont
                                    font.pixelSize: 15 //* widthRatio
                                    horizontalAlignment: Text.AlignLeft
                                    LayoutMirroring.enabled: true
                                    verticalAlignment: Qt.AlignVCenter
                                    color: "#d43460"
                                }

                                Item{Layout.fillHeight: true}
                            }
                        }

                        Item{Layout.preferredWidth: 50}

                        Item{
                            Layout.preferredWidth: 70
                            Layout.fillHeight: true
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 5
                                Item{Layout.fillHeight: true}

                                Label{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: contentHeight
                                    text: Functions.numberWithCommas(increseAmount) + " تومان"
                                    font.family: setting.activeNumFont
                                    font.pixelSize: 15 //* widthRatio
                                    horizontalAlignment: Text.AlignLeft
                                    LayoutMirroring.enabled: true
                                    verticalAlignment: Qt.AlignVCenter
                                    color: "#000000"
                                }

                                Label{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: contentHeight
                                    text: Functions.numberWithCommas(totalAmount) + " تومان"
                                    font.family: setting.activeNumFont
                                    font.pixelSize: 15 //* widthRatio
                                    horizontalAlignment: Text.AlignLeft
                                    LayoutMirroring.enabled: true
                                    verticalAlignment: Qt.AlignVCenter
                                    color: "#d43460"
                                }

                                Item{Layout.fillHeight: true}
                            }
                        }

                        Item{Layout.fillWidth: true}

                        ButtonShadow{
                            id: purchase
                            Layout.preferredWidth: 250
                            Layout.fillHeight: true
                            fontSize: 1
                            btnText: "پرداخت نهایی"
                            btnColor: "#d43460"
                            textColor: "#ffffff"

                            onDashboard_btnClicked: {
                                setting.mywallet = setting.mywallet + increseAmount
                                var licenseData = {
                                    "image": setting.licenseImage,
                                    "purchase_id": setting.licensePurchaseNumber,
                                    "time": setting.licenseTime,
                                    "expiredTime": setting.licenseExpiredTime
                                }
                                var birthday = {
                                    "day": setting.birthDay,
                                    "month": setting.birthMonth,
                                    "year": setting.birthYear
                                }
                                var data = {
                                    "id": setting.user_id,
                                    "name": setting.userName,
                                    "email": setting.userEmail,
                                    "phone": setting.userPhone,
                                    "password": setting.password,
                                    "gender": setting.gender,
                                    "getEmail": setting.getEmail,
                                    "birthday": birthday,
                                    "mywallet": setting.mywallet,
                                    "user_number": setting.user_number,
                                    "mylicense": licenseData
                                }
                                db.storeData("users", data, setting.profile)
                            }
                        }

                    }
                }

                Item{Layout.preferredHeight: 50}

            }
        }
    }
}
