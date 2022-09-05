import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

Item {
    Rectangle{
        anchors.fill: parent

        color: "#00ff0000"

        //-- container --//
        Rectangle{
            anchors.fill: parent

            color: color1

            layer.enabled: true
            layer.effect: DropShadow {
                verticalOffset: 3
                horizontalOffset: 3
                color: addOpacity(color4, 40)
                samples: 70
            }

            //-- logo and intro -//
            Rectangle{
                id: rec_head_activity

                height: parent.height * 0.25
                width: parent.width + (20 * ratio)
                color: "#00000000"

                //-- red background --//
                Canvas{
                    id: mycanvas
                    anchors.fill: parent

                    layer.enabled: true
                    layer.effect: DropShadow {
                        verticalOffset: 3
                        horizontalOffset: 0
                        color: addOpacity(color4, 40)
                        samples: 40
                    }


                    onPaint: {
                        var ctx = getContext("2d");

                        //-- set red color --//
                        ctx.fillStyle = "#1684A7"

                        //-- shadow --//
                        //                                ctx.shadowBlur = 10;
                        //                                ctx.shadowOffsetX = 3;
                        //                                ctx.shadowOffsetY = 3;
                        //                                ctx.shadowColor = Util.color_StatusBar;

                        var margin = 5;
                        var x1 = 0 + margin;
                        var x2 = width - margin;
                        var y1 = 0 + margin;
                        var y2 = height - ctx.shadowOffsetY*2;
                        var y3 = height * 0.5;

                        //-- draw polygon path --//
                        // x1, y1
                        //  _________ x2,y1
                        // |        |
                        // |        |
                        // |________|
                        // x1,y3   x2,y2
                        //
                        ctx.beginPath();
                        ctx.moveTo(x1, y1);
                        ctx.lineTo(x2, y1);
                        ctx.lineTo(x2, y2);
                        ctx.lineTo(x1, y3);
                        ctx.lineTo(x1, y1);
                        ctx.closePath();
                        ctx.fill();
                    }

                }

                //-- Icon section --//
                Label{
                    id: lbl_Icon
                    width: implicitWidth
                    height: parent.height
                    anchors.right: parent.right
                    anchors.rightMargin: 20 * ratio
                    anchors.top: parent.top
                    anchors.topMargin: 10 * ratio
                    verticalAlignment: Qt.AlignVCenter
                    text: Icons.phone
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 6
                    color: color1
                }

                //-- title --//
                Label{
                    text: "پشتیبانی"
                    color: color1
                    font.family: setting.activeFont
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                    renderType: Text.NativeRendering

                    anchors.right: lbl_Icon.left
                    anchors.rightMargin: 8 * ratio
                    anchors.verticalCenter: lbl_Icon.verticalCenter
                }
            }

            //-- activity buttons -//
            Rectangle{
                width: parent.width * 0.7
                height: parent.height - rec_head_activity.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom

                color: "#00ff0000"

                ColumnLayout{
                    anchors.fill: parent

                    //-- filler --//
                    Item{Layout.column: 1; Layout.row: 6; Layout.fillHeight: true}

                    //-- fullname --//
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: lbl_phone.implicitHeight * 2

                        RowLayout{
                            anchors.fill: parent

                            Item{Layout.column: 2; Layout.row: 0; Layout.fillWidth: true} //-- filler --//

                            //-- phone --//
                            Label{
                                id: lbl_phone
                                text: "09166546412"
                                font.family: setting.activeNumFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                                color: color4
                            }

                            //-- phone Icon --//
                            Label{
                                text: Icons.phone
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.0
                                color: color4
                            }

                            Item{Layout.column: 2; Layout.row: 0; Layout.fillWidth: true} //-- filler --//
                        }
                    }

                    //-- email --//
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: lbl_phone.implicitHeight * 2

                        RowLayout{
                            anchors.fill: parent

                            Item{Layout.column: 2; Layout.row: 0; Layout.fillWidth: true} //-- filler --//

                            //-- email --//
                            Label{
                                id: lbl_emailAddress
                                text: "seyedmaziarmousavi@gmail.com"
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                                color: color4
                            }

                            //-- email Icon --//
                            Label{
                                text: Icons.email
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.0
                                color: color4
                            }

                            Item{Layout.column: 2; Layout.row: 0; Layout.fillWidth: true} //-- filler --//
                        }
                    }

                    //-- phone --//
                    Item {
                        Layout.fillWidth: true
                        Layout.preferredHeight: lbl_phone.implicitHeight * 2

                        RowLayout{
                            anchors.fill: parent

                            Item{Layout.column: 2; Layout.row: 0; Layout.fillWidth: true} //-- filler --//

                            //-- whatsapp --//
                            Label{
                                id: lbl_whatsapp
                                text: "09166546412"
                                font.family: setting.activeNumFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                                color: color4
                            }

                            //-- phone Icon --//
                            Label{
                                text: Icons.whatsapp
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.0
                                color: color4
                            }

                            Item{Layout.column: 2; Layout.row: 0; Layout.fillWidth: true} //-- filler --//
                        }
                    }

                    //-- filler --//
                    Item{Layout.column: 1; Layout.row: 6; Layout.fillHeight: true}

                }

            }
        }
    }
}
