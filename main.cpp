#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "tablemodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/QmlTableView/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);


    // Создайте экземпляр модели
    CoeffTableModel model;

    // Зарегистрируйте модель для использования в QML
    qmlRegisterType<CoeffTableModel>("MyApp", 1, 0, "CoeffTableModel");

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("TableViewContext", &model);
    model.sendHeaderData();

//    QList<QVariant> headerData;
//    headerData << "Header1" << "Header2" << "Header3" << "Header4" << "Header5";  // Add your header data
//    model.setHeaderData(headerData);


    engine.load(url);

    return app.exec();
}
