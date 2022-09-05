import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

Rectangle{
    property string bookFileType: "Document Book"

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
                            font.family: setting.activeFont
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * 1.5
                            verticalAlignment: Qt.AlignVCenter
                            elide: Text.ElideRight
                        }
                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: contentHeight
                            text: "نویسنده: دارن هاردی"
                            font.family: setting.activeFont
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            verticalAlignment: Qt.AlignVCenter
                            elide: Text.ElideRight
                        }
                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: contentHeight
                            text: "مترجم: لطیف احمدپور"
                            font.family: setting.activeFont
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            verticalAlignment: Qt.AlignVCenter
                            elide: Text.ElideRight
                        }
                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: contentHeight
                            text: "ناشر: انتشارات نگاه نوین"
                            font.family: setting.activeFont
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * 1.2
                            verticalAlignment: Qt.AlignVCenter
                            elide: Text.ElideRight
                        }
                        Item{Layout.fillHeight: true}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            text: (bookFileType==="Document Book")?Icons.file_document_box:Icons.headphones
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
                            text: Functions.numberWithCommas("10000") + " تومان"
                            font.family: setting.activeNumFont
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
