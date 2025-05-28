//
//  SettingsView.swift
//  AIChat
//
//  Created by Ario Liyan on 28/5/2025.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dissmiss
    @Environment(AppState.self) private var appState
    
    var body: some View {
        NavigationStack {
            List {
                Button {
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
        dissmiss()
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            appState.updateViewState(showTabBarView: false)
        }
        
    }
}

#Preview {
    SettingsView()
}
