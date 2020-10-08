#ifndef TASKMANAGER_H
#define TASKMANAGER_H

#include <QObject>
#include "task.h"

class TaskManager : public QObject
{
    Q_OBJECT

public:
    explicit TaskManager(QObject *parent = nullptr);

    Q_INVOKABLE int count();
    Q_INVOKABLE QString getItemName(int index);
    Q_INVOKABLE QString getItemDate(int index);
    Q_INVOKABLE QString getItemProgress(int index);
    Q_INVOKABLE void createNewTask(QString name, QString date, int progress);

private:
    QList<Task*> taskList;

signals:
    void taskCreated(QString name, QString date, QString progress);


};

#endif // TASKMANAGER_H
