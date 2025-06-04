#include "mainwindow.h"

#include <QApplication>
#include <QNetworkAccessManager>
#include <QNetworkReply>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    w.show();

	QNetworkAccessManager *manager = new QNetworkAccessManager(&w);
	QObject::connect(manager, &QNetworkAccessManager::finished, [](QNetworkReply *reply) {
		QString response = reply -> readAll();
		qDebug() << response;
		reply -> deleteLater();
	});

	manager -> get(QNetworkRequest(QUrl("http://www.baidu.com")));

    return a.exec();
}
