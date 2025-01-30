//
//  WelcomeView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome!")
                    .frame(maxHeight: .infinity)

                NavigationLink(destination: {Text("OnBoarding Completed")}) {
                    Text("Get Started")
                        .callToActionButtonStyle()
                }
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
