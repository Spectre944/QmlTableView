import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt.labs.qmlmodels 1.0

import MyApp 1.0

Window {
    visible: true
    width: 800
    height: 600

    Connections {
        target: TableViewContext

        function onHeaderDataModified(data) {
            //textAreaLog.append(data)
            console.log(data)
        }
    }

    Rectangle {
        id: backround
        anchors.fill: parent
        color: "red"

        Item {
            id: param

            property int contentMargins: 10
            property int tableWidth: content.width

            property int tableColums: 11
            property int tableRows: 4

            property int tableColumnsSpacing: 0
            property int tableRowSpacing: 1

            property int tableCellRadius: 0
        }


        Rectangle {
            id: content
            anchors.fill: parent
            anchors.margins: param.contentMargins
            color: "gray"

            onWidthChanged: {
                param.tableWidth = content.width
                console.log(param.tableWidth)
            }

            Row{
                id: rowHeader

                anchors.margins: 0
                spacing: 0
                height: 25
                width: parent.width



                Repeater{
                    model: param.tableColums
                    id: headerModel

                    Rectangle {
                        id: headerDelegate
                        width: ((parent.width/headerModel.count) - rowHeader.spacing)
                        height: 25
                        color: "#f0f0f0"
                        radius: 0

                        Text {
                            anchors.centerIn: parent
                            text: modelData  // Use modelData to display the header text
                        }
                    }
                }
            }

            Rectangle {
                id: spacerHorizontal
                color: "black"
                width: parent.width
                height: 2

                anchors.top: rowHeader.bottom

            }

//            Column {
//                id: columnHeader
//                width: 25
//                anchors.top: spacerHorizontal.bottom
//                anchors.bottom: parent.bottom
//                anchors.left: parent.left
//                z: 1

//                Repeater{
//                    model: 4
//                    Rectangle {
//                        width: 25; height: 50
//                        border.width: 1
//                        color: "yellow"
//                    }

//                }

//            }


            TableView {
                id: tableView
                anchors.top: spacerHorizontal.bottom
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 0

                columnSpacing: param.tableColumnsSpacing
                rowSpacing: param.tableRowSpacing
                clip: true

                model: CoeffTableModel {
                            // Ваши столбцы и данные можно добавить здесь
                        }

                /*
                model: TableModel {
                    TableModelColumn { display: "id" }
                    TableModelColumn { display: "t6" }
                    TableModelColumn { display: "t5" }
                    TableModelColumn { display: "t4" }
                    TableModelColumn { display: "t3" }
                    TableModelColumn { display: "t2" }
                    TableModelColumn { display: "t1" }
                    TableModelColumn { display: "t0" }
                    TableModelColumn { display: "t-1" }
                    TableModelColumn { display: "t-2" }
                    TableModelColumn { display: "t-3" }
                    rows: [
                        {
                            "id": "Температура", "t6": "60.24", "t5": "50.54", "t4": "40.24", "t3": "30.23", "t2": "20.22", "t1": "10.11", "t0": "0.24",  "t-1": "-10.34", "t-2": "-20.33", "t-3": "-30.33",
                        },
                        {
                            "id": "Uзм", "t6": "1200", "t5": "1150", "t4": "1100", "t3": "1000", "t2": "900", "t1": "850", "t0": "800",  "t-1": "780", "t-2": "760", "t-3": "740",
                        },
                        {
                            "id": "Зсув", "t6": "3", "t5": "3", "t4": "3", "t3": "3", "t2": "4", "t1": "4", "t0": "4",  "t-1": "-5", "t-2": "5", "t-3": "5",
                        },
                        {
                            "id": "Шум","t6": "2", "t5": "2", "t4": "1", "t3": "1", "t2": "0", "t1": "0", "t0": "0",  "t-1": "0", "t-2": "0", "t-3": "0",
                        }
                    ]
                }
                */

                delegate: Rectangle {
                    implicitWidth: ((param.tableWidth/param.tableColums))
                    implicitHeight: 50
                    border.width: 0
                    radius: param.tableCellRadius

                    Text {
                        text: display
                        anchors.centerIn: parent
                    }
                }
            }


        }





    }






}

/*
Window {
    visible: true
    width: 800
    height: 600

    ListModel {
        id: tableModel
        ListElement {
            //id: "000001"
            firstName: "Lani"
            lastName: "Ovendale"
            email: "lovendale0@w3.org"
            street: "7850 Old Shore Drive"
            country: "United Kingdom"
            university: "University of Plymouth"
            iban: "BG34 MPVP 8782 88EX H1CJ SC"
        }

        ListElement {
            //id: "000001"
            firstName: "Lani"
            lastName: "Ovendale"
            email: "lovendale0@w3.org"
            street: "7850 Old Shore Drive"
            country: "United Kingdom"
            university: "University of Plymouth"
            iban: "BG34 MPVP 8782 88EX H1CJ SC"
        }

        // Add more data here...
    }

    GridView {
        anchors.fill: parent
        model: tableModel
        cellWidth: parent.width / 8
        cellHeight: 40

        delegate: Item {
            width: parent.width / 8
            height: 40
            Rectangle {
                width: parent.width
                height: 1
                color: "#000000"
            }

            Row {
                spacing: 5

                Text {
                    width: parent.width / 8
                    text: model.firstName
                }
                Text {
                    width: parent.width / 8
                    text: model.lastName
                }
                Text {
                    width: parent.width / 8
                    text: model.email
                }
                Text {
                    width: parent.width / 8
                    text: model.street
                }
                Text {
                    width: parent.width / 8
                    text: model.country
                }
                Text {
                    width: parent.width / 8
                    text: model.university
                }
                Text {
                    width: parent.width / 8
                    text: model.iban
                }
            }
        }
    }
}
*/
