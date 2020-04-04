# meta-somlabs-demo
Yocto demo layer for SOMLabs boards 

provides:
- custom Linux distro example with linux framebuffer/DRM display support
- network interfaces config + WiFi Access Point setup
- example web interface with led control and system info
- QT5 demo application with LCD touch controller support

To bulid use following Yocto layers set in your bblayers.conf file:
```
YOCTO_ROOT = "${@os.path.abspath(os.path.join("${TOPDIR}", os.pardir))}"

BBLAYERS ?= " \
  ${YOCTO_ROOT}/poky/meta \
  ${YOCTO_ROOT}/poky/meta-poky \
  ${YOCTO_ROOT}/poky/meta-openembedded/meta-oe \
  ${YOCTO_ROOT}/poky/meta-openembedded/meta-networking \
  ${YOCTO_ROOT}/poky/meta-openembedded/meta-python \
  ${YOCTO_ROOT}/poky/meta-freescale \
  ${YOCTO_ROOT}/poky/meta-qt5 \
  ${YOCTO_ROOT}/poky/meta-somlabs-bsp \
  ${YOCTO_ROOT}/poky/meta-somlabs-demo \
  "
  ```
  
Set distro to `DISTRO ?= "visionsom-linux"`inside local.conf file

And start build using:
`bitbake visionsom-linux-image`
