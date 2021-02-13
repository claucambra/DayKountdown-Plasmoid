add_definitions(-DTRANSLATION_DOMAIN=\"plasma_applet_org.kde.dkplasmoid\")

set(dkplasmoid_SRCS
    dkplasmoid.cpp
    kountdownmodel.cpp
)

add_library(plasma_applet_dkplasmoid MODULE ${dkplasmoid_SRCS})

kcoreaddons_desktop_to_json(plasma_applet_dkplasmoid package/metadata.desktop SERVICE_TYPES plasma-applet.desktop)

target_link_libraries(plasma_applet_dkplasmoid
                      Qt5::Gui
                      Qt5::Quick
                      Qt5::Sql
                      KF5::Plasma
                      KF5::Kirigami2
                      KF5::I18n)

install(TARGETS plasma_applet_dkplasmoid DESTINATION ${KDE_INSTALL_PLUGINDIR}/plasma/applets)

plasma_install_package(package org.kde.dkplasmoid)
