#ifndef WIFIAP_H
#define WIFIAP_H

#include <QObject>

class wifiAP : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString ssid    READ getSSID CONSTANT)
    Q_PROPERTY(QString passwd  READ getPASS CONSTANT)
public:
     explicit wifiAP(QObject *parent = nullptr);

     QString getSSID() {return m_ssid;}
     QString getPASS() {return m_passwd;}
signals:

private:
    QString m_ssid;
    QString m_passwd;
};

#endif // WIFIAP_H
