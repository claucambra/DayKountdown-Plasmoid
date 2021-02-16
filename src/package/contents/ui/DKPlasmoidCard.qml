/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2

import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kirigami 2.13 as Kirigami

// Delegate is how the information will be presented in the ListView
PlasmaExtras.ListItem {
	id: kountdownDelegate
	// implicitWidth/Height define the natural width/height of an item if no width or height is specified
	// The setting below defines a component's preferred size based on its content
	width: parent.width
	height: delegateLayout.height
	
	GridLayout {
		id: delegateLayout
		
		anchors {
			left: parent.left
			right: parent.right
		}
		
		rowSpacing: Kirigami.Units.largeSpacing
		columnSpacing: Kirigami.Units.largeSpacing
		columns: 2
		
		RowLayout {
			Layout.minimumWidth: Kirigami.Units.gridUnit * 4
			Layout.maximumWidth: Layout.minimumWidth
			clip: true
			Rectangle {
				Layout.fillHeight: true
				width: 5
				color: colour
			}
			Kirigami.Heading {
				Layout.fillHeight: true
				Layout.fillWidth: true
				level: 1
				text: daysLeftString(date)
				wrapMode: Text.WordWrap
				color: colour
			}
		}
		
		// Layout for positioning elements vertically
		ColumnLayout {
			Layout.fillWidth: true
			Kirigami.Heading {
				Layout.fillWidth: true
				level: 2
				wrapMode: Text.Wrap
				text: name
			}
			Controls.Label {
				Layout.fillWidth: true
				wrapMode: Text.WordWrap
				text: description
				opacity: 0.7
				visible: description.length > 0
			}
		}
	}
}

