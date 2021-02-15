/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigami 2.13 as Kirigami 

Item {
	property int cfg_pinnedDk: plasmoid.configuration.pinnedDk
	property var pinnedKountdown: plasmoid.nativeInterface.KountdownModel.getKountdownByIndex(cfg_pinnedDk)
	Component.onCompleted: {
		console.log(cfg_pinnedDk)
		console.log("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" + pinnedKountdown)
	}
}
