#ifndef TABLEMODEL_H
#define TABLEMODEL_H

#include <QObject>
#include <QAbstractTableModel>
#include <QVariant>

class CoeffTableModel : public QAbstractTableModel
{
    Q_OBJECT


   //Q_PROPERTY(QStringList headerData READ headerData WRITE setHeaderData NOTIFY headerDataChanged)

public:
    explicit CoeffTableModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    int columnCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section, Qt::Orientation orientation, int role) const override;
    bool setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role) override;
    Qt::ItemFlags flags(const QModelIndex& index) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;


private:
    QList<QList<QVariant>> tableData;
    QList<QVariant> m_headerData;  // Member variable to store header data

signals:


    // QAbstractItemModel interface
public:

};



#endif // TABLEMODEL_H
