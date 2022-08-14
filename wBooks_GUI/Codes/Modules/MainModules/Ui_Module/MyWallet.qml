import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

import "./../../../../Fonts/Icon.js" as Icons

import "./../../../Modules/Items"

Item{

    property int increseAmount: 2000

    property real btn_ShadowSpread: 0.0
    property real btn_ShadowRadius: 9

    signal dashboard_btnClicked

    ListModel{
        id: amountModel
        ListElement{
            amount: 2000
            isClick: true
        }
        ListElement{
            amount: 5000
            isClick: false
        }
        ListElement{
            amount: 10000
            isClick: false
        }
        ListElement{
            amount: 20000
            isClick: false
        }
        ListElement{
            amount: 50000
            isClick: false
        }
        ListElement{
            amount: 100000
            isClick: false
        }
    }

    Flickable{
        id: flick
        anchors.fill: parent
        contentHeight: membershipItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}
        clip: true
        ParallelAnimation {
            id: increseAmountClicked
            NumberAnimation { target: flick; property: "contentY"; to: 450; duration: 300 }
        }

        Item{
            id: membershipItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0
                WalletItem{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 350
                    Layout.leftMargin: 50
                    Layout.rightMargin: 50
                    Layout.topMargin: 50
                    title: "کیف پول"
                    price: 100000
                    bgColor: "#25B767"

                    onDashboard_btnClicked: {
                        increseAmountClicked.restart()
                    }
                }

                Item{Layout.preferredHeight: 50}

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 1
                    Layout.leftMargin: 50
                    Layout.rightMargin: 50
                    color: color4
                }

                GridView{
                    id: lview
                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.ceil(lview.count/Math.floor((parent.width-120)/cellWidth)) * cellHeight + 20
                    Layout.rightMargin: 70
                    Layout.leftMargin: 50
                    Layout.topMargin: 50
                    clip: true
                    focus: true
                    cellWidth: 250
                    cellHeight: 150
                    interactive: true
                    layoutDirection: Qt.RightToLeft
                    model: amountModel
                    ScrollBar.vertical: ScrollBar {}
                    delegate: IncreaseAmountItem{
                        amount: model.amount
                        isClick: model.isClick

                        onBtnClicked: {
                            for (var i=0; i<amountModel.count; i++){
                                if (i===index){
                                    amountModel.setProperty(i, "isClick", true)
                                }else{
                                    amountModel.setProperty(i, "isClick", false)
                                }
                            }
                            increseAmount = model.amount
                        }
                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    Layout.leftMargin: parent.width * 0.4
                    Layout.rightMargin: 100
                    RowLayout{
                        anchors.fill: parent
                        spacing: 10
                        layoutDirection: Qt.RightToLeft
                        Label{
                            Layout.preferredWidth: contentWidth
                            Layout.fillHeight: true
                            text: "مبلغ قابل پرداخت:"
                            font.family: mainFont.name
                            font.pixelSize: 23 //* widthRatio
                            font.bold: true
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter
                            color: color11
                        }
                        Label{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            text: increseAmount + " تومان"
                            font.family: mainFaNumFont.name
                            font.pixelSize: 23 //* widthRatio
                            font.bold: true
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter
                            color: color11
                        }
                    }
                }

                Item{Layout.preferredHeight: 50}

                ButtonShadow{
                    id: purchase
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    Layout.leftMargin: 50
                    Layout.rightMargin: 70
                    fontSize: 2
                    btnText: "پرداخت"
                    textColor: "#ffffff"
                }

                Item{Layout.preferredHeight: 50}
            }
        }
    }
}
