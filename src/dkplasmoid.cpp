#include "dkplasmoid.h"

void DKPlasmoid::initDb() {
	QSqlDatabase db = QSqlDatabase::addDatabase(QStringLiteral("QSQLITE"));
	const auto path = QDir::cleanPath(QStandardPaths::writableLocation(QStandardPaths::DataLocation) + QStringLiteral("/") + "daykountdown");
	db.setDatabaseName(path);
	if (!db.open()) {
		qCritical() << db.lastError() << "while opening database at" << path;
	}
}
