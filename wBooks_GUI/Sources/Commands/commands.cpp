#include "Headers/Commands/commands.h"

MoveCommand::MoveCommand(QString oldState,
                         QUndoCommand *parent)
    : QUndoCommand(parent)
{
    oldPageState = oldState;
}

void MoveCommand::undo()
{

}

void MoveCommand::redo()
{

}

