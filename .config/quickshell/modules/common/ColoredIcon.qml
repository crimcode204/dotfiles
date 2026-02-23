pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Effects
import Quickshell.Widgets
import qs.config

Item {
    id: root

    required property color color
    required property real size
    required property string iconName
    property string iconPack: ""
    readonly property string packDir: {
        if (iconPack === "") {
            return "";
        }
        else {
            return `${iconPack}/`;
        }
    }

    implicitWidth: size
    implicitHeight: size

    IconImage {
        id: iconImage

        anchors.fill: parent
        source: `${Paths.icons}/${root.packDir}${root.iconName}.svg`
        implicitSize: root.size

        layer.enabled: true
        layer.effect: MultiEffect {
          colorization: 1.0
          colorizationColor: root.color
          brightness: 1.0
        }
    }

}
