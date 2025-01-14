QT += quick  core widgets svg xml printsupport

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0  

include(vendor/vendor.pri)

SOURCES += \
        $$files(Sources/*.cpp)\
        $$files(Sources/Downloader/*.cpp)\
        $$files(Sources/PdfHandler/*.cpp)\
        $$files(Sources/EpubHandler/*.cpp)\
        $$files(Sources/TreeItem/*.cpp)\
        $$files(Sources/Commands/*.cpp)\
        desktopfunctions.cpp \
        main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    $$files(Headers/*.h)\
    $$files(Headers/Downloader/*.h)\
    $$files(Headers/PdfHandler/*.h)\
    $$files(Headers/EpubHandler/*.h)\
    $$files(Headers/TreeItem/*.h)\
    $$files(Headers/Commands/*.h)\
    desktopfunctions.h

win32: LIBS += $$PWD/libpoppler-qt5-1.dll
