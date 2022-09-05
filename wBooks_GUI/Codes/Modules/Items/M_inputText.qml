import QtQuick 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.15

import "./../../../Fonts/Icon.js" as Icons

//-- InputBox For Search --//
Rectangle{
    id: root_txf

    property alias inputText: txf_main
    property alias icon: iconLabel.text
    property string label: ""
    property string iconColor: color4
    property bool iconVisible: true
    property bool isClearIcon: true
    property string placeholder: ""
    property alias echoMode: txf_main.echoMode
    property alias clearEnable: lbl_clear.visible
    property int borderWidth: 1
    property string borderColor: "#ffffff"
    property string bgColor: color_input
    property bool enterAsAccept: false
    property int itemRadius: 10
    property bool acceptInput: false
    property double fontSize: 1
    property string placeHolderPosition: "Right" //Center
    property alias textPosition: root_txf.state // "Right", "Left", "Center"

    property alias imgIcon: iconTxt.source
    property bool iconAsImage: false
    property int iconRotation: 0
    signal acceptedLogin()

    property int selectStart
    property int selectEnd
    property int curPos

    color: "transparent"

//    Layout.fillWidth: true
    Layout.preferredHeight: 45 * ratio
    Layout.rightMargin: 10 * ratio

    state: "Right"
    states: [
        State{
            name: "Right"
            PropertyChanges {
                target: txf_main
                horizontalAlignment: TextInput.AlignRight
            }
        },
        State{
            name: "Center"
            PropertyChanges {
                target: txf_main
                horizontalAlignment: TextInput.AlignHCenter
            }
        },
        State{
            name: "Left"
            PropertyChanges {
                target: txf_main
                horizontalAlignment: TextInput.AlignLeft
            }
        }
    ]


    RowLayout{

        anchors.fill: parent

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true

            color: bgColor
            border.width: borderWidth
            border.color: borderColor
            radius: itemRadius

            //-- TextField --//
            TextInput{
                id:txf_main
                anchors.fill: parent
                readOnly: acceptInput
                clip: true

                //            width: parent.width - lbl_icon.implicitWidth - lbl_clear.implicitWidth  // Width of Rect - Width of Magnify
                //            height: parent.height

                verticalAlignment: TextInput.AlignVCenter
                rightPadding: 30
                leftPadding: 30
//                            leftPadding: 10 * ratio

                font.family: setting.activeNumFont
                font.pixelSize: Qt.application.font.pixelSize * fontSize
                selectedTextColor: color14
                color: color4

                selectByMouse: true
//                horizontalAlignment: TextInput.AlignRight


                //-- placeholder --//
                Label{
                    id: lbl_placeholder

                    visible: (placeHolderPosition==="Right")?(txf_main.length >= 1) ? false : true : false

                    text: placeholder

                    anchors.right: parent.right
                    anchors.rightMargin: 30
                    anchors.verticalCenter: parent.verticalCenter

                    font.family: setting.activeFont
                    font.pixelSize: Qt.application.font.pixelSize

                    color: color18

                    background: Rectangle{
                        color: "transparent"
                    }

                }

                Label{
                    id: lbl_placeholder_center

                    visible: (placeHolderPosition==="Center")?(txf_main.length >= 1) ? false : true : false

                    text: placeholder

                    anchors.centerIn: parent

                    font.family: setting.activeFont
                    font.pixelSize: Qt.application.font.pixelSize

                    color: color18

                    background: Rectangle{
                        color: "transparent"
                    }

                }


                //-- Cut Copy Paste => MouseArea --//
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    hoverEnabled: true

                    onClicked: {

                        selectStart = txf_main.selectionStart
                        selectEnd = txf_main.selectionEnd
                        curPos = txf_main.positionAt(mouse.x)
                        copyPaste_Menu.x = mouse.x
                        copyPaste_Menu.y = mouse.y
                        txf_main.cursorPosition = curPos
                        copyPaste_Menu.open()

                        txf_main.select(selectStart,selectEnd)
                    }
                    onPressAndHold: {
                        if (mouse.source === Qt.MouseEventNotSynthesized) {
                            selectStart = txf_main.selectionStart
                            selectEnd = txf_main.selectionEnd
                            curPos = txf_main.positionAt(mouse.x)
                            copyPaste_Menu.x = mouse.x
                            copyPaste_Menu.y = mouse.y
                            txf_main.cursorPosition = curPos
                            copyPaste_Menu.open()

                            txf_main.select(selectStart,selectEnd)
                        }
                    }

                    //-- Cut Copy Paste => Menu --//
                    Menu {
                        id: copyPaste_Menu
                        topPadding: 0
                        bottomPadding: 0
                        width: 150 * ratio
                        height: 150 * ratio
                        MenuItem {
                            text: "Cut"

                            font.pixelSize: 15 * ratio

                            enabled: (selectEnd - selectStart !== 0) ? true : false

                            width: 150 * ratio
                            height: 50 * ratio

                            onTriggered: {
                                txf_main.select(selectStart,selectEnd)
                                txf_main.cut()
                            }
                        }
                        MenuItem {
                            text: "Copy"

                            font.pixelSize: 15 * ratio

                            enabled: (selectEnd - selectStart !== 0) ? true : false

                            width: 150 * ratio
                            height: 50 * ratio

                            onTriggered: {
                                txf_main.select(selectStart,selectEnd)
                                txf_main.copy()
                            }
                        }
                        MenuItem {
                            text: "Paste"


                            font.pixelSize: Qt.application.font.pixelSize
                            enabled:txtTemp.text != "" ? true : false

                            width : 150 * ratio
                            height : 50 * ratio

                            onTriggered: {
                                txf_main.paste()
                            }

                            TextInput {
                                id: txtTemp
                                visible: false
                            }
                        }
                        onOpened: {

                            txf_main.select(selectStart,selectEnd)
                            txf_main.cursorPosition = curPos

                            //console.log(txf_Search.cursorPosition)
                        }

                        onAboutToShow: {
                            //-- paste enable check --//
                            txtTemp.text = ""
                            txtTemp.paste()
                        }
                    }
                }

                onAccepted: {

                    if(enterAsAccept){
                        acceptedLogin()

                    }

                }

            }
        }


        //-- Optional/Clear Icon  --//
        Label{
            id: lbl_clear

            visible: false
            text: (isClearIcon) ? Icons.close:Icons.star
            font.family: webfont.name
            font.pixelSize: (isClearIcon) ? Qt.application.font.pixelSize * 1.5:Qt.application.font.pixelSize * 0.5

            //            color: Util.color_RightMenu

            verticalAlignment: Qt.AlignVCenter
            Layout.alignment: Qt.AlignRight

            ItemDelegate{
                anchors.fill: parent
                onClicked: {
                    txf_main.text = ""
                }
            }

        }


    }

    //-- Exit Icon --//
    Label{
        id: iconLabel
        width: 10
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 15
        visible: (iconVisible && !iconAsImage)
        rotation: iconRotation

        text: Icons.key
        color: iconColor
        font.family: webfont.name
        font.pixelSize: Qt.application.font.pixelSize * 1.5

        verticalAlignment: Qt.AlignVCenter
    }
    Rectangle{
        width: 20
        height: parent.height
        anchors.right: parent.right
        anchors.rightMargin: 5
        visible: (iconVisible && iconAsImage)
        rotation: iconRotation
        color: "transparent"
        Image{
            id: iconTxt
            anchors.fill: parent
            source: ""
            mipmap: true
            fillMode: Image.PreserveAspectFit
            visible: false
        }
        ColorOverlay {
            anchors.fill: iconTxt
            source: iconTxt
            color: iconColor
        }
    }
}

