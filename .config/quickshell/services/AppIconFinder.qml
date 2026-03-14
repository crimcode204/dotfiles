pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Wayland

Singleton {
    id: root

    readonly property string defaultIcon: "application-x-executable"

    // Entries are not loaded at the start, so icons need to be reloaded on changes
    // This is a binding to force the icon lookup to be re-evaluated
    property int desktopEntriesVersion: 0
    Connections {
        target: DesktopEntries
        function onApplicationsChanged() {
            root.desktopEntriesVersion++;
        }
    }

    function getIcon(name: string) : string {
        if (!name || name.length === 0)
            return "image-missing";

        desktopEntriesVersion;

        const exactEntry = DesktopEntries.byId(name);
        if (exactEntry) {
            return exactEntry.icon;
        }

        const heuristicEntry = DesktopEntries.heuristicLookup(name);
        if (heuristicEntry) {
            return heuristicEntry.icon;
        }

        return defaultIcon;
    }

    function find(tl: Toplevel) : url {
        let icon = root.getIcon(tl.appId)
        if (icon === root.defaultIcon) {
            icon = root.getIcon(tl.title)
        }
        return Quickshell.iconPath(icon, true);
    }

}
