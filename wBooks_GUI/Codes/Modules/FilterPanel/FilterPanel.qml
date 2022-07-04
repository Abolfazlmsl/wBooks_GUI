import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

Item {

    property bool isShowAll: false
    property bool showAll: false
    property bool chevron: false
    property bool isChevron: false
    property alias title: lbl_title.text
    property alias lModel: lview.model

    clip: true

    ColumnLayout{
        anchors.fill: parent
        spacing: 0

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.15

            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft

                Label {
                    id: lbl_title
                    Layout.fillHeight: true
                    Layout.rightMargin: 20
                    text: "تیتر اصلی"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize * 1.3
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color4
                }

                Rectangle {
                    Layout.preferredWidth: (showAll) ? parent.width - lbl_title.width
                                                       - lbl_show.width - 45  : parent.width
                                                       - lbl_title.width - 45
                    Layout.fillHeight: true
                    color: "transparent"
                }

                Label {
                    id: lbl_show
                    visible: showAll
                    Layout.fillHeight: true
                    text: (isShowAll) ? "نمایش کمتر" : "نمایش همه"
                    font.family: iranSans.name
                    font.pixelSize: Qt.application.font.pixelSize
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color9
                }

                Rectangle {
                    Layout.preferredWidth: 2
                    Layout.fillHeight: true
                    color: "transparent"
                }

                Label {
                    Layout.fillHeight: true
                    visible: chevron
                    text: (isChevron) ? Icons.chevron_up : Icons.chevron_down
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 1.6
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color9
                }

                Item{Layout.fillWidth: true}

            }
        }

        ListView{
            id: lview
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.85
            clip: true
            spacing: 0
            interactive: false

            delegate: RadioButton{
                id: control
                width: parent.width
                height: 30
                anchors.right: parent.right
                rightPadding: 15
                scale: 0.7
                checked: (model.index === 0)
                text: model.text

                onClicked: {
                    control.checked = true
                }

                indicator: Rectangle {
                    anchors.left: parent.right
                    implicitWidth: 20
                    implicitHeight: 20
                    y: parent.height / 2
                    radius: 10
                    color: "#ffffff"
                    border.color: color1

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        radius: width/2
                        color: "transparent"
                        border.color: color5
                        border.width: 3
                        visible: control.checked
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            control.checked = true
                        }
                    }
                }

                contentItem: Label {
                    text: control.text
                    font.family: iranSansFAnum.name
                    font.bold: true
                    font.pixelSize: Qt.application.font.pixelSize * 1.6
                    color: color9

                }

            }
        }

    }
}

