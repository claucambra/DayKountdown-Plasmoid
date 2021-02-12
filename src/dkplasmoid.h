#include <Plasma/Applet>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QUrl>
#include <QSqlError>
#include <QDir> 
 
class DKPlasmoid : public Plasma::Applet
{
	Q_OBJECT
	
public:
	void initDb();
};
