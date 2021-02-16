/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.15
import QtQuick.Layouts 1.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3

MouseArea {
	id: compactMain
	property var pinnedKountdown: plasmoid.nativeInterface.KountdownModel.getKountdownByIndex(plasmoid.configuration.pinnedDk)
	property bool nameVisible: plasmoid.configuration.nameVisible
	
	Layout.minimumWidth: nameLabel.visible ? units.gridUnit * 9 : units.gridUnit * 6
    Layout.maximumWidth: Layout.minimumWidth
    
    onClicked: plasmoid.expanded = !plasmoid.expanded
	
	/* pinnedKountdown array contains:
	 * 0. ID
	 * 1. NAME
	 * 2. DESCRIPTION
	 * 3. DATE
	 * 4. DATE_IN_MS
	 * 5. COLOUR
	 */ 
	
	RowLayout {
		id: compactLayout
		width: parent.width
		height: parent.height
		spacing: 5
		
		PlasmaComponents.Label {
			id: nameLabel
			Layout.fillHeight: true
			Layout.maximumWidth: parent.width/3
			text: pinnedKountdown[1]
			wrapMode: Text.Wrap
			elide: Text.ElideRight
			verticalAlignment: Text.AlignVCenter
			visible: nameVisible
		}
		PlasmaComponents.Label {
			id: daysLabel
			Layout.fillWidth: true
			Layout.fillHeight: true
			text: daysLeftString(new Date(pinnedKountdown[3]))
			fontSizeMode: Text.Fit
			minimumPixelSize: 10
			font.pixelSize: 1024
			horizontalAlignment: Text.AlignHCenter
			verticalAlignment: Text.AlignVCenter
		}
	}
}
