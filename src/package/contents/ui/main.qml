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
	
	property bool errorLaunchingDK: false
	property string errorMessageDKLaunch
	
	Component.onCompleted: {
		plasmoid.nativeInterface.setDbPath(plasmoid.configuration.dbPath)
		plasmoid.nativeInterface.updateKountdownModel()
		plasmoid.setAction("launchFullDK", i18n("Open DayKountdown app"))
	}
	
	PlasmaCore.DataSource {
		id: executable
		engine: "executable"
		onNewData: {
			var exitCode = data["exit code"]
			exited(sourceName, exitCode)
			disconnectSource(sourceName) // cmd finished
		}
		function exec(cmd) {
			if (cmd) {
				connectSource(cmd)
			}
		}
		signal exited(string cmd, int exitCode)
		onExited: {
			if (exitCode != 0) {
				var message = i18n("Error opening DayKountdown.")
				if(exitCode == 127) {
					message += i18n("\nCouldn't find application binary. Have you installed DayKountdown?")
				}
				errorMessageDKLaunch = message
				errorLaunchingDK = true
			}
		}
	}
	
	function action_launchFullDK() {
		executable.exec("daykountdown")
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
		var daysLeft = Math.ceil((inDate.getTime()-nowDate.getTime())/86400000)
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
