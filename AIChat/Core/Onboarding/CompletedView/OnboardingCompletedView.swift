//
//  OnboardingCompletedView.swift
//  AIChat
//
//  Created by Ario Liyan on 28/5/2025.
//

import SwiftUI

struct OnboardingCompletedView: View {
    @Environment(AppState.self) private var root
    
    var body: some View {
        VStack {
            Text("Onboarding completed!")
                .frame(maxHeight: .infinity)
            
            Button(action: {
                onFinishButtonPressed()
            }, label: {
                Text("Finish")
                    .callToActionButton()
            })
            .padding(16)
        }
    }
    
    func onFinishButtonPressed() {
        //  logic will be added here
        root.updateAppState(showTabBarView: true)
    }
}

#Preview {
    OnboardingCompletedView()
        .environment(AppState())
}
