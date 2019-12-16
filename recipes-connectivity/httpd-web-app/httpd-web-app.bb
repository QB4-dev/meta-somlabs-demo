SUMMARY = "device web interface"
SECTION = "examples"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

PR = "r1"

SRC_URI += "file://www"

S = "${WORKDIR}"


do_install() {
	install -d ${D}/srv/www/
	cp -r     ${WORKDIR}/www ${D}/srv/
	ln -s -r  ${D}/var/log/  ${D}/srv/www/log
}

FILES_${PN} += "/srv/www/*"
RDEPENDS_${PN} += "busybox-httpd"
