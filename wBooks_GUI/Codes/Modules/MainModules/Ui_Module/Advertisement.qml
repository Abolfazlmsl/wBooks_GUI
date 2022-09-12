import QtQuick 2.15

Item {
    property alias source: image.source
    property bool selectable: true

    signal btnClicked()

    Rectangle{
        id: iconRec
        anchors.fill: parent
        anchors.rightMargin: parent.width * 0.05
        anchors.leftMargin: parent.width * 0.05
        color: color8
        Image {
            id: image
            anchors.fill: parent
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 8
            source: source
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: (selectable)? Qt.PointingHandCursor:Qt.ArrowCursor
            onClicked: {
               if (selectable){
                    btnClicked()
               }
            }
        }
    }

}
