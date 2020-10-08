import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: _wndNewTask
    width: 400; height: 250
    flags: Qt.Window | Qt.FramelessWindowHint

    property int previousX
    property int previousY
    property string taskName
    property date date
    property int progress

    date: new Date()

    taskName: "New Task"

    progress: 0


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
                    _wndNewTask.setY(_wndNewTask.y + dy)
                }
                onMouseXChanged: {
                    var dx = mouseX - previousX
                    _wndNewTask.setX(_wndNewTask.x + dx)
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
                onClicked: _wndNewTask.close()
            }
        }

        Rectangle {
            y: _topRect.height + 5
            x: 5
            width: _wndNewTask.width - 10
            height: _wndNewTask.height - y - 5
            color: "#00000000"


            GridLayout {
                anchors.fill: parent
                columns: 2
                rows: 4


                Label {
                    text: "Task name:"
                    Layout.column: 0
                    Layout.row: 0
                }
                Label {
                    text: "Deadline:"
                    Layout.column: 0
                    Layout.row: 1
                }
                Label {
                    text: "Progress"
                    Layout.column: 0
                    Layout.row: 2
                }

                TextField {
                    id: _txfTaskName
                    Layout.column: 1
                    Layout.row: 0
                    Layout.fillWidth: true
                    text: taskName
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    onAccepted:  text = ""
                    MouseArea {
                        anchors.fill: parent
                        propagateComposedEvents: true
                        onClicked: {
                            _txfTaskName.selectAll()
                            mouse.accepted = false
                            _txfTaskName.focus = true
                        }
                    }
                }




                TextField {
                    id: _txfTaskDate
                    Layout.column: 1
                    Layout.row: 1
                    Layout.fillWidth: true
                    //text: "Click to set date"
                    text: Qt.formatDate(date)
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    MouseArea {
                        anchors.fill: parent
                        propagateComposedEvents: true
                        onClicked: {
                            _txfTaskDate.text=""
                            var component = Qt.createComponent("CalendarWindow.qml")
                            var window    = component.createObject(_wndNewTask)
                            window.show()
                        }
                    }
                }



                SpinBox {
                    id: _spnProgress
                    value: progress
                    Layout.column: 1
                    Layout.row: 2
                    Layout.fillWidth: true
                    IntValidator {
                        bottom: 0
                        top: 10 //NOT WORKS
                    }
                    onValueChanged: progress = value
                }


                MyButton {
                    text: "Add Task"
                    Layout.column: 0
                    Layout.columnSpan: 2
                    Layout.row: 3
                    Layout.alignment: Qt.AlignHCenter;
                    onClicked:
                    {
                        taskName = _txfTaskName.text
                        _tskManager.createNewTask(taskName, _txfTaskDate.text, _spnProgress.value)
                        _wndNewTask.close()
                    }
                }
            }

        }

}

