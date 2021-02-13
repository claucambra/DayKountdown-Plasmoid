/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

import QtQuick 2.6
import QtQuick.Controls 2.0 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 2.13 as Kirigami

// Delegate is how the information will be presented in the ListView
Kirigami.AbstractCard {
	id: kountdownDelegate
	width: parent.width
	contentItem: Item {
		// implicitWidth/Height define the natural width/height of an item if no width or height is specified
		// The setting below defines a component's preferred size based on its content
		implicitWidth: delegateLayout.implicitWidth
		implicitHeight: delegateLayout.implicitHeight
		GridLayout {
			id: delegateLayout
			anchors {
				left: parent.left
				top: parent.top
				right: parent.right
			}
			rowSpacing: Kirigami.Units.largeSpacing
			columnSpacing: Kirigami.Units.largeSpacing
			columns: 2
			RowLayout {
				Rectangle {
					Layout.fillHeight: true
					width: 5
					color: colour
				}
				Kirigami.Heading {
					Layout.fillHeight: true
					level: 1
					property var daysLeft: Math.round((date.getTime()-nowDate.getTime())/86400000)
					property var daysWord: daysLeft <= -2 || daysLeft >= 2 ? "days" : "day"
					text: daysLeft < 0 ? 
						i18n("%1 " + daysWord + " ago", daysLeft*-1) : i18n("%1 " + daysWord, daysLeft)
					color: colour
				}
			}
			
			// Layout for positioning elements vertically
			ColumnLayout {
				Kirigami.Heading {
					Layout.fillWidth: true
					level: 2
					wrapMode: Text.Wrap
					text: name
				}
				Kirigami.Separator {
					Layout.fillWidth: true
					visible: description.length > 0
				}
				Controls.Label {
					Layout.fillWidth: true
					wrapMode: Text.WordWrap
					text: description
					visible: description.length > 0
				}
			}
		}
	}
}
