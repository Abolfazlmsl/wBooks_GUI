import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

//-- Left Menu --//
Dialog{
    id: leftMenu

    padding: 0
    topPadding: 0

    modal: true

    signal accept()
    signal cancel()

    width: parent.width - (40 * ratio)
    height: 450 * ratio

    background: Rectangle{
        radius: 5 * ratio
        color: "#444444"
    }

    //-- Header (Title) --//
    header: Rectangle{
        width: parent.width
        height: 80 * ratio
        radius: 5 * ratio
        color: "transparent"
        Label{
            anchors.fill: parent
            color: "#d43460"
            text: "فهرست منابع"
            font.family: setting.activeNumFont
            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2 //* widthRatio
            font.bold: true
            anchors.leftMargin: 10
            verticalAlignment: Qt.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            LayoutMirroring.enabled: true
        }
        Rectangle{
            width: parent.width
            height: 2
            color: "#d43460"
            anchors.bottom: parent.bottom
        }
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true

        TreeView {
            id: delegateTreeView

            anchors.fill: parent
            clip: true
            anchors.margins: 1

            model: contentModel
            selectionEnabled: true
            hoverEnabled: true

            color: "white"
            handleColor: "white"
            hoverColor: "skyblue"
            selectedColor: "cornflowerblue"
            selectedItemColor: "white"
            handleStyle: TreeView.Handle.Chevron
            rowHeight: 50
            rowPadding: 0
            rowSpacing: 0
            font.pixelSize: 12
        }

        onEntered: {
            epubArea.enabled = false
            mainArea.enabled = false
            cursorShape = Qt.PointingHandCursor
        }

        onExited: {
            epubArea.enabled = true
            mainArea.enabled = true
            cursorShape = Qt.ArrowCursor
        }
    }
}
