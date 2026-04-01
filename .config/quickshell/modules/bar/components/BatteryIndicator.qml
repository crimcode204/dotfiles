pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import qs.modules.common
import qs.config
import qs.services

Item {
    id: root

    readonly property real widthModifier: Battery.isPluggedIn ? 1.5 : 1.2

    implicitWidth: Appearance.sizes.bar.statusBar.iconSize * root.widthModifier
    implicitHeight: Appearance.sizes.bar.statusBar.iconSize * 0.8

    ProgressBar {
        id: bar

        anchors.fill: parent

        value: Battery.percentage

        background: Item {
            visible: false
        }

        contentItem: Rectangle {
            id: backgroundBar

            anchors.fill: parent
            radius: root.implicitHeight / 2
            color: Colorscheme.applyTransparency(progressFill.color, 0.5)

            Rectangle {
                id: progressFill

                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                    right: undefined
                }

                width: parent.width * bar.visualPosition
                height: parent.height

                radius: parent.radius
                color: Battery.isLowAndNotPluggedIn ? Colorscheme.colors.m3error : Colorscheme.colors.m3primary
            }
        }
    }

    StyledText {
        id: text

        anchors.centerIn: bar

        text: (Battery.isPluggedIn ? "󱐋 " : "") + Battery.textPercentage
        color: Battery.isLowAndNotPluggedIn ? Colorscheme.colors.m3onError : Colorscheme.colors.m3onPrimary

        font {
            pointSize: Appearance.font.size.smallest
        }
    }
}
