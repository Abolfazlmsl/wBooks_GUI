import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Functions/Funcs.js" as Functions

//-- Practice Square --//
Rectangle{

    property real btn_ShadowSpread: 0.0
    property real btn_ShadowRadius: 9

    property alias title: lbl_Title.text

    width: 280 //* widthRatio
    height: 300

    radius: 20 //* widthRatio

    color: "#3a3a3c"

    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 15
        spacing: 0
        Item{Layout.fillHeight: true}

        Item{
            Layout.preferredHeight: 40
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                spacing: 0
                Label{
                    id:lbl_Title
                    Layout.fillHeight: true
                    Layout.preferredWidth: contentWidth
                    text: "تمرین"
                    font.family: setting.activeFont
                    font.pixelSize: 15 //* widthRatio
                    verticalAlignment: Qt.AlignVCenter
                    color: "#ffffff"
                }
                Item{Layout.fillWidth: true}

                Label{
                    id:lbl_Price
                    Layout.fillHeight: true
                    Layout.preferredWidth: contentWidth
                    text: Functions.numberWithCommas(setting.mywallet) + " تومان"
                    font.family: setting.activeNumFont
                    font.pixelSize: 40 //* widthRatio
                    font.bold: true
                    verticalAlignment: Qt.AlignVCenter
                    color: "#14a085"
                }
            }
        }

        Item{Layout.preferredHeight: 40}

        Item{
            Layout.preferredHeight: 160
            Layout.fillWidth: true
            Layout.leftMargin: 20
            Layout.rightMargin: 20
            RowLayout{
                anchors.fill: parent
                layoutDirection: Qt.RightToLeft
                spacing: 0
                Label{
                    Layout.fillHeight: true
                    Layout.preferredWidth: contentWidth
                    text: "آخرین پرداخت"
                    font.family: setting.activeFont
                    font.pixelSize: 15 //* widthRatio
                    color: "#ffffff"
                }
                Item{Layout.fillWidth: true}

                ListView{
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.35
                    spacing: 4
                    clip: true
                    interactive: false
                    model: paymentModel
                    delegate: Rectangle{
                        width: parent.width
                        height: 40
                        color: "transparent"
                        RowLayout{
                            anchors.fill: parent
                            layoutDirection: Qt.RightToLeft
                            spacing: 0
                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                color: "#646464"
                                text: model.date
                                font.family: setting.activeNumFont
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.3
                            }
                            Item{Layout.preferredWidth: 5}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                color: "#ffffff"
                                text: "-"
                                font.family: setting.activeFont
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.3
                            }

                            Item{Layout.preferredWidth: 5}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                color: "#ffffff"
                                text: Functions.numberWithCommas(model.amount) + " تومان"
                                font.family: setting.activeNumFont
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * ratio * 1.3
                            }
                        }
                    }
                }
            }
        }


        Item{Layout.fillHeight: true}

    }
}
