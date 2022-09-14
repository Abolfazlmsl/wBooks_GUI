import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Ui_Module"

Rectangle{

//    property alias specialBooksModel: specialBooks.itemModel
//    property alias writersModel: writers.itemModel
//    property alias prepurchaseModel: prepurchase.itemModel

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
            model: serialModel
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
    }

//    Flickable{
//        anchors.fill: parent
//        contentHeight: homeItem.height
//        contentWidth: parent.width
//        boundsBehavior: Flickable.StopAtBounds
//        ScrollBar.vertical: ScrollBar {}

//        Item{
//            id: homeItem
//            implicitHeight: childrenRect.height
//            implicitWidth: parent.width
//            ColumnLayout{
//                width: parent.width
//                spacing: 0

//                TopSlider{
//                    id: special_cat
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 400
//                }

//                Advertisement{
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 220
//                    Layout.topMargin: 50
//                    source: "qrc:/Images/Adver3.jpg"
//                    selectable: true
//                    onBtnClicked: {
//                        print("clicked")
//                    }
//                }

//                SpecialOffer{
//                    id: specialBooks
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 400
//                    Layout.topMargin: 50
//                    Layout.leftMargin: parent.width * 0.05
//                    Layout.rightMargin: parent.width * 0.05
//                    title: "ویژه (پرفروش ها)"
//                    onMoreBtnClicked: {
//                        morebooks.itemModel = specialBooksModel
//                        morebooks.title = specialBooks.title
//                    }
//                }

//                Writers{
//                    id: writers
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 250
//                    Layout.topMargin: 50
//                    title: "نویسندگان و مترجمین برتر"
//                    onMoreBtnClicked: {
////                        morebooks.itemModel = writersModel
////                        morebooks.title = writers.title
//                    }
//                }

//                Prepurchase{
//                    id: prepurchase
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 450
//                    Layout.topMargin: 50
//                    Layout.leftMargin: parent.width * 0.05
//                    Layout.rightMargin: parent.width * 0.05
//                    title: "آنچه شما خواسته اید"
//                    onMoreBtnClicked: {
////                        morebooks.itemModel = prepurchaseModel
////                        morebooks.title = prepurchase.title
//                    }
//                }

//                Footer{
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 270
//                    Layout.topMargin: 50
//                }
//            }
//        }
//    }

    }
