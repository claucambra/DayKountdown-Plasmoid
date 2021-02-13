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
	
	ColumnLayout {
		anchors.fill: parent
		RowLayout {
			Kirigami.Heading {
				level: 1
				text: i18n("Kountdowns")
				wrapMode: Text.Wrap
			}
			Item {
				Layout.fillWidth: true
				height: addButton.implicitHeight
			}
			Controls.Button {
				id: addButton
				icon.name: "list-add"
				text: i18nc("@action:button", "Add")
			}
		}
		PlasmaExtras.ScrollArea {
			id: scrollArea
			anchors {
				left: parent.left
				right: parent.right
				bottom: parent.bottom
			}
			Layout.fillHeight: true
			ListView {
				id: layout
				anchors.fill: parent
				// Model contains info to be displayed
				model: plasmoid.nativeInterface.KountdownModel
				// Grabs component from different file specified in resources
				delegate: DKPlasmoidCard {}
				spacing: 5
			}
		}
	}
}
