import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kirigami 2.13 as Kirigami 

Item {
	id: fullResLayout
	anchors.fill: parent
	Layout.preferredWidth: Kirigami.Units.gridUnit * 16
	Layout.preferredHeight: Kirigami.Units.gridUnit * 56
	
	ListModel {
		id: kountdownModel
		ListElement {
			name: "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
			description: "goobye"
			date: 1
			colour: "blue"
		}
		ListElement {
			name: "HellOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
			description: "goobye"
			date: 1
			colour: "blue"
		}
		ListElement {
			name: "Hel"
			description: "goobye"
			date: 1
			colour: "blue"
		}
		ListElement {
			name: "He"
			description: "goobye"
			date: 1
			colour: "blue"
		}
	}
	
	PlasmaExtras.ScrollArea {
		id: scrollArea
		anchors.fill: parent
		ListView {
			id: layout
			anchors.fill: parent
			// Model contains info to be displayed
			model: kountdownModel
			// Grabs component from different file specified in resources
			delegate: DKPlasmoidCard {}
		}
	}
}
