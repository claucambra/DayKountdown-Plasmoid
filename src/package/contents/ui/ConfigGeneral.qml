/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.15
import QtQuick.Controls 2.5 as Controls
import QtQuick.Layouts 1.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.5 as Kirigami

Kirigami.FormLayout {
	id: configGeneral
	
	ListModel {
		id: poopmodel
		ListElement {name: "poop"}
		ListElement {name: "peep"}
	}
	
	anchors.left: parent.left
	anchors.right: parent.right
	
	property string cfg_dbPath: plasmoid.configuration.dbPath
	property string cfg_pinnedDk: plasmoid.configuration.pinnedDk
	
	Controls.TextField {
		id: pathField
		Kirigami.FormData.label: i18n("Database path:")
		text: plasmoid.nativeInterface.dbPath
	}
	
	Controls.ScrollView {
		Layout.fillWidth: true
		Layout.fillHeight: true
		Kirigami.FormData.label: i18n("Pinned kountdown:")
		background: Rectangle {
			SystemPalette {id: palette}
			width: parent.width
			height: parent.height
			color: palette.base
		}
		
		ListView {
			id: kountdownPicker
			width: parent.width
			height: parent.height
			
			highlight: highlight
			
			//model: plasmoid.nativeInterface.KountdownModel
			model: 10
			delegate: Kirigami.BasicListItem {
				label: "Item " + modelData
				onClicked: cfg_pinnedDk = index
			}
		}
	}
}
