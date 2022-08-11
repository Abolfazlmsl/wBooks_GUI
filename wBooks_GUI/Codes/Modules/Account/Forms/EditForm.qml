import QtQuick 2.14
import QtQuick.Window 2.2
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.12
import QtQuick.Controls.Material 2.12
import QtGraphicalEffects 1.0

import "./../../../../Fonts/Icon.js" as Icons
import "./../../../../Utils/Utils.js" as Util

import "./../Panels"
import "./../../MainModules/Ui_Module"

Item{
    id: root_edit

    signal getMessage(var signalmsg)

    Component.onCompleted: {

    }

    objectName: "Edit"

    MouseArea {
        //            anchors.fill: parent
        width: parent.width
        height: parent.height

        propagateComposedEvents: true
        property real lastMouseX: 0
        property real lastMouseY: 0
        acceptedButtons: Qt.LeftButton
        onMouseXChanged: root_edit.x += (mouseX - lastMouseX)
        onMouseYChanged: root_edit.y += (mouseY - lastMouseY)
        onPressed: {
            if(mouse.button == Qt.LeftButton){
                parent.forceActiveFocus()
                lastMouseX = mouseX
                lastMouseY = mouseY

                //-- seek clip --//
                //                    player.seek((player.duration*mouseX)/width)
            }
            //                mouse.accepted = false
        }
    }

    SwipeView {
        id: editView
        anchors.fill: parent
        interactive: false
        clip: true
        currentIndex: editFormIndex

        Item {
            EditAccount{
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.1
                anchors.leftMargin: parent.width * 0.3
                anchors.rightMargin: parent.width * 0.3
                onGetMessage: {
                    alarmLoginWin1.msg = signalmsg
                }
            }
            //-- Alarm --//
            Rectangle{
                id: alarmLoginWin1

                property string msg: ""

                width: parent.width
                height: lblAlarm1.implicitHeight * 2.5
                anchors.bottom: parent.bottom

                color: msg === "" ? "transparent" : color6

                Label{
                    id: lblAlarm1
                    text: alarmLoginWin1.msg
                    anchors.centerIn: parent
                    color: "#ffffff"

                }
            }
        }

        Item {
            MyWallet{
                anchors.fill: parent
            }
        }

        Item {
            MyBooksList{
                anchors.fill: parent
                back: false
            }
        }

        Item {
            MyAudioBooksList{
                anchors.fill: parent
                back: false
            }
        }

        Item {
            ForgotPasswordItem{
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.1
                anchors.leftMargin: parent.width * 0.3
                anchors.rightMargin: parent.width * 0.3
                onGetMessage: {
                    alarmLoginWin2.msg = signalmsg
                }
            }
            //-- Alarm --//
            Rectangle{
                id: alarmLoginWin2

                property string msg: ""

                width: parent.width
                height: lblAlarm2.implicitHeight * 2.5
                anchors.bottom: parent.bottom

                color: msg === "" ? "transparent" : color6

                Label{
                    id: lblAlarm2
                    text: alarmLoginWin2.msg
                    anchors.centerIn: parent
                    color: "#ffffff"

                }
            }
        }

        Item {
            TicketItem{
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.05
                anchors.leftMargin: parent.width * 0.05
                anchors.rightMargin: parent.width * 0.05
            }

        }

        Item {
            AboutUsItem{
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.05
                anchors.leftMargin: parent.width * 0.05
                anchors.rightMargin: parent.width * 0.05
            }
        }

        Item {
            SupportItem{
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.1
                anchors.leftMargin: parent.width * 0.25
                anchors.rightMargin: parent.width * 0.25
            }
        }
    }
}
