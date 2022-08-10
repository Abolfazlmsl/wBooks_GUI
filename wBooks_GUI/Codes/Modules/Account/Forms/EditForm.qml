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
                    getMessage(signalmsg)
                }
            }
        }

        Item {
            MyWallet{
                anchors.fill: parent
                anchors.topMargin: parent.height * 0.1
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

        }

        Item {
            TicketItem{
                anchors.fill: parent
            }

        }

        Item {

        }
    }
}
