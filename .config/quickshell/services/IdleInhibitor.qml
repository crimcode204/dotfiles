pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Wayland

Singleton {
    id: root

    property alias enabled: inhibitor.enabled
    enabled: false

    function toggleInhibitor() {
        root.enabled = !root.enabled
    }

    IdleInhibitor {
        id: inhibitor
        // Fake window that prohibits idling
        window: PanelWindow {
            implicitWidth: 0
            implicitHeight: 0
            color: "transparent"
            mask: Region {}
        }
    }
}
