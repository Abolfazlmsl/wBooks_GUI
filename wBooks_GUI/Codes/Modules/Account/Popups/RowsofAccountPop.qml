import QtQuick 2.15
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12

Rectangle {
    color: "transparent"
    property alias icon: iconLabel.text
    property alias text: maintxt.text
    property alias counter: recCount.visible
    property alias recText: rectxt.text

    signal showClick()

    Row{
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        RowLayout{
            width: parent.width * 0.8
            height: parent.height
            layoutDirection: Qt.RightToLeft
            Label{
                id: iconLabel
                Layout.preferredWidth: 30
                Layout.fillHeight: true

                text: ""
                color: "#ffffff"

                font.family: webfont.name
                font.pixelSize: Qt.application.font.pixelSize * 1.5

                verticalAlignment: Qt.AlignVCenter
            }
            Label{
                id: maintxt
                Layout.preferredWidth: contentWidth
                Layout.fillHeight: true
                text: setting.userName
                font.family: mainFont.name
                color: "#ffffff"

                font.pixelSize: Qt.application.font.pixelSize * 1.3
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

            }

            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            Rectangle{
                id: recCount
                Layout.preferredWidth: 20
                Layout.preferredHeight: width
                radius: width/2
                color: "#ffffff"
                visible: false

                Label{
                    id: rectxt
                    anchors.fill: parent
                    color: color16
                    text: ""
                    font.family: mainFaNumFont.name
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
            Item{
                Layout.fillHeight: true
                Layout.preferredWidth: 5
            }

        }

        RowLayout{
            width: parent.width * 0.2
            height: parent.height
            layoutDirection: Qt.RightToLeft

            Rectangle{
                Layout.preferredWidth: 40
                Layout.fillHeight: true
                color: "transparent"

                Label{
                    id: txt1
                    width: parent.width
                    height: parent.height * 0.9
                    color: "#ffffff"
                    text: "مشاهده"
                    font.family: mainFont.name
                    verticalAlignment: Qt.AlignVCenter
                }
                Rectangle{
                    id: txt2
                    width: parent.width
                    height: 1
                    anchors.top: txt1.bottom
                    color: "#ffffff"
                }

                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        showClick()
                    }
                }
            }

            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

        }

    }
}
