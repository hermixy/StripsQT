import QtQuick 2.0
import QtQuick.Controls 2.0
//import "game.js" as MyScript
import "../singleton"

Item {
    id: block
    width: MyGlobals.blockSize
    height: MyGlobals.blockSize
    Rectangle{
        id:blockRec
        anchors.fill: parent
        border.color : "white"
        color: "#efefef"
    }

    property int type: 0
    property string oldColor: ""



    function changeColor(i,j){
        var status = myBroker.getStatus(i,j);
        if(status === MyGlobals.free){
            blockRec.color = MyGlobals.freeColor;
        }
        else if (status === MyGlobals.wall){
            blockRec.color = MyGlobals.wallColor;
            blockRec.border.color = "black"
            block.enabled = false;
        }



    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            oldColor = blockRec.color;
            blockRec.color = "white";
        }

        onExited: {
            blockRec.color = oldColor;
        }
    }



}
