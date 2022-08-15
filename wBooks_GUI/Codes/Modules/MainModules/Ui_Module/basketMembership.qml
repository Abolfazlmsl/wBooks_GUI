import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../../Fonts/Icon.js" as Icons

Rectangle{
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
                    source: "qrc:/Images/bronze-medal.png"
                    mipmap: true
                }

                Item{Layout.preferredWidth: 30}

                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Label{
                        anchors.fill: parent
                        text: "اشتراک ویژه 15 روزه"
                        font.family: mainFaNumFont.name
                        color: color4
                        font.pixelSize: Qt.application.font.pixelSize * 1.5
                        verticalAlignment: Qt.AlignVCenter
                        elide: Text.ElideRight
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
                            text: "15000 تومان"
                            font.family: mainFaNumFont.name
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
