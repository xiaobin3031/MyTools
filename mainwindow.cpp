#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QWidget *center = new QWidget();

    QListWidget *qList = initNavs();
    qDebug() << "item count: " << qList->count();
    QStackedWidget *stack = initMainPanel();

    QHBoxLayout *mainLayout = new QHBoxLayout(center);
    mainLayout -> addWidget(qList);
    mainLayout -> addWidget(stack);

    QObject::connect(qList, &QListWidget::currentRowChanged, stack, &QStackedWidget::setCurrentIndex);

    setWindowTitle("aaa");
    resize(600, 400);
    setCentralWidget(center);
}

QListWidget *MainWindow::initNavs()
{
    QFont font("Sans", 12);
    QListWidget *qList = new QListWidget;
    qList ->setFont(font);
    qList ->setStyleSheet("");

    QListWidgetItem *item = new QListWidgetItem("Es log");
    item->setForeground(Qt::black);
    item->setSizeHint(QSize(100, 30));
    qList-> addItem(item);

    qList -> setFixedWidth(150);

    return qList;
}

QStackedWidget *MainWindow::initMainPanel()
{
    QStackedWidget *stack = new QStackedWidget;

    return stack;
}

MainWindow::~MainWindow()
{
    delete ui;
}
