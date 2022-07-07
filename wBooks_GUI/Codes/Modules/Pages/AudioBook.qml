import QtQuick 2.15
import QtMultimedia 5.9

import "./../MainModules"

Item {
    //-- video player --//
    Player{
        id: player

        anchors.fill: parent
        isTopToolsVisible: false
        isIgnoreOffset: false
    }
}
