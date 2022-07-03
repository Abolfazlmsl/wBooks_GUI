#include "desktopfunctions.h"

desktopFunctions::desktopFunctions(QObject *parent)
    : QObject{parent}
{

}

QString desktopFunctions::copyImagetoDb(QString m_path, QString path, QString fileName)
{

    QString str = path.replace("\\", "/");
    QDir dir = str;
    if(!dir.exists("Images")){
        dir.mkdir("Images");
    }
    QString cPath = str+"/Images/"+fileName;
    QFile::copy(m_path, cPath);
    QString qmlPath = "file:///"+path+"//Images//"+fileName;
    return qmlPath;

}
