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
        presentationMode.wrappedValue.dismiss()
        appState.updateViewState(showTabBarView: false)
    }
}

#Preview {
    SettingView()
        .environment(AppState())
}
