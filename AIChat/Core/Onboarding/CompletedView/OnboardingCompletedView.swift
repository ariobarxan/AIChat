//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var appState

    var body: some View {
        VStack {
            Text("Onboarding Completed")
                .frame(maxHeight: .infinity)

            Button(action: onFinishedButtonPressed) {
                Text("Finish")
                    .callToActionButtonStyle()
            }
        }
        .padding()
    }

    private func onFinishedButtonPressed() {
        // TODO: logic to complete onboarding
        appState.updateViewState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
