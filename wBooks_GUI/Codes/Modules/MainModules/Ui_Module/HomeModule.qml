import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

Flickable {
    anchors.fill: parent
    contentWidth: parent.width
    contentHeight: home.height

    Item{
        id: home
        implicitWidth: parent.width
        implicitHeight: childrenRect.height

        ColumnLayout{
            width: parent.width
            spacing: 0

            Item{
                width: parent.width
                height: 150

                ListModel{
                    id: specialCategoryModel
                }

                ColumnLayout{
                    anchors.fill: parent
                    spacing: 0

                    Label{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        text: "دسته بندی های ویژه"
                        font.family: setting.activeFont
                        font.pixelSize: Qt.application.font.pixelSize * setting.fontRatio * 2
                        renderType: Text.NativeRendering

                        verticalAlignment: Qt.AlignVCenter

                        color: color16
                    }

                    ListView{
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
                        spacing: 5
                        orientation: Qt.Horizontal
                        layoutDirection: Qt.RightToLeft
                        model: specialCategoryModel

                        delegate: Column{
                            width: 50
                            height: 40
                            spacing: 2

                            Rectangle{
                                width: parent.width
                                height: 30
                                color: color1
                                Rectangle{
                                    anchors.fill: parent
                                    anchors.margins: 2
                                    color: color4
                                }

                            }

                            Label{
                                width: parent.width
                                height: 10
                                text: model.title
                            }

                            Label{
                                width: parent.width
                                height: 0
//                                text: model.
                            }

                        }

                    }
                }
            }


        }
    }
}
