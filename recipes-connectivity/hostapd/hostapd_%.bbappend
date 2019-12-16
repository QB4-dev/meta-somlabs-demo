# WiFi Access Point config
SRC_URI += " \
        file://hostapd.conf \
        file://udhcpd.conf \
        file://hostapd_set_default_ap \
"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

do_install_append(){	
    install -d 0755 ${D}${sysconfdir}/default

    install -m 644  ${WORKDIR}/hostapd.conf  ${D}${sysconfdir}
    install -m 644  ${WORKDIR}/hostapd.conf  ${D}${sysconfdir}/default

    install -m 644  ${WORKDIR}/udhcpd.conf  ${D}${sysconfdir}
    install -m 644  ${WORKDIR}/udhcpd.conf  ${D}${sysconfdir}/default

    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc5.d

    install -m 644 ${WORKDIR}/hostapd_set_default_ap    ${D}${sysconfdir}/init.d/hostapd_set_default_ap
    chmod a+x ${D}${sysconfdir}/init.d/hostapd_set_default_ap 
    ln -s -r  ${D}${sysconfdir}/init.d/hostapd_set_default_ap   ${D}${sysconfdir}/rc5.d/S16hostapd_set_default_ap 
}
