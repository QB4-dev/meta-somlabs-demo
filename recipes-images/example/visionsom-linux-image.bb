DESCRIPTION = "visionSOM example image"
LICENSE = "MIT"

IMAGE_FEATURES += " \
    splash \
"

IMAGE_LINGUAS = "pl-pl"

inherit core-image 

SYSTEM_TOOLS_INSTALL = " \
    os-release \
    tzdata \
    devmem2 \
    evtest \
    fb-test \
    mtd-utils \
    cronie \
" 

NETWORK_APP = " \
    init-ifupdown \
    dropbear \
    openssh-sftp-server \
    httpd-web-app \
"

GSTREAMER_SUPPORT = " \
    gstreamer1.0 \
    gst1.0-fsl-plugin \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad  \
    gstreamer1.0-plugins-imx  \
"

UTILITIES_INSTALL = " \
    coreutils \
    gdbserver \
    ldd \
    util-linux \
    visionsom-ui \
"

WIFI_AP_SUPPORT = " \
    hostapd \
    busybox-udhcpd \
"

QT_LIBS = " \
    qt5-env \
    qtbase \
    qtbase-tools \
    qtbase-plugins \
    qtserialport \
    qtsvg \
    qtsvg-plugins \
    qtquickcontrols2 \
"

FONTS = " \
    fontconfig \
    fontconfig-utils \
    liberation-fonts \
"
 
IMAGE_INSTALL += " \
    ${SYSTEM_TOOLS_INSTALL} \
    ${UTILITIES_INSTALL} \
    ${GSTREAMER_SUPPORT} \
    ${NETWORK_APP}  \
    ${WIFI_AP_SUPPORT}  \
    ${FONTS} \
    ${QT_LIBS} \
"

#always add cmake to sdk
TOOLCHAIN_HOST_TASK_append = " nativesdk-cmake"

#remove conflicting packages from toolchain
TOOLCHAIN_HOST_TASK_remove = " dropbear dropbear-dev "
TOOLCHAIN_TARGET_TASK_remove = " dropbear dropbear-dev "

#add Qt5 toolchain to SDK
inherit populate_sdk_qt5

