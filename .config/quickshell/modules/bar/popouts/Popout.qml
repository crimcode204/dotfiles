pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick

Item {
    id: root

    property bool isOpen: false

    visible: isOpen
    focus: isOpen

    implicitWidth: 50
    implicitHeight: 50

    function open(): void {
        if (isOpen) {
            close()
        }

    }

    function close(): void {
        
    }

    Behavior on x {

    }

    Behavior on y {

    }

    states: [
        State {
            name: "open"
            when: root.isOpen
        },

        State {
            name: "closed"
            when: !root.isOpen
        }

    ]

    transitions: [
        Transition {
            from: "open"
            to: "closed"
        },

        Transition {
            from: "closed"
            to: "open"
        }

    ]

    component BezierAnimation: NumberAnimation {
        duration: 1
        easing.type: Easing.BezierSpline
        // easing.bezierCurve: 
    }
}
