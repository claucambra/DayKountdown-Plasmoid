// SPDX-FileCopyrightText: 2021 Carl Schwan <carl@carlschwan.eu>
// SPDX-FileCopyrightText: 2021 Claudio Cambra <claudio.cambra@gmail.com>
//
// SPDX-LicenseRef: GPL-3.0-or-later

#ifndef KOUNTDOWNMODEL_H
#define KOUNTDOWNMODEL_H

#include <QAbstractListModel>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlTableModel>

/**
* @brief Store all the kountdowns.
*/
class KountdownModel : public QSqlTableModel
{
	// Macro that enables wide-ranging object functionality provided by Qt
	Q_OBJECT

public:
	enum Roles {
		NameRole = Qt::UserRole + 1,
		DescriptionRole,
		DateRole,
		DateInMsRole,
		ColourRole,
	};

public:
	// Constructor function
	KountdownModel(QObject *parent = nullptr);

	// Destructor function
	virtual ~KountdownModel() override = default;

	QHash<int, QByteArray> roleNames() const override;
	QVariant data(const QModelIndex &index, int role) const override;

	// Q_INVOKABLE methods can be called within the QML
	Q_INVOKABLE QVariantList getKountdownByIndex(int index);
	Q_INVOKABLE void listAllKountdowns();

private:
	QSqlDatabase m_db;
};

#endif
