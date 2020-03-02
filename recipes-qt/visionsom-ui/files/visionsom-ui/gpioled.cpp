#include <QFile>

#include "gpioled.h"

gpioLED::gpioLED(QObject *parent) : QObject(parent)
{

}

void gpioLED::setLED(bool state)
{
    QFile file(m_dev_path+"/brightness");
    file.open(QIODevice::WriteOnly);
    file.write(state?"1":"0", 1);
    file.close();
}

bool gpioLED::getLED(void)
{
    QFile file(m_dev_path+"/brightness");
    char buf[4];

    file.open(QIODevice::ReadOnly);
    file.read(buf,sizeof(buf));
    file.close();

    return (buf[0] != '0');
}
