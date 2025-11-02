#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QDir>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QTranslator translator;
    const QString locale = "fa_FA";
    const QString translationPath = QDir(QCoreApplication::applicationDirPath()).filePath(".");
    if (translator.load(QString("app_%1.qm").arg(locale), translationPath)) {
        app.installTranslator(&translator);
    }

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Tap30pp", "Main");

    return app.exec();
}
