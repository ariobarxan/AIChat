//
//  WelcomeView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct WelcomeView: View {

    @State private var imageName: String = Constants.randomImage
    @State private var showSignInView: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .ignoresSafeArea()

                titleSection
                    .padding(.top, 24)

                ctaButtons
                    .padding()

                policyLinks
            }
        }
        .sheet(isPresented: $showSignInView) {
            CreateAccountView(
                title: "Sign in",
                subtitle: "Connect to an existing account."
            )
            .presentationDetents([.medium])
        }

    }

    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("AI Chat 🤙")
                .font(.largeTitle)
                .bold()

            Text("Medium @ Ariobarxan")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private var ctaButtons: some View {
        VStack(spacing: 8) {
            NavigationLink(destination: OnboardingIntroView()) {
                Text("Get Started")
                    .callToActionButtonStyle()
            }

            Text("Already have an account? Sign in!")
                .underline()
                .font(.body)
                .padding(8)
                .tappableBackgroundStyle()
                .onTapGesture(perform: onSignInPresssed)
        }
    }

    private var policyLinks: some View {
        HStack(spacing: 8) {
            Link(destination: URL(string: Constants.termsOfServiceUrl)!) {
                Text("Terms of Service")
            }

            Circle()
                .fill(.accent)
                .frame(width: 4, height: 4)

            Link(destination: URL(string: Constants.privacyPolicyUrl)!) {
                Text("Privacy Policy")
            }
        }
    }

    private func onSignInPresssed() {
        showSignInView = true
    }
}

#Preview {
    WelcomeView()
}
