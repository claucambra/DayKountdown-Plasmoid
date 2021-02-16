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
	id: mainRoot
	
	Component.onCompleted: {
		plasmoid.nativeInterface.setDbPath(plasmoid.configuration.dbPath)
		plasmoid.nativeInterface.updateKountdownModel()
	}
	
	property var nowDate: new Date()
	Timer {
		interval: 60000
		running: true
		repeat: true
		onTriggered: {
			nowDate = new Date()
		}
	}
	function daysLeftString(inDate) {
		var daysLeft = Math.round((inDate.getTime()-nowDate.getTime())/86400000)
		var daysWord = daysLeft <= -2 || daysLeft >= 2 ? "days" : "day"
		if (daysLeft < 0) 
			return i18n("%1 " + daysWord + " ago", daysLeft*-1) 
		else
			return i18n("%1 " + daysWord, daysLeft)
	}
	
	Plasmoid.switchHeight: units.gridUnit * 10
    Plasmoid.compactRepresentation: CompactRepresentation {}
    Plasmoid.fullRepresentation: FullRepresentation {}
}
