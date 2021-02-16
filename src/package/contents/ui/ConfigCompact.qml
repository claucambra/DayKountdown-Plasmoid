/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.15
import QtQuick.Controls 2.5 as Controls
import QtQuick.Layouts 1.2

import org.kde.plasma.core 2.0 as PlasmaCore
//import org.kde.kirigami 2.5 as Kirigami

/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.15
import QtQuick.Controls 2.5 as Controls
import QtQuick.Layouts 1.2 as Layouts

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.kirigami 2.5 as Kirigami

Kirigami.FormLayout {
	id: configCompact
	
	anchors.left: parent.left
	anchors.right: parent.right
	
	property alias cfg_pinnedDk: pinnedDk.currentIndex
	property alias cfg_nameVisible: nameVisible.checked

	Controls.ScrollView {
		Kirigami.FormData.label: i18n("Pinned kountdown:")
		Layout.minimumWidth: parent.width / 2
		
		background: Rectangle {
			SystemPalette {id: palette}
			width: parent.width
			height: parent.height
			color: palette.base
		}
		
		ListView {
			id: pinnedDk
			Layout.fillWidth: true
			currentIndex: plasmoid.configuration.pinnedDk
			model: plasmoid.nativeInterface.KountdownModel
			delegate: Kirigami.BasicListItem {
				label: index + ": " + name
			}
		}
	}
	Controls.CheckBox {
		id: nameVisible
		Kirigami.FormData.label: i18n("Name visible:")
		checked: plasmoid.configuration.nameVisible
	}
}
