/*
 * SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
 * 
 * SPDX-LicenseRef: GPL-3.0-or-later
 */

import QtQuick 2.6
import QtQuick.Layouts 1.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.kirigami 2.13 as Kirigami 

PlasmaComponents3.Page {
	id: fullMain
	
	anchors.fill: parent
	Layout.preferredWidth: units.gridUnit * 16
	Layout.preferredHeight: units.gridUnit * 18
	Layout.minimumWidth: units.gridUnit * 14
	Layout.minimumHeight: units.gridUnit * 14
	
	header: PlasmaExtras.PlasmoidHeading {
		id: headerArea
		
		RowLayout {
			width: parent.width
			
			PlasmaExtras.Heading {
				Layout.fillWidth: true
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
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Creation (ascending)")
						onClicked: {
							sortedDkModel.sortColumn = 0
							sortedDkModel.sortOrder = "AscendingOrder"
							cardsView.forceLayout()
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Creation (descending)")
						onClicked: {
							sortedDkModel.sortColumn = 0
							sortedDkModel.sortOrder = "DescendingOrder"
							cardsView.forceLayout()
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Date (ascending)")
						onClicked: {
							sortedDkModel.sortColumn = 4
							// Ms since epoch, so small number = sooner date
							sortedDkModel.sortOrder = "DescendingOrder"
							cardsView.forceLayout()
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Date (descending)")
						onClicked: {
							sortedDkModel.sortColumn = 4
							sortedDkModel.sortOrder = "AscendingOrder"
							cardsView.forceLayout()
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Alphabetical (ascending)")
						onClicked: {
							sortedDkModel.sortColumn = 1
							sortedDkModel.sortOrder = "AscendingOrder"
							cardsView.forceLayout()
						}
					}
					PlasmaComponents.MenuItem {
						text: i18nc("@action:button", "Alphabetical (descending)")
						onClicked: {
							sortedDkModel.sortColumn = 1
							sortedDkModel.sortOrder = "DescendingOrder"
							cardsView.forceLayout()
						}
					}
				}
			}
			PlasmaComponents3.ToolButton {
				id: openDKButton
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
			Layout.topMargin: Kirigami.Units.smallSpacing
			
			ListView {
				id: cardsView
				anchors.fill: parent
				// Model contains info to be displayed
				model: PlasmaCore.SortFilterModel {
					id: sortedDkModel
					sourceModel: plasmoid.nativeInterface.KountdownModel
				}
				delegate: DKPlasmoidCard {}
				
				spacing: Kirigami.Units.largeSpacing
				
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
	
	Connections {
		target: plasmoid.nativeInterface.KountdownModel
		onKountdownModelChanged: cardsView.forceLayout()
	}
}
