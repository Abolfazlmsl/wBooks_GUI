import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

import "./../MainModules/Ui_Module"

Rectangle {

//    property alias newBooksModel: newBooks.itemModel
//    property alias mostSellModel: mostSell.itemModel
//    property alias speakerModel: speaker.itemModel

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
            model: audioModel
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
                    }else if (model.type === "AudioBooksList"){
                        return audiobookListCom
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

//                Advertisement{
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 300
//                    Layout.topMargin: 50
//                    source: "qrc:/Images/Adver4.jpg"
//                    selectable: true
//                    onBtnClicked: {

//                    }
//                }

//                BooksList{
//                    id: newBooks
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 400
//                    Layout.topMargin: 50
//                    title: "تازه های صوتی"
//                    fileType: "Audio"

//                    onMoreBtnClicked: {

//                    }
//                }

//                BooksList{
//                    id: mostSell
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 400
//                    Layout.topMargin: 50
//                    title: "پرفروش ترین ها"
//                    fileType: "Audio"

//                    onMoreBtnClicked: {

//                    }
//                }

//                Advertisement{
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 220
//                    Layout.topMargin: 50
//                    source: "qrc:/Images/Adver5.jpg"
//                    selectable: true
//                    onBtnClicked: {

//                    }
//                }

//                BooksList{
//                    id: speaker
//                    Layout.fillWidth: true
//                    Layout.preferredHeight: 400
//                    Layout.topMargin: 50
//                    title: "با صدای عادل فردوسی پور"
//                    fileType: "Audio"

//                    onMoreBtnClicked: {

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
