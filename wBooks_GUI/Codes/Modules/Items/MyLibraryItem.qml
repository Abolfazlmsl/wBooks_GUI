import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

Item {
    id: list_item

    property alias title: txt2.text
    property alias btnTitle: btn.btnText
    property alias imgSource: img.source
    property string btnTextColor: color3
    property int radiusBtn: 0
    property string colorBtn: color8

    property string firstColor: color4
    property string secondColor: "#2cbbb9"
    property double percent: 50
    property int progressThickness: 10

    property var itemModel: []

    signal btnClicked()

    ColumnLayout{
        id: itemRec
        anchors.fill: parent
        spacing: 0

        Rectangle{
            id: imgRec
            Layout.fillWidth: true
            Layout.preferredHeight: 200  * ratio

            color: color8
            Image {
                id: img
                anchors.fill: parent
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 8
                source: ""
                mipmap: true

                Rectangle{
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 5
                    anchors.bottomMargin: 5
                    width: 70
                    height: 20
                    color: "transparent"
                    Label{
                        id: typeIcon
                        anchors.centerIn: parent
                        text: itemModel.count + " کتاب موجود"
                        font.family: setting.activeNumFont
                        color: "#ffffff"
                        font.pixelSize: Qt.application.font.pixelSize*1
                    }
                }
            }
        }

        Item{Layout.preferredHeight: 8 * ratio}

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: 30  * ratio
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                Rectangle{
                    id: title2Rec
                    Layout.fillHeight: true
                    Layout.preferredWidth: txt2.contentWidth
                    color: "transparent"
                    Label{
                        id: txt2
                        anchors.fill: parent
                        text: ""
                        font.family: setting.activeFont
                        font.pixelSize: Qt.application.font.pixelSize*1.2 * ratio
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                    }
                }

                Item{Layout.fillWidth: true}

                //-- Button --//
                ButtonShadow{
                    id: btn
                    Layout.fillHeight: true
                    Layout.preferredWidth: 120 * ratio
                    btnText: ""
                    textColor: btnTextColor
                    fontSize: 1 * ratio
                    btnRadius: radiusBtn
                    btnColor: colorBtn
                    onDashboard_btnClicked: {
                        btnClicked()
                    }
                }
            }
        }

        Item{Layout.preferredHeight: 10 * ratio}

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: 90  * ratio
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft
                CircularProgressbar{
                    Layout.preferredWidth: 70 * ratio
                    Layout.preferredHeight: 70 * ratio
                    thickness: progressThickness * ratio
                    primaryColor: firstColor
                    secondaryColor: secondColor
                    currentValue: percent
                }

                Item{Layout.preferredWidth: 20}

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 60 * ratio
                    Layout.bottomMargin: 45
                    ColumnLayout{
                        anchors.fill: parent
                        spacing: 0
                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 15
                            RowLayout{
                                anchors.fill: parent
                                spacing: 5
                                layoutDirection: Qt.RightToLeft

                                Rectangle{
                                    Layout.preferredWidth: 5
                                    Layout.preferredHeight: width
                                    radius: width/2
                                    color: firstColor
                                }

                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: txt3.contentWidth
                                    color: "transparent"
                                    Label{
                                        id: txt3
                                        anchors.fill: parent
                                        text: "تعداد کل کتاب ها"
                                        font.family: setting.activeFont
                                        color: firstColor
                                        font.pixelSize: Qt.application.font.pixelSize*1
                                        verticalAlignment: Qt.AlignVCenter
                                    }
                                }
                            }
                        }

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 15
                            RowLayout{
                                anchors.fill: parent
                                spacing: 5
                                layoutDirection: Qt.RightToLeft

                                Rectangle{
                                    Layout.preferredWidth: 5
                                    Layout.preferredHeight: width
                                    radius: width/2
                                    color: secondColor
                                }

                                Rectangle{
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: txt4.contentWidth
                                    color: "transparent"
                                    Label{
                                        id: txt4
                                        anchors.fill: parent
                                        text: "کتاب های خوانده شده"
                                        font.family: setting.activeFont
                                        color: secondColor
                                        font.pixelSize: Qt.application.font.pixelSize*1
                                        verticalAlignment: Qt.AlignVCenter
                                    }
                                }
                            }
                        }

                        Item{Layout.fillHeight: true}
                    }
                }
            }
        }

        Item{Layout.preferredHeight: 50 * ratio}
    }
}
