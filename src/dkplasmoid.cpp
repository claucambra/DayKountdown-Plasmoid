#include "dkplasmoid.h"
#include <KLocalizedString>

DKPlasmoid::DKPlasmoid(QObject *parent, const QVariantList &args) : Plasma::Applet(parent, args)
{
	QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
	const auto path = QDir::homePath() + QStringLiteral("/.local/share/daykountdown/daykountdown");
	db.setDatabaseName(path);
	if (!db.open()) {
		qCritical() << db.lastError() << "while opening database at" << path;
		m_dbError = true;
	}
	m_KountdownModel = new KountdownModel(qApp);
}

DKPlasmoid::~DKPlasmoid()
{
}

void DKPlasmoid::updateKountdownModel()
{
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

bool DKPlasmoid::readDbError()
{
	return m_dbError;
}


K_EXPORT_PLASMA_APPLET_WITH_JSON(DKPlasmoid, DKPlasmoid, "metadata.json")

#include "dkplasmoid.moc"
