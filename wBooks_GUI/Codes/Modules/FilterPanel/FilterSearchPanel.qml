import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../Items"

import "./../../../Fonts/Icon.js" as Icons

Item {
    id: panel
    property alias title: lbl_title.text
    property alias icon: input_text.icon
    property alias label: input_text.label
    property alias iconColor: input_text.iconColor
    property alias placeholder: input_text.placeholder
    property alias borderColor: input_text.borderColor
    property alias bgColor: input_text.bgColor
    property alias itemRadius: input_text.itemRadius

    signal acceptedLogin()

    property int selectStart
    property int selectEnd
    property int curPos

    clip: true

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.5

            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft

                Label {
                    id: lbl_title
                    Layout.fillHeight: true
                    Layout.rightMargin: 20
                    text: "تیتر اصلی"
                    font.family: setting.activeFont
                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                    font.bold: true
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: "#a2a2a2"
                }

                Item{Layout.fillWidth: true}

            }
        }

        //-- Email --//
        M_inputText{
            id: input_text
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.4
            Layout.leftMargin: 15
            Layout.rightMargin: 15
            placeholderSize: 1.2
            fontSize: 1.2
            label: "جستجو در ناشران"
            icon: Icons.magnify
            placeholder: "جستجو در ناشران"
            Keys.onTabPressed: {

            }
        }

        Item{Layout.fillHeight: true}

    }
}

