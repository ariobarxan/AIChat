//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
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
    }
}

#Preview {
    OnboardingCompletedView()
}
