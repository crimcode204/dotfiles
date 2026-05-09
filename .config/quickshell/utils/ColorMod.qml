import QtQuick
import Quickshell
pragma Singleton

Singleton {
    // factor in [0, 1]
    function applyTransparency(source: color, factor: real) : color {
        return Qt.rgba(source.r, source.g, source.b, factor)
    }

    // factor in [0, 1]
    function desaturate(source: color, factor: real) : color {
        let desaturated = Qt.color(source)
        desaturated.hslSaturation *= factor
        return desaturated
    }

}
