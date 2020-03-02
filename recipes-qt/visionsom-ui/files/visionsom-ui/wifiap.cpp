#include "wifiap.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>


wifiAP::wifiAP(QObject *parent) : QObject(parent),
    m_ssid("unavailable"),
    m_passwd("unavailable")
{
    QFile file("/etc/hostapd.conf");
    file.open(QIODevice::ReadOnly);
    FILE* fh = fdopen(file.handle(), "r");
    QTextStream in(fh, QIODevice::ReadOnly);
    QString line;

    do {
        line = in.readLine();
        if(line.section('=', 0, 0) == "ssid")
            m_ssid = line.section('=', 1, 1);
        else if(line.section('=', 0, 0) == "wpa_passphrase")
            m_passwd = line.section('=', 1, 1);
    } while (!line.isNull());
    file.close();
}

