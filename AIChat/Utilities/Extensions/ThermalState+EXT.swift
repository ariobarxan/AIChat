//
//  ThermalState+EXT.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import UIKit

public extension ProcessInfo.ThermalState {
    var stringValue: String {
        switch self {
        case .nominal:
            return "nominal"
        case .fair:
            return "fair"
        case .serious:
            return "serious"
        case .critical:
            return "critical"
        default:
            return "unknown"
        }
    }
}
