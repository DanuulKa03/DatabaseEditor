import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

ItemDelegate {
    // Ширина элемента совпадает с шириной ScrollView
    Text {
        anchors.centerIn: parent
        text: "Item " + index
    }
}
