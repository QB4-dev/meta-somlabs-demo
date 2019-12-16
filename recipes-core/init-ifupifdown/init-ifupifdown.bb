SUMMARY = "Network config"
DESCRIPTION = "Default network interfaces config"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

PR = "r0"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:" 

SRC_URI += "file://interfaces"

S = "${WORKDIR}"

do_install_append() { 
    install -d 0755 ${D}${sysconfdir}
    install -d 0755 ${D}${sysconfdir}/network
    install -d 0755 ${D}${sysconfdir}/default/network
    install -m 644  ${WORKDIR}/interfaces  ${D}${sysconfdir}/network/interfaces
    install -m 644  ${WORKDIR}/interfaces  ${D}${sysconfdir}/default/network/interfaces
}

