include(../../AuTerm-includes.pri)

QT += gui widgets serialport network bluetooth

TEMPLATE = lib

CONFIG += plugin
CONFIG += c++17

INCLUDEPATH    += ../../AuTerm
TARGET          = $$qtLibraryTarget(plugin_mcumgr)

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    bluetooth_setup.cpp \
    error_lookup.cpp \
    plugin_mcumgr.cpp \
    smp_bluetooth.cpp \
    smp_error.cpp \
    smp_group_fs_mgmt.cpp \
    smp_group_os_mgmt.cpp \
    smp_group_shell_mgmt.cpp \
    smp_group_stat_mgmt.cpp \
    smp_message.cpp \
    smp_processor.cpp \
    smp_uart.cpp \
    smp_group_img_mgmt.cpp \
    smp_udp.cpp

HEADERS += \
    ../../AuTerm/AutPlugin.h \
    bluetooth_setup.h \
    error_lookup.h \
    plugin_mcumgr.h \
    smp_bluetooth.h \
    smp_error.h \
    smp_group_array.h \
    smp_group_fs_mgmt.h \
    smp_group_os_mgmt.h \
    smp_group_shell_mgmt.h \
    smp_group_stat_mgmt.h \
    smp_message.h \
    smp_processor.h \
    smp_transport.h \
    smp_uart.h \
    smp_group.h \
    smp_group_img_mgmt.h \
    smp_udp.h

DISTFILES += plugin_mcumgr.json

# Default rules for deployment.
unix {
    target.path = $$[QT_INSTALL_PLUGINS]/plugin_mcumgr
}
!isEmpty(target.path): INSTALLS += target

CONFIG += install_ok  # Do not cargo-cult this!

# Common build location
CONFIG(release, debug|release) {
    DESTDIR = ../../release
} else {
    DESTDIR = ../../debug

    # The following form is only used for creating the GUI in Qt Creator, it is
    # not used by any part of the code in a normal build, therefore only build
    # this in debug mode.
    SOURCES += \
        form.cpp

    HEADERS += \
        form.h

    FORMS += \
        form.ui
}

# Do not prefix with lib for non-static builds
!contains(CONFIG, static) {
    CONFIG += no_plugin_name_prefix
}

FORMS += \
	bluetooth_setup.ui \
	error_lookup.ui
