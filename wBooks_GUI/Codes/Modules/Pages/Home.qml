import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Ui_Module"

Rectangle{

    //    property alias specialCatModel: special_cat.itemModel
//    property alias bestCatModel: best_cat.itemModel
//    property alias bestCollectionModel: best_collect.itemModel
//    property alias offerBooksModel: offer_books.itemModel

    color: "transparent"


    ColumnLayout{
        anchors.fill: parent
        spacing: 0
        BodyHeader{
            id: homeHeader
            Layout.fillWidth: true
            Layout.preferredHeight: 52
            topFilterVis: false
            listHeaderVis: true
            onItemClicked: {
                lview.positionViewAtIndex(pos, ListView.Beginning)
            }
        }

        ListView{
            id: lview
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            boundsBehavior: Flickable.StopAtBounds
            ScrollBar.vertical: ScrollBar {}
            model: homeModel
            cacheBuffer: 10000
            spacing: 30
            delegate: Loader{
                property string modelTitle: model.title
                property string modelFileType: model.fileType
                property string modelSource: model.source
                property bool modelSelectable: model.canSelect

                width: lview.width

                sourceComponent: {
                    if(model.type === "SpecialCategory"){
                        return specialCategoryCom
                    }else if (model.type === "BestCategory"){
                        return bestCategoryCom
                    }else if (model.type === "BooksList"){
                        return bookListCom
                    }else if (model.type === "BestCollection"){
                        return bestCollectionCom
                    }else if (model.type === "Writers"){
                        return writersCom
                    }else if (model.type === "SpecialOffer"){
                        return specialofferCom
                    }else if (model.type === "Prepurchase"){
                        return prepurchaseCom
                    }else if (model.type === "TopSlider"){
                        return topsliderCom
                    }else if (model.type === "Advertisement"){
                        return advertisementCom
                    }else if (model.type === "Footer"){
                        return footerCom
                    }
                }
            }
            onContentYChanged: {
                var idx = lview.indexAt(contentX, contentY)
                if (idx >= 0){
                    homeHeader.indexChanged(idx)
                }
            }
        }

//        Flickable{
//            id: flick
//            Layout.fillWidth: true
//            Layout.fillHeight: true
//            contentHeight: homeItem.height
//            contentWidth: parent.width
//            clip: true
//            boundsBehavior: Flickable.StopAtBounds
//            ScrollBar.vertical: ScrollBar {}

//            Item{
//                id: homeItem
//                implicitHeight: childrenRect.height
//                implicitWidth: parent.width
//                ColumnLayout{
//                    width: parent.width
//                    spacing: 0

//                    SpecialCategory{
//                        id: special_cat
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 400
//                        Layout.topMargin: 50
//                        //                    Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "دسته بندی های ویژه"
//                    }

//                    BestCategory{
//                        id: best_cat
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 400
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "برترین کتاب های ماه"
//                        onMoreBtnClicked: {
//                            morebooks.itemModel = bestCatModel
//                            morebooks.title = best_cat.title
//                        }
//                    }

//                    BestCollection{
//                        id: best_collect
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 300
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "مجموعه های برتر"
//                    }

//                    BooksList{
//                        id: offer_books
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 400
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "پیشنهادی برای شما"
//                        fileType: "Document"

//                        onMoreBtnClicked: {
//                            //                        morebooks.itemModel = offerBooksModel
//                            //                        morebooks.title = offer_books.title
//                        }
//                    }

//                    Writers{
//                        id: writers
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 250
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "نویسندگان محبوب"
//                        itemModel: writersModel
//                        onMoreBtnClicked: {
//                            //                        morebooks.itemModel = writersModel
//                            //                        morebooks.title = writers.title
//                        }
//                    }

//                    Writers{
//                        id: speakers
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 250
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "صداهای محبوب"
//                        itemModel: writersModel
//                        onMoreBtnClicked: {
//                            //                        morebooks.itemModel = writersModel
//                            //                        morebooks.title = writers.title
//                        }
//                    }

//                    Advertisement{
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 220
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        source: "qrc:/Images/Adver1.jpg"
//                        selectable: true
//                        onBtnClicked: {

//                        }
//                    }

//                    Advertisement{
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 220
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        source: "qrc:/Images/Adver2.jpg"
//                        selectable: false
//                    }

//                    BooksList{
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 400
//                        Layout.topMargin: 50
//                        Layout.leftMargin: parent.width * 0.05
//                        Layout.rightMargin: parent.width * 0.05
//                        title: "تازه های نشر ققنوس"
//                        itemModel: offerBooksModel
//                        fileType: "Document"

//                        onMoreBtnClicked: {
//                            //                        morebooks.itemModel = offerBooksModel
//                            //                        morebooks.title = offer_books.title
//                        }
//                    }

//                    Footer{
//                        Layout.fillWidth: true
//                        Layout.preferredHeight: 270
//                        Layout.topMargin: 50
//                    }
//                }
//            }
//        }

    }
}
