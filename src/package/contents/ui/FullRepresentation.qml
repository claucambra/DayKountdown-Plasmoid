/*
 * SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */

import QtQuick 2.6
import QtQuick.Layouts 1.2
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigami 2.13 as Kirigami 

PlasmaComponents3.Page {
	id: fullMain
	
	anchors.fill: parent
	Layout.preferredWidth: units.gridUnit * 16
	Layout.preferredHeight: units.gridUnit * 18
	Layout.minimumWidth: units.gridUnit * 12
	Layout.minimumHeight: units.gridUnit * 14
	
	header: PlasmaExtras.PlasmoidHeading {
		id: headerArea
		
		RowLayout {
			width: parent.width
			
			PlasmaExtras.Heading {
				level: 1
				text: i18n("Kountdowns")
				wrapMode: Text.Wrap
			}

			PlasmaComponents3.ToolButton {
				id: overflowMenu
				icon.name: "view-sort-descending"
				PlasmaComponents3.ToolTip {
					text: i18n("Sort kountdowns")
				}
				onClicked: {
					menu.open(overflowMenu, overflowMenu.height)
				}
				PlasmaComponents.ContextMenu {
					id: menu
					property var km: plasmoid.nativeInterface.KountdownModel
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Creation (ascending)")
						onClicked: {
							// Look at enums in kountdownmodel.cpp to understand the nums
							parent.km.sortModel(0)
							cardsView.forceLayout();
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Creation (descending)")
						onClicked: {
							parent.km.sortModel(1)
							cardsView.forceLayout();
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Date (ascending)")
						onClicked: {
							parent.km.sortModel(2)
							cardsView.forceLayout();
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Date (descending)")
						onClicked: {
							parent.km.sortModel(3)
							cardsView.forceLayout();
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Alphabetical (ascending)")
						onClicked: {
							parent.km.sortModel(4)
							cardsView.forceLayout();
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Alphabetical (descending)")
						onClicked: {
							parent.km.sortModel(5)
							cardsView.forceLayout();
						}
					}
				}
			}
			PlasmaComponents3.ToolButton {
				id: refreshButton
				icon.name: "view-refresh"
				onClicked: cardsView.forceLayout();
				PlasmaComponents3.ToolTip {
					text: i18n("Refresh")
				}
			}
			PlasmaComponents3.ToolButton {
				id: addButton
				icon.name: "document-properties"
				onClicked: plasmoid.action("launchFullDK").trigger()
				PlasmaComponents3.ToolTip {
                    text: plasmoid.action("launchFullDK").text
                }
			}
		}
	}
	
	
	ColumnLayout {
		id: fullResLayout
		anchors.fill: parent
		PlasmaExtras.ScrollArea {
			id: scrollArea
			anchors {
				left: parent.left
				right: parent.right
				bottom: parent.bottom
			}
			Layout.fillHeight: true
			ListView {
				id: cardsView
				anchors.fill: parent
				// Model contains info to be displayed
				model: plasmoid.nativeInterface.KountdownModel
				// Grabs component from different file specified in resources
				delegate: DKPlasmoidCard {}
				spacing: 5
				Kirigami.PlaceholderMessage {
					visible: cardsView.count == 0 ? true : false
					anchors.centerIn: parent
					anchors.left: parent.left
					anchors.right: parent.right
					
					text: {
						if(plasmoid.nativeInterface.dbError === "true") {
							return i18n("An error occurred when trying to read the Kountdown database.")
						} else if (cardsView.count == 0) {
							return i18n("Go add some kountdowns!")
						}
					}
				}
			}
		}
	}
}
