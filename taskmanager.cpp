#include "taskmanager.h"

TaskManager::TaskManager(QObject *parent) : QObject(parent)
{
    for (int i=0; i<3; ++i){
       Task* newTask = new Task();
       newTask->setName("Task"+QString::number(i));
       newTask->setDate(QDate(2012, 7, 6));
       newTask->setProgress(1);
       taskList.append(newTask);
    }

}

int TaskManager::count()
{
    return taskList.count();
}

QString TaskManager::getItemName(int index)
{
    return taskList[index]->getName();
}

QString TaskManager::getItemDate(int index)
{
    return taskList[index]->getDate().toString("dd.MM.yyyy");
}

QString TaskManager::getItemProgress(int index)
{
    return QString::number(taskList[index]->getProgress());
}

void TaskManager::createNewTask(QString name, QString date, int progress)
{
    Task* newTask = new Task();

    newTask->setName(name);

    QString date_string = date;

    newTask->setDate(QDate::fromString(date_string,"dd.MM.yyyy"));
    //newTask->setDate(QDateTime(QDate(2012, 7, 6), QTime(8, 30, 0)));
    newTask->setProgress(progress);
    taskList.append(newTask);

    QString newName = newTask->getName();
    QString newDate = newTask->getDate().toString("dd.MM.yyyy");
    QString newProgress = QString::number(newTask->getProgress());

    emit taskCreated(newName, newDate, newProgress);

}




