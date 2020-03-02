#ifndef GPIOLED_H
#define GPIOLED_H

#include <QObject>

class gpioLED : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString devPath  READ getDevPath WRITE setDevPath)
    Q_PROPERTY(bool ledState READ getLED WRITE setLED)
public:
    explicit gpioLED(QObject *parent = nullptr);

    QString getDevPath() {return m_dev_path;}
    void setDevPath(QString s) { m_dev_path=s;}

    void setLED(bool state);
    bool getLED(void);
signals:

public slots:
private:
    QString m_dev_path;
};

#endif // GPIOLED_H
