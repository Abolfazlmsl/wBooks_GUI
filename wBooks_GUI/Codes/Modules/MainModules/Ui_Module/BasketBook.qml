import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

Rectangle{
    property string bookFileType: "Document Book"
    property string bookDescription: ""

    color: "transparent"
    width: parent.width
    height: 140
    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: Qt.RightToLeft

        Image{
            id: image
            Layout.preferredWidth: 100
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
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        layoutDirection: Qt.RightToLeft
                        Label{
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "کتاب اثر مرکب"
                            font.family: setting.activeNumFont
                            font.bold: true
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            LayoutMirroring.enabled: true
                        }

                        Item{Layout.preferredWidth: 20}

                        Label{
                            Layout.fillWidth: true
                            Layout.preferredHeight: 40
                            text: (bookFileType==="Document Book")?Icons.file_document_box:Icons.headphones
                            font.family: webfont.name
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.5
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignLeft
                            LayoutMirroring.enabled: true
                            elide: Text.ElideRight
                        }

                        Item{Layout.fillWidth: true}

                        Label{
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: Functions.numberWithCommas("10000") + " تومان"
                            font.family: setting.activeNumFont
                            font.bold: true
                            color: "#d43460"
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            LayoutMirroring.enabled: true
                        }

                        Item{Layout.preferredWidth: 10}

                        Label{
                            Layout.preferredWidth: 60
                            Layout.preferredHeight: 60
                            text: Icons.close_octagon_outline
                            font.family: webfont.name
                            color: color4
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.5
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    basketModel.remove(index)
                                }
                            }
                        }

                        Item{Layout.preferredWidth: 10}
                    }
                }
                Item{Layout.preferredHeight: 10}
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: contentHeight
                    text: "نویسنده: دارن هاردی"
                    font.family: setting.activeNumFont
                    color: "#646464"
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    LayoutMirroring.enabled: true
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: contentHeight
                    text: "مترجم: لطیف احمدپور"
                    font.family: setting.activeNumFont
                    color: "#646464"
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    LayoutMirroring.enabled: true
                }
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: contentHeight
                    text: "ناشر: انتشارات نگاه نوین"
                    font.family: setting.activeNumFont
                    color: "#646464"
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                    LayoutMirroring.enabled: true
                }
                Item{Layout.preferredHeight: 10}
                Label{
                    Layout.fillWidth: true
                    Layout.preferredHeight: contentHeight
                    text: bookDescription
                    font.family: setting.activeNumFont
                    color: color4
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    verticalAlignment: Qt.AlignVCenter
                    wrapMode: Text.WordWrap
                }
                Item{Layout.fillHeight: true}
            }
        }
    }
}
