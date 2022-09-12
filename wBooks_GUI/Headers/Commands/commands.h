#ifndef COMMANDS_H
#define COMMANDS_H

#include <QUndoCommand>
#include <QDebug>

#include "commandcontroller.h"

class MoveCommand : public QUndoCommand
{
public:
    MoveCommand(QString oldState,
                QUndoCommand *parent = nullptr);

    void undo() override;
    void redo() override;
    QString getState(){return oldPageState;};

private:
    QString oldPageState;
};

#endif
