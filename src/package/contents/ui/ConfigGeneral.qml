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
	
	anchors.left: parent.left
	anchors.right: parent.right
	
	property alias cfg_dbPath: dbPath.text
	property alias cfg_pinnedDk: pinnedDk.currentIndex
	
	RowLayout {
		Kirigami.FormData.label: i18n("Database path:")
		Controls.TextField {
			id: dbPath
			Layout.fillWidth: true
			text: plasmoid.nativeInterface.dbPath
			onAccepted: {
				cfg_dbPath = this.text
				plasmoid.nativeInterface.setDbPath(cfg_dbPath)
				plasmoid.nativeInterface.updateKountdownModel()
			}
		}
		Controls.Button {
			id: resetPathButton
			icon.name: "edit-reset"
			onClicked: dbPath.text = plasmoid.nativeInterface.getStdDbPath()
		}
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
			id: pinnedDk
			width: parent.width
			height: parent.height
			
			model: plasmoid.nativeInterface.KountdownModel
			delegate: Kirigami.BasicListItem {
				label: index + ": " + name
			}
		}
	}
}
