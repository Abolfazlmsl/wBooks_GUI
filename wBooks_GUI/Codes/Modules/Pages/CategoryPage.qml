import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtMultimedia 5.9

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Player"
import "./../MainModules/Ui_Module"

Item {

    property alias bestCollectionModel: best_collect.itemModel
    property alias bestSellModel: best_sell.itemModel
    property alias newBooksModel: new_books.itemModel

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
                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    Layout.rightMargin: 100
                    Layout.topMargin: 50
                    Label{
                        anchors.fill: parent
                        text: "داستان و رمان"
                        font.family: setting.activeFont
                        color: color5
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                        verticalAlignment: Qt.AlignVCenter
                        elide: Text.ElideRight
                    }
                }

                BooksList{
                    id: best_sell
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "بیشترین فروش ها"
                    fileType: "Document"

                    onMoreBtnClicked: {
//                        morebooks.itemModel = offerBooksModel
//                        morebooks.title = offer_books.title
                    }
                }

                BooksList{
                    id: new_books
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "نسخه های داغ جدید"
                    fileType: "Document"

                    onMoreBtnClicked: {
//                        morebooks.itemModel = offerBooksModel
//                        morebooks.title = offer_books.title
                    }
                }

                BestCollection{
                    id: best_collect
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "مجموعه های برتر"
                }

                Item{Layout.preferredHeight: 50}
            }
        }
    }
}
