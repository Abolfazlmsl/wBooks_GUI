#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFontDatabase>
#include <QQmlContext>
#include <QIcon>

#include "desktopfunctions.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    qputenv("QT_QUICK_CONTROLS_STYLE", "material");

    QQmlApplicationEngine engine;

    //-- QSetting configuration --//
    QCoreApplication::setOrganizationName("wBooks_GUI");
    QCoreApplication::setOrganizationDomain("");
    QCoreApplication::setApplicationName("wBooks_GUI");

    auto offlineStoragePath = engine.offlineStoragePath();
    engine.rootContext()->setContextProperty("offlineStoragePath", offlineStoragePath);

    qmlRegisterType<desktopFunctions>("com.desktopFunctions", 1, 0, "Desktopfunctions");

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    //-- windows icon --//
    app.setWindowIcon(QIcon(":/Images/Wbooks1.png"));

    return app.exec();
}
