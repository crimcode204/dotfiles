pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Bluetooth
import qs.config
import qs.modules.common
import qs.services

Item {
    id: root

    readonly property real iconSize: Appearance.sizes.bar.statusBar.iconSize
    readonly property real spacing: Appearance.sizes.bar.statusBar.iconSpacing

    readonly property ListModel model: BarWidgets.status

    property real batteryWidth: 0

    // Change to a map containing all widths if more dynamic size items are added
    implicitWidth: {
        const spacingWidth = spacing * (model.count + 3);
        var itemsWidths = iconSize * model.count;
        if (batteryWidth !== 0) {
            itemsWidths += -iconSize + batteryWidth;
        }
        return spacingWidth + itemsWidths;
    }
    implicitHeight: Appearance.sizes.bar.containerHeight

    Rectangle {
        anchors.fill: parent

        radius: height / 2

        color: Colorscheme.colors.m3surfaceContainerHigh
    }

    RowLayout {
        z: 1
        anchors.centerIn: parent
        spacing: root.spacing

        Repeater {
            model: root.model

            DelegateChooser {
                role: "id"

                DelegateChoice {
                    roleValue: "battery"

                    delegate: Loader {
                        sourceComponent: BatteryIndicator {
                            id: batteryIndicator
                            onImplicitWidthChanged: root.batteryWidth = batteryIndicator.implicitWidth
                        }

                    }

                }

                StatusItem {
                    iconName: {
                        if (!Bluetooth.defaultAdapter?.enabled) {
                            return "bluetooth-slash"
                        } else if (Bluetooth.devices.values.some(d => d.connected)) {
                            return "bluetooth-connected"
                        } else {
                            return "bluetooth"
                        }
                    }

                    popoutName: "bluetooth"
                }

                StatusItem {
                    iconName: {
                        if (!IdleInhibitor.enabled) {
                            return "drop-simple"
                        } else {
                            return "drop-slash"
                        }
                    }
                    popoutName: "idle-inhibitor"
                    onTapped: IdleInhibitor.toggleInhibitor()
                }

                StatusItem {
                    iconName: "network"
                    popoutName: "internet"
                }

                StatusItem {
                    iconName: "speaker-high"
                    popoutName: "volume"
                }

            }

        }

    }

    component StatusItem: DelegateChoice {
        id: status

        required property string iconName
        required property string popoutName
        property string color: ""

        signal tapped()

        roleValue: popoutName

        delegate: Item {
            implicitWidth: root.iconSize
            implicitHeight: root.iconSize

            ColoredIcon {
                color: status.color !== "" ? status.color : Colorscheme.colors.m3primary
                size: root.iconSize
                iconName: status.iconName
                iconPack: "phosphor"
            }

            TapHandler {
                id: tapHandler
                onTapped: status.tapped()
            }

        }

    }

}
