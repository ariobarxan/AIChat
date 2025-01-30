//
//  SettingView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(AppState.self) private var appState

    var body: some View {
        NavigationStack {
            List {
                Button(action: onSignOutPressed) {
                    Text("Sign out")
                }
            }
            .navigationTitle("Settings")
        }
    }

    private func onSignOutPressed() {
        // TODO: Logic to sign user out of the app
        presentationMode.wrappedValue.dismiss()

        Task {
            try? await Task.sleep(for: .seconds(0.5))
            appState.updateViewState(showTabBarView: false)
        }
    }
}

#Preview {
    SettingView()
        .environment(AppState())
}
