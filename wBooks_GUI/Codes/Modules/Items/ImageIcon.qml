import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle{

    property alias imgSource: image.source
    property string imgColor: color4
    property bool imgFlip: false

    color: "transparent"
    Image{
        id: image
        anchors.fill: parent
        source: ""
        mipmap: true
        fillMode: Image.PreserveAspectFit
        transform: Matrix4x4 {
              matrix: (imgFlip)?Qt.matrix4x4( -1, 0, 0, image.width, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1):""
            }
        ColorOverlay {
            anchors.fill: image
            source: image
            color: imgColor
        }
    }
}
