import QtQuick 2.12
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../Fonts/Icon.js" as Icons
import "./../Utils/Enum.js" as Enum
import "./../Utils/Utils.js" as Util

Rectangle{

    color: "#d3d3d3"
    Flickable{
        anchors.fill: parent
        contentHeight: rightPanelItem.height
        contentWidth: parent.width
        boundsBehavior: Flickable.StopAtBounds
        ScrollBar.vertical: ScrollBar {}

        Item{
            id: rightPanelItem
            implicitHeight: childrenRect.height
            implicitWidth: parent.width
        ColumnLayout{
            width: parent.width
            spacing: 0

            Label {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                Layout.rightMargin: 20
                text: "فیلتر دسته بندی ها"
                font.family: iranSans.name
                font.pixelSize: Qt.application.font.pixelSize * 1.3
                verticalAlignment: Qt.AlignVCenter
                color: "#778899"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterPanel{
                Layout.fillWidth: true
                Layout.preferredHeight: categoryModel.count * 20 + 80
                title: "دسته بندی ها"
                showAll: true
                chevron: true
                lModel: categoryModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterPanel{
                Layout.fillWidth: true
                Layout.preferredHeight: certificateModel.count * 20 + 80
                title: "مجوزها"
                showAll: false
                chevron: false
                lModel: certificateModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterDisplayPanel{
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                title: "نحوه نمایش"
                showAll: false
                chevron: true
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterSearchPanel{
                id: input_search
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                title: "جستجوی ناشر"
                label: "جستجو در ناشران"
                icon: Icons.magnify
                placeholder: "جستجو در ناشران"

                Keys.onEnterPressed: {

                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterPanel{
                Layout.fillWidth: true
                Layout.preferredHeight: ageModel.count * 20 + 80
                title: "محدوده سنی"
                showAll: false
                chevron: false
                lModel: ageModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterPanel{
                Layout.fillWidth: true
                Layout.preferredHeight: dateModel.count * 20 + 80
                title: "تاریخ نشر"
                showAll: false
                chevron: true
                lModel: dateModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            FilterPanel{
                Layout.fillWidth: true
                Layout.preferredHeight: bookTypeModel.count * 20 + 80
                title: "نوع کتاب"
                showAll: false
                chevron: true
                lModel: bookTypeModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "white"
            }

            Item{Layout.fillHeight: true}

        }
        }
    }
}
