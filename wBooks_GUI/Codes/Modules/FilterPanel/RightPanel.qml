import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

Rectangle{
    id: filterPop

    signal btnClicked()

    color: "#e0e0e0"
    Flickable{
        anchors.fill: parent
        contentHeight: rightPanelItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {
            width: 12*ratio
            anchors.right: parent.right
        }

        Item{
            id: rightPanelItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
            ColumnLayout{
                width: parent.width
                spacing: 0

                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 50
                    color: "#d43460"
                    RowLayout{
                        anchors.fill: parent
                        layoutDirection: Qt.RightToLeft
                        spacing: 0
                        Item{Layout.preferredWidth: 5}

                        Rectangle{
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: "transparent"
                            Label {
                                id: txtTitle
                                anchors.fill: parent
                                text: "فیلتر دسته بندی ها"
                                font.family: setting.activeFont
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.3 * ratio
                                font.bold: true
                                verticalAlignment: Qt.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                                LayoutMirroring.enabled: true
                                color: "#ffffff"
                            }
                        }

                        Item{Layout.preferredWidth: 5}

                        Rectangle{
                            Layout.preferredHeight: width
                            Layout.preferredWidth: 30
                            Layout.topMargin: 10
                            Layout.bottomMargin: 10
                            radius: width / 2
                            color: "#ffffff"
                            Label{
                                anchors.centerIn: parent
                                text: Icons.arrow_right
                                font.family: webfont.name
                                font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 1.5 //* widthRatio

                                color: "#d43460"
                            }

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    btnClicked()
                                }
                            }
                        }

                        Item{Layout.preferredWidth: 15}
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterPanel{
                    title: "دسته بندی ها"
                    showAll: false
                    chevron: true
                    lModel: categoryModel
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterPanel{
                    title: "مجوزها"
                    showAll: false
                    chevron: true
                    lModel: certificateModel
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterDisplayPanel{
                    title: "نحوه نمایش"
                    showAll: false
                    chevron: true
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterSearchPanel{
                    id: input_search
                    Layout.fillWidth: true
                    Layout.preferredHeight: 100
                    title: "جستجوی ناشر"
                    label: "جستجو در ناشران"
                    icon: Icons.magnify
                    iconColor: "#a2a2a2"
                    borderColor: addOpacity("#a2a2a2", 40)
                    bgColor: addOpacity("#a2a2a2", 40)
                    itemRadius: 10
                    placeholder: "جستجو در ناشران"

                    Keys.onEnterPressed: {

                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterPanel{
                    title: "محدوده سنی"
                    showAll: false
                    chevron: true
                    lModel: ageModel
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterPanel{
                    title: "تاریخ نشر"
                    showAll: false
                    chevron: true
                    lModel: dateModel
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 5
                    color: "#e0e0e0"
                }

                FilterPanel{
                    title: "نوع کتاب"
                    showAll: false
                    chevron: true
                    lModel: bookTypeModel
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 10
                    color: "#e0e0e0"
                }

                Item{Layout.fillHeight: true}
            }
        }
    }
}
