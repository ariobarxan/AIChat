//
//  AppView.swift
//  AIChat
//
//  Created by Ario Zarepour on 30/1/2025.
//

import SwiftUI

struct AppView: View {

    @State var appState: AppState = AppState()

    var body: some View {
        AppViewBuilder(
            showTabBar: appState.showTabBar,
            mainView: {
                TabBarView()
            },
            onboardingView: {
                WelcomeView()
            }
        )
        .environment(appState)
    }
}

#Preview("AppView - Tabbar") {
    AppView(appState: AppState(showTabBar: true))
}
#Preview("AppView - Onboarding") {
    AppView(appState: AppState(showTabBar: false))
}
