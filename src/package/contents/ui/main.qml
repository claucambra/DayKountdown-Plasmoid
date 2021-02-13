import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
	property var nowDate: new Date()
	Timer {
		interval: 60000
		running: true
		repeat: true
		onTriggered: nowDate = new Date()
	}
	
    //Plasmoid.compactRepresentation: CompactRepresentation {}
    Plasmoid.fullRepresentation: FullRepresentation {}
    Component.onCompleted: console.log(plasmoid.nativeInterface.dbError)
}
