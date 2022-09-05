import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

import "./../../Items"

Item {
    id: topSliderItem
    property alias source: image.source
    property int rate: 30
    property string rightText: ""
    property string leftText: ""
    property int factor: 12
    property bool itemVisible: true
    property alias position: topSliderItem.state // "Right", "Left", "Center", "None"

    state: "Right"
    states: [
        State{
            name: "Right"
            PropertyChanges {
                target: topSliderItem
                factor: 12
            }
        },
        State{
            name: "Left"
            PropertyChanges {
                target: topSliderItem
                factor: 1
            }
        },
        State{
            name: "Center"
            PropertyChanges {
                target: topSliderItem
                factor: 7
            }
        },
        State{
            name: "None"
            PropertyChanges {
                target: topSliderItem
                factor: factor
            }
        }
    ]

    Rectangle{
        id: iconRec
        anchors.fill: parent

        color: "transparent"
        Image {
            id: image
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 8
            source: source
//            fillMode: Image.PreserveAspectFit

            ColumnLayout{
                width: parent.width * 0.3
                height: parent.height * 0.2
                clip: true
                visible: itemVisible
                x: factor * parent.width / 20
                y: 9 * parent.height / 14

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.4
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.3
                            color: "transparent"
                            Rating{
                                anchors.fill: parent
//                                anchors.right: parent.right

                                selectable: true

                            }
                        }

                        Rectangle{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.2
                            color: "transparent"
                            Label{
                                anchors.fill: parent
                                text: "(" + rate + " رای)"
                                font.family: setting.activeNumFont
                                color: color9
                                verticalAlignment: Qt.AlignVCenter
                                font.pixelSize: Qt.application.font.pixelSize * 0.9
                                elide: Text.ElideRight
                            }
                        }

                        Item{
                            Layout.fillWidth: true
                        }
                    }
                }
                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        spacing: 10

                        ButtonShadow{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.45
                            btnText: rightText
                            textColor: "#ffffff"
                            fontSize: 1
                            btnRadius: 0
                            btnColor: color2
                            onDashboard_btnClicked: {

                            }
                        }

                        ButtonShadow{
                            Layout.fillHeight: true
                            Layout.preferredWidth: parent.width * 0.45
                            btnText: leftText
                            textColor: color2
                            fontSize: 1
                            btnRadius: 0
                            btnColor: "#ffffff"
                            onDashboard_btnClicked: {

                            }
                        }
                    }
                }
            }
        }
    }
}
