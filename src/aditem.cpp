#include "aditem.h"
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>
#include <QUrl>

AdItem::AdItem(QObject *parent)
    : QObject{parent}
{
    QFile f(":/data.json");
    if (!f.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to read database";
    } else {
        auto data = f.readAll();
        f.close();

        QJsonParseError err;
        QJsonDocument doc = QJsonDocument::fromJson(data, &err);
        if (err.error != QJsonParseError::NoError) {
            qWarning() << "Failed to parse document: " << err.errorString();
        } else {
            auto home = doc.object().value("home").toObject();
            auto ad = home.value("header").toObject();
            setTitle(ad.value("title").toString());
            setSubTitle(ad.value("sub-title").toString());
            setImage(ad.value("image").toString());
            // auto action = ad.value("action").toObject();
            setAction(ad.value("action").toString());
            setActionTitle(ad.value("action-title").toString());
            setForeground(ad.value("fg-color").toString());
            setBackground(ad.value("bg-color").toString());
        }
    }
}

QString AdItem::title() const
{
    return m_title;
}

void AdItem::setTitle(const QString &title)
{
    if (m_title != title) {
        m_title = title;
        Q_EMIT titleChanged(title);
    }
}

QString AdItem::subTitle() const
{
    return m_subTitle;
}

void AdItem::setSubTitle(const QString &subTitle)
{
    if (m_subTitle != subTitle) {
        m_subTitle = subTitle;
        Q_EMIT subTitleChanged(subTitle);
    }
}

QUrl AdItem::image() const
{
    return m_image;
}

void AdItem::setImage(const QUrl &url)
{
    if (m_image != url) {
        m_image = url;
        Q_EMIT imageChanged(url);
    }
}

QUrl AdItem::action() const
{
    return m_action;
}

void AdItem::setAction(const QUrl &url)
{
    if (m_action != url) {
        m_action = url;
        Q_EMIT actionChanged(url);
    }
}

QString AdItem::actionTitle() const
{
    return m_actionTitle;
}

void AdItem::setActionTitle(const QString &title)
{
    if (m_actionTitle != title) {
        m_actionTitle = title;
        Q_EMIT actionTitleChanged(title);
    }
}

QString AdItem::foreground() const
{
    return m_foreground;
}

void AdItem::setForeground(const QString &foreground)
{
    if (m_foreground != foreground) {
        m_foreground = foreground;
        Q_EMIT foregroundChanged(foreground);
    }
}

QString AdItem::background() const
{
    return m_background;
}

void AdItem::setBackground(const QString &background)
{
    if (m_background != background) {
        m_background = background;
        Q_EMIT backgroundChanged(background);
    }
}
