//
//  SettingsView.swift
//  AIChat
//
//  Created by Ario Liyan on 28/5/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button{
                    onSingoutPressed()
                } label: {
                    Text("Sign out")
                }
            }
            .navigationTitle("Settings")
        }
    }
    
    func onSingoutPressed() {
        // add logic later here
        appState.updateAppState(showTabBarView: false)
    }
}

#Preview {
    SettingsView()
}
