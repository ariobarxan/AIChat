//
//  AppView.swift
//  AIChat
//
//  Created by Ario Liyan on 27/5/2025.
//

import SwiftUI

struct AppView: View {
    @State var appSate: AppState = AppState()

    var body: some View {
        AppViewBuilder(
            showTabBar: appSate.showTabBar,
            tabbarView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appSate)
    }
}

#Preview("AppView - Onboarding") {
    AppView(appSate: AppState(showTabBar: true))
}
#Preview("AppView - TabBar") {
    AppView(appSate: AppState(showTabBar: false))
}
