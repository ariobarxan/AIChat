//
//  Untitled.swift
//  AIChat
//
//  Created by Ario Liyan on 28/5/2025.
//

import SwiftUI

@Observable class AppState: ObservableObject {
    private(set) var showTabBar: Bool {
        didSet {
            UserDefaults.showTabBarView = showTabBar
        }
    }
    
    init(showTabBar: Bool = UserDefaults.showTabBarView) {
        self.showTabBar = showTabBar
    }
    
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
    
}

extension UserDefaults {
    private struct Keys {
        static let ShowTabBarView = "ShowTabBarView"
    }
    static var showTabBarView: Bool {
        get {
            standard.bool(forKey: Keys.ShowTabBarView)
        }
        
        set {
            standard.set(newValue, forKey: Keys.ShowTabBarView)
        }
    }
} 
