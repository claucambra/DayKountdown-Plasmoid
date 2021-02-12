import QtQuick 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {

	Component.onCompleted: {
		plasmoid.nativeInterface.initDb()
	}
	
	ListView {
		model: KountdownModel
		delegate: Text {
			text: name
		}
    }
	
}
