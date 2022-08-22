#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QQmlContext>
#include <QIcon>

#include "desktopfunctions.h"
#include <Headers/widget.h>
#include <Headers/Downloader/downloadcontroller.h>
#include <Headers/PdfHandler/pdfModel.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    qputenv("QT_QUICK_CONTROLS_STYLE", "material");

    QQmlApplicationEngine engine;

    qmlRegisterType<Widget>("com.EpubWidget", 1, 0, "EpubWidget");
    qmlRegisterType<PdfModel>("org.pdfviewer.poppler", 1, 0, "Poppler");

    downloadcontroller downloader;
    engine.rootContext()->setContextProperty("downloader", &downloader);

    auto offlineStoragePath = engine.offlineStoragePath();
    engine.rootContext()->setContextProperty("offlineStoragePath", offlineStoragePath);

    //-- QSetting configuration --//
    QCoreApplication::setOrganizationName("wBooks_GUI");
    QCoreApplication::setOrganizationDomain("");
    QCoreApplication::setApplicationName("wBooks_GUI");

    qmlRegisterType<desktopFunctions>("com.desktopFunctions", 1, 0, "Desktopfunctions");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    //-- windows icon --//
    app.setWindowIcon(QIcon(":/Images/Logo3.png"));

    return app.exec();
}
