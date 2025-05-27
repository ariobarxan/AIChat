//
//  TabBarView.swift
//  AIChat
//
//  Created by Ario Liyan on 27/5/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                Text("Explore")
                    .navigationTitle("Explore")
                    .tabItem {
                        Label("Explore", systemImage: "eyes")
                    }
            }
            NavigationStack {
                Text("Chats")
                    .navigationTitle("Chats")
                    .tabItem {
                        Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
                    }
            }
            NavigationStack {
                Text("Profile")
                    .navigationTitle("Profile")
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            }
        }
    }
}


#Preview {
    TabBarView()
}
