import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

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

        color: "red"

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
            margins: 5
        }

        text: "Пользователи"
    }

    ScrollView {
        id: scrollViewUser

        anchors {
            top: labelUser.bottom
            left: parent.left
            bottom: statusDataBase.top
            bottomMargin: parent.height * 0.015
            leftMargin: parent.width * 0.005
        }

        width: 300

        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        background: Rectangle {
            color: "#eeeeee"
        }

        ListView {

            clip: true // Обрезать содержимое, которое выходит за пределы ListView
            model: 25
            delegate: DataBaseUser {
                width: scrollViewUser.width
            }
        }
    }

    Image {
        id: photoPreview

        anchors {
            top: labelUser.bottom
            left: scrollViewUser.right
            leftMargin: 25
        }

        width: 250
        height: 300

        Layout.fillWidth: true

        source: "qrc:/photoUser/etc/93ed3af6411e1e8b997038c74c287a8a.jpg"
    }


    Grid {
        anchors {
            top: labelUser.bottom
            right: parent.right
            margins: 15
        }

        columns: 2
        spacing: 25
        columnSpacing: 50
        verticalItemAlignment: Grid.AlignVCenter // Центрирование элементов по вертикали
        Label {
            text: "Фамилия"
        }
        TextField {
            width: parent.parent.width * 0.25
            placeholderText: qsTr("Введите фамилию")
        }
        Label {
            anchors.rightMargin: 150
            text: "Имя"
        }
        TextField {
            width: parent.parent.width * 0.25
            placeholderText: qsTr("Введите имя")
        }
        Label {
            text: "Отчество"
        }
        TextField {
            width: parent.parent.width * 0.25
            placeholderText: qsTr("Введите отчество")
        }
    }
    GridLayout {
        id: grid
        anchors {
            right: parent.right
            bottom: statusDataBase.top
            rightMargin: parent.width * 0.05
            bottomMargin: parent.height * 0.10
        }

        columns: 2
        columnSpacing: parent.width * 0.25
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
        id: statusDataBase

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        height: 25

        color: "red"

        Label {
            anchors.centerIn: parent

            text: "Введение данных пользователей"
        }
    }

}
