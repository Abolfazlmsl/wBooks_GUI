import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Rectangle{

    property alias imgSource: image.source
    property string imgColor: color4

    color: "transparent"
    Image{
        id: image
        anchors.fill: parent
        source: ""
        mipmap: true
        fillMode: Image.PreserveAspectFit
        ColorOverlay {
            anchors.fill: image
            source: image
            color: imgColor
        }
    }
}
