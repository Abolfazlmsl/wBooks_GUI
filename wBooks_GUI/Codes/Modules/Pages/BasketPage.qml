import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

import "./../Items"

Rectangle {
    color: "transparent"
    StackLayout{
        anchors.fill: parent
        currentIndex: (basketModel.count === 0)? 0:1

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
                        fillMode: Qt.PreserveAspectFit
                    }
                    Label{
                        id: icontxt
                        Layout.preferredWidth: 200
                        Layout.preferredHeight: 200
                        font.family: iranSans.name
                        text: "سبد خرید شما خالی است."
                        font.pixelSize: Qt.application.font.pixelSize * 2
                        color: color4
                    }
                }
            }
        }

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
                                        font.family: iranSans.name
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
                                            font.family: iranSansFAnum.name
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

                    delegate: Rectangle{
                        width: lview.width
                        height: 180
                        color: "transparent"
                        ColumnLayout{
                            anchors.fill: parent
                            spacing: 0
                            Item{
                                Layout.fillWidth: true
                                Layout.preferredHeight: 140
                                RowLayout{
                                    anchors.fill: parent
                                    spacing: 0
                                    layoutDirection: Qt.RightToLeft

                                    Image{
                                        id: image
                                        Layout.preferredWidth: 150
                                        Layout.fillHeight: true
                                        source: "qrc:/Images/warriorqueen.jpg"
                                        mipmap: true
                                    }

                                    Item{Layout.preferredWidth: 30}

                                    Item{
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                        ColumnLayout{
                                            anchors.fill: parent
                                            spacing: 2
                                            Label{
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: contentHeight
                                                text: "کتاب اثر مرکب"
                                                font.family: iranSans.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 1.5
                                                verticalAlignment: Qt.AlignVCenter
                                                elide: Text.ElideRight
                                            }
                                            Label{
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: contentHeight
                                                text: "نویسنده: دارن هاردی"
                                                font.family: iranSans.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 1.2
                                                verticalAlignment: Qt.AlignVCenter
                                                elide: Text.ElideRight
                                            }
                                            Label{
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: contentHeight
                                                text: "مترجم: لطیف احمدپور"
                                                font.family: iranSans.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 1.2
                                                verticalAlignment: Qt.AlignVCenter
                                                elide: Text.ElideRight
                                            }
                                            Label{
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: contentHeight
                                                text: "ناشر: انتشارات نگاه نوین"
                                                font.family: iranSans.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 1.2
                                                verticalAlignment: Qt.AlignVCenter
                                                elide: Text.ElideRight
                                            }
                                            Item{Layout.fillHeight: true}

                                            Label{
                                                Layout.fillWidth: true
                                                Layout.preferredHeight: 40
                                                text: Icons.file_document_box
                                                font.family: webfont.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 2.5
                                                verticalAlignment: Qt.AlignVCenter
                                                horizontalAlignment: Qt.AlignLeft
                                                LayoutMirroring.enabled: true
                                                elide: Text.ElideRight
                                            }
                                        }
                                    }

                                    Item{
                                        Layout.preferredWidth: parent.width * 0.2
                                        Layout.fillHeight: true
                                        Layout.leftMargin: 20
                                        ColumnLayout{
                                            anchors.fill: parent
                                            spacing: 2
                                            Label{
                                                Layout.preferredWidth: 60
                                                Layout.preferredHeight: 60
                                                text: Icons.trash_can
                                                font.family: webfont.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 2.5
                                                verticalAlignment: Qt.AlignVCenter
                                                elide: Text.ElideRight
                                                MouseArea{
                                                    anchors.fill: parent
                                                    cursorShape: Qt.PointingHandCursor
                                                    onClicked: {
                                                        basketModel.remove(index)
                                                    }
                                                }
                                            }
                                            Item{Layout.fillHeight: true}

                                            Label{
                                                Layout.preferredWidth: contentWidth
                                                Layout.preferredHeight: contentHeight
                                                text: "10000 تومان"
                                                font.family: iranSansFAnum.name
                                                color: color4
                                                font.pixelSize: Qt.application.font.pixelSize * 2
                                                verticalAlignment: Qt.AlignVCenter
                                                elide: Text.ElideRight
                                            }
                                        }
                                    }
                                }
                            }
                            Item{Layout.preferredHeight: 19}
                            Rectangle{
                                Layout.fillWidth: true
                                Layout.preferredHeight: 1
                                Layout.rightMargin: 30
                                Layout.leftMargin: 30
                                color: color4
                            }
                            Item{Layout.preferredHeight: 20}
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
                            Layout.preferredHeight: 80
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            color: "transparent"
                            Label{
                                anchors.fill: parent
                                font.family: iranSans.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * 2
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
                                    font.family: iranSans.name
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
                                    font.family: iranSans.name
                                    font.pixelSize: Qt.application.font.pixelSize* 1.3
                                    checked: false

                                    text: "استفاده از اعتبار"
                                    LayoutMirroring.enabled: true

                                    contentItem: Text {
                                        text: checkbox.text
                                        font.pixelSize: Qt.application.font.pixelSize* 1.3
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
                                    font.family: iranSansFAnum.name
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                                    text: "0 تومان"
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
                            font.family: iranSans.name
                            font.pixelSize: Qt.application.font.pixelSize* 1.3
                            checked: true

                            text: "قوانین wBooks را میپذیرم."
                            LayoutMirroring.enabled: true

                            contentItem: Text {
                                text: checkbox2.text
                                font.pixelSize: Qt.application.font.pixelSize* 1.3
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
                                    font.family: iranSans.name
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                                    text: "قابل پرداخت:"
                                    color: color4
                                }

                                Label{
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true
                                    font.family: iranSansFAnum.name
                                    horizontalAlignment: Qt.AlignHCenter
                                    verticalAlignment: Qt.AlignVCenter
                                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                                    text: "20000 تومان"
                                    color: color4
                                }
                            }
                        }

                        Item{Layout.preferredHeight: 20}

                        Rectangle{
                            Layout.preferredHeight: 50
                            Layout.fillWidth: true
                            Layout.rightMargin: 10
                            Layout.leftMargin: 10
                            color: color12
                            radius: 10
                            Label{
                                anchors.fill: parent
                                font.family: iranSans.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * 1.3
                                text: "پرداخت"
                                color: color4
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
            }
        }
    }
}
