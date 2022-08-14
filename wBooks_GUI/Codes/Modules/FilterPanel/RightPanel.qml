import QtQuick 2.15
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

import "./../../../Fonts/Icon.js" as Icons
import "./../../../Utils/Enum.js" as Enum
import "./../../../Utils/Utils.js" as Util

Rectangle{

    color: color1
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
                font.family: mainFont.name
                font.pixelSize: Qt.application.font.pixelSize * 1.3
                verticalAlignment: Qt.AlignVCenter
                color: color9
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
            }

            FilterPanel{
                title: "دسته بندی ها"
                showAll: false
                chevron: true
                lModel: categoryModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
            }

            FilterPanel{
                title: "مجوزها"
                showAll: false
                chevron: true
                lModel: certificateModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
            }

            FilterDisplayPanel{
                title: "نحوه نمایش"
                showAll: false
                chevron: true
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
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
                color: "#ffffff"
            }

            FilterPanel{
                title: "محدوده سنی"
                showAll: false
                chevron: true
                lModel: ageModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
            }

            FilterPanel{
                title: "تاریخ نشر"
                showAll: false
                chevron: true
                lModel: dateModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
            }

            FilterPanel{
                title: "نوع کتاب"
                showAll: false
                chevron: true
                lModel: bookTypeModel
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                color: "#ffffff"
            }

            Item{Layout.fillHeight: true}

        }
        }
    }
}
