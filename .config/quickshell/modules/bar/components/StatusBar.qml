pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Bluetooth
import Quickshell.Services.UPower
import qs.config
import qs.modules.common

Item {
    id: root

    readonly property real iconSize: Appearance.sizes.bar.statusBar.iconSize
    readonly property real spacing: Appearance.sizes.bar.statusBar.iconSpacing

    readonly property ListModel model: BarWidgets.status

    implicitWidth: iconSize * model.count + spacing * (model.count + 3)
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

                StatusItem {
                    iconName: {
                        // NOTE: find another icon for pc power
                        if (!UPower.displayDevice.isLaptopBattery) {
                            return "battery-full";
                        }

                        const perc = UPower.displayDevice.percentage

                        if (perc === 1) {
                            return "battery-full";
                        } else if (perc >= 0.75) {
                            return "battery-high";
                        } else if (perc >= 0.5) {
                            return "battery-medium";
                        } else if (perc >= 0.25) {
                            return "battery-low";
                        } else {
                            return "battery-warning";
                        }
                    }
                    color: UPower.displayDevice.percentage < 0.25 ? Colorscheme.colors.m3error : ""
                    popoutName: "battery"
                }

                StatusItem {
                    iconName: {
                        if (!Bluetooth.defaultAdapter?.enabled) {
                            return "bluetooth-slash";
                        } else if (Bluetooth.devices.values.some(d => d.connected)) {
                            return "bluetooth-connected";
                        } else {
                            return "bluetooth";
                        }
                    }
                    popoutName: "bluetooth"
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

        roleValue: popoutName

        delegate: ColoredIcon {
            color: status.color !== "" ? status.color : Colorscheme.colors.m3primary
            size: root.iconSize
            iconName: status.iconName
            iconPack: "phosphor"
        }

    }

}
