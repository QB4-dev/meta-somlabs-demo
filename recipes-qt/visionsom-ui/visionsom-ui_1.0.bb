SUMMARY = "Qt5 visionsom UI"
DESCRIPTION = " \
    visionsom user interface demo Qt5 with QtQuick2  \
"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

DEPENDS += "qtbase qtquickcontrols2"

SRC_URI = "\
   file://visionsom-ui.tar.xz   \
   file://visionsom-ui-start.sh \
"

S = "${WORKDIR}"

inherit qmake5

do_install_append() {
    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc5.d
    install -d ${D}${sysconfdir}/rc6.d
    install -m 644 ${WORKDIR}/visionsom-ui-start.sh   ${D}${sysconfdir}/init.d/visionsom-ui
    chmod a+x ${D}${sysconfdir}/init.d/visionsom-ui
    ln -s -r  ${D}${sysconfdir}/init.d/visionsom-ui   ${D}${sysconfdir}/rc5.d/S25visionsom-ui
    ln -s -r  ${D}${sysconfdir}/init.d/visionsom-ui   ${D}${sysconfdir}/rc6.d/K10visionsom-ui
}

FILES_${PN} += "/opt"
FILES_${PN} += "/etc"
