set(daykountdown-plasmoid_SRCS
	kountdownmodel.cpp
	dkplasmoid.cpp
)
add_library(plasma_applet_daykountdown MODULE ${daykountdown-plasmoid_SRCS})

kcoreaddons_desktop_to_json(plasma_applet_daykountdown package/metadata.desktop SERVICE_TYPES plasma-applet.desktop)

target_link_libraries(plasma_applet_daykountdown
                      Qt5::Gui
                      Qt5::Sql
                      KF5::Plasma
                      KF5::I18n)

install(TARGETS plasma_applet_daykountdown DESTINATION ${KDE_INSTALL_PLUGINDIR}/plasma/applets)

plasma_install_package(package org.kde.daykountdown-plasmoid)
