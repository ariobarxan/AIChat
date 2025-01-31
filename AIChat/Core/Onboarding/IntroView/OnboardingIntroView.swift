//
//  OnboardingIntroView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct OnboardingIntroView: View {
    var body: some View {
        VStack {
            Group {
                Text("Make your own ")
                +
                Text("avatars ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("and chat with them!\n\nHave ")
                +
                Text("real conversations ")
                    .foregroundStyle(.accent)
                    .fontWeight(.semibold)
                +
                Text("with AI generated responses.")
            }
            .baselineOffset(6)
            .frame(maxHeight: .infinity)
            .padding(24)

            NavigationLink(destination: {Text("OnboardingColorView")}) {
                Text("Continue")
                    .callToActionButtonStyle()
            }
        }
        .padding(24)
        .font(.title3)
    }
}

#Preview {
    NavigationStack {
        OnboardingIntroView()
    }
}
