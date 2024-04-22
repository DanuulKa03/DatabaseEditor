// CustomTextField.qml
import QtQuick 2.15
import QtQuick.Controls 2.5

Item {
    property string labelText: ""
    property string placeholder: ""

    Row {
        Label {
            text: labelText
        }

        TextField {
            width: parent.parent.width * 0.25
            placeholderText: placeholder
        }
    }
}
