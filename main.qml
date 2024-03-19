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

    Row {
        anchors {
            top: labelUser.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 5
            bottomMargin: 5
        }

        ScrollView {
            anchors {
                top: parent.top
                // left: parent.left
                bottom: parent.bottom
            }

            width: 1000

            ColumnLayout {
                width: parent.width // Привязываем ширину к ширине ScrollView для правильного выравнивания

                // Много контента, чтобы он мог прокручиваться
                Repeater {
                    model: 50 // Пример с 50 элементами
                    Text {
                        text: "Item " + index
                        font.pixelSize: 20
                        color: index % 2 === 0 ? "black" : "gray" // Чтобы было видно прокрутку
                        Layout.alignment: Qt.AlignHCenter
                        Layout.margins: 10
                    }
                }
            }
        }


    }


}
