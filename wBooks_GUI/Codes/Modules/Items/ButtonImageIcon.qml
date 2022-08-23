import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle{
    id: btnIcon

    property alias icon: iconTxt.source
    property string iconColor: "#ffffff"
    property alias text: btnTxt.text
    property string textColor: "#ffffff"
    property double textSize: 1
    property string direction: "Right_Left" //"Left_Right"

    signal btnClicked()

    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: (direction === "Right_Left") ? Qt.RightToLeft : Qt.LeftToRight
        Item{Layout.fillWidth: true}

        Rectangle{
            Layout.preferredWidth: 20
            Layout.fillHeight: true
            color: "transparent"
            Image{
                id: iconTxt
                anchors.fill: parent
                source: ""
                mipmap: true
                fillMode: Image.PreserveAspectFit
                ColorOverlay {
                    anchors.fill: iconTxt
                    source: iconTxt
                    color: iconColor
                }
            }
        }

        Item{Layout.preferredWidth: 10}

        Rectangle{
            Layout.preferredWidth: btnTxt.contentWidth
            Layout.fillHeight: true
            color: "transparent"
            Label{
                id: btnTxt
                anchors.centerIn: parent
                text: ""
                font.family: mainFaNumFont.name
                font.pixelSize: Qt.application.font.pixelSize * textSize //* widthRatio
                font.bold: true

                color: textColor
            }
        }

        Item{Layout.fillWidth: true}
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            btnClicked()
        }
    }
}
