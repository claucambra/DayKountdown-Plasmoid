#include "dkplasmoid.h"
#include <KLocalizedString>

DKPlasmoid::DKPlasmoid(QObject *parent, const QVariantList &args) : Plasma::Applet(parent, args)
{
	QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
	const auto path = QDir::homePath() + QStringLiteral("/.local/share/daykountdown/daykountdown");
	db.setDatabaseName(path);
	if (!db.open()) {
		qCritical() << db.lastError() << "while opening database at" << path;
	}
	m_KountdownModel = new KountdownModel(qApp);
}

DKPlasmoid::~DKPlasmoid()
{
}

KountdownModel* DKPlasmoid::readKountdownModel() const
{
    return m_KountdownModel;
}

K_EXPORT_PLASMA_APPLET_WITH_JSON(DKPlasmoid, DKPlasmoid, "metadata.json")

#include "dkplasmoid.moc"
