//
//  MeasurementSystem+EXT.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import UIKit

public extension Locale.MeasurementSystem {
    var stringValue: String {
        switch self {
        case .us:
            return "us"
        case .uk:
            return "uk"
        case .metric:
            return "metric"
        default:
            return "unknown"
        }
    }
}
