/*
* SPDX-FileCopyrightText: (C) 2021 Claudio Cambra <claudio.cambra@gmail.com>
* 
* SPDX-LicenseRef: GPL-3.0-or-later
*/

#include "dkplasmoid.h"
#include <KLocalizedString>

DKPlasmoid::DKPlasmoid(QObject *parent, const QVariantList &args) : Plasma::Applet(parent, args)
{
}

DKPlasmoid::~DKPlasmoid()
{
}

void DKPlasmoid::updateKountdownModel()
{
	QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
	db.setDatabaseName(m_dbPath);
	if (!db.open()) {
		qCritical() << db.lastError() << "while opening database at" << m_dbPath;
		m_dbError = true;
	}
	
	KountdownModel* updatedModel = new KountdownModel(qApp);
	setKountdownModel(updatedModel);
}

void DKPlasmoid::setKountdownModel(KountdownModel* inKountdownModel)
{
	m_KountdownModel = inKountdownModel;
	emit kountdownModelChanged(inKountdownModel);
}

KountdownModel* DKPlasmoid::readKountdownModel() const
{
    return m_KountdownModel;
}


QString DKPlasmoid::getStdDbPath()
{
	return QDir::homePath() + QStringLiteral("/.local/share/daykountdown/daykountdown");
}


void DKPlasmoid::setDbPath(QString inDbPath)
{
	m_dbPath = inDbPath;
	emit dbPathChanged(inDbPath);
}

QString DKPlasmoid::readDbPath() const
{
    return m_dbPath;
}


bool DKPlasmoid::readDbError()
{
	return m_dbError;
}


K_EXPORT_PLASMA_APPLET_WITH_JSON(DKPlasmoid, DKPlasmoid, "metadata.json")

#include "dkplasmoid.moc"
