import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Ui_Module"

Rectangle {

    property alias newBooksModel: newBooks.itemModel
    property alias mostSellModel: mostSell.itemModel
    property alias speakerModel: speaker.itemModel

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

                Advertisement{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    source: "qrc:/Images/Adver4.jpg"
                    selectable: true
                    onBtnClicked: {

                    }
                }

                BooksList{
                    id: newBooks
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "تازه های صوتی"
                    fileType: "Audio"

                    onMoreBtnClicked: {

                    }
                }

                BooksList{
                    id: mostSell
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "پرفروش ترین ها"
                    fileType: "Audio"

                    onMoreBtnClicked: {

                    }
                }

                Advertisement{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 220
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    source: "qrc:/Images/Adver5.jpg"
                    selectable: true
                    onBtnClicked: {

                    }
                }

                BooksList{
                    id: speaker
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "با صدای عادل فردوسی پور"
                    fileType: "Audio"

                    onMoreBtnClicked: {

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
