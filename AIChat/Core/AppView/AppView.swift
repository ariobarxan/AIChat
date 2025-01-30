//
//  AppView.swift
//  AIChat
//
//  Created by Ario Zarepour on 30/1/2025.
//

import SwiftUI

struct AppView: View {

    @State var showTabBar: Bool = false

    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            mainView: {
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
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview("AppView - Tabbar") {
    AppView(showTabBar: true)
}
#Preview("AppView - Onboarding") {
    AppView(showTabBar: false)
}
