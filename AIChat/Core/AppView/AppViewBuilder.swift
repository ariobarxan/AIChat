//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Ario Liyan on 27/5/2025.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnBoardingView: View>: View {
    var showTabBar: Bool
    @ViewBuilder var tabbarView: TabBarView
    @ViewBuilder var onboardingView: OnBoardingView
    
    var body: some View {
        ZStack {
            if showTabBar {
                tabbarView
                    .transition(.move(edge: .trailing))
            } else {
                onboardingView
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.smooth, value: showTabBar)
    }
}

fileprivate struct PreviewView: View {
    @State private var showTabBar: Bool = false
    
    var body: some View {
        AppViewBuilder(
            showTabBar: showTabBar,
            tabbarView: {
                ZStack {
                    Color.red.ignoresSafeArea()
                    Text("Tabbar")
                }
            },
            onboardingView: {
                ZStack {
                    Color.blue.ignoresSafeArea()
                    Text("Onboarding")
                }
            }
        )
        .onTapGesture {
            showTabBar.toggle()
        }
    }
}

#Preview {
    PreviewView()
}
