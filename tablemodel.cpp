#include "tablemodel.h"

CoeffTableModel::CoeffTableModel(QObject *parent)
{
    // Инициализация данных вашей таблицы. Замените эти значения на ваши данные.
//    QList<QVariant> temperatureHeader;
//    temperatureHeader << id << t6 << t5 << t4 << t3 << t2 << t1 << t0 << t-1 << t-2 << t-3;
//    tableData.append(temperatureHeader);

    QList<QVariant> temperatureRow;
    temperatureRow << "Температура" << 60.24 << 50.54 << 40.24 << 30.23 << 20.22 << 10.11 << 0.24 << -10.34 << -20.33 << -30.33;
        tableData.append(temperatureRow);

    QList<QVariant> uzmRow;
    uzmRow << "Uзм" << 1200 << 1150 << 1100 << 1000 << 900 << 850 << 800 << 780 << 760 << 740;
    tableData.append(uzmRow);

    QList<QVariant> zsuwRow;
    zsuwRow << "Зсув" << 3 << 3 << 3 << 3 << 4 << 4 << 4 << -5 << 5 << 5;
        tableData.append(zsuwRow);

    QList<QVariant> noiseRow;
    noiseRow << "Шум" << 2 << 2 << 1 << 1 << 0 << 0 << 0 << 0 << 0 << 0;
    tableData.append(noiseRow);
}

int CoeffTableModel::rowCount(const QModelIndex &parent) const
{
    return tableData.size();
}

int CoeffTableModel::columnCount(const QModelIndex &parent) const
{
    if (tableData.isEmpty())
        return 0;
    return tableData.at(0).size();
}

QVariant CoeffTableModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || role != Qt::DisplayRole)
        return QVariant();

    int row = index.row();
    int col = index.column();

    if (row < 0 || row >= tableData.size() || col < 0 || col >= tableData.at(0).size())
        return QVariant();

    return tableData.at(row).at(col);
}

QVariant CoeffTableModel::headerData(int section, Qt::Orientation orientation, int role) const
{
    if (role != Qt::DisplayRole)
        return QVariant();

    if (orientation == Qt::Horizontal) {
        if (section < 0 || section >= m_headerData.size())
            return QVariant();
        return m_headerData.at(section);
    }

    return QVariant();
}

bool CoeffTableModel::setHeaderData(int section, Qt::Orientation orientation, const QVariant &value, int role)
{
    if (section < 0 || section >= m_headerData.size())
        return false;

    m_headerData[section] = value.toString();  // Update the header data
    emit headerDataChanged(Qt::Horizontal, section, section);  // Emit the signal
    return true;
}


Qt::ItemFlags CoeffTableModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEnabled | Qt::ItemIsSelectable;
}

bool CoeffTableModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (role != Qt::EditRole)
        return false;

    int row = index.row();
    int col = index.column();

    if (row < 1 || row >= tableData.size() || col < 0 || col >= tableData.at(0).size())
        return false;

    tableData[row][col] = value;
    // Эмитируем сигнал об изменении данных
    emit dataChanged(index, index);

    return true;
}


