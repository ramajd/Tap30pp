#ifndef ADITEM_H
#define ADITEM_H

#include <QObject>
#include <QQmlEngine>

class AdItem : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged FINAL)
    Q_PROPERTY(QString subTitle READ subTitle WRITE setSubTitle NOTIFY subTitleChanged FINAL)
    Q_PROPERTY(QUrl image READ image WRITE setImage NOTIFY imageChanged FINAL)
    Q_PROPERTY(QUrl action READ action WRITE setAction NOTIFY actionChanged FINAL)
    Q_PROPERTY(QString actionTitle READ actionTitle WRITE setActionTitle NOTIFY actionTitleChanged FINAL)

public:
    explicit AdItem(QObject *parent = nullptr);

    QString title() const;
    void setTitle(const QString& title);

    QString subTitle() const;
    void setSubTitle(const QString& subTitle);

    QUrl image() const;
    void setImage(const QUrl& url);

    QUrl action() const;
    void setAction(const QUrl& url);

    QString actionTitle() const;
    void setActionTitle(const QString& title);


signals:
    void titleChanged(const QString& title);
    void subTitleChanged(const QString& subTitle);
    void imageChanged(const QUrl& url);
    void actionChanged(const QUrl& url);
    void actionTitleChanged(const QString& title);

private:
    QString m_title;
    QString m_subTitle;
    QUrl m_image;
    QUrl m_action;
    QString m_actionTitle;
};

#endif // ADITEM_H
