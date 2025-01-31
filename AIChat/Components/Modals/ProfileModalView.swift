//
//  ProfileModalView.swift
//  AIChat
//
//  Created by Ario Zarepour on 31/1/2025.
//

import SwiftUI

struct ProfileModalView: View {

    var imageName: String? = Constants.randomImage
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An alien in the park."
    var onXMarkPressed: () -> Void = { }

    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                imageSection(imageName)
            }

            titleSection
        }
        .background(.thinMaterial)
        .cornerRadius(16)
        .overlay(closeButton, alignment: .topTrailing)
    }

    private func imageSection(_ imageName: String) -> some View {
        ImageLoaderView(
            urlString: imageName,
            forceTransitionAnimation: true
        )
        .aspectRatio(1, contentMode: .fit)
    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title {
                Text(title)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            if let subtitle {
                Text(subtitle)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            if let headline {
                Text(headline)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var closeButton: some View {
        Image(systemName: "xmark.circle.fill")
            .font(.title)
            .foregroundStyle(Color.black)
            .padding(4)
            .tappableBackgroundStyle()
            .anyButton {
                onXMarkPressed()
            }
            .padding(8)
    }
}

#Preview("Modal w/ Image") {
    ZStack {
        Color.gray.ignoresSafeArea()

        ProfileModalView()
            .padding(40)
    }
}
#Preview("Modal w/out Image") {
    ZStack {
        Color.gray.ignoresSafeArea()

        ProfileModalView(imageName: nil)
            .padding(40)
    }
}
