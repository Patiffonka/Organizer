import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    id: _wndCalendar
    width: _cal.width
    height: _cal.height + _topRect.height
    flags: Qt.Window | Qt.FramelessWindowHint

    property int previousX
    property int previousY

        Rectangle {
            id: _topRect
            width: parent.width
            height: 30
            color: "grey"

            MouseArea {
                anchors.fill: parent

                onPressed: {
                    previousX = mouseX
                    previousY = mouseY
                }
                onMouseYChanged: {
                    var dy = mouseY - previousY
                    _wndCalendar.setY(_wndCalendar.y + dy)
                }
                onMouseXChanged: {
                    var dx = mouseX - previousX
                    _wndCalendar.setX(_wndCalendar.x + dx)
                }
            }

        }

        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop {position: 0.000;color: Qt.rgba(0.21, 0.23, 0, 0.22);}
                GradientStop {position: 1.000;color: Qt.rgba(0.41, 0.45, 0.43, 1);}
            }
        }

        Image {
            id: _btnClose
            source: "qrc:///img/closebutton.png"
            width: 30
            height: 27
            x: parent.width - width - 2
            y: 2

            MouseArea {
                anchors.fill: parent
                onClicked: _wndCalendar.close()
            }
        }

        Calendar {
            id: _cal
            y: _topRect.height
            onClicked: {
                _txfTaskDate.text = Qt.formatDate(date)
                _wndCalendar.close()
            }
        }


}
