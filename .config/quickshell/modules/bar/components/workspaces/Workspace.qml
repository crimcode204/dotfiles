pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Hyprland
import Quickshell.Wayland
import qs.config
import qs.modules.bar.components.workspaces
import qs.utils

Item {
    id: root

    required property list<Toplevel> modelData
    required property int index

    required property int activeWorkspaceId

    readonly property bool isActive: root.index + 1 === root.activeWorkspaceId
    readonly property bool isHovered: area.hovered
    readonly property bool isEmpty: root.modelData.length === 0

    readonly property int buttonSize: Appearance.sizes.bar.workspace.buttonSize
    readonly property int iconSize: Appearance.sizes.bar.workspace.iconSize
    readonly property int spacing: Appearance.sizes.bar.workspace.spacing

    readonly property color color: root.isHovered ? Qt.darker(Colorscheme.colors.secondary, 1.3)
    : root.isActive ? Qt.darker(Colorscheme.colors.primary, 1.3)
        : Colorscheme.colors.container

    implicitWidth: root.buttonSize + (root.modelData.length ? root.modelData.length - 1 : 0) * (root.iconSize + root.spacing)
    implicitHeight: root.buttonSize

    TapHandler {
        onPressedChanged: {
            if (pressed && root.activeWorkspaceId !== root.index + 1) 
              Hyprland.dispatch(`workspace ${root.index + 1}`)
        }
    }

    HoverHandler {
        id: area
    }
    
    Rectangle {
        id: workspaceBackground

        anchors.fill: parent

        radius: height / 2

        color: root.color
        opacity: (!root.isEmpty || root.isActive || root.isHovered) ? 1 : 0
    }

    // Small dot for empty workspaces
    Rectangle {
        visible: root.isEmpty
        anchors.centerIn: parent
        width: root.buttonSize * 0.2
        height: width
        radius: width / 2
        color: root.color

        layer.enabled: true
        layer.effect: wsEffect
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: root.buttonSize / 2
        spacing: root.spacing

        Repeater {
            model: root.modelData

            WsAppIcon {
                wsEffect: wsEffect
            }

        }

    }

    Component {
        id: wsEffect

        MultiEffect {
            saturation: 0.3
            colorization: 0.7
            colorizationColor: root.color
            brightness: 0.8
            contrast: 0.8
        }
    }

}
