pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root
    
    property string time: {
        Qt.formatTime(clock.date, "hh:mm")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
