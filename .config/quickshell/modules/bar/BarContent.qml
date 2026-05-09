pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.modules.bar.components
import qs.modules.bar.components.workspaces

Item {
    id: root

    readonly property DelegateChooser
    mapper: DelegateChooser {
        role: "id"

        ComponentWithContainer {
            roleValue: "clock"

            component: Clock {
            }

        }

        ComponentWithContainer {
            roleValue: "osIcon"

            makeRound: true

            component: OsIcon {
            }

        }

        ComponentWithContainer {
            roleValue: "status"

            component: StatusBar {
            }

        }

        ComponentWithContainer {
            roleValue: "workspaces"

            component: Workspaces {
            }

        }

    }

    // Left side widgets
    RowLayout {
        Repeater {
            id: repeaterLeft

            model: BarWidgets.left
            delegate: root.mapper
        }

        anchors {
            left: parent.left
            leftMargin: Appearance.padding.large
            verticalCenter: parent.verticalCenter
        }

    }

    // Center widgets
    RowLayout {
        Repeater {
            id: repeaterMiddle

            model: BarWidgets.center
            delegate: root.mapper
        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }

    }

    // Right side widgets
    RowLayout {
        Repeater {
            id: repeaterRight

            model: BarWidgets.right
            delegate: root.mapper
        }

        anchors {
            right: parent.right
            rightMargin: Appearance.padding.large
            verticalCenter: parent.verticalCenter
        }

    }

    component ComponentWithContainer: DelegateChoice {
        id: choice

        required property Component component
        property bool makeRound: false

        delegate: Item {
            id: widget

            implicitHeight: Appearance.sizes.bar.containerHeight
            implicitWidth: widget.implicitHeight

            Rectangle {
                id: background

                anchors.fill: parent
                radius: widget.implicitHeight / 2
                color: Colorscheme.colors.background
            }

            Loader {
                id: content

                sourceComponent: choice.component
                onImplicitWidthChanged: {
                    if (!choice.makeRound) {
                        widget.implicitWidth = content.implicitWidth + 2 * Appearance.sizes.bar.containerMargins;
                    }
                }
                anchors.centerIn: parent
            }

        }

    }

}
