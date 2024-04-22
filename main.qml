import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

import Components 1.0 as Components

Window {
    width: 1600
    height: 900
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: headers

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: 25

        color: Components.Colors.topAndBottomPanelMainColor

        Label {
            anchors.centerIn: parent

            text: "Введение данных пользователей"
        }
    }

    Row {
        id: buttonRow

        anchors {
            top: headers.bottom
            left: parent.left
            right: parent.right
            margins: 5
        }

        height: 20

        Button {
            width: parent.width * 0.1
            height: parent.height

            text: "Сохранить в БД"
        }
    }

    Label {
        id: labelUser

        anchors {
            top: buttonRow.bottom
            left: parent.left
            right: parent.right
            leftMargin: parent.width * 0.005
        }

        text: "Пользователи"
    }

    ScrollView {
        id: scrollViewUser

        anchors {
            top: labelUser.bottom
            left: parent.left
            bottom: statusDataBar.top
            bottomMargin: parent.height * 0.015
            leftMargin: parent.width * 0.005
        }

        width: 300

        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        background: Rectangle {
            color: Components.Colors.leftPanelMainColor
        }

        ListView {

            clip: true // Обрезать содержимое, которое выходит за пределы ListView
            model: 25
            delegate: Components.DataBaseUser {
                width: scrollViewUser.width
            }
        }
    }

    RowLayout {
        id: rowPhotoAndFullName

        spacing: 1000

        anchors {
            top: labelUser.bottom
            left: scrollViewUser.right
            right: parent.right
        }

        Image {
            id: photoPreview

            Layout.leftMargin: 15

            source: "qrc:/photoUser/res/93ed3af6411e1e8b997038c74c287a8a.jpg"
        }


        Column {
            spacing: 10

            Components.LebInput {
                labelText: "Фамилия"
                placeholder: qsTr("Введите фамилию")
            }
            Components.LebInput {
                labelText: "Имя"
                placeholder: qsTr("Введите имя")
            }
            Components.LebInput {
                labelText: "Отчество"
                placeholder: qsTr("Введите отчество")
            }
        }
    }

    GridLayout {
        id: grid

        anchors {
            top: rowPhotoAndFullName.bottom
            left: scrollViewUser.right
            right: parent.right
            bottom: scrollViewUser.bottom
            leftMargin: 15
            rightMargin: 15
        }

        columns: 2
        rows: 6

        property var fieldNames: ["first_name", "last_name", "email", "phone_number", "date_of_birth", "password", "avatar",
            "is_active", "is_superuser", "addres", "city", "job_title"]

        Repeater {
            model: 12 // Количество текстовых полей

            TextField {
                Layout.fillWidth: true
                placeholderText: grid.fieldNames[index]
            }
        }
    }

    Rectangle {
        id: statusDataBar

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: 25

        color: Components.Colors.topAndBottomPanelMainColor
    }

}
