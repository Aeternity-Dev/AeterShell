import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Theme
import qs.Services

Scope {
    id: bar
    readonly property int height: 20

    Variants {
        model: Quickshell.screens
        delegate: Component {
            PanelWindow {
                required property var modelData
                screen: modelData

                anchors {
                    bottom: true
                    left: true
                    right: true
                }

                implicitHeight: bar.height
                color: Colors.background

                RowLayout {
                    anchors {
                        verticalCenter: parent.verticalCenter
                    }
                }
                
                Text {
                    anchors.centerIn: parent
                    text: Clock.time
                    color: Colors.text
                    font: Typography.sans(6, Font.Medium)
                }

                RowLayout {
                    anchors {
                        right: parent.right
                        verticalCenter: parent.verticalCenter
                    }

                    Text {
                        text: Battery.percentage + "%"
                        color: Colors.text
                        font: Typography.sans(6, Font.Medium)
                    }
                }
            }
        }
    }   
}
