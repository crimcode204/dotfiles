pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.modules.bar.components.workspaces

Item {
    id: root

    readonly property int workspaceCount: 10

    readonly property real containerHeight: Appearance.sizes.bar.containerHeight
    readonly property real buttonSize: Appearance.sizes.bar.workspace.buttonSize
    readonly property real iconSize: Appearance.sizes.bar.workspace.iconSize
    readonly property real spacing: Appearance.sizes.bar.workspace.spacing

    readonly property int activeWorkspaceId: Hyprland.focusedWorkspace ? 
        Hyprland.focusedWorkspace.id : 1

    // Save one toplevel for each distinct class in every workspace
    // Needed for app icon search (steam apps can only be found by title)
    readonly property list<var> workspaceDistinctApps: {
        let appList = []
        for (let i = 1; i <= workspaceCount; i++) {
            let workspace = Hyprland.workspaces.values.find(ws => ws.id === i)
            if (workspace === undefined) {
                appList.push([])
                continue
            }

            let distinctApps = new Set()
            let apps = []
            for (const tl of workspace.toplevels.values) {
                if (tl.wayland?.appId === undefined) {
                    continue
                }
                if (distinctApps.has(tl.wayland?.appId)) {
                    continue
                }
                console.log(`App icon: ${tl.wayland?.icon}`)
                distinctApps.add(tl.wayland?.appId);
                apps.push(tl.wayland)
            }
            appList.push(apps)
        }
        return appList
    }

    implicitWidth: {
        const defaultSize = root.workspaceCount * root.buttonSize + 
          (root.workspaceCount -1) * root.spacing + 4 * root.spacing
        let addedIconsSize = 0
        workspaceDistinctApps.forEach(apps => {
            addedIconsSize += (apps.length ? apps.length - 1 : 0) * (root.iconSize + root.spacing)
        })
        return defaultSize + addedIconsSize
    }
    implicitHeight: containerHeight

    WheelHandler {
        onWheel: (event) => {
            if (event.angleDelta.y > 0) {
                Hyprland.dispatch("workspace e+1")
            } else {
                Hyprland.dispatch("workspace e-1")
            }
        }
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    }

    Rectangle {
        anchors.fill: parent

        radius: height / 2

        color: Colorscheme.colors.m3surfaceContainerHigh
    }

    RowLayout {
        id: workspacesHolder

        z: 1
        anchors.centerIn: parent

        spacing: root.spacing

        Repeater {
            model: root.workspaceDistinctApps

            Workspace {
                activeWorkspaceId: root.activeWorkspaceId
            }

        }

    }

}
