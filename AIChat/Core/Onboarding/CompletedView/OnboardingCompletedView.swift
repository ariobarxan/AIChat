//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var appState
    @State private var isCompletingProfileSetup: Bool = false
    private var selectedColor: Color = .orange


    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Setup complete!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(selectedColor)


            Text("We've set up your profile and you're ready to start chatting.")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
        }
        .frame(maxHeight: .infinity)
        .safeAreaInset(edge: .bottom, content: {
            ctaButton
        })
        .padding(24)
        .toolbar(.hidden, for: .navigationBar)
    }

    private func onFinishedButtonPressed() {
        isCompletingProfileSetup = true

        // TODO: logic to complete onboarding
        Task {
            try await Task.sleep(for: .seconds(3))
            isCompletingProfileSetup = false
//            try await saveUserProfile(color: selectedColor)

            appState.updateViewState(showTabBarView: true)
        }
    }

    private var ctaButton: some View {
        Button(action: onFinishedButtonPressed) {
            ZStack {
                if isCompletingProfileSetup {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Finish")
                }
            }
            .callToActionButtonStyle()
        }
        .disabled(isCompletingProfileSetup)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
