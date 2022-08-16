import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

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
                        font.family: mainFont.name
                        text: "سبد خرید شما خالی است."
                        font.pixelSize: Qt.application.font.pixelSize * 2
                        color: color4
                    }
                }
            }
        }

        // Not Empty basket
        Item{
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                ListView{
                    id: lview
                    Layout.preferredWidth: parent.width * 0.8
                    Layout.fillHeight: true
                    spacing: 0
                    model: basketModel
                    clip: true
                    header: Rectangle{
                        width: lview.width
                        height: 60
                        color: "transparent"
                        ColumnLayout{
                            anchors.fill: parent
                            spacing: 0
                            Item{
                                Layout.fillWidth: true
                                Layout.preferredHeight: 40
                                RowLayout{
                                    anchors.fill: parent
                                    layoutDirection: Qt.RightToLeft
                                    spacing: 5
                                    Label{
                                        Layout.preferredWidth: contentWidth
                                        Layout.fillHeight: true
                                        font.family: mainFont.name
                                        verticalAlignment: Qt.AlignVCenter
                                        horizontalAlignment: Qt.AlignHCenter
                                        font.pixelSize: Qt.application.font.pixelSize * 2
                                        text: "سبد خرید"
                                        color: color4
                                    }

                                    Rectangle{
                                        Layout.preferredWidth: 30
                                        Layout.preferredHeight: width
                                        radius: width / 2
                                        color: color12
                                        Label{
                                            anchors.fill: parent
                                            font.family: mainFaNumFont.name
                                            verticalAlignment: Qt.AlignVCenter
                                            horizontalAlignment: Qt.AlignHCenter
                                            font.pixelSize: Qt.application.font.pixelSize * 2
                                            text: basketModel.count
                                            color: color3
                                        }
                                    }

                                    Rectangle{
                                        Layout.fillWidth: true
                                        Layout.preferredHeight: 1
                                        Layout.leftMargin: 10
                                        color: color4
                                    }
                                }
                            }
                            Item{Layout.fillHeight: true}
                        }
                    }

                    delegate: Loader{

                        property string modelType: model.type

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

                Rectangle{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: color1
                    ColumnLayout{
                        anchors.fill: parent
                        spacing: 0
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 80 * ratio
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            color: "transparent"
                            Label{
                                anchors.fill: parent
                                font.family: mainFont.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * 2 * ratio
                                text: "صورت حساب"
                                color: color4
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            color: "transparent"
                            //-- Phone --//
                            M_inputText{
                                id: input_off
                                anchors.fill: parent
                                label: "کدتخفیف"
                                icon: ""
                                placeholder: "کد تخفیف"
                                inputText.text: ""
                            }
                            Rectangle{
                                width: parent.width * 0.3
                                height: parent.height * 0.8
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.leftMargin: 10
                                anchors.left: input_off.left
                                color: color12
                                radius: 10
                                Label{
                                    anchors.fill: parent
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    text: "تایید کد"
                                    font.family: mainFont.name
                                    color: color4
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {

                                    }
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            color: color4
                        }

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 0
                                CheckBox {
                                    id: checkbox
                                    Layout.preferredWidth: parent.width * 0.8
                                    Layout.fillHeight: true
                                    font.family: mainFont.name
                                    font.pixelSize: Qt.application.font.pixelSize* 1.3
                                    checked: false

                                    text: "استفاده از اعتبار"
                                    LayoutMirroring.enabled: true

                                    contentItem: Text {
                                        text: checkbox.text
                                        font.pixelSize: Qt.application.font.pixelSize* 1.3 * ratio
                                        rightPadding: checkbox.indicator.width
                                        color: color4
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.left: parent.left
                                        width: parent.width / 2
                                    }
                                }

                                Label{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    font.family: mainFaNumFont.name
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.3 * ratio
                                    text: Functions.numberWithCommas("0") + " تومان"
                                    color: color4
                                }
                            }
                        }

                        CheckBox {
                            id: checkbox2
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            font.family: mainFont.name
                            font.pixelSize: Qt.application.font.pixelSize* 1.3
                            checked: true

                            text: "قوانین wBooks را میپذیرم."
                            LayoutMirroring.enabled: true

                            contentItem: Text {
                                text: checkbox2.text
                                font.pixelSize: Qt.application.font.pixelSize* 1.3 * ratio
                                rightPadding: checkbox2.indicator.width
                                color: color4
                                verticalAlignment: Text.AlignVCenter
                                anchors.left: parent.left
                                width: parent.width / 2
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            Layout.rightMargin: 20
                            Layout.leftMargin: 20
                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 0

                                Label{
                                    Layout.preferredWidth: parent.width * 0.8
                                    Layout.fillHeight: true
                                    font.family: mainFont.name
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.3 * ratio
                                    text: "قابل پرداخت:"
                                    color: color4
                                }

                                Label{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    font.family: mainFaNumFont.name
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.3 * ratio
                                    text: Functions.numberWithCommas("35000") + " تومان"
                                    color: color4
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        ButtonShadow{
                            id: regist
                            Layout.fillWidth: true
                            Layout.preferredHeight: 50
                            Layout.leftMargin: 10
                            Layout.rightMargin: 10
                            btnText: "پرداخت"
                            textColor: "#ffffff"
                            btnRadius: 10
                            onDashboard_btnClicked: {

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
        }
    }
}
