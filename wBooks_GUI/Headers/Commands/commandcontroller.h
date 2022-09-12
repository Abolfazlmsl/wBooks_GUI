#ifndef COMMANDCONTROLLER_H
#define COMMANDCONTROLLER_H

#include <QObject>
#include <QUndoStack>
#include <QUndoCommand>

#include "commands.h"

class CommandController : public QObject
{
    Q_OBJECT
public:
    explicit CommandController(QObject *parent = nullptr);

public slots:
    void changePage(QString oldPage);
    QString undoPage();

private:
    QUndoStack *undoStack = nullptr;
};

#endif // COMMANDCONTROLLER_H
