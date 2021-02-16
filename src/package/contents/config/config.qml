/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.0

import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
         name: i18n("General")
         icon: "preferences-desktop-plasma"
         source: "ConfigGeneral.qml"
    }
    ConfigCategory {
         name: i18n("Panel view settings")
         icon: "preferences-desktop"
         source: "ConfigCompact.qml"
    }
}
