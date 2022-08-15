import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Ui_Module"

Rectangle{

    property alias specialCatModel: special_cat.itemModel
    property alias bestCatModel: best_cat.itemModel
    property alias bestCollectionModel: best_collect.itemModel
    property alias offerBooksModel: offer_books.itemModel

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

                SpecialCategory{
                    id: special_cat
                    Layout.fillWidth: true
                    Layout.preferredHeight: 400
                    Layout.topMargin: 50
//                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "دسته بندی های ویژه"
                }

                BestCategory{
                    id: best_cat
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "برترین کتاب های ماه"
                    onMoreBtnClicked: {
                        morebooks.itemModel = bestCatModel
                        morebooks.title = best_cat.title
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

                BooksList{
                    id: offer_books
                    Layout.fillWidth: true
                    Layout.preferredHeight: 300
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    title: "پیشنهادی برای شما"
                    fileType: "Document"

                    onMoreBtnClicked: {
//                        morebooks.itemModel = offerBooksModel
//                        morebooks.title = offer_books.title
                    }
                }

                Advertisement{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 220
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    source: "qrc:/Images/Adver1.jpg"
                    selectable: true
                    onBtnClicked: {

                    }
                }

                Advertisement{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 220
                    Layout.topMargin: 50
                    Layout.leftMargin: parent.width * 0.05
                    Layout.rightMargin: parent.width * 0.05
                    source: "qrc:/Images/Adver2.jpg"
                    selectable: false
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
