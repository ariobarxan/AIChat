//
//  ProfileView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var showSettings: Bool = false

    var body: some View {
        NavigationStack {
            Text("Profile")
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        settingButton
                    }
                }
        }
        .sheet(isPresented: $showSettings) {
            Text("Settings View")
        }
    }

    private var settingButton: some View {
        Button(action: onSettingButtonPressed) {
            Image(systemName: "gear")
                .font(.headline)
        }
    }

    private func onSettingButtonPressed() {
        showSettings = true
    }
}

#Preview {
    ProfileView()
}
