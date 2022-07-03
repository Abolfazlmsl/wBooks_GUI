import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../Fonts/Icon.js" as Icons
import "./../../Utils/Enum.js" as Enum
import "./../../Utils/Utils.js" as Util

Rectangle{


    color: "transparent"
    Flickable{
        anchors.fill: parent
        contentHeight: homeItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}

        Item{
            id: homeItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0

                TopSlider{
                    id: special_cat
                    Layout.fillWidth: true
                    Layout.preferredHeight: 400
                }

                Advertisement{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 220
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    source: "qrc:/Images/Adver3.jpg"
                    selectable: true
                    onBtnClicked: {
                        print("clicked")
                    }
                }

                Footer{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 270
                    Layout.topMargin: 50
                }
            }
        }
    }
}
