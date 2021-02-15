/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.6
import QtQuick.Layouts 1.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.kirigami 2.13 as Kirigami 

Item {
	property int cfg_pinnedDk: plasmoid.configuration.pinnedDk
	property var pinnedKountdown: plasmoid.nativeInterface.KountdownModel.getKountdownByIndex(cfg_pinnedDk)
	Layout.preferredWidth: Kirigami.Units.gridUnit * 10
    Layout.preferredHeight: Kirigami.Units.gridUnit * 4
	
	/* pinnedKountdown array contains:
	 * 0. ID
	 * 1. NAME
	 * 2. DESCRIPTION
	 * 3. DATE
	 * 4. DATE_IN_MS
	 * 5. COLOUR
	 */ 
	
	ColumnLayout {
		clip: true
		width: parent.width
		height: parent.height
		PlasmaComponents.Label {
			Layout.fillWidth: true
			text: pinnedKountdown[1]
		}
		PlasmaComponents.Label {
			Layout.fillWidth: true
			text: daysLeftString(new Date(pinnedKountdown[3]))
		}
	}
}
