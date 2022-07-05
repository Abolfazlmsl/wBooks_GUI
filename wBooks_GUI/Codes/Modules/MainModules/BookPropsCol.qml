import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Styles 1.4

Rectangle{

    property alias text1: txt2.text
    property alias text2: txt3.text
    property alias text3: txt4.text

    color: "transparent"
    Label{
        id: txt2
        width: parent.width
        height: parent.height / 3
        text: "تعداد صفحات"
        font.family: iranSans.name
        font.bold: true
        color: color9
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }

    Label{
        id: txt3
        width: parent.width
        height: parent.height / 3
        anchors.top: txt2.bottom
        text: "224"
        font.family: iranSansFAnum.name
        font.bold: true
        color: color4
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }

    Label{
        id: txt4
        width: parent.width
        height: parent.height / 3
        anchors.top: txt3.bottom
        text: ""
        font.family: iranSans.name
        font.bold: true
        color: color9
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
    }
}
