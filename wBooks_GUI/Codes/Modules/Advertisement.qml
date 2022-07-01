import QtQuick 2.0

Item {
    property alias source: image.source
    property bool selectable: true

    signal btnClicked()

    Rectangle{
        id: iconRec
        width: parent.width
        height: 220
        color: "#211D1D"
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
