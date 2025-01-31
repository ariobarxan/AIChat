//
//  SettingView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(AppState.self) private var appState
    @State private var isPremium: Bool = false
    @State private var isAnonymousUser: Bool = false
    @State private var showCreateAccountView: Bool = false

    var body: some View {
        NavigationStack {
            List {
                accountSection
                purchaseSection
                applicationSection
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showCreateAccountView) {
                CreateAccountView()
                    .presentationDetents([.medium])
            }
        }
    }

    private var accountSection: some View {
        var saveAnBackup: some View {
            Text("Save & back-up account")
                .rowFormatting()
                .anyButton(.highlight) {
                    onCreateAccountPressed()
                }
                .removeListRowFormatting()
        }

        var signOut: some View {
            Text("Sign out")
                .rowFormatting()
                .anyButton(.highlight) {
                    onSignOutPressed()
                }
                .removeListRowFormatting()
        }

        var deleteAccount: some View {
            Text("Delete account")
                .foregroundStyle(.red)
                .rowFormatting()
                .anyButton(.highlight) {

                }
                .removeListRowFormatting()
        }

        return Section {
            if isAnonymousUser {
                saveAnBackup
            } else {
                signOut
            }
            deleteAccount

        } header: {
            Text("Account")
        }
    }

    private var purchaseSection: some View {
        Section {
            HStack(spacing: 8) {
                Text("Account status: \(isPremium ? "PREMIUM" : "FREE")")

                Spacer(minLength: 0)

                if isPremium {
                    Text("MANAGE")
                        .badgeButtonStyle()
                }
            }
            .rowFormatting()
            .anyButton(.highlight) {

            }
            .disabled(!isPremium)
            .removeListRowFormatting()
        } header: {
            Text("Purchases")
        }
    }

    private var applicationSection: some View {
        var version: some View {
            HStack(spacing: 8) {
                Text("Version")
                Spacer(minLength: 0)
                Text(Utilities.appVersion ?? "")
                    .foregroundStyle(.secondary)
            }
            .rowFormatting()
            .removeListRowFormatting()
        }

        var buildNumber: some View {
            HStack(spacing: 8) {
                Text("Build Number")
                Spacer(minLength: 0)
                Text(Utilities.buildNumber ?? "")
                    .foregroundStyle(.secondary)
            }
            .rowFormatting()
            .removeListRowFormatting()
        }

        var contactUs: some View {
            Text("Contact us")
                .foregroundStyle(.blue)
                .rowFormatting()
                .anyButton(.highlight, action: {

                })
                .removeListRowFormatting()
        }

        return Section {
            version

            buildNumber

            contactUs
        } header: { Text("Application") }
          footer: {
            Text("Created by Swiftful Thinking.\nLearn more at www.swiftful-thinking.com.")
                .baselineOffset(6)
        }
    }

    private func onSignOutPressed() {
        // TODO: Logic to sign user out of the app
        dismiss()

        Task {
            try? await Task.sleep(for: .seconds(0.5))
            appState.updateViewState(showTabBarView: false)
        }
    }

    func onCreateAccountPressed() {
        showCreateAccountView = true
    }
}

fileprivate extension View {
    func rowFormatting() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(uiColor: .systemBackground))
    }
}

#Preview {
    SettingView()
        .environment(AppState())
}
