import QtQuick 2.12
import QtQuick.Window 2.12
import Qt.labs.qmlmodels 1.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2
import TaskManager 1.0

Window {
    id: _mainWindow
    visible: true
    width: 500
    maximumWidth: 500
    height: 700
    title: qsTr("Task Manager")


    TaskManager {
        id: _tskManager
        onTaskCreated: {
            _lstModel.append({
                        "task": name,
                        "date": date,
                        "progress": progress + "/10"
                        })
        }
    }


    Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {position: 0.000;color: Qt.rgba(0.21, 0.23, 0, 0.22);}
            GradientStop {position: 1.000;color: Qt.rgba(0.41, 0.45, 0.43, 1);}
        }
    }

    ColumnLayout {

            anchors.fill:parent
            anchors.margins: 10

            MyButton{
                id: _addButton
                text: "Add task"
                onClicked: {
                    //_tskManager.createNewTask()
                    var component = Qt.createComponent("NewTaskWindow.qml")
                    var window    = component.createObject(_mainWindow)
                    window.show()
                }

            }

            Rectangle {

                Layout.fillHeight: true
                Layout.fillWidth: true
                border.width: 1
                border.color: "#747b7c"
                color: "#20000000"

                ListModel {
                    id: _lstModel

                    Component.onCompleted:
                            {
                                for(var i = 0; i < _tskManager.count(); ++i)
                                {
                                    _lstModel.append({
                                         "task":_tskManager.getItemName(i),
                                         "date":_tskManager.getItemDate(i),
                                         "progress":_tskManager.getItemProgress(i)+"/10"
                                        });
                                }
                            }
                }


                Component {
                    id: taskDelegate
                    Item {
                        width: 180; height: 50
                        Column {
                            Text { text: '<b>Name:</b> ' + task }
                            Text { text: '<b>Date:</b> ' + date }
                            Text { text: '<b>Progress:</b> ' + progress }
                        }
                    }
                }

                ListView {
                    anchors.fill: parent
                    model: _lstModel
                    delegate: taskDelegate
                    clip: true
                }
            }


         }


}
