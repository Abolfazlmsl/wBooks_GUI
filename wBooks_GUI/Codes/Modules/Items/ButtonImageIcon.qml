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
    property bool flip: false
    property int iconRotation: 0
    property int iconSize: 20

    property bool tooltipEnable: false
    property string tooltipText: ""

    signal btnClicked()

    ToolTip.text: tooltipText
    ToolTip.visible: (area.containsMouse && tooltipEnable)

    RowLayout{
        anchors.fill: parent
        spacing: 0
        layoutDirection: (direction === "Right_Left") ? Qt.RightToLeft : Qt.LeftToRight
        Item{Layout.fillWidth: true}

        Rectangle{
            Layout.preferredWidth: iconSize
            Layout.fillHeight: true
            rotation: iconRotation
            color: "transparent"
            Image{
                id: iconTxt
                anchors.fill: parent
                source: ""
                mipmap: true
                fillMode: Image.PreserveAspectFit
//                transform: Matrix4x4 {
//                      matrix: (flip)?Qt.matrix4x4( -1, 0, 0, iconTxt.width, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1):""
//                    }
                mirror: flip
                visible: false
            }
            ColorOverlay {
                anchors.fill: iconTxt
                source: iconTxt
                color: iconColor
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
                font.family: setting.activeNumFont
                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * textSize //* widthRatio
                font.bold: true

                color: textColor
            }
        }

        Item{Layout.fillWidth: true}
    }
    MouseArea{
        id: area
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            btnClicked()
        }
    }
}
