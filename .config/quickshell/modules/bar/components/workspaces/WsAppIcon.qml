pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Widgets
import Quickshell.Wayland
import qs.config
import qs.services

Item {
    id: root

    required property Toplevel modelData

    required property Component wsEffect

    readonly property real iconSize: Appearance.sizes.bar.workspace.iconSize

    IconImage {
        id: icon

        anchors.centerIn: parent
        implicitSize: root.iconSize

        source: AppIconFinder.find(root.modelData)

        layer.enabled: true
        layer.effect: root.wsEffect

    }

}
