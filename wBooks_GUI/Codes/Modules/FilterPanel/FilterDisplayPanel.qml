import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../../Fonts/Icon.js" as Icons

Item {
    id: panel
    property bool isShowAll: false
    property bool showAll: false
    property bool chevron: false
    property bool isChevron: false
    property alias title: lbl_title.text

    clip: true

    state: "Icon_1"

    states: [
        State {
            name: "Icon_1"
            PropertyChanges {
                target: lbl_lay1
                color: color5
            }
        },
        State {
            name: "Icon_2"
            PropertyChanges {
                target: lbl_lay2
                color: color5
            }
        },
        State {
            name: "Icon_3"
            PropertyChanges {
                target: lbl_lay3
                color: color5
            }
        }
    ]

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

        Item{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.5

            RowLayout{
                anchors.fill: parent
                spacing: 0
                layoutDirection: Qt.RightToLeft

                Label {
                    id: lbl_lay1
                    Layout.fillHeight: true
                    Layout.rightMargin: 20
                    text: Icons.page_layout_header
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color9
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            panel.state = "Icon_1"
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 5
                    Layout.fillHeight: true
                    color: "transparent"
                }

                Label {
                    id: lbl_lay2
                    Layout.fillHeight: true
                    text: Icons.page_layout_body
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color9
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            panel.state = "Icon_2"
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 5
                    Layout.fillHeight: true
                    color: "transparent"
                }

                Label {
                    id: lbl_lay3
                    Layout.fillHeight: true
                    text: Icons.page_layout_footer
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color9

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            panel.state = "Icon_3"
                        }
                    }
                }

                Item{Layout.fillWidth: true}

            }
        }
    }
}

