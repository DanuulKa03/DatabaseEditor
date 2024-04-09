// ConnectionDialog.qml
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Dialog {
    id: connectionDialog
    title: "Database Connection"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        TextField {
            id: hostInput
            placeholderText: "Hostname"
        }

        TextField {
            id: databaseInput
            placeholderText: "Database"
        }

        TextField {
            id: usernameInput
            placeholderText: "Username"
        }

        TextField {
            id: passwordInput
            placeholderText: "Password"
            echoMode: TextInput.Password
        }

        RowLayout {
            spacing: 10

            Button {
                text: "Connect"
                onClicked: {
                    // Вызов сигнала для передачи данных в C++
                    connectionDialog.accepted.emit()
                }
            }

            Button {
                text: "Cancel"
                onClicked: {
                    connectionDialog.rejected.emit()
                    connectionDialog.close()
                }
            }
        }
    }
}
