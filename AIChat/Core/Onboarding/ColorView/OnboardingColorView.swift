//
//  OnboardingColorView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct OnboardingColorView: View {
    @State private var selectedColor: Color?
    let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]

    var body: some View {
        ScrollView {
            colorGrid
                .padding(.horizontal, 24)
        }
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: 16) {
            ZStack {
                if let selectedColor {
                    ctaButton
                        .transition(AnyTransition.move(edge: .bottom))
                }
            }
            .padding(24)
            .background(Color(uiColor: .systemBackground))
        }
        .animation(.bouncy, value: selectedColor)
    }

    private var colorGrid: some View {
        let items = GridItem(.flexible(), spacing: 16)

        func sectionHeader() -> some View {
            Text("Select a profile color")
                .font(.headline)
                .frame(maxWidth: .infinity)
        }

        func circle(with color: Color) -> some View{
            color
                .clipShape(Circle())
                .padding(selectedColor == color ? 10 : 0)
        }

        func circles() -> some View {
            Group {
                ForEach(profileColors, id: \.self) { color in
                    Circle()
                        .fill(.accent)
                        .overlay(circle(with: color))
                        .onTapGesture {
                            selectedColor = color
                        }
                }
            }
        }

        return LazyVGrid(
            columns: Array(repeating: items, count: 3),
            alignment: .center,
            spacing: 16,
            pinnedViews: [.sectionHeaders]) {
                Section(content: circles, header: sectionHeader)
            }
    }

    private var ctaButton: some View {
        NavigationLink(destination: OnboardingCompletedView()) {
            Text("Continue")
                .callToActionButtonStyle()
        }
    }
}

#Preview {
    NavigationStack {
        OnboardingColorView()
    }
}
