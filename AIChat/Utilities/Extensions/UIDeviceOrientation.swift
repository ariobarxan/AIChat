//
//  UIDeviceOrientation.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import UIKit

public extension UIDeviceOrientation {
    var stringValue: String {
        switch self {
        case .portrait:
            return "portrait"
        case .portraitUpsideDown:
            return "portrait_upside_down"
        case .landscapeLeft:
            return "landscape_left"
        case .landscapeRight:
            return "landscape_right"
        case .faceUp:
            return "face_up"
        case .faceDown:
            return "face_down"
        default:
            return "unknown"
        }
    }
}
