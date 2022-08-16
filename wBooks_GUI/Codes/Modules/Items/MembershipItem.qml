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
    property alias bgColor: innerRect.color
    property int price: 1

    signal dashboard_btnClicked

    width: 280 //* widthRatio
    height: 350

    radius: 20 //* widthRatio

    color: "transparent"

    //-- Shadow of btnPurchase --//
    DropShadow {
        anchors.fill: dashboard_btn
        transparentBorder: true
        horizontalOffset: 0
        verticalOffset: 3
        spread: 0.0
        radius: 9.0
        samples: 14
        color: addOpacity(color4, 40)
        source: dashboard_btn
    }

    //-- Practice Square --//
    Rectangle{
        id: dashboard_btn

        anchors.fill: parent

        radius: 20 //* widthRatio

        color: "transparent"

        //-- Added this for "Shadow" --//
        Rectangle{
            anchors.fill: parent
            radius: dashboard_btn.radius

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#ffffff" }
                GradientStop { position: 1.0; color: "#e9eaea" }
            }

            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 15
                spacing: 0
                //-- Inner Rect --//
                Rectangle{
                    id: innerRect
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.75

                    radius: dashboard_btn.radius

                    border.width: 1
                    border.color: "#ffffff"

                    color: "#6c88b7"

                    //-- Inner Items --//
                    ColumnLayout{
                        anchors.fill: parent
                        spacing: 0

                        //-- Title Rect --//
                        Rectangle{

                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.3
                            color: "transparent"

                            radius: dashboard_btn.radius

                            //-- Title of Square --//
                            Label{
                                id:lbl_Title
                                anchors.centerIn: parent
                                text: "تمرین"
                                font.family: mainFaNumFont.name
                                font.pixelSize: 23 //* widthRatio
                                font.bold: true

                                color: "#ffffff"

                            }



                        }

                        //-- Separator --//
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 1
                        }

                        Item{Layout.fillHeight: true}

                        //-- Description Rect --//
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.2

                            color: "transparent"

                            radius: dashboard_btn.radius

                            //-- Title of Square --//
                            Label{
                                id:lbl_Desc
                                anchors.centerIn: parent
                                text: "دسترسی به کتاب های اشتراکی"
                                font.family: mainFont.name
                                font.pixelSize: 15 //* widthRatio
                                font.bold: true
                                wrapMode: Text.WordWrap

                                color: "#ffffff"

                            }
                        }

                        //-- Bottom Title Rect --//
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.2  //-- 62 in 1080 or 249(Inner Rect) / 62 = 4 --//

                            color: "transparent"

                            radius: dashboard_btn.radius

                            //-- Title of Square --//
                            Label{
                                id:lbl_Title2
                                anchors.centerIn: parent
                                text: "مبلغ:"
                                font.family: mainFont.name
                                font.pixelSize: 23 //* widthRatio
                                font.bold: true

                                color: "#ffffff"

                            }
                        }

                        //-- Price Rect --//
                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.2  //-- 62 in 1080 or 249(Inner Rect) / 62 = 4 --//

                            color: "transparent"

                            radius: dashboard_btn.radius

                            //-- Title of Square --//
                            Label{
                                id:lbl_Price
                                anchors.centerIn: parent
                                text: Functions.numberWithCommas(price) + " تومان"
                                font.family: mainFaNumFont.name
                                font.pixelSize: 23 //* widthRatio
                                font.bold: true

                                color: "#ffffff"

                            }
                        }
                    }
                }

                Item{Layout.fillHeight: true}


                //-- Bottom Purchase Rect --//
                Rectangle{
                    id: purchase
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.2

                    color: "transparent"

                    radius: dashboard_btn.radius

                    //-- Shadow of btnPurchase --//
                    DropShadow {
                        anchors.fill: purchaseInner
                        transparentBorder: true
                        horizontalOffset: 0
                        verticalOffset: 3
                        spread: btn_ShadowSpread
                        radius: btn_ShadowRadius
                        samples: 14
                        color: "#40000000"
                        source: purchaseInner
                    }

                    Rectangle{
                        id: purchaseInner
                        anchors.fill: parent

                        color: "green"

                        radius: dashboard_btn.radius

                        //-- Title of Square --//
                        Label{
                            id:lbl_Purchase
                            anchors.centerIn: parent
                            text: "خرید"
                            font.family: mainFont.name
                            font.pixelSize: 23 //* widthRatio
                            font.bold: true

                            color: "#ffffff"

                        }

                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor

                            onEntered: {
                                btn_ShadowSpread = 0.5
                                btn_ShadowRadius = 12
                            }

                            onExited: {
                                btn_ShadowSpread = 0.0
                                btn_ShadowRadius = 9
                            }

                            onClicked: {
                                dashboard_btnClicked()
                            }
                        }
                    }
                }
            }
        }
    }
}
