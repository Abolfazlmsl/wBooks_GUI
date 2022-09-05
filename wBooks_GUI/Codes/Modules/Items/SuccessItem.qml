import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../Fonts/Icon.js" as Icons
import "./../../../REST/apiService.js" as Service

Item{
    property double rightMargin: 0
    property double leftMargin: 0

    property alias text: txt.text
    property alias text2: txt2.text

    signal lblClicked()

    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        Item{Layout.fillHeight: true}

        Rectangle{
            Layout.fillWidth: true
            Layout.preferredHeight: 120
            Layout.rightMargin: rightMargin
            Layout.leftMargin: leftMargin
            color: "#e2e2e2"
            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft

                Item{Layout.fillWidth: true}

                Label{
                    id: txt
                    Layout.fillHeight: true
                    Layout.preferredWidth: contentWidth
                    text: "عنوان"
                    font.family: setting.activeNumFont
                    font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                    font.bold: true
                    verticalAlignment: Qt.AlignVCenter

                    color: "#000000"
                }

                Item{Layout.preferredWidth: 20}

                Label{
                    id: txt2
                    Layout.fillHeight: true
                    Layout.preferredWidth: contentWidth
                    text: "عنوان"
                    font.family: setting.activeNumFont
                    font.pixelSize: Qt.application.font.pixelSize * 1.5 * ratio //* widthRatio
                    verticalAlignment: Qt.AlignVCenter
                    color: "#d43460"
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            lblClicked()
                        }
                    }
                }

                Item{Layout.fillWidth: true}
            }
        }

        Item{Layout.fillHeight: true}
    }
}



