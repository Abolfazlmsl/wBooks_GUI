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

//    property alias title: lbl_Title.text
//    property alias bgColor: innerRect.color
    property int price: 1
    property int time: 1
    property alias imgSource: image.source
    property string text1: ""
    property string text2: ""
    property string text3: ""
    property string text4: ""
    property string text5: ""

    signal dashboard_btnClicked

    width: 280 //* widthRatio
    height: 350

//    radius: 20 //* widthRatio

    color: "transparent"

    Rectangle{
        id: priceRec
        width: parent.width
        height: 70
        anchors.top: parent.top
        color: "transparent"
        RowLayout{
            anchors.fill: parent
            spacing: 0
            layoutDirection: Qt.RightToLeft

            Item{Layout.fillWidth: true}

            Rectangle{
                Layout.fillHeight: true
                Layout.preferredWidth: parent.width * 0.5
                color: "transparent"
                Rectangle{
                    id: priceTxt
                    width: parent.width
                    height: parent.height * 0.5
                    anchors.top: parent.top
                    color: "transparent"
                    Rectangle{
                        width: parent.width
                        height: parent.height - 20
                        anchors.verticalCenter: parent.verticalCenter
                        color: "#7dfb01"
                        Label{
                            anchors.fill: parent
                            color: color4
                            text: Functions.numberWithCommas(price)
                            font.family: setting.activeNumFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.5
                            font.bold: true
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter
                        }
                    }

                    Rectangle{
                        width: parent.width
                        height: parent.height * 0.5
                        anchors.top: priceTxt.bottom
                        color: "transparent"
                        Label{
                            anchors.fill: parent
                            anchors.rightMargin: 20
                            color: color4
                            text: "تومان"
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                            font.bold: true
                            verticalAlignment: Qt.AlignVCenter
                        }
                    }
                }
            }

            Item{Layout.fillWidth: true}
        }
    }

    //-- Practice Square --//
    Rectangle{
        id: dashboard_btn

        width: parent.width
        height: 300
        anchors.top: priceRec.bottom
//        radius: 20 //* widthRatio

        color: "transparent"

        //-- Added this for "Shadow" --//
        Rectangle{
            anchors.fill: parent
//            radius: dashboard_btn.radius

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#ffffff" }
                GradientStop { position: 1.0; color: "#e9eaea" }
            }

            ColumnLayout{
                anchors.fill: parent
                spacing: 0

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.2
                    color: "#474749"
                    z: 1
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        layoutDirection: Qt.RightToLeft
                        // Title text //
                        Label{
                            id:lbl_Title
                            Layout.preferredWidth: lbl_Title.contentWidth
                            Layout.fillHeight: true
                            Layout.rightMargin: 20
                            font.family: setting.activeNumFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                            font.bold: true
                            text: "اشتراک ویژه " + time + " روزه"
                            color: "#ffffff"
                            verticalAlignment: Qt.AlignVCenter
                        }

                        Item{Layout.fillWidth: true}

                        Image{
                            id: image
                            Layout.preferredWidth: 50
                            Layout.fillHeight: true
                            Layout.leftMargin: 20
                            Layout.bottomMargin: -60
                            source: "qrc:/Images/bronze-medal.png"
                            mipmap: true
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }

                //-- Inner Rect --//
                Rectangle{
                    id: innerRect
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.6

//                    radius: dashboard_btn.radius

//                    border.width: 1
//                    border.color: "#ffffff"

                    color: "#e2e2e2"

                    //-- Inner Items --//
                    ColumnLayout{
                        anchors.fill: parent
                        spacing: 0

                        Item{Layout.preferredHeight: 20}

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            Layout.rightMargin: 20
                            RowLayout{
                               anchors.fill: parent
                               layoutDirection: Qt.RightToLeft
                               spacing: 0
                               Rectangle{
                                   Layout.preferredWidth: 5
                                   Layout.preferredHeight: 5
                                   color: "#d43460"
                                   rotation: 45
                               }

                               Item{Layout.preferredWidth: 10}

                               Label{
                                   Layout.preferredWidth: 50
                                   Layout.fillHeight: true
                                   color: color4
                                   text: text1
                                   font.family: setting.activeNumFont
                                   font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1
                                   verticalAlignment: Qt.AlignVCenter
                               }
                               Item{Layout.fillWidth: true}
                            }
                        }

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            Layout.rightMargin: 20
                            RowLayout{
                               anchors.fill: parent
                               layoutDirection: Qt.RightToLeft
                               spacing: 0
                               Rectangle{
                                   Layout.preferredWidth: 5
                                   Layout.preferredHeight: 5
                                   color: "#d43460"
                                   rotation: 45
                               }

                               Item{Layout.preferredWidth: 10}

                               Label{
                                   Layout.preferredWidth: 50
                                   Layout.fillHeight: true
                                   color: color4
                                   text: text2
                                   font.family: setting.activeNumFont
                                   font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1
                                   verticalAlignment: Qt.AlignVCenter
                               }
                               Item{Layout.fillWidth: true}
                            }
                        }

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            Layout.rightMargin: 20
                            RowLayout{
                               anchors.fill: parent
                               layoutDirection: Qt.RightToLeft
                               spacing: 0
                               Rectangle{
                                   Layout.preferredWidth: 5
                                   Layout.preferredHeight: 5
                                   color: "#d43460"
                                   rotation: 45
                               }

                               Item{Layout.preferredWidth: 10}

                               Label{
                                   Layout.preferredWidth: 50
                                   Layout.fillHeight: true
                                   color: color4
                                   text: text3
                                   font.family: setting.activeNumFont
                                   font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1
                                   verticalAlignment: Qt.AlignVCenter
                               }
                               Item{Layout.fillWidth: true}
                            }
                        }

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            Layout.rightMargin: 20
                            RowLayout{
                               anchors.fill: parent
                               layoutDirection: Qt.RightToLeft
                               spacing: 0
                               Rectangle{
                                   Layout.preferredWidth: 5
                                   Layout.preferredHeight: 5
                                   color: "#d43460"
                                   rotation: 45
                               }

                               Item{Layout.preferredWidth: 10}

                               Label{
                                   Layout.preferredWidth: 50
                                   Layout.fillHeight: true
                                   color: color4
                                   text: text4
                                   font.family: setting.activeNumFont
                                   font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1
                                   verticalAlignment: Qt.AlignVCenter
                               }
                               Item{Layout.fillWidth: true}
                            }
                        }

                        Item{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 30
                            Layout.rightMargin: 20
                            RowLayout{
                               anchors.fill: parent
                               layoutDirection: Qt.RightToLeft
                               spacing: 0
                               Rectangle{
                                   Layout.preferredWidth: 5
                                   Layout.preferredHeight: 5
                                   color: "#d43460"
                                   rotation: 45
                               }

                               Item{Layout.preferredWidth: 10}

                               Label{
                                   Layout.preferredWidth: 50
                                   Layout.fillHeight: true
                                   color: color4
                                   text: text5
                                   font.family: setting.activeNumFont
                                   font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1
                                   verticalAlignment: Qt.AlignVCenter
                               }
                               Item{Layout.fillWidth: true}
                            }
                        }

                        Item{Layout.fillHeight: true}

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 3
                            color: "#d43460"
                        }
                    }
                }

                Item{Layout.fillHeight: true}

                //-- Bottom Purchase Rect --//
                Rectangle{
                    id: purchase
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.15

                    color: "transparent"

//                    radius: dashboard_btn.radius

                    //-- Shadow of btnPurchase --//
                    DropShadow {
                        anchors.fill: purchaseInner
                        transparentBorder: true
                        horizontalOffset: 0
                        verticalOffset: 3
                        spread: btn_ShadowSpread
                        radius: btn_ShadowRadius
                        samples: 14
                        color: "#40d43460"
                        source: purchaseInner
                    }

                    Rectangle{
                        id: purchaseInner
                        anchors.fill: parent

                        color: "#d43460"

//                        radius: dashboard_btn.radius

                        RowLayout{
                            anchors.fill: parent
                            spacing: 0
                            layoutDirection: Qt.RightToLeft

                            //-- Title of Square --//
                            Label{
                                id:lbl_Purchase
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                Layout.rightMargin: 20
                                text: "خرید اشتراک ویژه " + time + " روزه"
                                font.family: setting.activeNumFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1 //* widthRatio
                                verticalAlignment: Qt.AlignVCenter
                                color: "#ffffff"
                            }

                            Item{Layout.fillWidth: true}

                            Label{
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100
                                Layout.leftMargin: 20
                                text: Icons.arrow_left
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio
                                color: "#ffffff"
                                verticalAlignment: Qt.AlignVCenter
                            }
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
