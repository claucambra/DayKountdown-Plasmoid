/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
	property string cfg_dbPath: plasmoid.configuration.dbPath
	property string cfg_pinnedDk: plasmoid.configuration.pinnedDk
	
	Component.onCompleted: {
		if(cfg_dbPath === "") {
			cfg_dbPath = plasmoid.nativeInterface.getStdDbPath()
		}
		plasmoid.nativeInterface.setDbPath(cfg_dbPath)
		plasmoid.nativeInterface.updateKountdownModel()
	}
	
	property var nowDate: new Date()
	Timer {
		interval: 60000
		running: true
		repeat: true
		onTriggered: nowDate = new Date()
	}
	
    Plasmoid.compactRepresentation: CompactRepresentation {}
    Plasmoid.fullRepresentation: FullRepresentation {}
    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
}
