pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property UPowerDevice battery: UPower.displayDevice

    readonly property real percentage: battery?.percentage ?? 1
    readonly property string textPercentage: Math.round(percentage * 100)

    readonly property bool isLow: percentage <= 10 / 100
    readonly property bool isPluggedIn: battery.state == UPowerDeviceState.Charging || battery.state == UPowerDeviceState.PendingCharge
    readonly property bool isLowAndNotPluggedIn: isLow && !isPluggedIn

}
