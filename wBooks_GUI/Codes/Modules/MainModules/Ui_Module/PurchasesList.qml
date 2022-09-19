import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Functions/Funcs.js" as Functions

import "./../../Items"
import "./../../MainModules/SearchModule"

Item {

    property int currentPage: 0

    property double rMargin: 0
    property double lMargin: 0

    property int columnItemCount: 1
    property int maxInPage: columnItemCount * 6
    property int rowItemCount: if ((purchasesModel.count-currentPage*maxInPage) >= maxInPage){
                                   return 6
                               }else{
                                   return (Math.floor((purchasesModel.count-currentPage*maxInPage)/columnItemCount) + 1)
                               }

    property int pageItemCount: columnItemCount * rowItemCount

    property int maxPages: if (Math.floor(purchasesModel.count / maxInPage) === (purchasesModel.count / maxInPage)){
                               return Math.floor(purchasesModel.count / maxInPage)
                           }else{
                               return Math.floor(purchasesModel.count / maxInPage) + 1
                           }

    ParallelAnimation {
        id: purchasesAnim
        NumberAnimation { target: flick; property: "contentY"; to: 50; duration: 300 }
    }


    Flickable{
        id: flick
        anchors.fill: parent
        contentHeight: homeItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}
        clip: true

        Item{
            id: homeItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0

                ListView{
                    id: lview
                    Layout.fillWidth: true
                    Layout.preferredHeight: rowItemCount * 70 + 50
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
                    Layout.topMargin: 50
                    headerPositioning: ListView.OverlayHeader
                    focus: true
                    interactive: true
                    spacing: 10
                    model: (purchasesModel.count >= (currentPage+1)*pageItemCount) ? pageItemCount:purchasesModel.count-currentPage*pageItemCount
                    visible: (purchasesModel.count===0) ? false:true

                    ScrollBar.vertical: ScrollBar{}

                    header: Item{
                        width: lview.width
                        height: 50
                        clip: true
                        z: 2
                        RowLayout{
                            anchors.fill: parent
                            layoutDirection: Qt.RightToLeft
                            spacing: 0
                            Item{Layout.preferredWidth: 120}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                text: "شماره"
                                font.family: setting.activeFont
                                font.bold: true
                                color: "#000000"
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                            }

                            Item{Layout.preferredWidth: 50 * setting.fontRatio * ratio}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                text: "تاریخ پرداخت"
                                font.family: setting.activeFont
                                font.bold: true
                                color: "#000000"
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                            }

                            Item{Layout.preferredWidth: 40 * setting.fontRatio * ratio}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                text: "زمان پرداخت"
                                font.family: setting.activeFont
                                font.bold: true
                                color: "#000000"
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                            }

                            Item{Layout.preferredWidth: 80 * setting.fontRatio * ratio}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                text: "مبلغ"
                                font.family: setting.activeFont
                                font.bold: true
                                color: "#000000"
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                            }

                            Item{Layout.preferredWidth: 90 * setting.fontRatio * ratio}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                text: "شماره پیگیری"
                                font.family: setting.activeFont
                                font.bold: true
                                color: "#000000"
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                            }

                            Item{Layout.preferredWidth: 40 * setting.fontRatio * ratio}

                            Label{
                                Layout.preferredWidth: contentWidth
                                Layout.fillHeight: true
                                text: "کتاب های خریداری شده"
                                font.family: setting.activeFont
                                font.bold: true
                                color: "#000000"
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 * ratio
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                            }

                            Item{Layout.fillWidth: true}
                        }
                    }

                    delegate: Item{
                        id: itemRec
                        width: lview.width
                        height: 60
                        Rectangle{
                            id: image
                            width: 50
                            height: parent.height
                            anchors.right: parent.right
                            color: "transparent"
                            Image{
                                anchors.fill: parent
                                source: purchasesModel.get(index+currentPage*pageItemCount).source
                                mipmap: true
                                fillMode: Image.PreserveAspectFit
                            }
                        }

                        Item{
                            id: spacer
                            width: 40
                            height: parent.height
                            anchors.right: image.left
                        }

                        Rectangle{
                            width: parent.width - 90
                            height: parent.height
                            anchors.right: spacer.left
                            color: "#d6d6d6"
                            radius: 20
                            RowLayout{
                                anchors.fill: parent
                                layoutDirection: Qt.RightToLeft
                                spacing: 0
                                Item{Layout.preferredWidth: 50 * setting.fontRatio * ratio}

                                Label{
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: index+currentPage*pageItemCount+1
                                    font.family: setting.activeNumFont
                                    color: color18
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Item{Layout.preferredWidth: 80 * setting.fontRatio * ratio}

                                Label{
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: purchasesModel.get(index+currentPage*pageItemCount).date
                                    font.family: setting.activeNumFont
                                    color: color18
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Item{Layout.preferredWidth: 80 * setting.fontRatio * ratio}

                                Label{
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: purchasesModel.get(index+currentPage*pageItemCount).time
                                    font.family: setting.activeNumFont
                                    color: color18
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Item{Layout.preferredWidth: 80 * setting.fontRatio * ratio}

                                Label{
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: Functions.numberWithCommas(purchasesModel.get(index+currentPage*pageItemCount).amount) + " تومان"
                                    font.family: setting.activeNumFont
                                    color: color18
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Item{Layout.preferredWidth: 80 * setting.fontRatio * ratio}

                                Label{
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: purchasesModel.get(index+currentPage*pageItemCount).serial
                                    font.family: setting.activeNumFont
                                    color: color18
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Item{Layout.preferredWidth: 80 * setting.fontRatio * ratio}

                                Label{
                                    Layout.preferredWidth: contentWidth
                                    Layout.fillHeight: true
                                    text: purchasesModel.get(index+currentPage*pageItemCount).book
                                    font.family: setting.activeNumFont
                                    color: color18
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                }

                                Item{Layout.fillWidth: true}
                            }
                        }

                    }
                }

                Item{Layout.preferredHeight: 40}

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 150
                    Layout.rightMargin: rMargin
                    Layout.leftMargin: lMargin
                    visible: (purchasesModel.count===0) ? false:true
                    RowLayout{
                        anchors.fill: parent
                        spacing: 0
                        Item{Layout.fillWidth: true}
                        Rectangle{
                            Layout.preferredWidth: icon2.contentWidth
                            Layout.fillHeight: true
                            enabled: (currentPage===0)?false:true
                            color: "transparent"
                            Label{
                                id: icon2
                                text: Icons.chevron_left
                                font.family: webfont.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3.5
                                color: (currentPage===0)?color9:color2
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    currentPage -= 1
                                    nView.decrementCurrentIndex()
                                    purchasesAnim.restart()
                                }
                            }
                        }
                        ListView{
                            id: nView
                            Layout.fillHeight: true
                            Layout.preferredWidth: 50 * 5
                            spacing: 10
                            clip: true
                            orientation: ListView.Horizontal
                            interactive: true
                            model: maxPages
                            delegate: Rectangle{
                                width: 40
                                height: 40
                                radius: 8
                                color: (index===currentPage) ? color8:"transparent"
                                Label{
                                    anchors.fill: parent
                                    verticalAlignment: Qt.AlignVCenter
                                    horizontalAlignment: Qt.AlignHCenter
                                    font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5
                                    text: index+1
                                    font.family: setting.activeNumFont
                                    color: color2
                                }
                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: Qt.PointingHandCursor
                                    onClicked: {
                                        if (currentPage !== index){
                                            nView.currentIndex = index
                                            currentPage = index
                                            purchasesAnim.restart()
                                        }
                                    }
                                }
                            }
                        }
                        Rectangle{
                            Layout.preferredWidth: icon3.contentWidth
                            Layout.fillHeight: true
                            enabled: (currentPage===maxPages-1)?false:true
                            color: "transparent"
                            Label{
                                id: icon3
                                text: Icons.chevron_right
                                font.family: webfont.name
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Qt.AlignHCenter
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 3.5
                                color: (currentPage===maxPages-1)?color9:color2
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    currentPage += 1
                                    nView.incrementCurrentIndex()
                                    purchasesAnim.restart()
                                }
                            }
                        }
                        Item{Layout.fillWidth: true}
                    }
                }
            }
        }
    }
}
