#ifndef DKPLASMOID_H
#define DKPLASMOID_H

#include <Plasma/Applet>
#include <QSqlDatabase>
#include <QSqlError>
#include <QDir>
// Remember to have .h files in here! Otherwise the linker will panic!
#include "kountdownmodel.h"

class DKPlasmoid : public Plasma::Applet
{
    Q_OBJECT
    Q_PROPERTY(KountdownModel* KountdownModel READ readKountdownModel CONSTANT)

public:
    DKPlasmoid(QObject *parent, const QVariantList &args);
    ~DKPlasmoid();

    KountdownModel* readKountdownModel() const;

private:
    KountdownModel* m_KountdownModel;
};

#endif
