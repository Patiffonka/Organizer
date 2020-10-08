import QtQuick 2.0

BorderImage {

    property alias text: _txt.text

    signal clicked;
    source: "qrc:///img/button.png"
    width: 107
    height: 42
    border.left: 5; border.top: 5
    border.right: 5; border.bottom: 5

    Text {
        id: _txt
        text: qsTr("Button")
        color: "white"
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.clicked()
    }
}
