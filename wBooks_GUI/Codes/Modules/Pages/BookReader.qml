import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Qt.labs.platform 1.1
import Qt.labs.settings 1.1
import QtGraphicalEffects 1.0

import com.EpubWidget 1.0
import org.pdfviewer.poppler 1.0

import "./../../Modules/MainModules/DownloadManager"
import "./../../Modules/MainModules/TreeModule"
import "./../../Modules/Items"

import "./../../../Fonts/Icon.js" as Icons

Item {
    property int ratio: 1
    property bool contentEnable: false
    property bool fileUploaded: false
    property int pagesNumber: 1
    property int thisPageNumber: 1
    property int blocksNumber: 1
    property int sliderTotalHeight: 1
    property var contentModel
    property int content_panel_width: 500

    signal changeReaderTheme(var mode)

    Component.onCompleted: {
        if (visible){
            epub.setSetting(setting.font, setting.fontSize, setting.themeState)
            if (setting.cPath !== ""){
                if (setting.isEpubViewer) {
//                    var result = epub.loadFile(setting.cPath)
//                    if (result){
//                        fileUploaded = true
//                        browseText.text = setting.openFileName
//                        epubslider.value = setting.sliderValue
//                        mainStack.currentIndex = 1
//                    }
                }else{
                    mainStack.currentIndex = 2
                }
            }
        }
    }

    onChangeReaderTheme: {
        epub.changeTheme(mode)
    }

    function showWinFullScreen() {
        mainHeader.visible = false
        mainFooter.visible = false
        win.showFullScreen()
    }

    function showWinMaximized() {
        mainHeader.visible = true
        mainFooter.visible = true
        win.showMaximized()
    }

    MouseArea {
        id: mainArea
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        onClicked: {
            contentpanel.width = 0
            contentEnable = false
        }
    }

    //-- Home --//
    Rectangle{
        anchors.fill: parent
//        color: (setting.lightMode) ? "steelblue" : "#201918"
        color: color0
        ColumnLayout{
            anchors.fill: parent
            spacing: 0

            RowLayout{
                id: header
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.10
                Layout.margins: 5
                spacing: 10

                Label{
                    id: contentButton
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.05
                    rotation: 180
                    text: Icons.table_of_contents
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3

                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter

//                    color: (setting.lightMode) ? (contentEnable) ? "white":"black" : (contentEnable) ? "black":"white"
                    color: (contentEnable) ? color3:color4
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            contentEnable = !contentEnable
                            //                            contentpanel.visible = contentEnable
                            if (contentEnable){
                                contentpanel.width = content_panel_width*ratio
                            }else{
                                contentpanel.width = 0
                            }
                        }
                    }
                }

                Label{
                    id: downloadButton
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.05 / 2
                    text: Icons.download
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3

                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter

//                    color: (setting.lightMode) ? "black":"white"
                    color: color4
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            downloadpanel.visible = true
                        }
                    }
                }

                Item{Layout.preferredWidth: 10}

                Label{
                    id: fullscreenButton

                    property bool state: false
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.05 / 2
                    text: (fullscreenButton.state) ? Icons.arrow_collapse_all:Icons.arrow_expand_all
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3

                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter

//                    color: (setting.lightMode) ? "black":"white"
                    color: color4
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            fullscreenButton.state = !fullscreenButton.state
                            if (fullscreenButton.state){
                                showWinFullScreen()
                            }else{
                                showWinMaximized()
                            }
                        }
                    }
                }

                Item{Layout.preferredWidth: 10}

                M_inputText{
                    id: input_search
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    label: "جستجو بر اساس شماره صفحه"
                    icon: Icons.magnify
                    placeholder: "جستجو بر اساس شماره صفحه"

                    Keys.onEnterPressed: {
                        if (parseInt(input_search.inputText.text) > 0 && parseInt(input_search.inputText.text) <= pagesNumber){
                            epubslider.value = parseInt(input_search.inputText.text)
                        }
                    }
                }

                ComboBox{
                    id: fontButton
                    Layout.fillHeight: true
                    currentIndex: setting.fontCurrentIndex
                    enabled: fileUploaded
                    Layout.preferredWidth: parent.width * 0.13
                    clip: true
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2 * ratio
                    background: Rectangle {
                        color: color12
                    }
                    delegate: ItemDelegate {
                        id:itemDlgt
                        width: fontButton.width
                        height:40
                        padding:0

                        contentItem: Text {
                            id:textItem
                            text: model.text
                            color: itemDlgt.hovered?color1:color4
                            font.family: setting.activeFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2* ratio
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignLeft
                            rightPadding: 20
                        }

                        background: Rectangle {
                          color:itemDlgt.hovered?color4:color1;
                          anchors.left: itemDlgt.left
                          anchors.leftMargin: 0
                          width:itemDlgt.width
                        }

                      }

                    model: ListModel {
                        id: model
                        ListElement { text: "Times New Roman" }
                        ListElement { text: "Calibri" }
                        ListElement { text: "Arial" }
                        ListElement { text: "Courier"}
                        ListElement { text: "Kalameh(FaNum)-Black"}
                        ListElement { text: "Kalameh(FaNum)-Bold"}
                        ListElement { text: "Kalameh(FaNum)-Regular"}
                        ListElement { text: "Kalameh(FaNum)-Thin"}
                        ListElement { text: "Kalameh-Black"}
                        ListElement { text: "Kalameh-Bold"}
                        ListElement { text: "Kalameh-Regular"}
                        ListElement { text: "Kalameh-Thin"}
                    }
                    onActivated: {
                        if (setting.font !== fontButton.currentText){
                            setting.font = fontButton.currentText
                            setting.fontCurrentIndex = fontButton.currentIndex
                            epub.setFont(fontButton.currentText, fontSizeButton.value)
                        }
                    }
                }

                SpinBox{
                    id: fontSizeButton
                    Layout.fillHeight: true
                    enabled: fileUploaded
                    scale: 1
                    Layout.preferredWidth: parent.width * 0.1
                    Layout.margins: 7
                    from: 1
                    to: 40
                    value: setting.fontSize
                    font.family: setting.activeNumFont
                    stepSize: 1


                    background: Rectangle{
                        radius: 5
                        color: color12
//                        color: (setting.lightMode) ? "transparent" : "#f7f7f7"
                    }

                    contentItem: Label{
                        text: fontSizeButton.displayText
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                        color: color4
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter

                    }

                    onValueModified: {
                        setting.fontSize = fontSizeButton.value
                        epub.setFont(fontButton.currentText, fontSizeButton.value)
                    }
                }

                Label{
                    id: imagesButton
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.05 / 2
                    text: Icons.view_sequential
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3

                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter

//                    color: (setting.lightMode) ? "black":"white"
                    color: color4
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            mainRow.isImagesOpen = !mainRow.isImagesOpen
                            if (fileUploaded){
                                if (!setting.isEpubViewer){
                                    if (mainRow.isImagesOpen){
                                        showImagesAnimpdf.restart()
                                    }else{
                                        hideImagesAnimpdf.restart()
                                    }
                                }else if (setting.isEpubViewer){
                                    if (mainRow.isImagesOpen){
                                        showImagesAnimepub.restart()
                                    }else{
                                        hideImagesAnimepub.restart()
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Row{
                id: mainRow
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.7
                Layout.leftMargin: 10
                Layout.rightMargin: 10
                clip: true

                // pdf small images Animation
                ParallelAnimation {
                    id: showImagesAnimpdf
                    NumberAnimation { target: mainStack; property: "width"; to: mainRow.width * 0.875; duration: 0 }
                    NumberAnimation { target: pdfview; property: "Layout.preferredWidth"; to: mainRow.width * 0.11; duration: 0 }
                }

                ParallelAnimation {
                    id: hideImagesAnimpdf
                    NumberAnimation { target: mainStack; property: "width"; to: mainRow.width; duration: 0 }
                    NumberAnimation { target: pdfview; property: "Layout.preferredWidth"; to: 0; duration: 0 }
                }

                // epub small images Animation
                ParallelAnimation {
                    id: showImagesAnimepub
                    NumberAnimation { target: mainStack; property: "width"; to: mainRow.width * 0.875; duration: 0 }
                    NumberAnimation { target: epubview; property: "Layout.preferredWidth"; to: mainRow.width * 0.11; duration: 0 }
                }

                ParallelAnimation {
                    id: hideImagesAnimepub
                    NumberAnimation { target: mainStack; property: "width"; to: mainRow.width; duration: 0 }
                    NumberAnimation { target: epubview; property: "Layout.preferredWidth"; to: 0; duration: 0 }
                }

                property bool isImagesOpen: false

                StackLayout {
                    id: mainStack
                    height: parent.height
                    currentIndex: 0
                    width: parent.width

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
//                        color: (setting.lightMode) ? "white":"black"
                        color: color1

                        Image{
                            id: image
                            anchors.centerIn: parent
                            sourceSize: Qt.size(50,50)
                            source: "qrc:/Images/Logo Footer2.png"
                            mipmap: true
                            fillMode: Image.PreserveAspectFit
                            visible: false
                        }
                        ColorOverlay {
                            anchors.fill: image
                            source: image
                            color: "#d43460"
                        }

                        Label{
                            anchors.top: image.bottom
                            width: parent.width
                            height: 50
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio *1.5
//                            color: (setting.lightMode) ? "black":"white"
                            color: color4
                            text: "کتابخوان وی بوکس"
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "white"
                        RowLayout{
                            anchors.fill: parent
                            spacing: 20

                            EpubWidget{
                                id: epub
                                clip: true
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width
                                onWidthChanged: {
                                    epub.resizeEvent()
                                }

                                onHeightChanged: {
                                    epub.resizeEvent()
                                }

                                onContentsChanged: {
                                    contentModel = contents
                                    epubslider.from = 1
                                    epubslider.value = 1
                                    epubslider.stepSize = 1
                                    setting.stepSize = epubslider.stepSize
                                    thisPageNumber = 1
                                }

                                onSliderHeightChanged: {

                                    //                        epubslider.to = sliderHeight
                                    sliderTotalHeight = sliderHeight
                                }

                                onPageHeightChanged: {
                                    setting.onepageHeight = pageHeight
                                }

                                onPageNumberChanged: {
                                    epubslider.to = pageNumber
                                    pagesNumber = pageNumber
                                }

                                onBlockNumberChanged: {
                                    blocksNumber = blockNumber
                                }

                                onCurrentPageNumberChanged: {
                                    epubslider.value = currentPageNumber
                                }

                                onPdfPathChanged: {
                                    if (epub.getEpubType() === 0){
                                        popplerepub.path = pdfPath
                                        for (var i=0; i<popplerepub.numPages;i++){
                                            var cPath = popplerepub.saveImages(epubModel.count+1, offlineStoragePath)
                                            epubModel.append({
                                                             "url": "file:///"+cPath
                                                             })
                                        }
                                    }else{
                                        popplerepub.path = pdfPath
                                        for (var j=0; j<popplerepub.numPages;j++){
                                            epubModel.append({
                                                             "url": "image://poppler/page/" + (j+1)
                                                             })
                                        }
                                    }
                                }

                                MouseArea{
                                    id: epubArea
                                    anchors.fill: parent
                                    propagateComposedEvents: true
                                    onWheel: {
                                        //                            epub.scroll(-wheel.angleDelta.y)
                                        //                                    epubslider.value = epubslider.value-wheel.angleDelta.y*setting.stepSize
                                        epub.scrollSlider(-wheel.angleDelta.y*setting.stepSize)
                                    }
                                }

                            }

                            ListModel{
                                id: epubModel
                            }

                            ListView{
                                id: epubview
                                Layout.fillHeight: true
                                Layout.preferredWidth: 0
//                                model: popplerepub.numPages
                                model: epubModel
                                clip: true
                                focus: true
                                ScrollBar.vertical: ScrollBar{}
                                spacing: 25

                                delegate: Column{
                                    id: image
                                    Image{
                                        width: epubview.width
                                        source: popplerepub.loaded? model.url:""
                                        sourceSize.width: width
                                        cache: false
                                        MouseArea{
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: {
                                                epubview.positionViewAtIndex(index, ListView.Center)
                                                epubslider.value = index+1
                                            }
                                        }
                                    }
                                    Label{
                                        width: epubview.width
                                        visible: mainRow.isImagesOpen
//                                        color: (setting.lightMode) ? "black":"white"
                                        color: color4
                                        text: index+1
                                        horizontalAlignment: Qt.AlignHCenter
                                    }
                                }
                            }
                        }
                    }

                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"

                        RowLayout{
                            anchors.fill: parent
                            spacing: 20

                            ListView{
                                id: pdf
                                property double stride: (pdf.contentHeight) / (poppler.numPages+1)
                                Layout.fillHeight: true
                                Layout.preferredWidth: parent.width
                                model: poppler.numPages
                                spacing: 25
                                clip: true
                                interactive: false
                                focus: true
                                delegate:
                                    Image{
                                    id: bigImage
                                    sourceSize.width: mainStack.width
                                    sourceSize.height: mainStack.height
                                    source: (poppler.loaded && pdfview.currentIndex >= 0)?  "image://poppler/page/"+(index+1): ""
                                }

//                                MouseArea {
//                                    anchors.fill: pdf
//                                    onWheel: {
//                                        pdf.flick(0, wheel.angleDelta.y * 5)
//                                        epubslider.value = pdf.contentY
//                                        if (pdf.indexAt(pdf.contentX, pdf.contentY) >= 0){
//                                            thisPageNumber = pdf.indexAt(pdf.contentX, pdf.contentY) + 1
//                                        }
//                                    }
//                                }

                                onContentHeightChanged: {
                                    epubslider.to = poppler.numPages
                                    epubslider.stepSize = epubslider.to / pdf.contentHeight
                                    setting.stepSize = epubslider.stepSize
                                }

                                MouseArea{
                                    anchors.fill: parent
                                    onWheel: {
                                        if (epubslider.value-(wheel.angleDelta.y)*epubslider.stepSize >=0
                                                && epubslider.value-(wheel.angleDelta.y)*epubslider.stepSize<=poppler.numPages){
                                            epubslider.value = epubslider.value-(wheel.angleDelta.y)*epubslider.stepSize
                                        }else if (epubslider.value-(wheel.angleDelta.y)*epubslider.stepSize <0){
                                            epubslider.value = 0
                                            pdf.positionViewAtBeginning()
                                        }else if (epubslider.value-(wheel.angleDelta.y)*epubslider.stepSize>poppler.numPages){
                                            epubslider.value = poppler.numPages
                                            pdf.positionViewAtEnd()
                                        }
                                    }
                                }
                            }


                            ListView{
                                id: pdfview
                                Layout.fillHeight: true
                                Layout.preferredWidth: 0
                                ScrollBar.vertical: ScrollBar{}
                                model: poppler.numPages
                                spacing: 25

                                delegate: Column{
                                    id: image2
                                    Image{
                                        width: pdfview.width
                                        source: poppler.loaded? "image://poppler/page/" + (index+1): ""
                                        sourceSize.width: width
                                        MouseArea{
                                            anchors.fill: parent
                                            cursorShape: Qt.PointingHandCursor
                                            onClicked: {

                                                epubslider.value = index+1
                                                pdf.positionViewAtIndex(index, ListView.Beginning)
                                                pdfview.positionViewAtIndex(index, ListView.Center)
                                                //                                    image.ListView.view.currentIndex = index
                                                //                                    image.ListView.view.focus = true
                                            }
                                        }
                                    }
                                    Label{
                                        width: pdfview.width
                                        visible: mainRow.isImagesOpen
//                                        color: (setting.lightMode) ? "black":"white"
                                        color: color4
                                        text: index+1
                                        horizontalAlignment: Qt.AlignHCenter
                                    }
                                }
                            }

                        }
                    }
                }

            }

            RowLayout{
                id: changepage
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.05
                Layout.topMargin: 4
                spacing: 50
                Item{Layout.fillWidth: true}

                Item{
                    Layout.preferredWidth: 20
                    Layout.fillHeight: true
                    Rectangle{
                        width: 30
                        height: width
                        radius: width/2
                        color: (previousPage.enabled) ? color12:color15
                        Label{
                            id: previousPage
                            anchors.fill: parent
                            enabled: (fileUploaded) ? (epubslider.value==1)? false:true : false
                            text: Icons.chevron_left
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter

                            color: "black"
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    epubslider.value = epubslider.value - 1
                                    //                                epub.previousPage()
                                }
                            }
                        }
                    }
                }

                Item{Layout.preferredWidth: 25}
                Item{
                    Layout.fillHeight: true
                    Layout.preferredWidth: 200

                    Rectangle{
                        anchors.fill: parent
                        anchors.topMargin: 5
                        border.width: 2
//                        border.color: setting.lightMode ? "#888":"black"
                        border.color: color1
                        radius: 10
//                        color: setting.lightMode ? "#808080":"black"
                        color: color1
                        clip: true
                        Label{
                            anchors.fill: parent
                            text: thisPageNumber + " از " + pagesNumber
//                            text: thisPageNumber + "/" + pagesNumber
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter

                            minimumPointSize: 10
                            font.family: setting.activeNumFont
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter

//                            color: setting.lightMode ? "black":"white"
                            color: color4
                            clip: true
                        }
                    }
                }

                Item{Layout.preferredWidth: 25}
                Item{
                    Layout.preferredWidth: 20
                    Layout.fillHeight: true
                    Rectangle{
                        width: 30
                        height: width
                        radius: width/2
                        color: (nextPage.enabled) ? color12:color15
                        Label{
                            id: nextPage
                            anchors.fill: parent
                            enabled: (fileUploaded) ? (epubslider.value==pagesNumber)?false:true : false
                            text: Icons.chevron_right
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3

                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter

                            color: "black"
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    epubslider.value = epubslider.value + 1
                                    //                                epub.nextPage()
                                }
                            }
                        }
                    }
                }

                Item{Layout.fillWidth: true}
            }

            Slider{
                id: epubslider
                enabled: fileUploaded
                clip: true
//                from: stepSize
//                value: stepSize
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.05
                Layout.topMargin: 20

                onValueChanged: {
                    if (setting.isEpubViewer){
                        setting.sliderValue = value
                        //                        epub.scrollSlider(value/setting.stepSize)
                        epub.specificPage(value)
                        //                        thisPageNumber = Math.ceil(value / setting.onepageHeight/setting.stepSize)
                        thisPageNumber = value
                        update()
                    }else{
                        setting.sliderValue = value

                        pdf.contentY = value * pdf.stride
                        if (value==from){
                            pdf.positionViewAtBeginning()
                        }else if (value==to){
                            pdf.positionViewAtEnd()
                        }

                        if (pdf.indexAt(pdf.contentX, pdf.contentY) >= 0){
                            thisPageNumber = pdf.indexAt(pdf.contentX, pdf.contentY) + 1
                        }
                    }
                }
            }

            RowLayout{
                id: browesLay
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.075
                Layout.margins: 5
                spacing: 10
                Button{
                    id: browseButton
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text: "جستجوی فایل"

//                    highlighted: setting.lightMode ? false:true

                    contentItem: Text {
                        text: browseButton.text
//                        font: browseButton.font
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: setting.activeFont
                    }

                    background: Rectangle {

                        border.width: browseButton.activeFocus ? 2 : 1
//                        border.color: setting.lightMode ? "#888":"black"
                        border.color: color12
                        radius: 4
//                        color: setting.lightMode ? "#808080":"black"
                        color: color12
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            fileDialog.open()
                        }
                    }
                }

                TextField{
                    id: browseText
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.85
                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.2
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    selectByMouse: true
                    readOnly: true
                    text: ""
//                    color: setting.lightMode ? "black":"white"
                    color: color4
                }
            }
        }

        FilePanel{
            id: contentpanel
            anchors.left: parent.left
            y: header.height + 10
            //            visible: false
            Behavior on width {
                NumberAnimation { duration: 300 }
            }

            clip: true
            width: 0
            height: epub.height

            color: "#444444"
        }
    }


    Poppler{
        id: poppler
    }

    Poppler{
        id: popplerepub
    }

    //-- File dialog --//
    FileDialog {
        id: fileDialog
        visible: false
        title: "Please choose a file"
        selectedNameFilter.index: 0
        nameFilters: ["Epub files (*.epub)", "Pdf files (*.pdf)"]

        onAccepted: {
            epub.setSetting(setting.font, setting.fontSize, setting.themeState)
            if (fileDialog.selectedNameFilter.name === "Epub files"){
                setting.isEpubViewer = true
                var path = fileDialog.file.toString()
                path = path.replace(/^(file:\/{3})/,"")
                var fileName = path.slice(path.lastIndexOf("/")+1)
                browseText.text = fileName
                popplerepub.loaded = false;
                epubModel.clear()
                var result = epub.loadFile(path)
                if (result){
                    fileUploaded = true
                    var cPath = epub.copytoDb(offlineStoragePath, "Files",fileName)
                    setting.cPath = cPath
                    setting.openFileName = fileName
                    mainStack.currentIndex = 1
                }
            }else{
                setting.isEpubViewer = false
                path = fileDialog.file.toString()
                path = path.replace(/^(file:\/{3})/,"")
                fileName = path.slice(path.lastIndexOf("/")+1)
                browseText.text = fileName
                poppler.path = urlToPath(""+fileDialog.file.toString())
                thisPageNumber = 1

                epubslider.from = 1
                epubslider.value = 1
                pagesNumber = poppler.numPages

                fileUploaded = true
                mainStack.currentIndex = 2
            }
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    DownloadPanel{
        id: downloadpanel
        visible: false
    }

    function urlToPath(urlString) {
        var s
        if (urlString.startsWith("file:///")) {
            var k = urlString.charAt(9) === ':' ? 8 : 7
            s = urlString.substring(k)
        } else {
            s = urlString
        }
        return decodeURIComponent(s);
    }

//    Component.onCompleted: {
//        epub.setSetting(setting.font, setting.fontSize, setting.lightMode)
//        if (setting.cPath !== ""){
//            var result = epub.loadFile(setting.cPath)
//            if (result){
//                fileUploaded = true
//                browseText.text = setting.openFileName
//                epubslider.value = setting.sliderValue
//            }
//        }

//        db.initDatabase();
//    }
}
