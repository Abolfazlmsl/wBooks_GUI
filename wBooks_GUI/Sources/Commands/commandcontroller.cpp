#include "Headers/Commands/commandcontroller.h"

CommandController::CommandController(QObject *parent)
    : QObject{parent}
{
    undoStack = new QUndoStack(this);
}

void CommandController::changePage(QString oldPage)
{
    QUndoCommand *moveCommand = new MoveCommand(oldPage);
    moveCommand->setText(oldPage);
    undoStack->push(moveCommand);
}

QString CommandController::undoPage()
{
    undoStack->undo();
    return undoStack->text(undoStack->index());
}
