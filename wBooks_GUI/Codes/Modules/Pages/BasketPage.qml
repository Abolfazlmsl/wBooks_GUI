import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Functions/Funcs.js" as Functions

import "./../Items"
import "./../MainModules/Ui_Module"

Rectangle {
    color: "transparent"
    StackLayout{
        anchors.fill: parent
        currentIndex: (basketModel.count === 0)? 0:1

        // Empty basket
        Item{
            Rectangle{
                anchors.fill: parent
                color: "transparent"
                ColumnLayout{
                    anchors.centerIn: parent
                    Image{
                        id: icon
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 200
                        source: "qrc:/Images/Emptybasket.png"
                        mipmap: true
                        fillMode: Image.PreserveAspectFit
                    }
                    Label{
                        id: icontxt
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 200
                        font.family: setting.activeFont
                        text: "سبد خرید شما خالی است."
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                        color: color4
                    }
                }
            }
        }

        // Not Empty basket
        Item{
            RowLayout{
                anchors.fill: parent
                anchors.topMargin: 50
                anchors.bottomMargin: 50
                anchors.rightMargin: 70
                anchors.leftMargin: 70
                spacing: 0
                layoutDirection: Qt.RightToLeft
                Rectangle{
                    Layout.preferredWidth: parent.width * 0.7
                    Layout.fillHeight: true
                    color: color1
                    radius: 20
                    ListView{
                        id: lview
                        anchors.fill: parent
                        anchors.margins: 20
                        spacing: 30
                        model: basketModel
                        clip: true

                        delegate: Loader{

                            property string modelType: model.type
                            property string modelDescription: model.description

                            width: lview.width
                            height: 180

                            sourceComponent: {
                                if(model.type === "Audio Book" || model.type === "Document Book"){
                                    return basketBookCom
                                }else{
                                    return basketMembershipCom
                                }
                            }
                        }

                    }
                }

                Item{Layout.preferredWidth: 15}

                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    ColumnLayout{
                        anchors.fill: parent
                        spacing: 15
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.7
                            color: color1
                            radius: 20
                            ColumnLayout{
                                anchors.fill: parent
                                spacing: 0

                                Item{Layout.preferredHeight: 10}

                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.rightMargin: 10
                                    Layout.leftMargin: 10
                                    color: "transparent"
                                    Label{
                                        anchors.fill: parent
                                        font.family: setting.activeFont
                                        verticalAlignment: Qt.AlignVCenter
                                        horizontalAlignment: Text.AlignLeft
                                        LayoutMirroring.enabled: true
                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                        font.bold: true
                                        text: "صورت حساب"
                                        color: "#646464"
                                    }
                                }

                                Item{Layout.preferredHeight: 10}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.rightMargin: 20
                                    Layout.leftMargin: 20
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0

                                        Label{
                                            Layout.preferredWidth: contentWidth
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            verticalAlignment: Qt.AlignVCenter
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                            text: "جمع کل:"
                                            color: color4
                                        }

                                        Item{Layout.fillWidth: true}

                                        Label{
                                            Layout.preferredWidth: contentWidth
                                            Layout.fillHeight: true
                                            font.family: setting.activeNumFont
                                            horizontalAlignment: Qt.AlignHCenter
                                            verticalAlignment: Qt.AlignVCenter
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                            text: Functions.numberWithCommas("35000") + " تومان"
                                            color: color4
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 5}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.rightMargin: 20
                                    Layout.leftMargin: 20
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0

                                        Label{
                                            Layout.preferredWidth: contentWidth
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            verticalAlignment: Qt.AlignVCenter
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                            text: "قابل پرداخت:"
                                            color: "#d43460"
                                        }

                                        Item{Layout.fillWidth: true}

                                        Label{
                                            Layout.preferredWidth: contentWidth
                                            Layout.fillHeight: true
                                            font.family: setting.activeNumFont
                                            horizontalAlignment: Qt.AlignHCenter
                                            verticalAlignment: Qt.AlignVCenter
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                            text: Functions.numberWithCommas("35000") + " تومان"
                                            color: "#d43460"
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 15}

                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.rightMargin: 20
                                    Layout.leftMargin: 20
                                    color: "transparent"
                                    Label{
                                        anchors.fill: parent
                                        verticalAlignment: Qt.AlignVCenter
                                        horizontalAlignment: Text.AlignLeft
                                        LayoutMirroring.enabled: true
                                        text: "اگر کد تخفیف دارید در این بخش وارد کنید"
                                        font.family: setting.activeFont
                                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.2*ratio
                                        color: color4
                                    }
                                }

                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.rightMargin: 10
                                    Layout.leftMargin: 10
                                    color: "transparent"
                                    //-- Phone --//
                                    M_inputText{
                                        id: input_off
                                        anchors.fill: parent
                                        itemRadius: 10
                                        label: "کدتخفیف"
                                        icon: ""
                                        placeholder: "کد تخفیف"
                                        inputText.text: ""
                                        bgColor: "transparent"
                                        borderColor: "#646464"
                                    }
                                    Rectangle{
                                        width: parent.width * 0.3
                                        height: parent.height
                                        anchors.left: input_off.left
                                        color: "#d43460"
                                        radius: 10
                                        Label{
                                            anchors.fill: parent
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            text: "اعمال"
                                            font.family: setting.activeFont
                                            color: color3
                                        }
                                        MouseArea{
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: {

                                            }
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 15}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.rightMargin: 10
                                    Layout.leftMargin: 10
                                    RowLayout{
                                        anchors.fill: parent
                                        layoutDirection: Qt.RightToLeft
                                        spacing: 0
                                        CheckBox {
                                            id: checkbox
                                            Layout.preferredWidth: parent.width * 0.6
                                            Layout.fillHeight: true
                                            font.family: setting.activeFont
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3
                                            checked: false

                                            text: "استفاده از اعتبار کیف پول"
                                            LayoutMirroring.enabled: true

                                            contentItem: Text {
                                                text: checkbox.text
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio* 1.3 * ratio
                                                rightPadding: checkbox.indicator.width
                                                color: color4
                                                verticalAlignment: Text.AlignVCenter
                                                anchors.left: parent.left
                                                width: parent.width / 2
                                            }
                                        }

                                        Item{Layout.fillWidth: true}

                                        Label{
                                            Layout.preferredWidth: contentWidth
                                            Layout.fillHeight: true
                                            font.family: setting.activeNumFont
                                            horizontalAlignment: Qt.AlignHCenter
                                            verticalAlignment: Qt.AlignVCenter
                                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                            text: Functions.numberWithCommas(setting.mywallet) + " تومان"
                                            color: color4
                                        }
                                    }
                                }

                                Item{Layout.preferredHeight: 15}

                                Item{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: parent.height * 0.1
                                    Layout.leftMargin: 10
                                    Layout.rightMargin: 10
                                    RowLayout{
                                        anchors.fill: parent
                                        spacing: 5
                                        layoutDirection: Qt.RightToLeft
                                        ButtonShadow{
                                            id: delBasket
                                            Layout.fillHeight: true
                                            Layout.preferredWidth: parent.width * 0.4
                                            btnText: "حذف سبد خرید"
                                            textColor: "#d43460"
                                            fontSize: 1.1 * ratio
                                            btnColor: "transparent"
                                            btnRadius: 10
                                            border.width: 1
                                            border.color: "#646464"
                                            onDashboard_btnClicked: {
                                                basketModel.clear()
                                            }
                                        }

                                        ButtonShadow{
                                            id: regist
                                            Layout.fillHeight: true
                                            Layout.fillWidth: true
                                            btnText: "پرداخت نهایی"
                                            textColor: "#ffffff"
                                            fontSize: 1.1 * ratio
                                            btnColor: "#d43460"
                                            btnRadius: 10
                                            onDashboard_btnClicked: {

                                            }
                                        }
                                    }
                                }

                                Item{Layout.fillHeight: true}
                            }
                        }

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
                                                text: "با خرید اشتراکی کتاب های سریالی"
                                                font.family: setting.activeFont
                                                font.bold: true
                                                color: "#ffffff"
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Text.AlignLeft
                                                LayoutMirroring.enabled: true
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.3
                                            }

                                            Label{
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 20
                                                text: "کتاب صوتی مغازه خودکشی را به صورت رایگان دریافت کنید"
                                                wrapMode: Text.WordWrap
                                                font.family: setting.activeNumFont
                                                color: "#646464"
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Text.AlignLeft
                                                LayoutMirroring.enabled: true
                                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Item{Layout.fillHeight: true}
                    }
                }
            }
        }
    }

    Component{
        id: basketMembershipCom
        BasketMembership{
            width: parent.width
            height: 180
        }
    }

    Component{
        id: basketBookCom
        BasketBook{
            width: parent.width
            height: 180
            bookFileType: modelType
            bookDescription: modelDescription
        }
    }
}
