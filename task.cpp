#include "task.h"

Task::Task(): progress(0)
{

}

QString Task::getName() const
{
    return name;
}

void Task::setName(const QString &value)
{
    name = value;
}

QDate Task::getDate() const
{
    return date;
}

void Task::setDate(const QDate &value)
{
    date = value;
}

int Task::getProgress() const
{
    return progress;
}

void Task::setProgress(int value)
{
    progress = value;
}
