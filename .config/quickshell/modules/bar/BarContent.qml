pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.modules.bar.components
import qs.modules.bar.components.workspaces

Item {
    id: root

    readonly property DelegateChooser mapper: DelegateChooser {
        role: "id"

        DelegateChoice {
            roleValue: "clock"

            delegate: Loader {
                sourceComponent: Clock {}
            }
        }

        DelegateChoice {
            roleValue: "osIcon"

            delegate: Loader {
                sourceComponent: OsIcon {}
            }

        }

        DelegateChoice {
            roleValue: "status"

            delegate: Loader {
                sourceComponent: StatusBar {}
            }
        }

        DelegateChoice {
            roleValue: "workspaces"

            delegate: Loader {
                sourceComponent: Workspaces {
                    Layout.fillHeight: true
                }

            }

        }

    }

    // Left side widgets
    RowLayout {
        Repeater {
            id: repeaterLeft

            model: BarWidgets.left
            delegate: root.mapper

        }

        anchors {
            left: parent.left
            leftMargin: Appearance.padding.large
            verticalCenter: parent.verticalCenter
        }
    }

    // Center widgets
    RowLayout {
        Repeater {
            id: repeaterMiddle

            model: BarWidgets.center
            delegate: root.mapper

        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

    }

    // Right side widgets
    RowLayout {
        Repeater {
            id: repeaterRight

            model: BarWidgets.right
            delegate: root.mapper
        }

        anchors {
            right: parent.right
            rightMargin: Appearance.padding.large
            verticalCenter: parent.verticalCenter
        }

    }

}
