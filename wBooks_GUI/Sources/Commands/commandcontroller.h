#ifndef COMMANDCONTROLLER_H
#define COMMANDCONTROLLER_H

#include <QObject>
#include <QUndoCommand>

class CommandController : public QObject
{
    Q_OBJECT
public:
    explicit CommandController(QObject *parent = nullptr);

};

#endif // COMMANDCONTROLLER_H
