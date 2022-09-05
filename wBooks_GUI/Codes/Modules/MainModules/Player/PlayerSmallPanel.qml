import QtQuick 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15

import "./../../../../Fonts/Icon.js" as Icons

Item {
    width: parent.width
    height: 100
    clip: true

    function play_pause() {
        console.log("player.playbackState: " + player.playbackState + MediaPlayer.PlayingState + MediaPlayer.PlayingState)
        if(player.playbackState === MediaPlayer.PlayingState){

            console.log("pause")
            player.pause()
        }
        else if(player.playbackState === MediaPlayer.PausedState
                || player.playbackState === MediaPlayer.StoppedState){
            console.log("play")
            player.play()

        }
    }

    function right_play() {
        if(player.playbackState !== 0){

            player.seek(player.position + 5000)
        }
    }

    function left_play() {
        if(player.playbackState !== 0){

            player.seek(player.position - 5000)
        }
    }


    RowLayout{
        anchors.fill: parent
        spacing: 0
        Item{
            Layout.preferredWidth: 200
            Layout.fillHeight: true
            clip: true
            Rectangle{
                anchors.fill: parent; color:  "#000000"
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        mainPage.state = "Media Page"
                    }
                }
            }

            Material.theme: Material.Dark

            Image{
                id: image
                visible: (playerMediaType === "Video") ? player.playbackState === MediaPlayer.PlayingState ? false : true : true
                anchors.centerIn: parent
                source: (playerMediaType === "Video") ? 'qrc:/Images/Wbooks1.png' : 'qrc:/Images/music.png'
//                sourceSize: Qt.size(100,100)
                verticalAlignment: Image.AlignVCenter
                horizontalAlignment: Image.AlignHCenter
                fillMode: Image.PreserveAspectFit
            }

            ShaderEffectSource {
                id: vidOut
                anchors.fill: parent
                sourceItem: vidOutmain
            }
//            VideoOutput{
//                id: vidOutmain

//                anchors.fill: parent
//                source: player
//            }
        }

        Rectangle{
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: color1
            RowLayout{
                anchors.fill: parent
                spacing: 0
                //-- skip backward --//
                Item {Layout.preferredWidth: 20}
                Label{
                    Layout.preferredWidth: 50
                    Layout.fillHeight: true
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    text: Icons.skip_backward
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color4

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            left_play()
                        }
                    }
                }

                //-- play --//
                Rectangle{
                    Layout.preferredWidth: 50
                    Layout.fillHeight: true
                    color: "transparent"


                    Rectangle{
                        width: 40
                        height: width
                        radius: width / 2
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        border.width: 2
                        border.color: color12
                        color: color12
                        Label{
                            anchors.fill: parent
                            font.family: webfont.name
                            font.pixelSize: Qt.application.font.pixelSize * 2
                            text: player.playbackState === 1 ? Icons.pause: Icons.play
                            color: color4
                            verticalAlignment: Qt.AlignVCenter
                            horizontalAlignment: Qt.AlignHCenter

                            MouseArea{
                                id: ma_play
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: {
                                    console.log("play")
                                    play_pause()
                                }
                            }
                        }
                    }
                }
                //-- skip forward --//
                Label{
                    Layout.preferredWidth: 50
                    Layout.fillHeight: true
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    text: Icons.skip_forward
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color4
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            right_play()
                        }
                    }
                }

                Item {Layout.preferredWidth: 20}
                Item{
                    Layout.preferredWidth: parent.width * 0.5
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignVCenter
                    Rectangle{
                        anchors.fill: parent
                        color: "transparent"
                        Slider {
                            id: sli_timer
                            anchors.fill: parent
                            from: 0
                            to: width
                            value: (player.position/player.duration) * width
                            onMoved: {
                                player.seek((player.duration*sli_timer.value)/width)
                            }
                            MouseArea{
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                propagateComposedEvents: true
                                onPressed: mouse.accepted = false
                            }

                        }

                        Label{
                            id: lblTimeSpend
                            width: parent.width
                            height: 30
                            anchors.bottom: sli_timer.bottom
                            anchors.bottomMargin: 5
                            text: lblTimeSpendmain
                            font.pixelSize: Qt.application.font.pixelSize * 1.3
                            font.family: setting.activeFont
                            horizontalAlignment: Qt.AlignHCenter
                            color: color4
                        }
                    }
                }

                Item {Layout.preferredWidth: 20}
                //-- speed --//
                Label{
                    id: btn_speedLevel
                    Layout.preferredWidth: 50
                    Layout.fillHeight: true

                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    text: Icons.speedometer
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color4

                    Popup{
                        id: popupspeed
                        width: list_speed.implicitWidth * 1
                        height: btn_speedLevel.implicitHeight * 5
                        y: -height/2 - 20
//                                    x: -width*0.5 + btn_speedLevel.implicitWidth*0.5

                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

                        property bool state: false

                        Slider{
                            id: list_speed

                            height: parent.height
                            anchors.centerIn: parent

                            from: 1
                            value: playerSpeed
                            onValueChanged: {
                                playerSpeed = value
                                player.playbackRate = value
                            }

                            to: 4
                            orientation: Qt.Vertical
                        }

                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true

                        onClicked: {
                            if (popupspeed.state === false){
                                popupspeed.open()
                                popupspeed.state = true
                            }
                            else {
                                popupspeed.close()
                                popupspeed.state = false
                            }
                        }
                    }

                }

                Rectangle {
                    id: vol_row
                    Layout.preferredWidth: 100
                    Layout.fillHeight: true
                    color: "transparent"
                    Label{
                        id: btn_soundLevel

                        //anchors.right: parent.right;
                        width: 40
                        height: parent.height
                        anchors.rightMargin: implicitWidth * 2
                        font.family: webfont.name
                        font.pixelSize: Qt.application.font.pixelSize * 2
                        verticalAlignment: Qt.AlignVCenter
                        horizontalAlignment: Qt.AlignHCenter
                        color: color4
                        text: {if (mutePlayer){
                                  return Icons.volume_off
                              }else{
                                  if (slider_vol.value > 75) {
                                      return Icons.volume_high
                                  }
                                  else if (slider_vol.value >= 25 && slider_vol.value <= 75){
                                      return Icons.volume_medium
                                  }
                                  else if (slider_vol.value === 0){
                                      return Icons.volume_mute
                                  }
                                  else {
                                      return Icons.volume_low
                                  }
                              }
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                mutePlayer = !mutePlayer
                                if (mutePlayer){
                                    player.volume = 0
                                }
                                else {
                                    player.volume = slider_vol.value / 100
                                }
                            }

                        }
                    }

                    //-- volume --//

                    Slider{
                        id: slider_vol
                        anchors.left: btn_soundLevel.right
                        width: 60
                        height: parent.height
                        from: 0
                        value: playerVolume
                        to: 100
                        orientation: Qt.Horizontal
                        onValueChanged: {
                            playerVolume = value
                            player.volume = value/100
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            propagateComposedEvents: true
                            onPressed: mouse.accepted = false

                        }

                    }
                }

                Item{Layout.fillWidth: true}

                Label{
                    Layout.preferredWidth: 50
                    Layout.fillHeight: true
                    font.family: webfont.name
                    font.pixelSize: Qt.application.font.pixelSize * 2
                    text: Icons.close
                    verticalAlignment: Qt.AlignVCenter
                    horizontalAlignment: Qt.AlignHCenter
                    color: color4
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            player.stop()
                            smallPlayer.visible = false
                        }
                    }
                }
            }
        }
    }
}
