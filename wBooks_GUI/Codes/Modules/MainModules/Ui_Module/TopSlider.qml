import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.15
import QtQuick.Controls.Styles 1.4

Item {

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true

        onEntered: {
            timer.running = false
        }
        onExited: {
            timer.running = true
        }

        Timer {
            id: timer
            interval: 3000 // triggers every 5000 ms
            repeat: true
            onTriggered: {
                if (view.currentIndex+1 < view.count){
                    view.setCurrentIndex(view.currentIndex+1)
                }else{
                    view.setCurrentIndex(0)
                }
            }
            running: (mainPage.state === "Serial Book")? true:false
        }
        SwipeView {
            id: view
            clip: true
            currentIndex: 0
            anchors.fill: parent

            Item {
                id: firstPage
                TopSliderPage1{
                    anchors.fill: parent
                    source: "qrc:/Images/Banner Home.jpg"
                    itemVisible: false
                    rate: 80
                    leftText: "بخوانید"
                    rightText: "اطلاعات بیشتر"
                    position: "Right"
                }
            }
            Item {
                id: secondPage
                TopSliderPage1{
                    anchors.fill: parent
                    source: "qrc:/Images/Battleground.jpg"
                    rate: 60
                    leftText: "خرید"
                    rightText: "اطلاعات بیشتر"
                    position: "Left"
                }
            }
            Item {
                id: thirdPage
                TopSliderPage1{
                    anchors.fill: parent
                    source: "qrc:/Images/newsroom.jpg"
                    rate: 100
                    leftText: "انتقال به سایت"
                    rightText: "اطلاعات بیشتر"
                    position: "Right"
                }
            }
        }

        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex
            interactive: true
            anchors.bottom: view.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter

            delegate: Rectangle{
                width: 15
                height: width
                radius: width/2
                color: (view.currentIndex===index) ? color2:"#ffffff"
                MouseArea{
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        view.setCurrentIndex(index)
                    }
                }
            }
        }
    }

}
