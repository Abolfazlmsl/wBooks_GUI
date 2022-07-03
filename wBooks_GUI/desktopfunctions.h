#ifndef DESKTOPFUNCTIONS_H
#define DESKTOPFUNCTIONS_H

#include <QObject>
#include <QDir>
#include <QFile>
#include <QDebug>

class desktopFunctions : public QObject
{
    Q_OBJECT
public:
    explicit desktopFunctions(QObject *parent = nullptr);

public slots:
    QString copyImagetoDb(QString m_path, QString path, QString fileName);

signals:

};

#endif // DESKTOPFUNCTIONS_H
