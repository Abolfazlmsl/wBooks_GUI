#ifndef WIDGET_H
#define WIDGET_H

#include <QQuickItem>
#include <QQuickPaintedItem>
#include <QFileDialog>
#include <QSettings>
#include <QDebug>
#include <QPainter>
#include <QKeyEvent>
#include <QAbstractTextDocumentLayout>
#include <QApplication>
#include <QQmlListProperty>
#include <QJsonObject>
#include <QJsonArray>
#include "Headers/TreeItem/tree_model.h"

class EPubDocument;
class EPubContainer;

class Widget : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(int sliderHeight READ sliderHeight WRITE setSliderHeight NOTIFY sliderHeightChanged)
    Q_PROPERTY(int pageHeight READ pageHeight WRITE setPageHeight NOTIFY pageHeightChanged)
    Q_PROPERTY(int pageNumber READ pageNumber WRITE setPageNumber NOTIFY pageNumberChanged)
    Q_PROPERTY(int blockNumber READ blockNumber WRITE setBlockNumber NOTIFY blockNumberChanged)
    Q_PROPERTY(TreeModel* contents READ contents WRITE setContents NOTIFY contentsChanged)
    QML_ELEMENT

public:
    Widget(QQuickItem *parent = 0);
    ~Widget();

    void setContents(TreeModel* contents)
        {
            m_contents = contents;
            emit contentsChanged(contents);
        }

    TreeModel* contents() const { return m_contents; }

    void setSliderHeight(int sliderHeight)
        {
            m_sliderHeight = sliderHeight;
            emit sliderHeightChanged(sliderHeight);
        }

    int sliderHeight() const { return m_sliderHeight; }

    void setPageHeight(int pageHeight)
        {
            m_pageHeight = pageHeight;
            emit pageHeightChanged(pageHeight);
        }

    int pageHeight() const { return m_pageHeight; }

    void setPageNumber(int pageNumber)
        {
            m_pageNumber = pageNumber;
            emit pageNumberChanged(pageNumber);
        }

    int pageNumber() const { return m_pageNumber; }

    void setBlockNumber(int blockNumber)
        {
            m_blockNumber = blockNumber;
            emit blockNumberChanged(blockNumber);
        }

    int blockNumber() const { return m_blockNumber; }

public slots:
    void setFont(QString font, int fontSize);
    void changeTheme(QString mode);
    void scroll(int amount);
    void scrollSlider(int amount);
    void scrollPage(int amount);
//    bool loadFile();
    bool loadFile(const QString &path);
    void resizeEvent();
    int findBlockNumber(int index);
    void setSetting(QString font, int fontSize, QString mode);
    QString copyBooktoDb(QString path, QString fileName);

protected:
    void paint(QPainter *painter) override;
//    void keyPressEvent(QKeyEvent *event) override;
//    void wheelEvent(QWheelEvent *event) override;

private:
    QAbstractTextDocumentLayout::PaintContext paintContext;
    QImage m_cover;
    EPubDocument *m_document;
    int m_currentChapter;
    int m_yOffset;
    TreeModel* m_contents;
    int m_sliderHeight;
    int m_pageHeight;
    int m_pageNumber;
    int m_blockNumber;

    QString m_path;

    QString themeMode = "Light";
    QString m_font;
    int m_fontSize;

signals:
    void contentsChanged(TreeModel *model);
    void sliderHeightChanged(int);
    void pageHeightChanged(int);
    void pageNumberChanged(int);
    void blockNumberChanged(int);
};

#endif // WIDGET_H
