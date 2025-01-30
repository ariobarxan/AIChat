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
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(.accent)
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeView()
}
