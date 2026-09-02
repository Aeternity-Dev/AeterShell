pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    property UPowerDevice battery: {
        const batteryList = UPower.devices ? UPower.devices.values : []
        for (const d in batteryList)
            if (d && d.type === UPowerDeviceType.Battery && d.nativePath === "BAT1")
                return d
        for (const d of batteryList)
            if (d && d.isLaptopBattery)
                return d
        return UPower.displayDevice
    }

    property int percentage: {
        if (!battery) return 0
        const p = battery.percentage
        return Math.round(p <= 1 ? p * 100 : p)
    }

    property var icon: {
    
}
 }
