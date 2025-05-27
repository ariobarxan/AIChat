//
//  AppView.swift
//  AIChat
//
//  Created by Ario Liyan on 27/5/2025.
//

import SwiftUI

struct AppView: View {
    @AppStorage("ShowTabBarView") var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
    }
}

#Preview("AppView - Onboarding") {
    AppView(showTabBar: true)
} 
#Preview("AppView - TabBar") {
    AppView(showTabBar: true)
}
