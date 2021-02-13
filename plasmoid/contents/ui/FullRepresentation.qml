import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.13 as Kirigami 

Kirigami.CardsListView {
	id: layout
	// Model contains info to be displayed
	model: KountdownModel
	// Grabs component from different file specified in resources
		delegate: DKPlasmoidCard {}
		
		header: Kirigami.Heading {
			padding: {
				top: Kirigami.Units.largeSpacing
			}
			width: parent.width
			horizontalAlignment: Text.AlignHCenter
			// Javascript variables must be prefixed with 'property'
			// Use toLocaleDateString, method to convert date object to string
			text: i18n("Today is %1", nowDate.toLocaleDateString())
			level: 1
			wrapMode: Text.Wrap
		}
		// Different types of header positioning, this one gets covered up when you scroll
		headerPositioning: ListView.PullBackHeader
		
		Kirigami.PlaceholderMessage {
			// Center element, horizontally and vertically
			anchors.centerIn: parent
			width: parent.width - (Kirigami.Units.largeSpacing * 4)
			// Hide this if there are list elements to display
			visible: layout.count === 0
			text: i18n("Add some kountdowns!")
			helpfulAction: addAction
		}
	}
