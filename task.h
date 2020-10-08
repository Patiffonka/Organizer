#ifndef TASK_H
#define TASK_H

#include <QObject>
#include <QDate>

class Task : public QObject
{
    Q_OBJECT
public:
    Task();

    QString getName() const;
    void setName(const QString &value);

    QDate getDate() const;
    void setDate(const QDate &value);

    int getProgress() const;
    void setProgress(int value);

private:
    QString name;
    QDate date;
    int progress;
};

#endif // TASK_H
