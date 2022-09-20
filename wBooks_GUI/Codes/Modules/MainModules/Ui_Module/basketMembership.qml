import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

Rectangle{
    color: "transparent"
    width: parent.width
    height: 140
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
                font.family: setting.activeNumFont
                color: color4
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                LayoutMirroring.enabled: true
            }
        }

        Item{Layout.fillWidth: true}

        Label{
            Layout.preferredWidth: contentWidth
            Layout.fillHeight: true
            text: Functions.numberWithCommas("15000") + " تومان"
            font.family: setting.activeNumFont
            font.bold: true
            color: "#d43460"
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Qt.AlignHCenter
        }

        Item{Layout.preferredWidth: 10}

        Label{
            Layout.preferredWidth: contentWidth
            Layout.fillHeight: true
            text: Icons.close_octagon_outline
            font.family: webfont.name
            color: color4
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2.5
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

        Item{Layout.preferredWidth: 10}
    }
}
