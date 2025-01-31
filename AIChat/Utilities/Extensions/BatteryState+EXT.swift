//
//  BatteryState+EXT.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import UIKit

public extension UIDevice.BatteryState {
    var stringValue: String {
        switch self {
        case .unplugged:
            return "unplugged"
        case .charging:
            return "charging"
        case .full:
            return "full"
        default:
            return "unknown"
        }
    }
}

