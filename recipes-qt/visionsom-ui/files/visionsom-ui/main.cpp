#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "gpioled.h"
#include "wifiap.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<gpioLED>("Gpio_LED", 1, 0, "Gpio_LED");
    qmlRegisterType<wifiAP>("WifiAP", 1, 0, "WifiAP");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
